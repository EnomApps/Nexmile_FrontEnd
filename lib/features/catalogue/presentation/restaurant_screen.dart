import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../auth/data/auth_failure.dart';
import '../data/cart_models.dart';
import '../data/storefront_models.dart';
import '../state/cart_controller.dart';
import '../state/storefront_controller.dart';
import 'widgets/catalogue_widgets.dart';
import 'widgets/customise_sheet.dart';

/// One restaurant: its menu, and the basket that belongs to it.
class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.args});

  final RestaurantArgs args;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    if (!mounted) return;
    final String id = widget.args.restaurantId;
    await context.read<StorefrontController>().openRestaurant(id);
    if (!mounted) return;
    // Carts are per-restaurant, so this shop's basket is fetched alongside its
    // menu rather than kept globally.
    await context.read<CartController>().load(id);
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  /// Adds one of [item]. Anything with a required option group has to go
  /// through the sheet — the API rejects the bare add with a 422 otherwise.
  Future<void> _add(MenuItem item) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController cart = context.read<CartController>();
    final String restaurantId = widget.args.restaurantId;

    if (item.optionGroups.isNotEmpty) {
      final CustomiseResult? result = await showCustomiseSheet(
        context: context,
        item: item,
      );
      if (result == null || !mounted) return;
      final AuthFailure? failure = await cart.addItem(
        restaurantId,
        menuItemId: item.id,
        quantity: result.quantity,
        optionIds: result.optionIds,
        notes: result.notes,
      );
      if (failure != null) {
        _showError(cart.firstError() ?? failure.message(l10n));
      }
      return;
    }

    final AuthFailure? failure =
        await cart.addItem(restaurantId, menuItemId: item.id);
    if (failure != null) {
      _showError(cart.firstError() ?? failure.message(l10n));
    }
  }

  Future<void> _remove(MenuItem item) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController cart = context.read<CartController>();
    final CartLine? line = cart.soleLineFor(item.id);

    // Split across several option combinations — which one to take away is the
    // customer's call, so send them to the cart rather than guessing.
    if (line == null) {
      Navigator.of(context).pushNamed(
        AppRoutes.cart,
        arguments: CartArgs(restaurantId: widget.args.restaurantId),
      );
      return;
    }

    final AuthFailure? failure = await cart.setQuantity(
      widget.args.restaurantId,
      cartItemId: line.id,
      quantity: line.quantity - 1,
    );
    if (failure != null) {
      _showError(cart.firstError() ?? failure.message(l10n));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final StorefrontController storefront = context.watch<StorefrontController>();
    final Restaurant? restaurant = storefront.current;
    final RestaurantMenu? menu = storefront.menu;

    if (storefront.isMenuLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (restaurant == null) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: EmptyState(
            emoji: '📡',
            title: l10n.somethingWentWrong,
            subtitle: (storefront.menuFailure ?? AuthFailure.unknown)
                .message(l10n),
            action: OutlinedButton(onPressed: _load, child: Text(l10n.retry)),
          ),
        ),
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            _RestaurantHeader(restaurant: restaurant),
            SliverToBoxAdapter(
              child: _RestaurantSummary(restaurant: restaurant),
            ),
            if (menu == null || menu.isEmpty)
              SliverToBoxAdapter(
                child: EmptyState(
                  emoji: '📋',
                  title: l10n.menuEmptyTitle,
                  subtitle: l10n.menuEmptySubtitle,
                ),
              )
            else
              for (final MenuSection section in menu.sections) ...<Widget>[
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: section.isUncategorised
                        ? l10n.moreDishesTitle
                        : section.name,
                    trailing: Text(
                      l10n.itemsInCart(section.items.length),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.separated(
                    itemCount: section.items.length,
                    separatorBuilder: (_, __) => const Divider(height: 28),
                    itemBuilder: (BuildContext context, int index) {
                      final MenuItem item = section.items[index];
                      return _MenuRow(
                        item: item,
                        canOrder: restaurant.isOpen,
                        onAdd: () => _add(item),
                        onRemove: () => _remove(item),
                      );
                    },
                  ),
                ),
              ],
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
      bottomNavigationBar: _CartBar(restaurantId: widget.args.restaurantId),
    );
  }
}

class _RestaurantHeader extends StatelessWidget {
  const _RestaurantHeader({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 190,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FoodImage(
              seed: restaurant.id,
              url: restaurant.bannerUrl.isEmpty
                  ? restaurant.logoUrl
                  : restaurant.bannerUrl,
              size: double.infinity,
              radius: 0,
            ),
            // The title sits on top of an arbitrary photo, so it needs its own
            // contrast rather than relying on the image being dark.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantSummary extends StatelessWidget {
  const _RestaurantSummary({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            restaurant.name,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            restaurant.area.isEmpty
                ? restaurant.serviceCategory
                : '${restaurant.serviceCategory} · ${restaurant.area}',
            style: theme.textTheme.bodyMedium,
          ),
          if (restaurant.description.isNotEmpty) ...<Widget>[
            const SizedBox(height: 6),
            Text(restaurant.description, style: theme.textTheme.bodySmall),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: <Widget>[
              _Fact(
                icon: Icons.schedule_rounded,
                label: l10n.minutesAway(restaurant.avgPrepTimeMinutes),
              ),
              if (restaurant.distanceKmLabel != null)
                _Fact(
                  icon: Icons.near_me_rounded,
                  label: l10n.kilometresAway(restaurant.distanceKmLabel!),
                ),
              if (restaurant.minOrderValue > 0)
                _Fact(
                  icon: Icons.shopping_bag_outlined,
                  label: l10n.minimumOrder(
                    formatRupees(restaurant.minOrderValue),
                  ),
                ),
              if (restaurant.supportsPickup)
                _Fact(
                  icon: Icons.storefront_rounded,
                  label: l10n.pickupLabel,
                ),
            ],
          ),
          if (!restaurant.isOpen) ...<Widget>[
            const SizedBox(height: 14),
            ClosedNotice(restaurant: restaurant),
          ],
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.item,
    required this.canOrder,
    required this.onAdd,
    required this.onRemove,
  });

  final MenuItem item;
  final bool canOrder;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController cart = context.watch<CartController>();
    final int quantity = cart.quantityOfMenuItem(item.id);
    final bool orderable = canOrder && item.isAvailable;

    return Opacity(
      opacity: item.isAvailable ? 1 : 0.55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    VegMark(isVeg: item.isVeg),
                    if (item.containsEgg) ...<Widget>[
                      const SizedBox(width: 6),
                      Text('🥚', style: theme.textTheme.labelSmall),
                    ],
                    if (item.percentOff != null) ...<Widget>[
                      const SizedBox(width: 8),
                      Text(
                        l10n.percentOff(item.percentOff!),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.orangeDeep,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.name,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Rupees(
                      item.price,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (item.compareAtPrice != null) ...<Widget>[
                      const SizedBox(width: 8),
                      Flexible(
                        child: Rupees(
                          item.compareAtPrice!,
                          struck: true,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ],
                ),
                if ((item.description ?? '').isNotEmpty) ...<Widget>[
                  const SizedBox(height: 6),
                  Text(
                    item.description!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
                if (!item.isAvailable) ...<Widget>[
                  const SizedBox(height: 6),
                  Text(
                    l10n.soldOut,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 14),
          Column(
            children: <Widget>[
              FoodImage(seed: '${item.id}', url: item.imageUrl, size: 96),
              const SizedBox(height: 8),
              SizedBox(
                width: 104,
                child: QuantityControl(
                  quantity: quantity,
                  enabled: orderable && !cart.isMutating,
                  onAdd: onAdd,
                  onRemove: onRemove,
                ),
              ),
              if (item.optionGroups.isNotEmpty) ...<Widget>[
                const SizedBox(height: 4),
                Text(
                  l10n.customisable,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Floating summary of this restaurant's basket.
class _CartBar extends StatelessWidget {
  const _CartBar({required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final CartController controller = context.watch<CartController>();
    final Cart? cart = controller.cart;

    if (cart == null || cart.isEmpty) return const SizedBox.shrink();

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Material(
        color: AppColors.greenDeep,
        borderRadius: BorderRadius.circular(AppTheme.radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppTheme.radius),
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.cart,
            arguments: CartArgs(restaurantId: restaurantId),
          ),
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
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: Colors.white70),
                      ),
                      Rupees(
                        cart.totals.grandTotal,
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
                  child: Text(
                    l10n.viewCart,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_rounded,
                    color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
