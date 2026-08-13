import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/address.dart';
import '../data/location_service.dart';

/// Pin picker. The customer drags the map under a fixed centre pin, which is
/// how every delivery app does it — dragging a marker with a thumb hides the
/// marker under the thumb, and on a small screen that is exactly the pixel you
/// need to see.
///
/// The 1 km circle is drawn to scale, so "is my building inside the delivery
/// area" is answerable at a glance rather than after checkout fails.
///
/// Tiles come from OpenStreetMap so the map works without a billing account.
/// Swapping to `google_maps_flutter` means replacing [FlutterMap] here; nothing
/// else in the app knows which map is in use.
class AddressMapScreen extends StatefulWidget {
  const AddressMapScreen({super.key, required this.args});

  final AddressMapArgs args;

  @override
  State<AddressMapScreen> createState() => _AddressMapScreenState();
}

class _AddressMapScreenState extends State<AddressMapScreen> {
  /// Nexmile only delivers this far, and the API computes the same radius from
  /// the saved coordinates.
  static const double deliveryRadiusMetres = 1000;

  /// Central Chennai — only used when there is no fix to start from.
  static const LatLng _fallbackCentre = LatLng(13.0827, 80.2707);

  final MapController _map = MapController();

  late LatLng _pin;
  ResolvedPlace? _place;
  bool _isResolving = false;
  bool _isLocating = false;

  /// The map fires a position change on every frame of a drag. Reverse
  /// geocoding on each one would hammer the platform geocoder, so resolution
  /// waits for the gesture to settle.
  Timer? _settleTimer;

  @override
  void initState() {
    super.initState();
    // Correcting an address opens on its own pin; otherwise the GPS fix, and
    // failing both a city centre to drag from.
    final Address? editing = widget.args.editing;
    _pin = editing != null
        ? LatLng(editing.latitude, editing.longitude)
        : (widget.args.latitude != null && widget.args.longitude != null
            ? LatLng(widget.args.latitude!, widget.args.longitude!)
            : _fallbackCentre);
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolve());
  }

  @override
  void dispose() {
    _settleTimer?.cancel();
    _map.dispose();
    super.dispose();
  }

  void _onPositionChanged(MapCamera camera, bool hasGesture) {
    _pin = camera.center;
    if (!hasGesture) return;
    _settleTimer?.cancel();
    _settleTimer = Timer(const Duration(milliseconds: 600), _resolve);
    if (_place != null) setState(() => _place = null);
  }

  Future<void> _resolve() async {
    if (!mounted) return;
    setState(() => _isResolving = true);

    final LatLng target = _pin;
    final ResolvedPlace place = await context
        .read<LocationService>()
        .describe(target.latitude, target.longitude);

    if (!mounted) return;
    setState(() {
      _isResolving = false;
      // A later drag may have superseded this lookup.
      if (target == _pin) _place = place;
    });
  }

  Future<void> _useMyLocation() async {
    setState(() => _isLocating = true);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    try {
      final LocationFix fix =
          await context.read<LocationService>().requestFix();
      if (!mounted) return;
      final LatLng target = LatLng(fix.latitude, fix.longitude);
      _map.move(target, 16.5);
      _pin = target;
      setState(() => _isLocating = false);
      await _resolve();
    } on LocationException catch (error) {
      if (!mounted) return;
      setState(() => _isLocating = false);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              switch (error.failure) {
                LocationFailure.denied => l10n.locationDenied,
                LocationFailure.deniedForever => l10n.locationDeniedForever,
                LocationFailure.serviceDisabled => l10n.locationServiceOff,
                LocationFailure.unavailable => l10n.locationUnavailable,
              },
            ),
          ),
        );
    }
  }

  void _confirm() {
    Navigator.of(context).pushNamed(
      AppRoutes.addressForm,
      arguments: AddressFormArgs(
        latitude: _pin.latitude,
        longitude: _pin.longitude,
        prefill: _place,
        isFirstAddress: widget.args.isFirstAddress,
        editing: widget.args.editing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.pinLocationTitle)),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: _map,
            options: MapOptions(
              initialCenter: _pin,
              initialZoom: 16.5,
              minZoom: 4,
              maxZoom: 18.4,
              onPositionChanged: _onPositionChanged,
              interactionOptions: const InteractionOptions(
                // Rotation only confuses a pin-drop, and a rotated map makes
                // "north is up" assumptions in the address wrong.
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: <Widget>[
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // OSM's tile policy requires an identifying agent.
                userAgentPackageName: 'com.nexmile.app',
                maxNativeZoom: 19,
              ),
              CircleLayer<Object>(
                circles: <CircleMarker<Object>>[
                  CircleMarker<Object>(
                    point: _pin,
                    radius: deliveryRadiusMetres,
                    useRadiusInMeter: true,
                    color: AppColors.greenDeep.withValues(alpha: 0.12),
                    borderColor: AppColors.greenDeep.withValues(alpha: 0.55),
                    borderStrokeWidth: 2,
                  ),
                ],
              ),
              const RichAttributionWidget(
                attributions: <SourceAttribution>[
                  TextSourceAttribution('OpenStreetMap contributors'),
                ],
              ),
            ],
          ),
          // Fixed centre pin, floating above the map.
          const IgnorePointer(child: Center(child: _CentrePin())),
          Positioned(
            left: 16,
            right: 16,
            top: 12,
            child: _RadiusHint(
              text: l10n.deliveryRadiusHint,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLocating ? null : _useMyLocation,
        icon: _isLocating
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2.2),
              )
            : const Icon(Icons.my_location_rounded),
        label: Text(l10n.useMyLocation),
      ),
      bottomNavigationBar: _PinSummary(
        place: _place,
        isResolving: _isResolving,
        onConfirm: _confirm,
      ),
    );
  }
}

/// The pin itself, with a shadow ellipse so it reads as hovering over the
/// exact point rather than sitting on it.
class _CentrePin extends StatelessWidget {
  const _CentrePin();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Icon(
          Icons.location_on_rounded,
          size: 48,
          color: AppColors.orangeDeep,
        ),
        Container(
          width: 10,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        // Offsets the pin so its tip, not its middle, sits on the centre.
        const SizedBox(height: 44),
      ],
    );
  }
}

class _RadiusHint extends StatelessWidget {
  const _RadiusHint({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(AppTheme.radius),
        border: Border.all(color: theme.colorScheme.outline),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.info_outline_rounded,
            size: 17,
            color: AppColors.greenDeep,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet showing what the pin resolved to, plus the confirm action.
class _PinSummary extends StatelessWidget {
  const _PinSummary({
    required this.place,
    required this.isResolving,
    required this.onConfirm,
  });

  final ResolvedPlace? place;
  final bool isResolving;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    final String summary = <String?>[
      place?.line1,
      place?.landmark,
      place?.city,
      place?.pincode,
    ].where((String? p) => p != null && p.trim().isNotEmpty).join(', ');

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outline)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.place_outlined,
                    size: 18,
                    color: AppColors.orangeDeep,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.deliveringHere,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  if (isResolving)
                    const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                summary.isEmpty ? l10n.dragToAdjust : summary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              GradientButton(
                label: l10n.confirmLocation,
                icon: Icons.arrow_forward_rounded,
                onPressed: onConfirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
