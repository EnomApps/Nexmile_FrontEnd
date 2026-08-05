import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/catalogue_models.dart';
import '../state/cart_controller.dart';
import 'widgets/catalogue_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController cart = context.watch<CartController>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cartTitle)),
      body: cart.isEmpty
          ? EmptyState(
              emoji: '🛒',
              title: l10n.cartEmptyTitle,
              subtitle: l10n.cartEmptySubtitle,
              action: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.browseRestaurants),
              ),
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              children: <Widget>[
                _RestaurantStrip(restaurant: cart.restaurant!),
                const SizedBox(height: 16),
                for (final CartLine line in cart.lines) ...<Widget>[
                  _CartLineRow(line: line, restaurant: cart.restaurant!),
                  const Divider(height: 26),
                ],
                const SizedBox(height: 8),
                _BillCard(bill: cart.bill),
                const SizedBox(height: 20),
                Text(
                  l10n.prototypeCheckoutNotice,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
      bottomNavigationBar: cart.isEmpty
          ? null
          : SafeArea(
              minimum: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: GradientButton(
                label: l10n.placeOrderFor(cart.bill.toPay),
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  final PlacedOrder? order = cart.placeOrder();
                  if (order == null) return;
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.orderStatus,
                    arguments: OrderArgs(orderId: order.id),
                  );
                },
              ),
            ),
    );
  }
}

class _RestaurantStrip extends StatelessWidget {
  const _RestaurantStrip({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Row(
      children: <Widget>[
        FoodImage(emoji: restaurant.emoji, seed: restaurant.id, size: 52),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                restaurant.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                l10n.minutesAway(restaurant.deliveryMinutes),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CartLineRow extends StatelessWidget {
  const _CartLineRow({required this.line, required this.restaurant});

  final CartLine line;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CartController cart = context.read<CartController>();

    return Row(
      children: <Widget>[
        VegMark(isVeg: line.dish.isVeg),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            line.dish.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall,
          ),
        ),
        const SizedBox(width: 10),
        QuantityControl(
          quantity: line.quantity,
          onAdd: () => cart.add(line.dish, restaurant),
          onRemove: () => cart.remove(line.dish),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 62,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerEnd,
              child: Rupees(
                line.lineTotal,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BillCard extends StatelessWidget {
  const _BillCard({required this.bill});

  final BillSummary bill;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: <Widget>[
          _BillRow(label: l10n.itemTotal, amount: bill.itemTotal),
          const SizedBox(height: 10),
          _BillRow(
            label: l10n.deliveryFeeLabel,
            amount: bill.deliveryFee,
            // Zero here means the free-delivery threshold was met.
            freeLabel: bill.deliveryFee == 0 ? l10n.freeLabel : null,
          ),
          const SizedBox(height: 10),
          _BillRow(label: l10n.taxesAndCharges, amount: bill.taxes),
          const Divider(height: 26),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.toPay,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Rupees(
                bill.toPay,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  const _BillRow({
    required this.label,
    required this.amount,
    this.freeLabel,
  });

  final String label;
  final int amount;
  final String? freeLabel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(width: 12),
        if (freeLabel != null)
          Text(
            freeLabel!,
            maxLines: 1,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.greenDeep,
              fontWeight: FontWeight.w800,
            ),
          )
        else
          Rupees(amount, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
