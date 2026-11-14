import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:latlong2/latlong.dart';

import '../../data/order_models.dart';
import 'tracking/map_styles.dart';
import 'tracking/marker_icons.dart';
import 'tracking/route_geometry.dart';

/// Bridges the decoded coordinate to the app's own [LatLng].
///
/// Lives here rather than on [GeoPoint] so that the map package is a detail of
/// this folder and nothing in `data/` knows which one draws the map.
extension GeoPointToLatLng on GeoPoint {
  LatLng toLatLng() => LatLng(latitude, longitude);
}

gm.LatLng _g(LatLng p) => gm.LatLng(p.latitude, p.longitude);

/// The route line's two strokes: a deeper blue casing under a brighter core.
/// Blue because it is what every ride and delivery app has taught people a
/// route looks like; brand colours are for the pins and the bike.
const Color _routeCasing = Color(0xFF1967D2);
const Color _routeCore = Color(0xFF4A8DF6);

/// The live map of a rider carrying an order.
///
/// Positions arrive every few seconds from a poll. Each one is *driven to*
/// rather than jumped to: the marker travels at a steady pace for nearly the
/// whole gap before the next fix, along the road when the server sent a
/// route, so on screen the rider is always moving the way a real one does
/// rather than hopping and waiting. The route behind the rider is consumed as
/// they go, and the scooter turns with the road, the short way round.
///
/// Drawn with Google Maps. The SDK key is injected by the platform build
/// (android/maps.properties, ios/Flutter/Secrets.xcconfig).
class RiderMap extends StatefulWidget {
  const RiderMap({
    super.key,
    this.rider,
    this.destination,
    this.restaurant,
    this.route = const <LatLng>[],
    this.heading,
    this.destinationLabel,
    this.restaurantLabel,
    this.interactive = false,
    this.follow = true,
    this.padding = EdgeInsets.zero,
    this.glide = const Duration(milliseconds: 7200),
    this.zoom = 15.5,
  });

  /// The newest position from the tracker. Null before a rider is assigned,
  /// when the map shows the two ends of the journey on their own.
  final LatLng? rider;

  /// Where the order is going.
  final LatLng? destination;

  /// Where it came from.
  final LatLng? restaurant;

  /// The road from the server's Directions call. Empty until it sends one, and
  /// then the map draws a curved dashed arc instead.
  final List<LatLng> route;

  /// Direction of travel from the phone, clockwise from north. When null, the
  /// scooter follows the route or the direction of movement.
  final double? heading;

  /// Written beside the home pin, such as "You". No label when null.
  final String? destinationLabel;

  /// Written beside the restaurant pin: its name.
  final String? restaurantLabel;

  final bool interactive;

  /// Keeps the rider and the destination framed together. False leaves the
  /// camera wherever the customer moved it.
  final bool follow;

  /// Space the map's own UI must keep clear of, such as a bottom sheet, so
  /// framing centres on the visible part of the map.
  final EdgeInsets padding;

  /// How long each fix is travelled over. Just under the poll interval, so
  /// the marker arrives a moment before the next position lands.
  final Duration glide;

  final double zoom;

  @override
  State<RiderMap> createState() => _RiderMapState();
}

class _RiderMapState extends State<RiderMap> with TickerProviderStateMixin {
  final Completer<gm.GoogleMapController> _controller =
      Completer<gm.GoogleMapController>();

  TrackingMarkerIcons? _icons;
  Offset _homeAnchor = const Offset(0.5, 1);
  Offset _shopAnchor = const Offset(0.5, 1);
  bool _iconsRequested = false;

  RoutePath? _path;

  // --- Motion between fixes ------------------------------------------------

  late final AnimationController _motion =
      AnimationController(vsync: this, duration: widget.glide)
        ..addListener(_onFrame)
        ..addStatusListener(_onMotionStatus);

  LatLng? _shown;
  LatLng? _from;
  LatLng? _to;

  /// Set when both ends of the current leg sit on the route, so the marker
  /// follows the road between them instead of cutting the corner.
  double? _alongFrom;
  double? _alongTo;

  double _bearing = 0;
  bool _hasBearing = false;

  // --- Decoration ----------------------------------------------------------

  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..addListener(_onFrame);

  /// Draws a fresh route in from the rider outwards.
  late final AnimationController _reveal = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..addListener(_onFrame);

  /// Every marker and line is sent across the platform channel on rebuild,
  /// so frames are capped near 30 a second: smooth to the eye, half the
  /// traffic of 60.
  final Stopwatch _sinceRebuild = Stopwatch()..start();

  bool _cameraBusy = false;

  @override
  void initState() {
    super.initState();
    _shown = widget.rider;
    _path = _buildPath(widget.route);
    if (_path != null || (widget.rider != null && widget.destination != null)) {
      _reveal.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool animate = !MediaQuery.disableAnimationsOf(context);
    if (animate && !_pulse.isAnimating) {
      _pulse.repeat();
    } else if (!animate) {
      _pulse.stop();
    }

    if (_iconsRequested) return;
    _iconsRequested = true;
    TrackingMarkerIcons.paint(
      MediaQuery.devicePixelRatioOf(context),
      homeLabel: widget.destinationLabel ?? '',
      shopLabel: widget.restaurantLabel,
    ).then(((TrackingMarkerIcons, Offset, Offset) painted) {
      if (!mounted) return;
      setState(() {
        _icons = painted.$1;
        _homeAnchor = painted.$2;
        _shopAnchor = painted.$3;
      });
    });
  }

  @override
  void didUpdateWidget(RiderMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_sameRoute(oldWidget.route, widget.route)) {
      final bool hadRoute = _path != null;
      _path = _buildPath(widget.route);
      // Only a route appearing for the first time is drawn in. A recomputed
      // route swapping in mid-trip would flicker if it re-animated.
      if (!hadRoute && _path != null) _reveal.forward(from: 0);
    }

    final LatLng? next = widget.rider;
    if (next != null && next != oldWidget.rider) _driveTo(next);

    if (widget.follow && !oldWidget.follow) _frame();
    if (widget.padding != oldWidget.padding) _frame();
  }

  @override
  void dispose() {
    _motion.dispose();
    _pulse.dispose();
    _reveal.dispose();
    super.dispose();
  }

  static RoutePath? _buildPath(List<LatLng> points) {
    if (points.length < 2) return null;
    final RoutePath path = RoutePath(points);
    return path.isUsable ? path : null;
  }

  static bool _sameRoute(List<LatLng> a, List<LatLng> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    if (a.isEmpty) return true;
    return a.first == b.first && a.last == b.last;
  }

  /// Starts a new leg from wherever the marker is drawn now.
  void _driveTo(LatLng target) {
    final LatLng? start = _shown;
    if (start == null) {
      _shown = target;
      _frame();
      return;
    }

    final double gap = distanceMetres(start, target);
    // A fix far from the last one is a reopened screen or a GPS jump, not a
    // ride. Gliding across a kilometre in seven seconds would look absurd.
    if (gap > 600) {
      _motion.stop();
      _shown = target;
      _from = _to = null;
      _alongFrom = _alongTo = null;
      _frame();
      setState(() {});
      return;
    }

    _from = start;
    _to = target;
    _alongFrom = _alongTo = null;

    final RoutePath? path = _path;
    if (path != null) {
      final RouteFix a = path.project(start);
      final RouteFix b = path.project(target);
      // On the road at both ends and not going backwards along it: follow
      // the road. Anything else is a detour, and a straight glide is honest.
      if (a.offRouteMetres < 40 &&
          b.offRouteMetres < 40 &&
          b.along >= a.along - 5) {
        _alongFrom = a.along;
        _alongTo = b.along;
      }
    }

    if (gap > 3 && widget.heading == null && !_hasBearing) {
      _bearing = bearingDegrees(start, target);
      _hasBearing = true;
    }

    _motion.forward(from: 0);
    if (widget.follow) _frame();
  }

  void _onFrame() {
    if (_motion.isAnimating) _advance();
    if (_sinceRebuild.elapsedMilliseconds < 30) return;
    _sinceRebuild.reset();
    if (mounted) setState(() {});
  }

  /// The last frame of a leg must land even if the throttle would skip it,
  /// or with reduced motion on (no pulse to redraw) the marker would rest a
  /// few metres short of the fix.
  void _onMotionStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;
    _advance();
    if (mounted) setState(() {});
  }

  void _advance() {
    final LatLng? from = _from;
    final LatLng? to = _to;
    if (from == null || to == null) return;

    // Linear on purpose. Easing each leg makes the rider brake to a stop at
    // every fix, which reads as stop-start traffic that is not happening.
    final double t = _motion.value;
    final double? alongFrom = _alongFrom;
    final double? alongTo = _alongTo;
    final RoutePath? path = _path;

    double? target = widget.heading;
    if (path != null && alongFrom != null && alongTo != null) {
      final double along = alongFrom + (alongTo - alongFrom) * t;
      _shown = path.pointAt(along);
      target ??= alongTo - alongFrom > 2 ? path.bearingAt(along) : null;
    } else {
      _shown = lerpLatLng(from, to, t);
      target ??= distanceMetres(from, to) > 3 ? bearingDegrees(from, to) : null;
    }

    if (target != null) {
      // Eased toward the target each frame rather than snapped, so a corner
      // turns over a few hundred milliseconds like a vehicle does.
      _bearing = _hasBearing ? lerpBearing(_bearing, target, 0.12) : target;
      _hasBearing = true;
    }
  }

  /// Frames the rider and where they are going, leaving the sheet clear.
  Future<void> _frame() async {
    if (!widget.follow || !_controller.isCompleted || _cameraBusy) return;
    final List<LatLng> points = <LatLng>[
      if (_to ?? _shown case final LatLng rider) rider,
      if (widget.destination case final LatLng home) home,
      // The kitchen matters until the food leaves it.
      if (widget.restaurant case final LatLng shop
          when widget.rider == null || _isHeadingToShop())
        shop,
    ];
    if (points.isEmpty) return;

    final gm.GoogleMapController map = await _controller.future;
    _cameraBusy = true;
    try {
      if (points.length == 1) {
        await map.animateCamera(
          gm.CameraUpdate.newLatLngZoom(_g(points.first), widget.zoom),
        );
      } else {
        await map.animateCamera(
          gm.CameraUpdate.newLatLngBounds(_bounds(points), 72),
        );
      }
    } catch (_) {
      // The map can refuse bounds before its first layout; the next fix
      // frames it again.
    } finally {
      _cameraBusy = false;
    }
  }

  /// Before pickup the rider is closer to the shop than the route's end.
  bool _isHeadingToShop() {
    final LatLng? rider = _shown;
    final LatLng? shop = widget.restaurant;
    final LatLng? home = widget.destination;
    if (rider == null || shop == null || home == null) return false;
    return distanceMetres(rider, shop) < distanceMetres(rider, home) &&
        distanceMetres(rider, shop) > 80;
  }

  static gm.LatLngBounds _bounds(List<LatLng> points) {
    double south = points.first.latitude;
    double north = south;
    double west = points.first.longitude;
    double east = west;
    for (final LatLng p in points) {
      if (p.latitude < south) south = p.latitude;
      if (p.latitude > north) north = p.latitude;
      if (p.longitude < west) west = p.longitude;
      if (p.longitude > east) east = p.longitude;
    }
    // Two points a few metres apart would zoom past street level.
    const double minSpan = 0.003;
    if (north - south < minSpan) {
      final double mid = (north + south) / 2;
      south = mid - minSpan / 2;
      north = mid + minSpan / 2;
    }
    if (east - west < minSpan) {
      final double mid = (east + west) / 2;
      west = mid - minSpan / 2;
      east = mid + minSpan / 2;
    }
    return gm.LatLngBounds(
      southwest: gm.LatLng(south, west),
      northeast: gm.LatLng(north, east),
    );
  }

  /// The part of the route still ahead of the rider, drawn in from the rider
  /// while [_reveal] runs.
  List<LatLng> _remainingRoute(RoutePath path, LatLng rider) {
    final double along =
        _motion.isAnimating && _alongFrom != null
            ? _alongFrom! + (_alongTo! - _alongFrom!) * _motion.value
            : path.project(rider).along;
    final double reveal = Curves.easeOutCubic.transform(_reveal.value);
    final double end = along + (path.length - along) * reveal;
    return <LatLng>[rider, ...path.slice(along, end).skip(1)];
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final TrackingMarkerIcons? icons = _icons;
    final LatLng? rider = _shown;
    final LatLng? destination = widget.destination;
    final LatLng? restaurant = widget.restaurant;
    final RoutePath? path = _path;

    final List<LatLng> line =
        rider == null
            ? const <LatLng>[]
            : path != null
            ? _remainingRoute(path, rider)
            : destination != null
            ? () {
              final List<LatLng> arc = arcBetween(rider, destination);
              final double reveal = Curves.easeOutCubic.transform(
                _reveal.value,
              );
              return arc.sublist(
                0,
                (arc.length * reveal).ceil().clamp(2, arc.length),
              );
            }()
            : const <LatLng>[];

    final LatLng initial =
        rider ?? destination ?? restaurant ?? const LatLng(13.0827, 80.2707);
    final double pulse = _pulse.value;

    return gm.GoogleMap(
      initialCameraPosition: gm.CameraPosition(
        target: _g(initial),
        zoom: widget.zoom,
      ),
      // The standard Google map in light mode, street detail and landmarks
      // included, because that is the map people navigate their own street
      // by. Dark mode gets the quiet style so the route still stands out.
      style: dark ? kTrackingMapStyleDark : null,
      padding: widget.padding,
      onMapCreated: (gm.GoogleMapController controller) {
        _controller.complete(controller);
        // Let the first layout settle before asking for bounds.
        Future<void>.delayed(const Duration(milliseconds: 250), _frame);
      },
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      scrollGesturesEnabled: widget.interactive,
      zoomGesturesEnabled: widget.interactive,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      compassEnabled: false,
      buildingsEnabled: false,
      trafficEnabled: false,
      circles: <gm.Circle>{
        if (rider != null && _pulse.isAnimating)
          gm.Circle(
            circleId: const gm.CircleId('pulse'),
            center: _g(rider),
            radius: 14 + 46 * pulse,
            fillColor: _routeCore.withValues(alpha: 0.22 * (1 - pulse)),
            strokeWidth: 0,
            zIndex: 1,
          ),
      },
      polylines: <gm.Polyline>{
        if (line.length >= 2 && path != null) ...<gm.Polyline>{
          gm.Polyline(
            polylineId: const gm.PolylineId('route-casing'),
            points: line.map(_g).toList(growable: false),
            width: 9,
            color: _routeCasing,
            jointType: gm.JointType.round,
            startCap: gm.Cap.roundCap,
            endCap: gm.Cap.roundCap,
            zIndex: 1,
          ),
          gm.Polyline(
            polylineId: const gm.PolylineId('route-core'),
            points: line.map(_g).toList(growable: false),
            width: 5,
            color: _routeCore,
            jointType: gm.JointType.round,
            startCap: gm.Cap.roundCap,
            endCap: gm.Cap.roundCap,
            zIndex: 2,
          ),
        },
        if (line.length >= 2 && path == null)
          gm.Polyline(
            polylineId: const gm.PolylineId('arc'),
            points: line.map(_g).toList(growable: false),
            width: 4,
            color: _routeCasing.withValues(alpha: 0.75),
            jointType: gm.JointType.round,
            // Dotted: an arc is a direction, not a road, and should not be
            // mistaken for one.
            patterns: <gm.PatternItem>[
              gm.PatternItem.dot,
              gm.PatternItem.gap(10),
            ],
            zIndex: 1,
          ),
      },
      markers: <gm.Marker>{
        if (icons != null && restaurant != null)
          gm.Marker(
            markerId: const gm.MarkerId('restaurant'),
            position: _g(restaurant),
            icon: icons.shop,
            anchor: _shopAnchor,
            zIndexInt: 2,
          ),
        if (icons != null && destination != null)
          gm.Marker(
            markerId: const gm.MarkerId('home'),
            position: _g(destination),
            icon: icons.home,
            anchor: _homeAnchor,
            zIndexInt: 3,
          ),
        if (icons != null && rider != null)
          gm.Marker(
            markerId: const gm.MarkerId('rider'),
            position: _g(rider),
            icon: icons.rider,
            anchor: const Offset(0.5, 0.5),
            // Flat so it lies on the road and turns with the map; rotated so
            // the front of the bike faces where it is going.
            flat: true,
            rotation: _hasBearing ? _bearing : 0,
            zIndexInt: 5,
          ),
      },
    );
  }
}
