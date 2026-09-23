import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({super.key, required this.orderId});

  final int orderId;

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
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
    final ThemeData theme = Theme.of(context);
    final OrdersController controller = context.watch<OrdersController>();
    final OrderTracking? tracking = controller.tracking;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.trackRider)),
      body: tracking == null || !tracking.hasRiderPosition
          // The position is absent before a rider picks the order up, and
          // again for good once it is delivered. Neither is an error.
          ? _Waiting(message: l10n.riderLocationSoon)
          : Stack(
              children: <Widget>[
                Positioned.fill(
                  child: NotificationListener<ScrollNotification>(
                    child: Listener(
                      onPointerDown: (_) {
                        if (_follow) setState(() => _follow = false);
                      },
                      child: RiderMap(
                        rider: LatLng(
                          tracking.riderLatitude!,
                          tracking.riderLongitude!,
                        ),
                        interactive: true,
                        follow: _follow,
                      ),
                    ),
                  ),
                ),
                if (!_follow)
                  Positioned(
                    right: 16,
                    bottom: 150,
                    child: FloatingActionButton.small(
                      heroTag: 'recentre',
                      tooltip: l10n.recentreOnRider,
                      onPressed: () => setState(() => _follow = true),
                      child: const Icon(Icons.my_location_rounded),
                    ),
                  ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: _RiderSheet(
                    tracking: tracking,
                    onCall: _call,
                    theme: theme,
                    l10n: l10n,
                  ),
                ),
              ],
            ),
    );
  }
}

class _Waiting extends StatelessWidget {
  const _Waiting({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.pedal_bike_rounded,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The card over the map: who is carrying the order, how far away they are,
/// and the button that dials them.
class _RiderSheet extends StatelessWidget {
  const _RiderSheet({
    required this.tracking,
    required this.onCall,
    required this.theme,
    required this.l10n,
  });

  final OrderTracking tracking;
  final ValueChanged<String> onCall;
  final ThemeData theme;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final String? phone = tracking.riderPhone;
    final int? eta = tracking.estimatedMinutes;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 22,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(tracking.statusLabel, style: theme.textTheme.labelMedium),
          const SizedBox(height: 4),
          if (eta != null)
            Text(
              '${l10n.arrivingIn} ${l10n.minutesAway(eta)}',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              const CircleAvatar(child: Icon(Icons.person_rounded)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(l10n.riderLabel, style: theme.textTheme.labelSmall),
                    Text(
                      tracking.riderName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              if (phone != null && phone.isNotEmpty)
                IconButton.filled(
                  onPressed: () => onCall(phone),
                  icon: const Icon(Icons.call_rounded),
                  tooltip: l10n.callRider,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
