import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/theme/app_colors.dart';

/// The OpenStreetMap tile server.
///
/// Free and needs no billing account, which is why the app is on it — but the
/// public server is for modest use only. Before launch this becomes a paid
/// tile URL (MapTiler, Mapbox, Thunderforest) or a self-hosted one; nothing
/// changes here but the string and the attribution.
const String kTileUrl = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

/// The live map of a rider carrying an order.
///
/// The position arrives from `GET /v1/orders/{id}/track`, which is polled
/// every 8 seconds. Dropped straight onto the map that would read as a marker
/// teleporting eight times a minute, so each new fix is *walked* to over a few
/// seconds instead. It is a lie about when we learned the position, but an
/// honest one about where the rider is going, and it is what every delivery
/// app does.
class RiderMap extends StatefulWidget {
  const RiderMap({
    super.key,
    required this.rider,
    this.destination,
    this.interactive = false,
    this.follow = true,
    this.zoom = 15.5,
  });

  /// The newest position from the tracker.
  final LatLng rider;

  /// Where the order is going, when the API tells us — it does not yet, so
  /// this is null in the app today and the map shows the rider alone. The
  /// moment `delivery_address` carries a latitude and longitude, passing it
  /// here draws the destination pin and the line to it.
  final LatLng? destination;

  final bool interactive;

  /// Keeps the rider in frame as they move. False lets the customer pan away
  /// and stay where they panned.
  final bool follow;

  final double zoom;

  @override
  State<RiderMap> createState() => _RiderMapState();
}

class _RiderMapState extends State<RiderMap> with TickerProviderStateMixin {
  final MapController _map = MapController();

  /// Where the marker is drawn right now, which trails [RiderMap.rider] while
  /// an update is being walked out.
  late LatLng _shown = widget.rider;
  late LatLng _from = widget.rider;

  late final AnimationController _walk = AnimationController(
    vsync: this,
    // Comfortably shorter than the 8-second poll: the marker should settle
    // and rest, not still be gliding when the next fix lands.
    duration: const Duration(milliseconds: 1600),
  )..addListener(_tick);

  bool _mapReady = false;

  void _tick() {
    final double t = Curves.easeInOut.transform(_walk.value);
    setState(() {
      _shown = LatLng(
        _from.latitude + (widget.rider.latitude - _from.latitude) * t,
        _from.longitude + (widget.rider.longitude - _from.longitude) * t,
      );
    });
    if (widget.follow && _mapReady) _map.move(_shown, _map.camera.zoom);
  }

  @override
  void didUpdateWidget(RiderMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rider != widget.rider) {
      _from = _shown;
      _walk.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _walk.dispose();
    _map.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final LatLng? destination = widget.destination;

    return FlutterMap(
      mapController: _map,
      options: MapOptions(
        initialCenter: _shown,
        initialZoom: widget.zoom,
        onMapReady: () => _mapReady = true,
        interactionOptions: InteractionOptions(
          flags: widget.interactive
              // No rotation: a tilted map of a delivery helps nobody, and a
              // two-finger twist is easy to do by accident while pinching.
              ? InteractiveFlag.all & ~InteractiveFlag.rotate
              : InteractiveFlag.none,
        ),
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate: kTileUrl,
          userAgentPackageName: 'com.nexmile.app',
        ),
        if (destination != null)
          PolylineLayer<Object>(
            polylines: <Polyline<Object>>[
              Polyline<Object>(
                points: <LatLng>[_shown, destination],
                strokeWidth: 3,
                color: AppColors.greenDeep.withValues(alpha: 0.55),
                // Dashed, because it is a line of sight and not a route: the
                // app has no routing service, and a solid line would claim the
                // rider is taking a road that runs through the buildings.
                pattern: StrokePattern.dashed(segments: const <double>[7, 7]),
              ),
            ],
          ),
        MarkerLayer(
          markers: <Marker>[
            if (destination != null)
              Marker(
                point: destination,
                width: 34,
                height: 34,
                child: _Pin(
                  icon: Icons.home_rounded,
                  colour: theme.colorScheme.primary,
                ),
              ),
            Marker(
              point: _shown,
              width: 44,
              height: 44,
              child: const _RiderPin(),
            ),
          ],
        ),
      ],
    );
  }
}

class _Pin extends StatelessWidget {
  const _Pin({required this.icon, required this.colour});

  final IconData icon;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.5),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: 17, color: Colors.white),
    );
  }
}

/// The rider: the same pin with a slow halo behind it.
///
/// The halo is the map's only sign that the position is live rather than a
/// screenshot of where the rider was when the screen opened.
class _RiderPin extends StatefulWidget {
  const _RiderPin();

  @override
  State<_RiderPin> createState() => _RiderPinState();
}

class _RiderPinState extends State<_RiderPin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1900),
  )..repeat();

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Honours the platform's reduce-motion setting: a pulse is decoration, and
    // decoration is the first thing to go when someone has asked for less.
    final bool animate = !MediaQuery.disableAnimationsOf(context);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        if (animate)
          AnimatedBuilder(
            animation: _pulse,
            builder: (BuildContext context, _) {
              final double t = _pulse.value;
              return Container(
                width: 20 + 24 * t,
                height: 20 + 24 * t,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orangeDeep.withValues(
                    alpha: 0.28 * (1 - t),
                  ),
                ),
              );
            },
          ),
        const _Pin(icon: Icons.pedal_bike_rounded, colour: AppColors.orangeDeep),
      ],
    );
  }
}
