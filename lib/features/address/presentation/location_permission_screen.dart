import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/location_service.dart';

/// Explains why Nexmile needs location *before* the OS dialog appears.
///
/// The system prompt gives one line and two buttons. A customer who taps Deny
/// there is expensive to recover — on Android a second denial becomes
/// permanent — so the reasons go here, in full, on a screen the customer can
/// read at their own pace. The OS dialog is only triggered once they have
/// chosen to allow.
///
/// Declining is always a first-class option: the address can be typed by hand,
/// with the pin dragged on the map instead.
class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  bool _isBusy = false;
  LocationFailure? _failure;

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  Future<void> _requestLocation() async {
    setState(() {
      _isBusy = true;
      _failure = null;
    });

    final NavigatorState navigator = Navigator.of(context);
    final LocationService service = context.read<LocationService>();

    try {
      final LocationFix fix = await service.requestFix();
      if (!mounted) return;
      navigator.pushReplacementNamed(
        AppRoutes.addressMap,
        arguments: AddressMapArgs(
          latitude: fix.latitude,
          longitude: fix.longitude,
        ),
      );
    } on LocationException catch (error) {
      if (!mounted) return;
      setState(() {
        _isBusy = false;
        _failure = error.failure;
      });
    }
  }

  /// Skipping drops the customer on the map at a city-level default; they can
  /// drag the pin to the right spot.
  void _enterManually() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.addressMap,
      arguments: const AddressMapArgs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                children: <Widget>[
                  SizedBox(
                    height: 210,
                    child: Center(
                      child: _PulsingPin(animation: _pulse),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.locationTitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.locationSubtitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 28),
                  _ReasonRow(
                    icon: Icons.my_location_rounded,
                    title: l10n.locationReasonRadiusTitle,
                    body: l10n.locationReasonRadiusBody,
                  ),
                  const SizedBox(height: 14),
                  _ReasonRow(
                    icon: Icons.delivery_dining_rounded,
                    title: l10n.locationReasonAccuracyTitle,
                    body: l10n.locationReasonAccuracyBody,
                  ),
                  const SizedBox(height: 14),
                  _ReasonRow(
                    icon: Icons.lock_outline_rounded,
                    title: l10n.locationReasonPrivacyTitle,
                    body: l10n.locationReasonPrivacyBody,
                  ),
                  if (_failure != null) ...<Widget>[
                    const SizedBox(height: 20),
                    _FailureNotice(
                      failure: _failure!,
                      onOpenSettings: () =>
                          context.read<LocationService>().openSettings(),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (_isBusy)
                    const SizedBox(
                      height: 56,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    GradientButton(
                      label: l10n.allowLocation,
                      icon: Icons.near_me_rounded,
                      onPressed: _requestLocation,
                    ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _isBusy ? null : _enterManually,
                    child: Text(l10n.enterAddressManually),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Map pin with two rings breathing outward — the delivery radius, suggested
/// rather than drawn literally.
class _PulsingPin extends StatelessWidget {
  const _PulsingPin({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        return SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (int i = 0; i < 2; i++)
                _Ring(progress: (animation.value + i * 0.5) % 1.0),
              Container(
                width: 92,
                height: 92,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.orangeGradient,
                ),
                child: const Icon(
                  Icons.location_on_rounded,
                  size: 46,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    // Ease the scale so the ring accelerates away and fades as it goes.
    final double eased = Curves.easeOut.transform(progress);
    final double size = 92 + 108 * eased;
    final double opacity = (1 - eased) * 0.45;

    return Opacity(
      opacity: math.max(0, opacity),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.orangeLight, width: 2),
        ),
      ),
    );
  }
}

class _ReasonRow extends StatelessWidget {
  const _ReasonRow({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color accent = isDark ? AppColors.greenLight : AppColors.greenDeep;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: isDark ? 0.20 : 0.12),
            ),
            child: Icon(icon, size: 20, color: accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(body, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shown after a refusal. A permanent denial cannot be re-prompted, so the only
/// honest action is to point at the settings screen.
class _FailureNotice extends StatelessWidget {
  const _FailureNotice({
    required this.failure,
    required this.onOpenSettings,
  });

  final LocationFailure failure;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Color foreground = theme.colorScheme.error;

    final String message = switch (failure) {
      LocationFailure.denied => l10n.locationDenied,
      LocationFailure.deniedForever => l10n.locationDeniedForever,
      LocationFailure.serviceDisabled => l10n.locationServiceOff,
      LocationFailure.unavailable => l10n.locationUnavailable,
    };

    final bool needsSettings = failure == LocationFailure.deniedForever ||
        failure == LocationFailure.serviceDisabled;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: foreground.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.error_outline_rounded, size: 19, color: foreground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(color: foreground),
            ),
          ),
          if (needsSettings)
            TextButton(
              onPressed: onOpenSettings,
              style: TextButton.styleFrom(
                foregroundColor: foreground,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                minimumSize: const Size(0, 40),
              ),
              child: Text(l10n.openSettings),
            ),
        ],
      ),
    );
  }
}
