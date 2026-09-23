import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/motion/app_motion.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../data/cart_models.dart';
import '../data/order_models.dart';
import '../state/orders_controller.dart';
import 'orders_tab.dart' show OrderStatusChip;
import 'widgets/catalogue_widgets.dart';
import 'widgets/rider_map.dart';

/// One order: where it is, what is in it, and what it cost.
///
/// While the order is in flight the controller polls `/orders/{id}/track` every
/// few seconds and stops the moment it finishes.
class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key, required this.args});

  final OrderArgs args;

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  /// Held rather than looked up in [dispose]: by then this element has been
  /// deactivated, and reaching back up the tree for a provider from there is
  /// unsafe — it throws the moment the screen is torn down with its ancestors.
  OrdersController? _orders;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<OrdersController>().open(widget.args.orderId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _orders = context.read<OrdersController>();
  }

  @override
  void dispose() {
    // Nothing is watching the tracker once this screen is gone.
    _orders?.stopPolling();
    super.dispose();
  }

  Future<void> _open(Uri uri) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool opened =
        await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(l10n.somethingWentWrong)));
    }
  }

  Future<void> _cancel(Order order) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final TextEditingController reason = TextEditingController();

    final bool confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(l10n.cancelOrderTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(l10n.cancelOrderMessage),
                const SizedBox(height: 12),
                TextField(
                  controller: reason,
                  maxLength: 120,
                  decoration: InputDecoration(
                    labelText: l10n.cancelReasonLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.keepBrowsing),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.cancelOrder),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed || !mounted) {
      reason.dispose();
      return;
    }

    final OrdersController controller = context.read<OrdersController>();
    final AuthFailure? failure = await controller.cancel(
      order.id,
      reason: reason.text.trim().isEmpty
          ? l10n.cancelReasonFallback
          : reason.text.trim(),
    );
    reason.dispose();

    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            failure == null ? l10n.orderCancelled : failure.message(l10n),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final OrdersController controller = context.watch<OrdersController>();
    final Order? order = controller.current;
    final OrderTracking? tracking = controller.tracking;

    if (order == null) {
      return Scaffold(
        appBar: AppBar(),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: EmptyState(
                  emoji: '📡',
                  title: l10n.somethingWentWrong,
                  subtitle: AuthFailure.unknown.message(l10n),
                  action: OutlinedButton(
                    onPressed: () =>
                        context.read<OrdersController>().open(widget.args.orderId),
                    child: Text(l10n.retry),
                  ),
                ),
              ),
      );
    }

    // The tracker is fresher than the order body while polling, so its label
    // and estimate win when both are present.
    final String statusLabel = tracking?.statusLabel.isNotEmpty ?? false
        ? tracking!.statusLabel
        : order.statusLabel;
    final OrderStatus status = tracking?.status ?? order.status;
    final int? eta = tracking?.estimatedMinutes ?? order.estimatedPrepMinutes;
    final String? pickupCode = tracking?.pickupCode ?? order.pickupCode;
    final String? cancellationReason =
        tracking?.cancellationReason ?? order.cancellationReason;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orderTitle(order.orderNumber)),
        actions: <Widget>[
          IconButton(
            tooltip: l10n.viewInvoice,
            icon: const Icon(Icons.receipt_long_outlined),
            onPressed: () => _open(controller.invoiceUrl(order.id)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  order.restaurantName ?? l10n.appName,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(width: 10),
              OrderStatusChip(label: statusLabel, status: status),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            order.fulfilmentType == FulfilmentType.pickup
                ? l10n.pickupLabel
                : l10n.deliveryLabel,
            style: theme.textTheme.bodySmall,
          ),
          if (status.isActive && eta != null) ...<Widget>[
            const SizedBox(height: 16),
            _Highlight(
              icon: Icons.timer_outlined,
              title: l10n.arrivingIn,
              value: l10n.minutesAway(eta),
              // A slow breath on the estimate is the one place a pulse earns
              // its keep: it is the app's only signal that the number is live
              // and being re-fetched, not frozen from when the screen opened.
              pulse: true,
            ),
          ],
          // Offered once the food has actually arrived, and nowhere else: a
          // rating asked for mid-delivery is a rating of the wait.
          if (status == OrderStatus.delivered) ...<Widget>[
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(
                AppRoutes.rateOrder,
                arguments: RateOrderArgs(order: order),
              ),
              icon: const Icon(Icons.star_outline_rounded),
              label: Text(l10n.rateThisOrder),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
          if (pickupCode != null && pickupCode.isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            _Highlight(
              icon: Icons.confirmation_number_outlined,
              title: l10n.pickupCodeLabel,
              value: pickupCode,
            ),
          ],
          if (cancellationReason != null && cancellationReason.isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            // Written by the merchant for the customer — shown verbatim.
            _Highlight(
              icon: Icons.info_outline_rounded,
              title: l10n.cancellationReasonLabel,
              value: cancellationReason,
              isError: true,
            ),
          ],
          if (tracking != null && (tracking.riderName ?? '').isNotEmpty) ...<Widget>[
            const SizedBox(height: 16),
            _RiderCard(
              tracking: tracking,
              orderId: order.id,
              onCall: (String phone) => _open(Uri.parse('tel:$phone')),
            ),
          ],
          if (order.timeline.isNotEmpty) ...<Widget>[
            const SizedBox(height: 24),
            Text(
              l10n.orderProgressTitle,
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            _Timeline(entries: order.timeline),
          ],
          const SizedBox(height: 24),
          Text(
            l10n.orderItemsTitle,
            style:
                theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          for (final OrderItem item in order.items) _OrderItemRow(item: item),
          if ((order.customerNote ?? '').isNotEmpty) ...<Widget>[
            const SizedBox(height: 12),
            Text(
              order.customerNote!,
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
          ],
          const SizedBox(height: 24),
          _OrderBill(order: order),
          const SizedBox(height: 24),
          if (status.isCancellable)
            OutlinedButton(
              onPressed: controller.isLoading ? null : () => _cancel(order),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
                side: BorderSide(color: theme.colorScheme.error),
                minimumSize: const Size.fromHeight(48),
              ),
              child: Text(l10n.cancelOrder),
            ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.of(context).popUntil(
              (Route<dynamic> route) => route.settings.name == AppRoutes.dashboard,
            ),
            child: Text(l10n.backToHome),
          ),
        ],
      ),
    );
  }
}

class _Highlight extends StatefulWidget {
  const _Highlight({
    required this.icon,
    required this.title,
    required this.value,
    this.isError = false,
    this.pulse = false,
  });

  final IconData icon;
  final String title;
  final String value;
  final bool isError;

  /// Breathes gently, to show the value is being refreshed.
  final bool pulse;

  @override
  State<_Highlight> createState() => _HighlightState();
}

class _HighlightState extends State<_Highlight>
    with SingleTickerProviderStateMixin {
  AnimationController? _breath;

  @override
  void initState() {
    super.initState();
    if (widget.pulse) {
      _breath = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1900),
      )..repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _breath?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final IconData icon = widget.icon;
    final String title = widget.title;
    final String value = widget.value;
    final Color tint =
        widget.isError ? theme.colorScheme.error : AppColors.greenDeep;

    final AnimationController? breath =
        AppMotion.reduced(context) ? null : _breath;

    final Widget dot = breath == null
        ? const SizedBox.shrink()
        : FadeTransition(
            opacity: Tween<double>(begin: 0.25, end: 1).animate(breath),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: tint, shape: BoxShape.circle),
            ),
          );

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: tint.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 20, color: tint),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: theme.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (breath != null) ...<Widget>[
                      const SizedBox(width: 8),
                      dot,
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The rider, with their live position when the API is sending one.
class _RiderCard extends StatelessWidget {
  const _RiderCard({
    required this.tracking,
    required this.orderId,
    required this.onCall,
  });

  final OrderTracking tracking;
  final int orderId;
  final ValueChanged<String> onCall;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? phone = tracking.riderPhone;

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: AppColors.orangeDeep,
                child: Icon(Icons.pedal_bike_rounded, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      l10n.riderLabel,
                      style: theme.textTheme.labelSmall,
                    ),
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
        ),
        if (tracking.hasRiderPosition) ...<Widget>[
          const SizedBox(height: 12),
          // A preview rather than a map to use: it follows the rider and
          // nothing else, and a tap hands over to the full-screen one. Pinching
          // a 180px map inside a scrolling list is a fight with the list.
          Semantics(
            button: true,
            label: l10n.trackRider,
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.liveTracking,
                arguments: OrderArgs(orderId: orderId),
              ),
              borderRadius: BorderRadius.circular(14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  height: 180,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: RiderMap(
                          rider: LatLng(
                            tracking.riderLatitude!,
                            tracking.riderLongitude!,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Icon(Icons.open_in_full_rounded,
                                    size: 14),
                                const SizedBox(width: 6),
                                Text(
                                  l10n.trackRider,
                                  style: theme.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.entries});

  final List<OrderTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        for (int i = 0; i < entries.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.greenDeep,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (i != entries.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Server-authored and already localised for the
                        // customer, so it is rendered verbatim.
                        Text(
                          entries[i].label,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        if (entries[i].at != null)
                          Text(
                            TimeOfDay.fromDateTime(entries[i].at!)
                                .format(context),
                            style: theme.textTheme.bodySmall,
                          ),
                        if ((entries[i].note ?? '').isNotEmpty)
                          Text(
                            entries[i].note!,
                            style: theme.textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _OrderItemRow extends StatelessWidget {
  const _OrderItemRow({required this.item});

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: VegMark(isVeg: item.isVeg, size: 14),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${item.quantity} × ${item.name}',
                  style: theme.textTheme.bodyMedium,
                ),
                if (item.options.isNotEmpty)
                  Text(
                    item.options
                        .map((OrderItemOption o) => o.name)
                        .join(', '),
                    style: theme.textTheme.bodySmall,
                  ),
                if ((item.notes ?? '').isNotEmpty)
                  Text(
                    item.notes!,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Rupees(item.lineTotal, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _OrderBill extends StatelessWidget {
  const _OrderBill({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              l10n.billDetailsTitle,
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 12),
          BillRow(label: l10n.itemTotal, amount: order.itemsTotal),
          if (order.packagingFee > 0)
            BillRow(label: l10n.packagingLabel, amount: order.packagingFee),
          if (order.fulfilmentType == FulfilmentType.delivery)
            BillRow(
              label: l10n.deliveryFeeLabel,
              amount: order.deliveryFee,
              freeLabel: order.deliveryFee == 0 ? l10n.freeLabel : null,
            ),
          if (order.discountTotal > 0)
            BillRow(
              label: l10n.discountLabel,
              amount: -order.discountTotal,
              highlight: true,
            ),
          if (order.taxTotal > 0)
            BillRow(label: l10n.taxesAndCharges, amount: order.taxTotal),
          const Divider(height: 24),
          BillRow(label: l10n.toPay, amount: order.grandTotal, emphasis: true),
        ],
      ),
    );
  }
}
