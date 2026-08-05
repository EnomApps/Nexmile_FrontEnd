import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/catalogue_models.dart';
import '../data/sample_catalogue.dart';
import '../state/cart_controller.dart';
import 'widgets/catalogue_widgets.dart';

/// Restaurant detail: hero, stats, veg filter and the menu.
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.args});

  final RestaurantArgs args;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  static const CatalogueRepository _catalogue = SampleCatalogue();

  bool _vegOnly = false;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Restaurant? restaurant =
        _catalogue.restaurantById(widget.args.restaurantId);

    if (restaurant == null) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState(
          emoji: '🍽️',
          title: l10n.noRestaurantsTitle,
          subtitle: l10n.noRestaurantsSubtitle,
        ),
      );
    }

    final List<MenuSection> sections = _visibleSections(restaurant);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 190,
            title: Text(
              restaurant.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _RestaurantHero(restaurant: restaurant),
            ),
          ),
          SliverToBoxAdapter(child: _RestaurantStats(restaurant: restaurant)),
          if (restaurant.hasVegOptions)
            SliverToBoxAdapter(
              child: _VegFilter(
                value: _vegOnly,
                onChanged: (bool v) => setState(() => _vegOnly = v),
              ),
            ),
          if (sections.isEmpty)
            SliverToBoxAdapter(
              child: EmptyState(
                emoji: '🥗',
                title: l10n.noVegDishesTitle,
                subtitle: l10n.noVegDishesSubtitle,
              ),
            )
          else
            for (final MenuSection section in sections) ...<Widget>[
              SliverToBoxAdapter(
                child: SectionHeader(title: section.title),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList.separated(
                  itemCount: section.dishes.length,
                  separatorBuilder: (_, __) => const Divider(height: 28),
                  itemBuilder: (BuildContext context, int index) => _DishRow(
                    dish: section.dishes[index],
                    restaurant: restaurant,
                  ),
                ),
              ),
            ],
          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),
      bottomNavigationBar: const CartBar(),
    );
  }

  List<MenuSection> _visibleSections(Restaurant restaurant) {
    if (!_vegOnly) return restaurant.menu;
    return restaurant.menu
        .map((MenuSection s) => MenuSection(
              title: s.title,
              dishes: s.dishes.where((Dish d) => d.isVeg).toList(),
            ))
        .where((MenuSection s) => s.dishes.isNotEmpty)
        .toList();
  }
}

class _RestaurantHero extends StatelessWidget {
  const _RestaurantHero({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FoodImage(
          emoji: restaurant.emoji,
          seed: restaurant.id,
          size: 400,
          radius: 0,
        ),
        // Keeps the pinned title legible against a light gradient.
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0x99000000), Color(0x00000000)],
              stops: <double>[0.0, 0.6],
            ),
          ),
        ),
      ],
    );
  }
}

class _RestaurantStats extends StatelessWidget {
  const _RestaurantStats({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      padding: const EdgeInsets.all(16),
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
              Expanded(
                child: Text(
                  restaurant.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              RatingPill(rating: restaurant.rating),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            restaurant.cuisines.join(' · '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          // Wrap, not Row: three stat blocks plus long translations overflow a
          // single line on a narrow phone.
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              _Stat(
                icon: Icons.schedule_rounded,
                label: l10n.minutesAway(restaurant.deliveryMinutes),
              ),
              _Stat(
                icon: Icons.place_outlined,
                label: l10n.kilometresAway(
                  restaurant.distanceKm.toStringAsFixed(1),
                ),
              ),
              _Stat(
                icon: Icons.star_border_rounded,
                label: l10n.ratingsCount(restaurant.ratingsCount),
              ),
            ],
          ),
          if (restaurant.offerPercent != null) ...<Widget>[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.orangeDeep.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.orangeDeep.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.local_offer_rounded,
                    size: 16,
                    color: AppColors.orangeDeep,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.percentOffOnOrder(restaurant.offerPercent!),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: AppColors.orangeDeep,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 6),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _VegFilter extends StatelessWidget {
  const _VegFilter({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Row(
        children: <Widget>[
          const VegMark(isVeg: true, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.vegOnly,
              style: theme.textTheme.titleSmall,
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _DishRow extends StatelessWidget {
  const _DishRow({required this.dish, required this.restaurant});

  final Dish dish;
  final Restaurant restaurant;

  Future<void> _add(BuildContext context) async {
    final CartController cart = context.read<CartController>();
    final AppLocalizations l10n = AppLocalizations.of(context);

    if (cart.wouldReplaceCart(restaurant)) {
      final bool? replace = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(l10n.replaceCartTitle),
          content: Text(l10n.replaceCartMessage(cart.restaurant!.name)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.cancelLabel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.replaceCartConfirm),
            ),
          ],
        ),
      );
      if (replace != true) return;
      if (!context.mounted) return;
      cart.add(dish, restaurant, replace: true);
      return;
    }
    cart.add(dish, restaurant);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final int quantity =
        context.watch<CartController>().quantityOf(dish);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  VegMark(isVeg: dish.isVeg),
                  if (dish.isBestseller) ...<Widget>[
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        l10n.bestseller,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.orangeDeep,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 6),
              Text(
                dish.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: <Widget>[
                  Rupees(dish.price, style: theme.textTheme.titleSmall),
                  if (dish.rating != null) ...<Widget>[
                    const SizedBox(width: 10),
                    RatingPill(rating: dish.rating!, compact: true),
                  ],
                ],
              ),
              const SizedBox(height: 6),
              Text(
                dish.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        Column(
          children: <Widget>[
            FoodImage(emoji: dish.emoji, seed: dish.id, size: 92),
            const SizedBox(height: 8),
            QuantityControl(
              quantity: quantity,
              onAdd: () => _add(context),
              onRemove: () => context.read<CartController>().remove(dish),
            ),
          ],
        ),
      ],
    );
  }
}

/// Floating summary bar shown whenever the cart has something in it.
class CartBar extends StatelessWidget {
  const CartBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController cart = context.watch<CartController>();

    if (cart.isEmpty) return const SizedBox.shrink();

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Material(
        color: AppColors.greenDeep,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
          borderRadius: BorderRadius.circular(AppTheme.radius),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        l10n.itemsInCart(cart.itemCount),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Rupees(
                        cart.itemTotal,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          l10n.viewCart,
                          maxLines: 1,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
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
