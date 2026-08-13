import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../data/storefront_models.dart';
import 'catalogue_widgets.dart';

/// What the customer chose in the sheet.
@immutable
class CustomiseResult {
  const CustomiseResult({
    required this.optionIds,
    required this.quantity,
    this.notes,
  });

  final List<int> optionIds;
  final int quantity;
  final String? notes;
}

/// Option picker for a dish with add-ons.
///
/// Required groups are enforced here rather than left to the server: a 422 from
/// `POST /carts/{id}/items` reads as a failure, whereas a disabled Add button
/// with the group highlighted reads as an instruction.
Future<CustomiseResult?> showCustomiseSheet({
  required BuildContext context,
  required MenuItem item,
}) {
  return showModalBottomSheet<CustomiseResult>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (BuildContext context) => _CustomiseSheet(item: item),
  );
}

class _CustomiseSheet extends StatefulWidget {
  const _CustomiseSheet({required this.item});

  final MenuItem item;

  @override
  State<_CustomiseSheet> createState() => _CustomiseSheetState();
}

class _CustomiseSheetState extends State<_CustomiseSheet> {
  /// Chosen option ids per group, so a single-choice group can replace rather
  /// than accumulate.
  final Map<int, Set<int>> _selected = <int, Set<int>>{};
  final TextEditingController _notes = TextEditingController();
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    // Pre-select the first available option of a required single-choice group.
    // It is what the customer would pick anyway, and it stops the sheet opening
    // with the Add button already disabled.
    for (final OptionGroup group in widget.item.optionGroups) {
      if (!group.isRequired || !group.isSingleChoice) continue;
      final MenuOption? first = group.options
          .cast<MenuOption?>()
          .firstWhere((MenuOption? o) => o?.isAvailable ?? false,
              orElse: () => null);
      if (first != null) _selected[group.id] = <int>{first.id};
    }
  }

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  List<int> get _optionIds =>
      _selected.values.expand((Set<int> s) => s).toList(growable: false);

  /// Base price plus every chosen add-on, times the quantity — the same sum the
  /// server will compute, shown before the customer commits to it.
  double get _total {
    double unit = widget.item.price;
    for (final OptionGroup group in widget.item.optionGroups) {
      final Set<int> chosen = _selected[group.id] ?? const <int>{};
      for (final MenuOption option in group.options) {
        if (chosen.contains(option.id)) unit += option.priceDelta;
      }
    }
    return unit * _quantity;
  }

  int _minFor(OptionGroup group) =>
      group.isRequired ? (group.minSelections < 1 ? 1 : group.minSelections)
                       : group.minSelections;

  bool _isSatisfied(OptionGroup group) {
    final int chosen = (_selected[group.id] ?? const <int>{}).length;
    final int max = group.maxSelections ?? chosen;
    return chosen >= _minFor(group) && chosen <= max;
  }

  bool get _canAdd => widget.item.optionGroups.every(_isSatisfied);

  void _toggle(OptionGroup group, MenuOption option) {
    setState(() {
      final Set<int> chosen = _selected.putIfAbsent(group.id, () => <int>{});
      if (group.isSingleChoice) {
        chosen
          ..clear()
          ..add(option.id);
        return;
      }
      if (chosen.contains(option.id)) {
        chosen.remove(option.id);
        return;
      }
      final int? max = group.maxSelections;
      // At the ceiling the tap is refused rather than silently dropping an
      // earlier choice — quietly swapping one topping for another is worse.
      if (max != null && chosen.length >= max) return;
      chosen.add(option.id);
    });
  }

  String _rule(AppLocalizations l10n, OptionGroup group) {
    final int min = _minFor(group);
    final int? max = group.maxSelections;
    if (max == 1) return l10n.chooseOne;
    if (min > 0 && max != null) return l10n.chooseBetween(min, max);
    if (min > 0) return l10n.chooseAtLeast(min);
    if (max != null) return l10n.chooseUpTo(max);
    return l10n.optionalLabel;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final MenuItem item = widget.item;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Row(
                children: <Widget>[
                  VegMark(isVeg: item.isVeg),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                children: <Widget>[
                  for (final OptionGroup group in item.optionGroups) ...<Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            group.name,
                            style: theme.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        if (group.isRequired)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: _isSatisfied(group)
                                  ? theme.colorScheme.surfaceContainerHighest
                                  : theme.colorScheme.error
                                      .withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              l10n.requiredLabel,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: _isSatisfied(group)
                                    ? theme.colorScheme.onSurfaceVariant
                                    : theme.colorScheme.error,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(_rule(l10n, group), style: theme.textTheme.bodySmall),
                    const SizedBox(height: 6),
                    for (final MenuOption option in group.options)
                      _OptionRow(
                        option: option,
                        isSingleChoice: group.isSingleChoice,
                        isSelected:
                            (_selected[group.id] ?? const <int>{}).contains(option.id),
                        onTap: option.isAvailable
                            ? () => _toggle(group, option)
                            : null,
                      ),
                    const SizedBox(height: 20),
                  ],
                  Text(
                    l10n.specialInstructions,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notes,
                    maxLength: 200,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: l10n.specialInstructionsHint,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: Row(
                children: <Widget>[
                  QuantityControl(
                    quantity: _quantity,
                    onAdd: () => setState(() => _quantity++),
                    onRemove: () => setState(
                      () => _quantity = _quantity > 1 ? _quantity - 1 : 1,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _canAdd
                          ? () => Navigator.of(context).pop(
                                CustomiseResult(
                                  optionIds: _optionIds,
                                  quantity: _quantity,
                                  notes: _notes.text.trim().isEmpty
                                      ? null
                                      : _notes.text.trim(),
                                ),
                              )
                          : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.greenDeep,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          l10n.addForAmount(formatRupees(_total)),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.option,
    required this.isSingleChoice,
    required this.isSelected,
    required this.onTap,
  });

  final MenuOption option;
  final bool isSingleChoice;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: option.isAvailable ? 1 : 0.45,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: <Widget>[
              Icon(
                isSingleChoice
                    ? (isSelected
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_unchecked_rounded)
                    : (isSelected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded),
                size: 22,
                color: isSelected
                    ? AppColors.greenDeep
                    : theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  option.isAvailable
                      ? option.name
                      : '${option.name} · ${l10n.soldOut}',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              if (option.priceDelta != 0) ...<Widget>[
                const SizedBox(width: 8),
                Text(
                  '${option.priceDelta > 0 ? '+' : '−'}'
                  '${formatRupees(option.priceDelta.abs())}',
                  textDirection: TextDirection.ltr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
