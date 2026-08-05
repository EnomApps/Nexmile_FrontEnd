import 'dart:async';

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

/// Order confirmation and live-ish tracking.
///
/// The prototype advances the status on a timer so the whole journey is
/// demonstrable without a backend. When the orders API arrives, delete the
/// timer and drive [PlacedOrder.status] from the server (poll or socket) —
/// the stepper below does not care where the status comes from.
class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key, required this.args});

  final OrderArgs args;

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  static const Duration _stageDuration = Duration(seconds: 6);

  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(_stageDuration, (Timer timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      final CartController cart = context.read<CartController>();
      final PlacedOrder? order = cart.orderById(widget.args.orderId);
      if (order == null || order.status == OrderStatus.delivered) {
        timer.cancel();
        return;
      }
      cart.advance(order.id);
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final PlacedOrder? order =
        context.watch<CartController>().orderById(widget.args.orderId);

    if (order == null) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState(
          emoji: '📦',
          title: l10n.ordersEmptyTitle,
          subtitle: l10n.ordersEmptySubtitle,
        ),
      );
    }

    final bool delivered = order.status == OrderStatus.delivered;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.orderTitle(order.id))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          _StatusHeadline(order: order),
          const SizedBox(height: 24),
          _StatusStepper(status: order.status),
          const SizedBox(height: 24),
          _OrderSummaryCard(order: order),
          const SizedBox(height: 20),
          Text(
            l10n.prototypeTrackingNotice,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: GradientButton(
          label: delivered ? l10n.backToHome : l10n.keepBrowsing,
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.dashboard,
            (Route<void> route) => false,
          ),
        ),
      ),
    );
  }
}

class _StatusHeadline extends StatelessWidget {
  const _StatusHeadline({required this.order});

  final PlacedOrder order;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool delivered = order.status == OrderStatus.delivered;

    return Column(
      children: <Widget>[
        Container(
          width: 84,
          height: 84,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: delivered
                ? AppColors.greenGradient
                : AppColors.orangeGradient,
          ),
          child: Icon(
            delivered
                ? Icons.check_rounded
                : Icons.delivery_dining_rounded,
            size: 42,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          delivered ? l10n.orderDeliveredTitle : l10n.orderPlacedTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 6),
        Text(
          delivered
              ? l10n.orderDeliveredSubtitle
              : l10n.orderPlacedSubtitle(order.restaurant.deliveryMinutes),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _StatusStepper extends StatelessWidget {
  const _StatusStepper({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    final List<String> labels = <String>[
      l10n.statusOrderPlaced,
      l10n.statusPreparing,
      l10n.statusOnTheWay,
      l10n.statusDelivered,
    ];

    return Column(
      children: <Widget>[
        for (int i = 0; i < labels.length; i++)
          _StepRow(
            label: labels[i],
            isDone: i <= status.index,
            isCurrent: i == status.index,
            isLast: i == labels.length - 1,
          ),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.label,
    required this.isDone,
    required this.isCurrent,
    required this.isLast,
  });

  final String label;
  final bool isDone;
  final bool isCurrent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color accent = isDark ? AppColors.greenLight : AppColors.greenDeep;
    final Color inactive = theme.colorScheme.outline;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone ? accent : Colors.transparent,
                  border: Border.all(
                    color: isDone ? accent : inactive,
                    width: 2,
                  ),
                ),
                child: isDone
                    ? Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: isDark ? AppColors.black : Colors.white,
                      )
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    color: isDone ? accent : inactive,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 22, top: 2),
              child: Text(
                label,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: isDone
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderSummaryCard extends StatelessWidget {
  const _OrderSummaryCard({required this.order});

  final PlacedOrder order;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              FoodImage(
                emoji: order.restaurant.emoji,
                seed: order.restaurant.id,
                size: 44,
                radius: 12,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  order.restaurant.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 26),
          for (final ({String name, int quantity, int price}) item
              in order.items) ...<Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 34,
                  child: Text(
                    '${item.quantity}×',
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 10),
                Rupees(
                  item.price * item.quantity,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          const Divider(height: 16),
          const SizedBox(height: 10),
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
                order.total,
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
