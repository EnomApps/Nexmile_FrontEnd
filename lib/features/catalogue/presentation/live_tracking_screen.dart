import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/motion/nexmile_loader.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/order_models.dart';
import '../state/orders_controller.dart';
import 'widgets/rider_map.dart';

/// The rider, full screen, for as long as the customer wants to watch.
///
/// Reads the same poll the order screen started — it does not open a second
/// one — so opening and closing this screen costs nothing beyond the frames.
/// When the order finishes, polling stops upstream and this screen stops with
/// it rather than holding a dead timer open.
///
/// Laid out the way the big delivery apps do it: the map edge to edge, and a
/// sheet over its lower third that leads with the one number people open the
/// screen for, the minutes until the food arrives.
class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key, required this.orderId});

  final int orderId;

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  /// Fractions of the screen the sheet rests at.
  static const double _sheetMin = 0.24;
  static const double _sheetStart = 0.36;
  static const double _sheetMax = 0.64;

  /// False once the customer drags the map: following them around after they
  /// have deliberately looked somewhere else is a fight over the viewport.
  bool _follow = true;

  Future<void> _call(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    final bool dialled = await launchUrl(uri);
    if (!dialled && mounted) {
      final AppLocalizations l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(l10n.somethingWentWrong)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final OrdersController controller = context.watch<OrdersController>();
    final OrderTracking? tracking = controller.tracking;
    // The order carries the two fixed ends of the journey; the tracker carries
    // the one that moves.
    final Order? order = controller.current;

    final LatLng? rider = tracking != null && tracking.hasRiderPosition
        ? LatLng(tracking.riderLatitude!, tracking.riderLongitude!)
        : null;
    final LatLng? destination = order?.deliveryLocation?.toLatLng();
    final LatLng? restaurant = order?.restaurantLocation?.toLatLng();

    final MediaQueryData media = MediaQuery.of(context);
    final double sheetPadding = media.size.height * _sheetStart;

    // Nothing to put on a map yet: no rider and neither end known.
    final bool hasMap =
        rider != null || destination != null || restaurant != null;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: hasMap
                ? Listener(
                    onPointerDown: (_) {
                      if (_follow) setState(() => _follow = false);
                    },
                    child: RiderMap(
                      rider: rider,
                      destination: destination,
                      restaurant: restaurant,
                      route: tracking == null
                          ? const <LatLng>[]
                          : tracking.route
                              .map((GeoPoint p) => p.toLatLng())
                              .toList(growable: false),
                      heading: tracking?.riderHeading,
                      interactive: true,
                      follow: _follow,
                      padding: EdgeInsets.only(
                        top: media.padding.top + 56,
                        bottom: sheetPadding,
                      ),
                    ),
                  )
                : const NexmileLoader(),
          ),
          // Floating controls over the map, clear of the status bar.
          Positioned(
            top: media.padding.top + 8,
            left: 12,
            right: 12,
            child: Row(
              children: <Widget>[
                _MapButton(
                  icon: Icons.arrow_back_rounded,
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                // Takes whatever the two buttons leave, so a long translation
                // ellipsizes instead of pushing the buttons off screen.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: tracking != null &&
                                tracking.isStale(DateTime.now())
                            ? _StaleNotice(message: l10n.riderLocationStale)
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                AnimatedScale(
                  scale: _follow ? 0 : 1,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutBack,
                  child: _MapButton(
                    icon: Icons.my_location_rounded,
                    tooltip: l10n.recentreOnRider,
                    onPressed: () => setState(() => _follow = true),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: _sheetStart,
            minChildSize: _sheetMin,
            maxChildSize: _sheetMax,
            snap: true,
            snapSizes: const <double>[_sheetStart],
            builder: (BuildContext context, ScrollController scroll) =>
                _TrackingSheet(
              scroll: scroll,
              tracking: tracking,
              order: order,
              onCall: _call,
            ),
          ),
        ],
      ),
    );
  }
}

class _MapButton extends StatelessWidget {
  const _MapButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(icon, color: theme.colorScheme.onSurface),
      ),
    );
  }
}

class _StaleNotice extends StatelessWidget {
  const _StaleNotice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.square(
              dimension: 12,
              child: CircularProgressIndicator(
                strokeWidth: 1.8,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The sheet: ETA, progress, the rider, and what the order is.
class _TrackingSheet extends StatelessWidget {
  const _TrackingSheet({
    required this.scroll,
    required this.tracking,
    required this.order,
    required this.onCall,
  });

  final ScrollController scroll;
  final OrderTracking? tracking;
  final Order? order;
  final ValueChanged<String> onCall;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final OrderTracking? t = tracking;
    final OrderStatus status = t?.status ?? order?.status ?? OrderStatus.placed;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ListView(
        controller: scroll,
        padding: EdgeInsets.fromLTRB(
          20,
          10,
          20,
          20 + MediaQuery.paddingOf(context).bottom,
        ),
        children: <Widget>[
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _EtaHeader(
            statusLabel: t?.statusLabel ?? '',
            minutes: t?.estimatedMinutes,
            live: t != null && t.hasRiderPosition && !t.isStale(DateTime.now()),
          ),
          const SizedBox(height: 18),
          _ProgressTracker(status: status),
          const SizedBox(height: 20),
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
          const SizedBox(height: 16),
          _RiderCard(tracking: t, onCall: onCall),
          if (order != null) ...<Widget>[
            const SizedBox(height: 16),
            _OrderLine(order: order!),
          ],
        ],
      ),
    );
  }
}

class _EtaHeader extends StatelessWidget {
  const _EtaHeader({
    required this.statusLabel,
    required this.minutes,
    required this.live,
  });

  final String statusLabel;
  final int? minutes;
  final bool live;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final int? eta = minutes;

    final String headline = eta == null
        ? statusLabel
        : eta <= 1
            ? l10n.trackingArrivingNow
            : l10n.minutesAway(eta);
    final String? arriveBy = eta == null || eta <= 1
        ? null
        : l10n.trackingArrivingBy(
            MaterialLocalizations.of(context).formatTimeOfDay(
              TimeOfDay.fromDateTime(
                DateTime.now().add(Duration(minutes: eta)),
              ),
            ),
          );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (eta != null && statusLabel.isNotEmpty)
                Text(
                  statusLabel,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.greenDeep,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              // Rolls up when the minutes change, the way a departures board
              // does, so a new estimate is noticed without being shouted.
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 380),
                transitionBuilder: (Widget child, Animation<double> a) =>
                    FadeTransition(
                  opacity: a,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.4),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(parent: a, curve: Curves.easeOutCubic),
                    ),
                    child: child,
                  ),
                ),
                child: Text(
                  headline,
                  key: ValueKey<String>(headline),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
              ),
              if (arriveBy != null)
                Text(
                  arriveBy,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        if (live) const _LiveBadge(),
      ],
    );
  }
}

/// A small "Live" badge with a breathing dot.
class _LiveBadge extends StatefulWidget {
  const _LiveBadge();

  @override
  State<_LiveBadge> createState() => _LiveBadgeState();
}

class _LiveBadgeState extends State<_LiveBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _breath = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _breath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool animate = !MediaQuery.disableAnimationsOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.greenDeep.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FadeTransition(
            opacity: animate
                ? Tween<double>(begin: 0.35, end: 1).animate(_breath)
                : const AlwaysStoppedAnimation<double>(1),
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: AppColors.greenDeep,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            l10n.trackingLive,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.greenDeep,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/// Four steps joined by bars. Finished bars are solid; the current one fills
/// with a moving sheen, which is how the order shows it is in progress
/// rather than stuck.
class _ProgressTracker extends StatefulWidget {
  const _ProgressTracker({required this.status});

  final OrderStatus status;

  @override
  State<_ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<_ProgressTracker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _sheen = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat();

  @override
  void dispose() {
    _sheen.dispose();
    super.dispose();
  }

  /// Which step is under way: 0 confirmed … 3 delivered.
  static int _stepOf(OrderStatus status) => switch (status) {
        OrderStatus.pendingPayment ||
        OrderStatus.placed ||
        OrderStatus.accepted =>
          0,
        OrderStatus.preparing ||
        OrderStatus.readyForPickup ||
        OrderStatus.riderAssigned =>
          1,
        OrderStatus.pickedUp => 2,
        OrderStatus.delivered => 3,
        _ => 0,
      };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final int step = _stepOf(widget.status);
    final bool animate = !MediaQuery.disableAnimationsOf(context);

    final List<(IconData, String)> steps = <(IconData, String)>[
      (Icons.check_rounded, l10n.trackingStepConfirmed),
      (Icons.soup_kitchen_rounded, l10n.trackingStepPreparing),
      (Icons.delivery_dining_rounded, l10n.trackingStepOnTheWay),
      (Icons.home_rounded, l10n.trackingStepDelivered),
    ];

    Widget dot(int i) {
      final bool done = i < step || step == 3;
      final bool current = i == step && step != 3;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: done || current
              ? AppColors.greenDeep
              : theme.colorScheme.surfaceContainerHighest,
          boxShadow: current
              ? <BoxShadow>[
                  BoxShadow(
                    color: AppColors.greenDeep.withValues(alpha: 0.35),
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
        child: Icon(
          steps[i].$1,
          size: 16,
          color: done || current
              ? Colors.white
              : theme.colorScheme.onSurfaceVariant,
        ),
      );
    }

    Widget bar(int i) {
      // Bar i joins step i and step i + 1.
      final bool filled = i < step;
      final bool active = i == step && step < 3;
      return Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: filled
                ? AppColors.greenDeep
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(2),
          ),
          child: active && animate
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: AnimatedBuilder(
                    animation: _sheen,
                    builder: (BuildContext context, _) => FractionallySizedBox(
                      alignment: AlignmentDirectional.centerStart,
                      widthFactor: Curves.easeInOut.transform(_sheen.value),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              AppColors.greenDeep.withValues(alpha: 0.15),
                              AppColors.greenDeep,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        ),
      );
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            dot(0),
            bar(0),
            dot(1),
            bar(1),
            dot(2),
            bar(2),
            dot(3),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            for (int i = 0; i < steps.length; i++)
              Expanded(
                child: Text(
                  steps[i].$2,
                  textAlign: i == 0
                      ? TextAlign.start
                      : i == steps.length - 1
                          ? TextAlign.end
                          : TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: i == step ? FontWeight.w800 : FontWeight.w500,
                    color: i <= step
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _RiderCard extends StatelessWidget {
  const _RiderCard({required this.tracking, required this.onCall});

  final OrderTracking? tracking;
  final ValueChanged<String> onCall;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? name = tracking?.riderName;

    if (name == null || name.trim().isEmpty) {
      return Row(
        children: <Widget>[
          const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2.2),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              l10n.trackingFindingRider,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      );
    }

    final String? phone = tracking?.riderPhone;
    final String? plate = tracking?.riderVehicleNumber;
    final String initial = name.trim().characters.first.toUpperCase();

    return Row(
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: AppColors.orangeGradient,
            shape: BoxShape.circle,
          ),
          child: Text(
            initial,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      l10n.riderLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  if (plate != null) ...<Widget>[
                    const SizedBox(width: 8),
                    _Plate(number: plate),
                  ],
                ],
              ),
            ],
          ),
        ),
        if (phone != null && phone.isNotEmpty)
          IconButton.filled(
            onPressed: () => onCall(phone),
            tooltip: l10n.callRider,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.greenDeep,
              foregroundColor: Colors.white,
              fixedSize: const Size.square(46),
            ),
            icon: const Icon(Icons.call_rounded),
          ),
      ],
    );
  }
}

/// The vehicle number, set like a plate so it is read as one.
class _Plate extends StatelessWidget {
  const _Plate({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: theme.colorScheme.onSurface, width: 1.2),
      ),
      child: Text(
        number.toUpperCase(),
        // A plate reads left to right in every language.
        textDirection: TextDirection.ltr,
        maxLines: 1,
        style: theme.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _OrderLine extends StatelessWidget {
  const _OrderLine({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? restaurant = order.restaurantName;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.receipt_long_rounded,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (restaurant != null && restaurant.isNotEmpty)
                  Text(
                    l10n.trackingOrderFrom(restaurant),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                Text(
                  '#${order.orderNumber}',
                  textDirection: TextDirection.ltr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
