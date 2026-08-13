import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../data/order_models.dart';
import '../state/orders_controller.dart';
import 'widgets/catalogue_widgets.dart';

/// Order history, newest first, with the in-flight ones lifted to the top.
class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key, required this.onBrowse});

  /// Switches the shell back to the home tab — the only useful thing to do
  /// from an empty order list.
  final VoidCallback onBrowse;

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final AppLocalizations l10n = AppLocalizations.of(context);
    final AuthFailure? failure = await context.read<OrdersController>().load();
    if (failure != null && mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(failure.message(l10n))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final OrdersController controller = context.watch<OrdersController>();

    final List<Order> active = controller.active;
    final List<Order> past = controller.orders
        .where((Order o) => !o.status.isActive)
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ordersTitle)),
      body: RefreshIndicator(
        onRefresh: _load,
        child: Builder(
          builder: (BuildContext context) {
            if (controller.isLoading && !controller.hasLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.orders.isEmpty) {
              return ListView(
                children: <Widget>[
                  EmptyState(
                    emoji: '🧾',
                    title: l10n.ordersEmptyTitle,
                    subtitle: l10n.ordersEmptySubtitle,
                    action: FilledButton(
                      onPressed: widget.onBrowse,
                      child: Text(l10n.browseRestaurants),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.only(bottom: 110),
              children: <Widget>[
                if (active.isNotEmpty) ...<Widget>[
                  SectionHeader(title: l10n.activeOrdersTitle),
                  for (final Order order in active)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: _OrderCard(order: order),
                    ),
                ],
                if (past.isNotEmpty) ...<Widget>[
                  SectionHeader(title: l10n.pastOrdersTitle),
                  for (final Order order in past)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: _OrderCard(order: order),
                    ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final BorderRadius radius = BorderRadius.circular(16);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.orderStatus,
          arguments: OrderArgs(orderId: order.id),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        order.restaurantName ?? l10n.appName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OrderStatusChip(
                      label: order.statusLabel,
                      status: order.status,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.orderTitle(order.orderNumber),
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  order.items
                      .map((OrderItem i) => '${i.quantity} × ${i.name}')
                      .join(', '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        l10n.itemsInCart(order.itemCount),
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    Rupees(
                      order.grandTotal,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Status pill. The label is the server's — it knows about statuses this build
/// may not — but the colour is derived locally so an unknown one stays neutral.
class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({
    super.key,
    required this.label,
    required this.status,
  });

  final String label;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color color = switch (status) {
      OrderStatus.delivered => const Color(0xFF0F8A0F),
      OrderStatus.cancelled ||
      OrderStatus.rejected =>
        theme.colorScheme.error,
      OrderStatus.unknown => theme.colorScheme.onSurfaceVariant,
      _ => AppColors.orangeDeep,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelSmall
            ?.copyWith(color: color, fontWeight: FontWeight.w800),
      ),
    );
  }
}
