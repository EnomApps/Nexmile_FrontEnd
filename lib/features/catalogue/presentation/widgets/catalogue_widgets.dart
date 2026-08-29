import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/motion/app_motion.dart';
import '../../../../core/motion/pressable.dart';
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
      width: size.isFinite ? size : null,
      height: size.isFinite ? size : null,
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

    // An infinite `size` means "fill whatever box you are given". Passing that
    // straight to Image.network makes it lay out square against the smaller
    // axis instead of filling, so the fill case drops the explicit dimensions
    // and expands instead.
    final bool fills = !size.isFinite;

    final Widget image = Image.network(
      src,
      width: fills ? null : size,
      height: fills ? null : size,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => fallback,
      loadingBuilder:
          (BuildContext context, Widget child, ImageChunkEvent? progress) {
        if (progress == null) return child;
        return fallback;
      },
    );

    if (fills) {
      return radius == 0
          ? SizedBox.expand(child: image)
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: SizedBox.expand(child: image),
            );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: image,
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
      // Solid rather than tinted: the compact badge sits over a photograph on
      // the restaurant card, where a 12%-alpha wash would disappear.
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.error,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onError,
            fontWeight: FontWeight.w800,
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
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    // Heavier and tighter than the body scale it sits above:
                    // a heading should read as a different voice, not as the
                    // same sentence in bold.
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.7,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 5),
                // A short brand rule under the first word's worth of title.
                // Cheaper than a bigger type size and it does not push the
                // content it introduces further down the page.
                Container(
                  width: 26,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.orangeDeep,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...<Widget>[
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: trailing!,
            ),
          ],
        ],
      ),
    );
  }
}

/// Restaurant card on the home and search tabs.
///
/// A photo-led card rather than a bordered row: in a delivery app the picture
/// is the product, and a list of text rows reads like a directory. The facts a
/// customer actually chooses on — distance, prep time, whether it is open —
/// float over the image, so the block of text below stays short enough to scan.
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
    this.onFavourite,
    this.compact = false,
  });

  final Restaurant restaurant;
  final VoidCallback onTap;

  /// Shows the bookmark when given. Absent on search results, where the row is
  /// about finding a shop rather than keeping it.
  final VoidCallback? onFavourite;

  /// Two-across grid form: shorter image, tighter type.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final BorderRadius radius = BorderRadius.circular(AppTheme.radiusLarge);
    final bool isOpen = restaurant.isOpen;

    return Pressable(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: radius,
          border: Border.all(color: theme.colorScheme.outline),
          // A single soft shadow lifts the card off the page. Dark themes get
          // none — a shadow on a dark ground reads as mud.
          boxShadow: isDark
              ? null
              : <BoxShadow>[
                  BoxShadow(
                    color: AppColors.inkStrong.withValues(alpha: 0.07),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: compact ? 4 / 3 : 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // A shut shop is dimmed rather than hidden — customers look
                  // for a favourite by name even when it is closed.
                  ColorFiltered(
                    colorFilter: isOpen
                        ? const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          )
                        : const ColorFilter.matrix(_greyscale),
                    child: FoodImage(
                      seed: restaurant.id,
                      url: restaurant.bannerUrl.isEmpty
                          ? restaurant.logoUrl
                          : restaurant.bannerUrl,
                      size: double.infinity,
                      radius: 0,
                    ),
                  ),
                  // Scrim only along the bottom, so the pills stay legible on a
                  // bright photo without dulling the whole image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: <Color>[Colors.black54, Colors.transparent],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 10,
                    child: Row(
                      children: <Widget>[
                        _GlassPill(
                          icon: Icons.schedule_rounded,
                          label: l10n.minutesAway(restaurant.avgPrepTimeMinutes),
                        ),
                        if (restaurant.distanceKmLabel != null) ...<Widget>[
                          const SizedBox(width: 6),
                          _GlassPill(
                            icon: Icons.near_me_rounded,
                            label: l10n.kilometresAway(
                              restaurant.distanceKmLabel!,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (!isOpen)
                    PositionedDirectional(
                      top: 10,
                      start: 12,
                      child: ClosedNotice(restaurant: restaurant, compact: true),
                    )
                  // The offer ribbon and the closed badge occupy the same
                  // corner. A shut shop's hours matter more than its discount.
                  else if (restaurant.offers.isNotEmpty)
                    PositionedDirectional(
                      top: 10,
                      start: 12,
                      // Leaves the bookmark its corner. Without this the
                      // ribbon runs under it and the two overlap.
                      end: onFavourite != null ? 48 : 12,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: _OfferRibbon(
                          label: restaurant.offers.first.label,
                        ),
                      ),
                    ),
                  if (restaurant.isPureVeg && onFavourite == null)
                    const PositionedDirectional(
                      top: 10,
                      end: 12,
                      child: VegMark(isVeg: true, size: 20),
                    ),
                  if (onFavourite != null)
                    PositionedDirectional(
                      top: 4,
                      end: 4,
                      child: _FavouriteButton(
                        isFavourite: restaurant.isFavourite,
                        onTap: onFavourite!,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          restaurant.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                      // Hidden entirely until the API sends a rating. A "0.0"
                      // badge reads as *bad*, where an unrated shop is merely
                      // new.
                      if (restaurant.hasRating) ...<Widget>[
                        const SizedBox(width: 8),
                        RatingBadge(rating: restaurant.rating!),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    restaurant.subtitle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  if (restaurant.minOrderValue > 0) ...<Widget>[
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            l10n.minimumOrder(
                              formatRupees(restaurant.minOrderValue),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Luminance-weighted greyscale, for a shop that is shut.
  static const List<double> _greyscale = <double>[
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0, //
  ];
}

/// A frosted pill that sits over a photograph.
class _GlassPill extends StatelessWidget {
  const _GlassPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// ADD button that morphs into a quantity stepper.
///
/// The swap is animated rather than instant: adding the first item is the
/// moment the app most needs to feel responsive, and a control that pops from
/// one shape to another makes a fast action feel like a page reload.
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
    final Color onAccent = isDark ? AppColors.black : Colors.white;
    final bool isEmpty = quantity == 0;

    return AnimatedContainer(
      duration: AppMotion.quick,
      curve: AppMotion.enter,
      width: 104,
      height: 38,
      decoration: BoxDecoration(
        // Outlined while empty, filled once something is in the cart. The fill
        // is what makes a chosen dish scannable down a long menu.
        color: isEmpty ? Colors.transparent : accent,
        border: Border.all(color: accent, width: 1.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: AnimatedSwitcher(
        duration: AppMotion.quick,
        switchInCurve: AppMotion.enter,
        switchOutCurve: AppMotion.exit,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.82, end: 1).animate(animation),
              child: child,
            ),
          );
        },
        child: isEmpty
            ? _AddButton(
                key: const ValueKey<String>('add'),
                label: l10n.addLabel,
                accent: accent,
                onTap: enabled ? onAdd : null,
              )
            : _Stepper(
                key: const ValueKey<String>('stepper'),
                quantity: quantity,
                enabled: enabled,
                foreground: onAccent,
                onAdd: onAdd,
                onRemove: onRemove,
              ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    super.key,
    required this.label,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final Color accent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Opacity(
      opacity: onTap == null ? 0.45 : 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  label,
                  maxLines: 1,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({
    super.key,
    required this.quantity,
    required this.enabled,
    required this.foreground,
    required this.onAdd,
    required this.onRemove,
  });

  final int quantity;
  final bool enabled;
  final Color foreground;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _StepperButton(
            icon: quantity == 1
                ? Icons.delete_outline_rounded
                : Icons.remove_rounded,
            onTap: enabled ? onRemove : null,
            foreground: foreground,
          ),
          // The count slides rather than cutting, so a rapid tap-tap-tap reads
          // as one continuous change.
          AnimatedSwitcher(
            duration: AppMotion.instant,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.4),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Text(
              '$quantity',
              key: ValueKey<int>(quantity),
              textDirection: TextDirection.ltr,
              style: theme.textTheme.titleMedium?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          _StepperButton(
            icon: Icons.add_rounded,
            onTap: enabled ? onAdd : null,
            foreground: foreground,
          ),
        ],
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

/// Five stars, filled to a rating. Read-only — the tappable version lives on
/// the rate-your-order screen, where a half star would be meaningless.
class StarRow extends StatelessWidget {
  const StarRow({super.key, required this.rating, this.size = 16});

  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // Stars run left to right even in Urdu: they are a scale, not text.
      textDirection: TextDirection.ltr,
      children: <Widget>[
        for (int star = 1; star <= 5; star++)
          Icon(
            // Rounds to the nearer half, which is what the eye reads anyway.
            rating >= star - 0.25
                ? Icons.star_rounded
                : rating >= star - 0.75
                    ? Icons.star_half_rounded
                    : Icons.star_outline_rounded,
            size: size,
            color: const Color(0xFFF5A623),
          ),
      ],
    );
  }
}

/// The green rating badge. Only ever built when a rating exists — an unrated
/// restaurant shows nothing rather than a zero.
class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // Below 4.0 the badge goes amber rather than green — a colour that says
    // "good" on a 3.2 is a small lie told on every card.
    final Color base =
        rating >= 4.0 ? const Color(0xFF0F8A0F) : AppColors.orangeDeep;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.star_rounded, size: 13, color: Colors.white),
          const SizedBox(width: 2),
          Text(
            rating.toStringAsFixed(1),
            // A rating reads left to right in every language.
            textDirection: TextDirection.ltr,
            style: theme.textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/// The promotion strip over a card's photo. The label is the server's wording,
/// rendered verbatim.
class _OfferRibbon extends StatelessWidget {
  const _OfferRibbon({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.orangeDeep,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// The bookmark on a card. Sits over a photograph, so it carries its own
/// scrim rather than relying on the image behind it being dark.
class _FavouriteButton extends StatelessWidget {
  const _FavouriteButton({required this.isFavourite, required this.onTap});

  final bool isFavourite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: isFavourite,
      child: InkResponse(
        onTap: onTap,
        radius: 22,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedSwitcher(
            duration: AppMotion.quick,
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavourite
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              key: ValueKey<bool>(isFavourite),
              size: 24,
              color: Colors.white,
              shadows: const <Shadow>[
                Shadow(color: Colors.black54, blurRadius: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
