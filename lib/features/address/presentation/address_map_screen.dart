import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
/// A search bar above the map jumps it to an area, street or landmark, for a
/// customer adding an address somewhere other than where they are standing.
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

  static const double _zoom = 16.5;

  final Completer<GoogleMapController> _map = Completer<GoogleMapController>();

  late LatLng _pin;
  ResolvedPlace? _place;
  bool _isResolving = false;
  bool _isLocating = false;

  /// True between the customer touching the map and the camera coming to
  /// rest. Google reports every frame of a drag through [_onCameraMove];
  /// reverse geocoding waits for [_onCameraIdle] so it runs once per drag.
  bool _moving = false;

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

  void _onCameraMove(CameraPosition position) {
    _pin = position.target;
    if (!_moving) {
      _moving = true;
      setState(() => _place = null);
    }
  }

  void _onCameraIdle() {
    if (!_moving) return;
    _moving = false;
    setState(() {});
    _resolve();
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

  Future<void> _moveTo(LatLng target) async {
    _pin = target;
    if (_map.isCompleted) {
      final GoogleMapController map = await _map.future;
      await map.animateCamera(CameraUpdate.newLatLngZoom(target, _zoom));
    }
    if (!mounted) return;
    // The camera's own idle callback resolves the place once the animation
    // lands; this covers a map that had not finished loading yet.
    if (!_moving) await _resolve();
  }

  Future<void> _useMyLocation() async {
    setState(() => _isLocating = true);
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    try {
      final LocationFix fix =
          await context.read<LocationService>().requestFix();
      if (!mounted) return;
      setState(() => _isLocating = false);
      await _moveTo(LatLng(fix.latitude, fix.longitude));
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

  Future<void> _search() async {
    final PlaceSuggestion? picked = await Navigator.of(context).push(
      MaterialPageRoute<PlaceSuggestion>(
        fullscreenDialog: true,
        builder: (_) => const _PlaceSearchPage(),
      ),
    );
    if (picked == null || !mounted) return;
    await _moveTo(LatLng(picked.latitude, picked.longitude));
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
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _pin, zoom: _zoom),
            onMapCreated: _map.complete,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            minMaxZoomPreference: const MinMaxZoomPreference(4, 19),
            // Rotation only confuses a pin-drop, and a rotated map makes
            // "north is up" assumptions in the address wrong.
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            circles: <Circle>{
              Circle(
                circleId: const CircleId('delivery-radius'),
                center: _pin,
                radius: deliveryRadiusMetres,
                fillColor: AppColors.greenDeep.withValues(alpha: 0.12),
                strokeColor: AppColors.greenDeep.withValues(alpha: 0.55),
                strokeWidth: 2,
              ),
            },
          ),
          // Fixed centre pin, floating above the map.
          const IgnorePointer(child: Center(child: _CentrePin())),
          Positioned(
            left: 16,
            right: 16,
            top: 12,
            child: Column(
              children: <Widget>[
                _SearchBar(label: l10n.searchAddressHint, onTap: _search),
                const SizedBox(height: 10),
                _RadiusHint(text: l10n.deliveryRadiusHint),
              ],
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
        isResolving: _isResolving || _moving,
        onConfirm: _confirm,
      ),
    );
  }
}

/// Looks like a field, opens the search page. A real field over the map would
/// pop the keyboard over the pin every time the customer brushed it.
class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.25),
      borderRadius: BorderRadius.circular(AppTheme.radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: <Widget>[
              const Icon(Icons.search_rounded, color: AppColors.orangeDeep),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Type an area, street, landmark or pincode; pick a result; the map jumps
/// there and the customer fine-tunes the pin by dragging.
class _PlaceSearchPage extends StatefulWidget {
  const _PlaceSearchPage();

  @override
  State<_PlaceSearchPage> createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends State<_PlaceSearchPage> {
  final TextEditingController _query = TextEditingController();

  /// The geocoder is a network call per query; waiting for a pause in typing
  /// keeps it to one per word rather than one per letter.
  Timer? _debounce;

  List<PlaceSuggestion> _results = const <PlaceSuggestion>[];
  bool _isSearching = false;
  bool _searched = false;

  /// Bumped per query so a slow answer to "anna" cannot overwrite the answer
  /// to "anna nagar" that arrived first.
  int _generation = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    _query.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    if (value.trim().length < 3) {
      setState(() {
        _results = const <PlaceSuggestion>[];
        _isSearching = false;
        _searched = false;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 450), () => _run(value));
  }

  Future<void> _run(String value) async {
    final int generation = ++_generation;
    setState(() => _isSearching = true);
    final List<PlaceSuggestion> results =
        await context.read<LocationService>().search(value);
    if (!mounted || generation != _generation) return;
    setState(() {
      _results = results;
      _isSearching = false;
      _searched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _query,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onChanged: _onChanged,
          onSubmitted: (String value) {
            _debounce?.cancel();
            if (value.trim().length >= 3) _run(value);
          },
          decoration: InputDecoration(
            hintText: l10n.searchAddressHint,
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          if (_query.text.isNotEmpty)
            IconButton(
              tooltip: l10n.clearLabel,
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                _query.clear();
                _onChanged('');
              },
            ),
        ],
        bottom: _isSearching
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(minHeight: 2),
              )
            : null,
      ),
      body: _searched && _results.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  l10n.searchAddressNoResults,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
          : ListView.separated(
              itemCount: _results.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (BuildContext context, int index) {
                final PlaceSuggestion result = _results[index];
                return ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.orangeDeep,
                  ),
                  title: Text(
                    result.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: result.subtitle.isEmpty
                      ? null
                      : Text(
                          result.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                  onTap: () => Navigator.of(context).pop(result),
                );
              },
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
