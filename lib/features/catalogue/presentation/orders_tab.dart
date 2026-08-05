import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/catalogue_models.dart';
import '../state/cart_controller.dart';
import 'widgets/catalogue_widgets.dart';

/// Order history for the session.
///
/// In-memory only — the prototype has no orders API, so this empties when the
/// app restarts.
class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key, required this.onBrowse});

  /// Sends the customer back to the home tab from the empty state.
  final VoidCallback onBrowse;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<PlacedOrder> orders = context.watch<CartController>().orders;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ordersTitle)),
      body: orders.isEmpty
          ? EmptyState(
              emoji: '📦',
              title: l10n.ordersEmptyTitle,
              subtitle: l10n.ordersEmptySubtitle,
              action: OutlinedButton(
                onPressed: onBrowse,
                child: Text(l10n.browseRestaurants),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (BuildContext context, int index) =>
                  _OrderCard(order: orders[index]),
            ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final PlacedOrder order;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final BorderRadius radius = BorderRadius.circular(AppTheme.radiusLarge);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.orderStatus,
          arguments: OrderArgs(orderId: order.id),
        ),
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FoodImage(
                      emoji: order.restaurant.emoji,
                      seed: order.restaurant.id,
                      size: 48,
                      radius: 12,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            order.restaurant.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${order.id} · ${order.placedAtLabel}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    _OrderStatusChip(status: order.status),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  order.items
                      .map((({String name, int quantity, int price}) i) =>
                          '${i.quantity}× ${i.name}')
                      .join(', '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
                const Divider(height: 24),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              l10n.itemsInCart(order.itemCount),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Rupees(
                            order.total,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        context.read<CartController>().reorder(order);
                        Navigator.of(context).pushNamed(AppRoutes.cart);
                      },
                      icon: const Icon(Icons.refresh_rounded, size: 18),
                      label: Text(l10n.reorder),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            theme.brightness == Brightness.dark
                                ? AppColors.greenLight
                                : AppColors.greenDeep,
                      ),
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

class _OrderStatusChip extends StatelessWidget {
  const _OrderStatusChip({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final (String label, Color color) = switch (status) {
      OrderStatus.placed => (l10n.statusOrderPlaced, AppColors.orangeDeep),
      OrderStatus.preparing => (l10n.statusPreparing, AppColors.orangeDeep),
      OrderStatus.onTheWay => (l10n.statusOnTheWay, AppColors.orangeDeep),
      OrderStatus.delivered => (
          l10n.statusDelivered,
          isDark ? AppColors.greenLight : AppColors.greenDeep
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      constraints: const BoxConstraints(maxWidth: 110),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.18 : 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
