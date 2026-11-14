import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/motion/nexmile_loader.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/order_models.dart';
import '../state/orders_controller.dart';
import 'order_status_screen.dart' show dispatchMessage;
import 'widgets/rider_map.dart';
import 'widgets/tracking/route_geometry.dart';

/// The rider, full screen, for as long as the customer wants to watch.
///
/// Reads the same poll the order screen started — it does not open a second
/// one — so opening and closing this screen costs nothing beyond the frames.
/// When the order finishes, polling stops upstream and this screen stops with
/// it rather than holding a dead timer open.
///
/// Laid out the way ride and delivery apps do it: the map edge to edge with
/// the bike moving on it, and a sheet that leads with the one number people
/// open the screen for, then who is coming and on what.
class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key, required this.orderId});

  final int orderId;

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  /// Fractions of the screen the sheet rests at.
  static const double _sheetMin = 0.30;
  static const double _sheetStart = 0.42;
  static const double _sheetMax = 0.82;

  /// False once the customer drags the map: following them around after they
  /// have deliberately looked somewhere else is a fight over the viewport.
  bool _follow = true;

  /// How much of the screen the sheet covers right now, so the recentre
  /// button can ride just above it.
  double _sheetExtent = _sheetStart;

  Future<void> _launch(Uri uri) async {
    final bool opened = await launchUrl(uri);
    if (!opened && mounted) {
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
    final List<LatLng> route = tracking == null
        ? const <LatLng>[]
        : tracking.route
            .map((GeoPoint p) => p.toLatLng())
            .toList(growable: false);

    final MediaQueryData media = MediaQuery.of(context);
    final double screen = media.size.height;

    // Nothing to put on a map yet: no rider and neither end known.
    final bool hasMap =
        rider != null || destination != null || restaurant != null;

    return Scaffold(
      body: NotificationListener<DraggableScrollableNotification>(
        onNotification: (DraggableScrollableNotification n) {
          setState(() => _sheetExtent = n.extent);
          return false;
        },
        child: Stack(
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
                        route: route,
                        heading: tracking?.riderHeading,
                        destinationLabel: l10n.trackingPinYou,
                        restaurantLabel: order?.restaurantName,
                        interactive: true,
                        follow: _follow,
                        padding: EdgeInsets.only(
                          top: media.padding.top + 56,
                          bottom: screen * _sheetStart,
                        ),
                      ),
                    )
                  : const NexmileLoader(),
            ),
            // Back, and the stale notice, clear of the status bar.
            Positioned(
              top: media.padding.top + 8,
              left: 12,
              right: 12,
              child: Row(
                children: <Widget>[
                  _MapButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  // Takes whatever the button leaves, so a long translation
                  // ellipsizes instead of pushing anything off screen.
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 56),
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: tracking != null &&
                                  tracking.isStale(DateTime.now())
                              ? _StaleNotice(
                                  message: l10n.riderLocationStale,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Recentre rides just above the sheet, where the thumb already is.
            Positioned(
              right: 16,
              bottom: screen * _sheetExtent + 14,
              child: _MapButton(
                icon: _follow
                    ? Icons.my_location_rounded
                    : Icons.location_searching_rounded,
                tooltip: l10n.recentreOnRider,
                highlighted: !_follow,
                onPressed: () => setState(() => _follow = true),
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
                distanceToGo: _distanceToGo(rider, destination, route),
                onCall: (String phone) =>
                    _launch(Uri(scheme: 'tel', path: phone)),
                onMessage: (String phone) =>
                    _launch(Uri(scheme: 'sms', path: phone)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// How far the rider still has to ride: along the road when there is one,
  /// as the crow flies when there is not.
  static double? _distanceToGo(
    LatLng? rider,
    LatLng? destination,
    List<LatLng> route,
  ) {
    if (rider == null || destination == null) return null;
    if (route.length >= 2) {
      final RoutePath path = RoutePath(route);
      if (path.isUsable) return path.length - path.project(rider).along;
    }
    return distanceMetres(rider, destination);
  }
}

class _MapButton extends StatelessWidget {
  const _MapButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.highlighted = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool highlighted;

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
        iconSize: 24,
        padding: const EdgeInsets.all(12),
        icon: Icon(
          icon,
          color: highlighted
              ? const Color(0xFF1967D2)
              : theme.colorScheme.onSurface,
        ),
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

/// The sheet: arrival, progress, the rider, and where it is going.
class _TrackingSheet extends StatelessWidget {
  const _TrackingSheet({
    required this.scroll,
    required this.tracking,
    required this.order,
    required this.distanceToGo,
    required this.onCall,
    required this.onMessage,
  });

  final ScrollController scroll;
  final OrderTracking? tracking;
  final Order? order;
  final double? distanceToGo;
  final ValueChanged<String> onCall;
  final ValueChanged<String> onMessage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final OrderTracking? t = tracking;
    final Order? o = order;
    final OrderStatus status = t?.status ?? o?.status ?? OrderStatus.placed;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ListView(
        controller: scroll,
        padding: EdgeInsets.fromLTRB(
          16,
          10,
          16,
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
          const SizedBox(height: 14),
          _EtaCard(tracking: t, distanceToGo: distanceToGo),
          const SizedBox(height: 18),
          _ProgressTracker(status: status),
          const SizedBox(height: 18),
          _RiderCard(
            tracking: t,
            onCall: onCall,
            onMessage: onMessage,
            waiting: o != null && o.dispatchStatus.isNews
                ? dispatchMessage(o, l10n)
                : null,
          ),
          if (o != null) ...<Widget>[
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        l10n.trackingDeliveringTo,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        o.deliveryAddress.isNotEmpty
                            ? o.deliveryAddress
                            : '#${o.orderNumber}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    minimumSize: const Size(0, 44),
                  ),
                  child: Text(l10n.trackingOrderDetails),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// "Arriving in 12 min", on a soft green wash, with how far the rider is.
class _EtaCard extends StatelessWidget {
  const _EtaCard({required this.tracking, required this.distanceToGo});

  final OrderTracking? tracking;
  final double? distanceToGo;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final OrderTracking? t = tracking;
    final int? eta = t?.estimatedMinutes;
    final bool dark = theme.brightness == Brightness.dark;
    final bool live =
        t != null && t.hasRiderPosition && !t.isStale(DateTime.now());

    final TextStyle? big = theme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w800,
      height: 1.2,
    );

    final Widget headline = eta == null
        ? Text(t?.statusLabel ?? '', style: big)
        : eta <= 1
            ? Text(
                l10n.trackingArrivingNow,
                style: big?.copyWith(color: AppColors.greenDeep),
              )
            : Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: '${l10n.arrivingIn} '),
                    TextSpan(
                      text: l10n.minutesAway(eta),
                      style: const TextStyle(color: AppColors.greenDeep),
                    ),
                  ],
                ),
                style: big,
              );

    final String? name = t?.riderName?.trim();
    final double? metres = distanceToGo;
    final String? subtitle = name != null && name.isNotEmpty && metres != null
        ? l10n.trackingRiderAway(
            name.split(' ').first,
            l10n.kilometresAway((metres / 1000).toStringAsFixed(1)),
          )
        : eta == null
            ? null
            : t?.statusLabel;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 14, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.greenDeep.withValues(alpha: dark ? 0.35 : 0.18),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            theme.colorScheme.surface,
            AppColors.greenDeep.withValues(alpha: dark ? 0.22 : 0.10),
          ],
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Rolls up when the minutes change, so a new estimate is
                // noticed without being shouted.
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
                  child: KeyedSubtree(
                    key: ValueKey<String>('${eta ?? t?.statusLabel}'),
                    child: headline,
                  ),
                ),
                if (subtitle != null && subtitle.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      if (live) ...<Widget>[
                        const _LiveDot(),
                        const SizedBox(width: 6),
                      ],
                      Flexible(
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.orangeDeep.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.delivery_dining_rounded,
              size: 40,
              color: AppColors.orangeDeep,
            ),
          ),
        ],
      ),
    );
  }
}

/// A small breathing dot: the position is live.
class _LiveDot extends StatefulWidget {
  const _LiveDot();

  @override
  State<_LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<_LiveDot>
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
    final bool animate = !MediaQuery.disableAnimationsOf(context);
    return Semantics(
      label: AppLocalizations.of(context).trackingLive,
      child: FadeTransition(
        opacity: animate
            ? Tween<double>(begin: 0.35, end: 1).animate(_breath)
            : const AlwaysStoppedAnimation<double>(1),
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.greenDeep,
            shape: BoxShape.circle,
          ),
        ),
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
        OrderStatus.riderAssigned ||
        OrderStatus.reachedRestaurant =>
          1,
        OrderStatus.pickedUp || OrderStatus.reachedCustomer => 2,
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

/// Who is coming: the plate first, the way people spot their bike in a
/// street, then the name, a face, and the two ways to reach them.
class _RiderCard extends StatelessWidget {
  const _RiderCard({
    required this.tracking,
    required this.onCall,
    required this.onMessage,
    this.waiting,
  });

  final OrderTracking? tracking;

  /// What to say before a rider is assigned.
  final String? waiting;
  final ValueChanged<String> onCall;
  final ValueChanged<String> onMessage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? name = tracking?.riderName?.trim();

    if (name == null || name.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2.2),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                waiting ?? l10n.trackingFindingRider,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }

    final String? phone = tracking?.riderPhone;
    final String? plate = tracking?.riderVehicleNumber;
    final String first = name.split(' ').first;
    final bool hasPhone = phone != null && phone.isNotEmpty;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 16, 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (plate != null && plate.isNotEmpty)
                      Text(
                        plate.toUpperCase().replaceAll(' ', ''),
                        // A plate reads left to right in every language.
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      <String>[
                        l10n.riderLabel,
                        if (_vehicle(tracking?.riderVehicleType, l10n)
                            case final String vehicle)
                          vehicle,
                      ].join(' · '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _Avatar(initial: first.characters.first.toUpperCase()),
            ],
          ),
          if (hasPhone) ...<Widget>[
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Material(
                  shape: CircleBorder(
                    side: BorderSide(color: theme.colorScheme.outlineVariant),
                  ),
                  color: theme.colorScheme.surface,
                  child: IconButton(
                    tooltip: l10n.callRider,
                    onPressed: () => onCall(phone),
                    padding: const EdgeInsets.all(14),
                    icon: const Icon(Icons.call_rounded),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Material(
                    color: theme.colorScheme.surface,
                    shape: StadiumBorder(
                      side: BorderSide(color: theme.colorScheme.outlineVariant),
                    ),
                    child: InkWell(
                      customBorder: const StadiumBorder(),
                      onTap: () => onMessage(phone),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.chat_rounded,
                              size: 22,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                l10n.trackingMessageRider(first),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// The vehicle in the customer's language, or the server's word for one this
/// build does not know.
String? _vehicle(String? type, AppLocalizations l10n) {
  if (type == null) return null;
  return switch (type.toLowerCase()) {
    'bike' || 'motorcycle' || 'motorbike' => l10n.vehicleBike,
    'scooter' => l10n.vehicleScooter,
    'bicycle' || 'cycle' => l10n.vehicleBicycle,
    'ev' || 'electric' || 'electric_scooter' || 'e_scooter' =>
      l10n.vehicleElectric,
    _ => type[0].toUpperCase() + type.substring(1).replaceAll('_', ' '),
  };
}

/// The rider's initial in a ring, standing in for the photo the API does not
/// send yet.
class _Avatar extends StatelessWidget {
  const _Avatar({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.orangeGradient,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.surface,
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.orangeDeep.withValues(alpha: 0.12),
          ),
          child: Text(
            initial,
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.orangeDeep,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
