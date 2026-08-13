import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../data/storefront_models.dart';

/// Formats rupees the way a bill does: no decimals when the amount is whole,
/// two when it is not. `₹249` and `₹249.50` both read correctly; `₹249.00`
/// looks like a spreadsheet.
String formatRupees(double amount) {
  final bool isWhole = amount == amount.roundToDouble();
  return '₹${isWhole ? amount.round() : amount.toStringAsFixed(2)}';
}

/// Always left-to-right — a price reads the same way in every language, and
/// mirroring "₹249" would be wrong in Urdu.
class Rupees extends StatelessWidget {
  const Rupees(this.amount, {super.key, this.style, this.struck = false});

  final double amount;
  final TextStyle? style;

  /// Renders struck through, for a compare-at price.
  final bool struck;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatRupees(amount),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: (style ?? const TextStyle()).copyWith(
        decoration: struck ? TextDecoration.lineThrough : null,
      ),
    );
  }
}

/// The green (veg) or red (non-veg) square Indian menus are required to show.
class VegMark extends StatelessWidget {
  const VegMark({super.key, required this.isVeg, this.size = 16});

  final bool isVeg;
  final double size;

  @override
  Widget build(BuildContext context) {
    final Color color =
        isVeg ? const Color(0xFF0F8A0F) : const Color(0xFFB3261E);
    return Semantics(
      label: isVeg ? 'Veg' : 'Non-veg',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.6),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Container(
            width: size * 0.45,
            height: size * 0.45,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}

/// Remote image with a branded fallback.
///
/// Image URLs from the API are signed and expiring, so a broken link is a
/// normal event rather than a bug — it falls back to an emoji on a brand
/// gradient, keyed off the id so the same shop always looks the same.
class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.seed,
    this.url,
    this.emoji = '🍽️',
    this.size = 96,
    this.radius = 16,
  });

  final String seed;
  final String? url;
  final String emoji;
  final double size;
  final double radius;

  static const List<List<Color>> _light = <List<Color>>[
    <Color>[Color(0xFFE8F5D8), Color(0xFFCDE9A8)],
    <Color>[Color(0xFFFFE9D6), Color(0xFFFFD0A8)],
    <Color>[Color(0xFFE4F1E1), Color(0xFFBFE0C4)],
    <Color>[Color(0xFFFFF1D6), Color(0xFFFFE0A3)],
  ];
  static const List<List<Color>> _dark = <List<Color>>[
    <Color>[Color(0xFF1E2A14), Color(0xFF2C3D1B)],
    <Color>[Color(0xFF2E2013), Color(0xFF3E2A16)],
    <Color>[Color(0xFF17251A), Color(0xFF213525)],
    <Color>[Color(0xFF2C2413), Color(0xFF3A301A)],
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final List<Color> colors =
        (isDark ? _dark : _light)[seed.hashCode.abs() % _light.length];

    final Widget fallback = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      // The banner passes an infinite size to fill its slot, which would make
      // the emoji's font size infinite too.
      child: Text(
        emoji,
        style: TextStyle(fontSize: size.isFinite ? size * 0.42 : 48),
      ),
    );

    final String? src = url;
    if (src == null || src.isEmpty) return fallback;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        src,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => fallback,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? progress) {
          if (progress == null) return child;
          return fallback;
        },
      ),
    );
  }
}

/// One line of a bill, on both the cart and the order screens.
class BillRow extends StatelessWidget {
  const BillRow({
    super.key,
    required this.label,
    required this.amount,
    this.freeLabel,
    this.highlight = false,
    this.emphasis = false,
  });

  final String label;
  final double amount;

  /// Shown instead of the amount when the charge was waived — "₹0" hides the
  /// fact that free delivery was earned.
  final String? freeLabel;

  /// Green, for a discount.
  final bool highlight;

  /// The total row.
  final bool emphasis;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? style = emphasis
        ? theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)
        : theme.textTheme.bodyMedium?.copyWith(
            color: highlight ? const Color(0xFF0F8A0F) : null,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label, style: style)),
          const SizedBox(width: 12),
          if (freeLabel != null)
            Text(
              freeLabel!,
              style: style?.copyWith(
                color: const Color(0xFF0F8A0F),
                fontWeight: FontWeight.w700,
              ),
            )
          else
            Rupees(amount, style: style),
        ],
      ),
    );
  }
}

/// Says *why* a shop is shut. "Closed for the night" and "not taking orders"
/// are different messages, and only one of them is worth waiting for.
class ClosedNotice extends StatelessWidget {
  const ClosedNotice({super.key, required this.restaurant, this.compact = false});

  final Restaurant restaurant;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (restaurant.isOpen) return const SizedBox.shrink();

    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String message = restaurant.withinOperatingHours
        ? l10n.notTakingOrders
        : l10n.closedRightNow;

    if (compact) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: theme.colorScheme.error.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.error,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.error.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.error.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.schedule_rounded,
              size: 18, color: theme.colorScheme.error),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

/// Restaurant row on the home and search tabs.
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final BorderRadius radius = BorderRadius.circular(AppTheme.radiusLarge);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // A shut shop is dimmed rather than hidden — customers look
                // for a favourite by name even when it is closed.
                Opacity(
                  opacity: restaurant.isOpen ? 1 : 0.55,
                  child: FoodImage(
                    seed: restaurant.id,
                    url: restaurant.logoUrl,
                    size: 92,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                            l10n.minutesAway(restaurant.avgPrepTimeMinutes),
                            style: theme.textTheme.bodySmall,
                          ),
                          if (restaurant.distanceKmLabel != null)
                            Text(
                              l10n.kilometresAway(restaurant.distanceKmLabel!),
                              style: theme.textTheme.bodySmall,
                            ),
                          if (!restaurant.isOpen)
                            ClosedNotice(restaurant: restaurant, compact: true),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        restaurant.area.isEmpty
                            ? restaurant.serviceCategory
                            : '${restaurant.serviceCategory} · ${restaurant.area}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                      if (restaurant.minOrderValue > 0) ...<Widget>[
                        const SizedBox(height: 2),
                        Text(
                          l10n.minimumOrder(
                            formatRupees(restaurant.minOrderValue),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ADD button / quantity stepper.
class QuantityControl extends StatelessWidget {
  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    this.enabled = true,
  });

  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color accent = isDark ? AppColors.greenLight : AppColors.greenDeep;

    if (quantity == 0) {
      return SizedBox(
        width: 104,
        height: 38,
        child: OutlinedButton(
          onPressed: enabled ? onAdd : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: accent,
            side: BorderSide(color: accent, width: 1.4),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              l10n.addLabel,
              maxLines: 1,
              style: theme.textTheme.labelLarge?.copyWith(
                color: accent,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      );
    }

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        width: 104,
        height: 38,
        decoration: BoxDecoration(
          color: accent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _StepperButton(
              icon: Icons.remove_rounded,
              onTap: enabled ? onRemove : null,
              foreground: isDark ? AppColors.black : Colors.white,
            ),
            Text(
              '$quantity',
              textDirection: TextDirection.ltr,
              style: theme.textTheme.titleMedium?.copyWith(
                color: isDark ? AppColors.black : Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            _StepperButton(
              icon: Icons.add_rounded,
              onTap: enabled ? onAdd : null,
              foreground: isDark ? AppColors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.onTap,
    required this.foreground,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 22,
      child: SizedBox(
        width: 34,
        height: 38,
        child: Icon(icon, size: 18, color: foreground),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    this.action,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(emoji, style: const TextStyle(fontSize: 52)),
          const SizedBox(height: 16),
          Text(title,
              textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(subtitle,
              textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
          if (action != null) ...<Widget>[
            const SizedBox(height: 20),
            action!,
          ],
        ],
      ),
    );
  }
}

/// Food Rescue card: surplus food, discounted, and racing a clock.
class RescueDealCard extends StatelessWidget {
  const RescueDealCard({super.key, required this.deal, required this.onTap});

  final RescueDeal deal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return SizedBox(
      width: 230,
      child: Material(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FoodImage(
                        seed: deal.id,
                        url: deal.imageUrl,
                        emoji: '♻️',
                        size: 46,
                        radius: 12,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          deal.itemName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    deal.restaurantName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      Rupees(
                        deal.price,
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      if (deal.compareAtPrice != null) ...<Widget>[
                        const SizedBox(width: 6),
                        Flexible(
                          child: Rupees(
                            deal.compareAtPrice!,
                            struck: true,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  // A rescue deal is a race; the count is the whole point.
                  Text(
                    l10n.portionsLeft(deal.portionsLeft),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.orangeDeep,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
