import 'package:flutter/material.dart';

import '../../../../core/motion/app_motion.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../data/restaurant_filters.dart';
import 'catalogue_widgets.dart';

/// Filters and sorting.
///
/// Edits a working copy and returns it only on "Show results", so tapping
/// through five options costs one request rather than five. Returns null when
/// the customer backs out, which the caller reads as "leave the list alone".
Future<RestaurantFilters?> showFilterSheet({
  required BuildContext context,
  required RestaurantFilters current,
}) {
  return showModalBottomSheet<RestaurantFilters>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) => _FilterSheet(current: current),
  );
}

/// One section of the sheet, and its entry in the left rail.
///
/// Deliberately holds no title: a localised string cannot be resolved in
/// `initState`, and reading one there throws. Titles are resolved in `build`
/// and passed alongside.
class _Section {
  _Section({required this.key, required this.icon});

  final GlobalKey key;
  final IconData icon;
}

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({required this.current});

  final RestaurantFilters current;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late RestaurantFilters _draft = widget.current;
  final ScrollController _scroll = ScrollController();

  final List<_Section> _sections = <_Section>[
    _Section(key: GlobalKey(), icon: Icons.sort_rounded),
    _Section(key: GlobalKey(), icon: Icons.bolt_rounded),
    _Section(key: GlobalKey(), icon: Icons.star_outline_rounded),
    _Section(key: GlobalKey(), icon: Icons.local_offer_outlined),
    _Section(key: GlobalKey(), icon: Icons.currency_rupee_rounded),
    _Section(key: GlobalKey(), icon: Icons.tune_rounded),
  ];
  int _active = 0;

  /// Brackets are hard-coded until `GET /v1/filters` exists; the shape matches
  /// what that endpoint will send, so swapping to it is a data change.
  static const List<CostBracket> _brackets = <CostBracket>[
    CostBracket(max: 150),
    CostBracket(min: 150, max: 300),
    CostBracket(min: 300),
  ];

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_syncRail);
  }

  /// Rail titles, in the same order as [_sections]. Resolved in `build`,
  /// because localisations are not available during `initState`.
  List<String> _titles(AppLocalizations l10n) => <String>[
        l10n.sortByTitle,
        l10n.timeSection,
        l10n.ratingSection,
        l10n.offersSection,
        l10n.dishPriceSection,
        l10n.moreSection,
      ];

  @override
  void dispose() {
    _scroll.removeListener(_syncRail);
    _scroll.dispose();
    super.dispose();
  }

  /// Highlights the rail entry for whichever section is at the top of the
  /// panel, so scrolling and tapping stay in agreement.
  void _syncRail() {
    int top = 0;
    for (int i = 0; i < _sections.length; i++) {
      final BuildContext? ctx = _sections[i].key.currentContext;
      if (ctx == null) continue;
      final RenderBox box = ctx.findRenderObject()! as RenderBox;
      final double y = box.localToGlobal(Offset.zero).dy;
      // 220 is roughly the sheet header; anything above it has scrolled past.
      if (y < 220) top = i;
    }
    if (top != _active) setState(() => _active = top);
  }

  Future<void> _jumpTo(int index) async {
    setState(() => _active = index);
    final BuildContext? ctx = _sections[index].key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: AppMotion.quick,
      curve: AppMotion.enter,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.filtersAndSorting,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              TextButton(
                onPressed: _draft.isActive
                    ? () => setState(() => _draft = RestaurantFilters.none)
                    : null,
                child: Text(l10n.clearAll),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _Rail(
                sections: _sections,
                titles: _titles(l10n),
                active: _active,
                onTap: _jumpTo,
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: ListView(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  children: <Widget>[
                    _group(
                      key: _sections[0].key,
                      title: l10n.sortByTitle,
                      child: Column(
                        children: <Widget>[
                          for (final RestaurantSort sort in RestaurantSort.values)
                            RadioListTile<RestaurantSort>(
                              value: sort,
                              groupValue: _draft.sort,
                              onChanged: (RestaurantSort? v) => setState(
                                () => _draft = _draft.copyWith(sort: v),
                              ),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              title: Text(_sortLabel(l10n, sort)),
                            ),
                        ],
                      ),
                    ),
                    _group(
                      key: _sections[1].key,
                      title: l10n.timeSection,
                      child: _ChipWrap(
                        children: <Widget>[
                          _Choice(
                            label: l10n.nearAndFast,
                            icon: Icons.bolt_rounded,
                            selected: _draft.nearAndFast,
                            onTap: () => setState(
                              () => _draft = _draft.copyWith(
                                nearAndFast: !_draft.nearAndFast,
                              ),
                            ),
                          ),
                          _Choice(
                            label: l10n.openNow,
                            icon: Icons.schedule_rounded,
                            selected: _draft.openNow,
                            onTap: () => setState(
                              () => _draft =
                                  _draft.copyWith(openNow: !_draft.openNow),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _group(
                      key: _sections[2].key,
                      title: l10n.ratingSection,
                      child: _ChipWrap(
                        children: <Widget>[
                          for (final double value in <double>[3.5, 4.0])
                            _Choice(
                              label: l10n.ratedAbove('$value'),
                              icon: Icons.star_rounded,
                              iconColour: const Color(0xFF0F8A0F),
                              selected: _draft.ratingMin == value,
                              onTap: () => setState(() {
                                _draft = _draft.ratingMin == value
                                    ? _draft.copyWith(clearRating: true)
                                    : _draft.copyWith(ratingMin: value);
                              }),
                            ),
                        ],
                      ),
                    ),
                    _group(
                      key: _sections[3].key,
                      title: l10n.offersSection,
                      child: _ChipWrap(
                        children: <Widget>[
                          _Choice(
                            label: l10n.hasOffersLabel,
                            icon: Icons.local_offer_rounded,
                            selected: _draft.hasOffers,
                            onTap: () => setState(
                              () => _draft =
                                  _draft.copyWith(hasOffers: !_draft.hasOffers),
                            ),
                          ),
                          _Choice(
                            label: l10n.freeDelivery,
                            icon: Icons.delivery_dining_rounded,
                            selected: _draft.freeDelivery,
                            onTap: () => setState(
                              () => _draft = _draft.copyWith(
                                freeDelivery: !_draft.freeDelivery,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _group(
                      key: _sections[4].key,
                      title: l10n.dishPriceSection,
                      child: _ChipWrap(
                        children: <Widget>[
                          for (final CostBracket bracket in _brackets)
                            _Choice(
                              label: _costLabel(l10n, bracket),
                              selected: _draft.cost == bracket,
                              onTap: () => setState(() {
                                _draft = _draft.cost == bracket
                                    ? _draft.copyWith(
                                        cost: const CostBracket())
                                    : _draft.copyWith(cost: bracket);
                              }),
                            ),
                        ],
                      ),
                    ),
                    _group(
                      key: _sections[5].key,
                      title: l10n.moreSection,
                      child: Column(
                        children: <Widget>[
                          SwitchListTile(
                            value: _draft.vegOnly,
                            onChanged: (bool v) =>
                                setState(() => _draft = _draft.copyWith(vegOnly: v)),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(l10n.vegOnly),
                          ),
                          SwitchListTile(
                            value: _draft.noPackagingFee,
                            onChanged: (bool v) => setState(
                              () => _draft = _draft.copyWith(noPackagingFee: v),
                            ),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(l10n.noPackagingCharges),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(l10n.closeLabel),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(_draft),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.greenDeep,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(l10n.showResults, maxLines: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _group({
    required GlobalKey key,
    required String title,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
                theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  static String _sortLabel(AppLocalizations l10n, RestaurantSort sort) =>
      switch (sort) {
        RestaurantSort.relevance => l10n.sortRelevance,
        RestaurantSort.rating => l10n.sortRating,
        RestaurantSort.deliveryTime => l10n.sortDeliveryTime,
        RestaurantSort.costLowHigh => l10n.sortCostLowHigh,
        RestaurantSort.costHighLow => l10n.sortCostHighLow,
      };

  static String _costLabel(AppLocalizations l10n, CostBracket bracket) {
    if (bracket.min == null && bracket.max != null) {
      return l10n.costUnder(formatRupees(bracket.max!.toDouble()));
    }
    if (bracket.min != null && bracket.max == null) {
      return l10n.costOver(formatRupees(bracket.min!.toDouble()));
    }
    return l10n.costBetween(
      formatRupees(bracket.min!.toDouble()),
      formatRupees(bracket.max!.toDouble()),
    );
  }
}

/// The left rail of section names.
class _Rail extends StatelessWidget {
  const _Rail({
    required this.sections,
    required this.titles,
    required this.active,
    required this.onTap,
  });

  final List<_Section> sections;
  final List<String> titles;
  final int active;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      width: 104,
      child: ColoredBox(
        color: theme.colorScheme.surfaceContainerLow,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int i) {
            final bool isActive = i == active;
            return InkWell(
              onTap: () => onTap(i),
              child: AnimatedContainer(
                duration: AppMotion.instant,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                decoration: BoxDecoration(
                  color: isActive
                      ? theme.colorScheme.surface
                      : Colors.transparent,
                  border: BorderDirectional(
                    start: BorderSide(
                      color: isActive ? AppColors.greenDeep : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      sections[i].icon,
                      size: 20,
                      color: isActive
                          ? AppColors.greenDeep
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      titles[i],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isActive
                            ? theme.colorScheme.onSurface
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChipWrap extends StatelessWidget {
  const _ChipWrap({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) =>
      Wrap(spacing: 8, runSpacing: 8, children: children);
}

/// A selectable filter chip.
class _Choice extends StatelessWidget {
  const _Choice({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.iconColour,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColour;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
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
              color: selected ? AppColors.greenDeep : theme.colorScheme.outline,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (icon != null) ...<Widget>[
                  Icon(
                    icon,
                    size: 16,
                    color: iconColour ??
                        (selected
                            ? AppColors.greenDeep
                            : theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
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
