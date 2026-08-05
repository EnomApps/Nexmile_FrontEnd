import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/state/auth_controller.dart';
import '../data/catalogue_models.dart';
import '../data/sample_catalogue.dart';
import 'widgets/catalogue_widgets.dart';

/// Storefront landing tab: address, search entry, categories, offers and the
/// restaurant list.
class HomeTab extends StatefulWidget {
  const HomeTab({super.key, required this.onOpenSearch});

  /// Switches the shell to the search tab — tapping the fake search bar here
  /// should land on the real one rather than opening a second search UI.
  final VoidCallback onOpenSearch;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  static const CatalogueRepository _catalogue = SampleCatalogue();

  String _categoryId = 'all';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<Restaurant> restaurants = _catalogue.byCategory(_categoryId);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(child: _HomeHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: _SearchEntry(onTap: widget.onOpenSearch),
            ),
          ),
          const SliverToBoxAdapter(child: PrototypeNotice()),
          SliverToBoxAdapter(
            child: SectionHeader(title: l10n.cravingTitle),
          ),
          SliverToBoxAdapter(child: _CategoryStrip(
            selectedId: _categoryId,
            onSelect: (String id) => setState(
              () => _categoryId = _categoryId == id ? 'all' : id,
            ),
          )),
          SliverToBoxAdapter(child: SectionHeader(title: l10n.offersTitle)),
          const SliverToBoxAdapter(child: _OfferStrip()),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: _categoryId == 'all'
                  ? l10n.restaurantsNearby
                  : l10n.restaurantsCount(restaurants.length),
            ),
          ),
          if (restaurants.isEmpty)
            SliverToBoxAdapter(
              child: EmptyState(
                emoji: '🍽️',
                title: l10n.noRestaurantsTitle,
                subtitle: l10n.noRestaurantsSubtitle,
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList.separated(
                itemCount: restaurants.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (BuildContext context, int index) {
                  final Restaurant restaurant = restaurants[index];
                  return RestaurantCard(
                    restaurant: restaurant,
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.restaurant,
                      arguments: RestaurantArgs(restaurantId: restaurant.id),
                    ),
                  );
                },
              ),
            ),
          // Clears the floating cart bar.
          const SliverToBoxAdapter(child: SizedBox(height: 110)),
        ],
      ),
    );
  }
}

/// Green header carrying the delivery address and the account shortcut.
class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? name = context.watch<AuthController>().user?.firstName;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppColors.greenDeep, Color(0xFF1C6606)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 12, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.location_on_rounded,
                  color: AppColors.orangeLight,
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      l10n.deliverTo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: <Widget>[
                        Flexible(
                          // Sample address — the real one comes from
                          // /v1/addresses once that screen exists.
                          child: Text(
                            'Anna Nagar, Chennai',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                    if (name != null && name.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 6),
                      Text(
                        l10n.greetingNamed(name),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.profile),
                icon: const Icon(Icons.person_outline_rounded),
                color: Colors.white,
                tooltip: l10n.profileTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Non-editable search affordance; tapping switches to the search tab.
class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppTheme.radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search_rounded,
                  size: 22,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.searchDishesHint,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
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

class _CategoryStrip extends StatelessWidget {
  const _CategoryStrip({required this.selectedId, required this.onSelect});

  final String selectedId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    const CatalogueRepository catalogue = SampleCatalogue();
    final List<FoodCategory> categories = catalogue.categories();

    return SizedBox(
      height: 118,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final FoodCategory category = categories[index];
          return CategoryTile(
            category: category,
            isSelected: selectedId == category.id,
            onTap: () => onSelect(category.id),
          );
        },
      ),
    );
  }
}

class _OfferStrip extends StatelessWidget {
  const _OfferStrip();

  @override
  Widget build(BuildContext context) {
    const CatalogueRepository catalogue = SampleCatalogue();
    final List<Offer> offers = catalogue.offers();

    return SizedBox(
      height: 152,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) =>
            OfferCard(offer: offers[index]),
      ),
    );
  }
}
