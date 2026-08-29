import 'package:flutter/material.dart';

import '../../../../core/motion/app_motion.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../data/restaurant_filters.dart';
import 'filter_sheet.dart';

/// The row of filter chips under the search field.
///
/// The first chip opens the full sheet; the rest are the shortcuts worth
/// reaching without it. Each is a whole filter, so tapping one is a single
/// query rather than a step in a wizard.
class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.filters,
    required this.onChanged,
  });

  final RestaurantFilters filters;
  final ValueChanged<RestaurantFilters> onChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          _Chip(
            label: filters.activeCount > 0
                ? '${l10n.filtersAndSorting} · ${filters.activeCount}'
                : l10n.filtersAndSorting,
            icon: Icons.tune_rounded,
            trailingIcon: Icons.keyboard_arrow_down_rounded,
            selected: filters.isActive,
            onTap: () async {
              final RestaurantFilters? next = await showFilterSheet(
                context: context,
                current: filters,
              );
              // Null means the customer backed out — leave the list alone.
              if (next != null) onChanged(next);
            },
          ),
          const SizedBox(width: 8),
          _Chip(
            label: l10n.nearAndFast,
            icon: Icons.bolt_rounded,
            selected: filters.nearAndFast,
            onTap: () => onChanged(
              filters.copyWith(nearAndFast: !filters.nearAndFast),
            ),
          ),
          const SizedBox(width: 8),
          _Chip(
            label: l10n.noPackagingCharges,
            selected: filters.noPackagingFee,
            onTap: () => onChanged(
              filters.copyWith(noPackagingFee: !filters.noPackagingFee),
            ),
          ),
          const SizedBox(width: 8),
          _Chip(
            label: l10n.freeDelivery,
            icon: Icons.delivery_dining_rounded,
            selected: filters.freeDelivery,
            onTap: () => onChanged(
              filters.copyWith(freeDelivery: !filters.freeDelivery),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

/// The pure-veg switch, which sits beside the search field.
///
/// Kept out of the chip row deliberately: for a customer who eats only veg it
/// is not one filter among several, it is the setting that makes the whole
/// list usable.
class VegToggle extends StatelessWidget {
  const VegToggle({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  static const Color _veg = Color(0xFF0F8A0F);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Semantics(
      toggled: value,
      label: l10n.vegOnly,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              l10n.vegOnly,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: AppMotion.quick,
              curve: AppMotion.enter,
              width: 46,
              height: 26,
              padding: const EdgeInsets.all(3),
              alignment:
                  value ? Alignment.centerRight : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: value ? _veg : Colors.white.withValues(alpha: 0.28),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: value
                    ? const Icon(Icons.check_rounded, size: 14, color: _veg)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.trailingIcon,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Material(
        color: selected
            ? AppColors.greenDeep.withValues(alpha: 0.10)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    selected ? AppColors.greenDeep : theme.colorScheme.outline,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (icon != null) ...<Widget>[
                    Icon(
                      icon,
                      size: 16,
                      color: selected
                          ? AppColors.greenDeep
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 5),
                  ],
                  Text(
                    label,
                    maxLines: 1,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  if (trailingIcon != null) ...<Widget>[
                    const SizedBox(width: 3),
                    Icon(
                      trailingIcon,
                      size: 17,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
