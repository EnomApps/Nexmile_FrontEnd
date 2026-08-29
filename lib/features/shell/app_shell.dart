import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/motion/app_motion.dart';
import '../../core/motion/reveal.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../generated/l10n/app_localizations.dart';
import '../catalogue/data/cart_models.dart';
import '../catalogue/presentation/home_tab.dart';
import '../catalogue/presentation/orders_tab.dart';
import '../catalogue/presentation/widgets/catalogue_widgets.dart';
import '../catalogue/state/cart_controller.dart';
import '../profile/profile_screen.dart';

/// Signed-in home: four tabs plus the floating cart bar.
///
/// Tabs are kept alive in an [IndexedStack] so switching away and back does not
/// reset the search query, the category filter or a scroll position — which is
/// what customers expect from every delivery app.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  /// Tabs the customer has actually opened.
  ///
  /// [IndexedStack] builds every child eagerly, which would make the profile
  /// tab call `GET /v1/profile` on launch even for someone who never opens it.
  /// Building a tab only once visited avoids that wasted request while still
  /// keeping its state alive from then on.
  final Set<int> _visited = <int>{0};

  int _index = 0;

  @override
  void initState() {
    super.initState();
    // Carts live on the server, one per restaurant, so an unfinished basket
    // survives a reinstall. `GET /v1/carts` is what surfaces it.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<CartController>().loadOpenCarts();
    });
  }

  void _select(int index) {
    setState(() {
      _index = index;
      _visited.add(index);
    });
  }

  /// Search is a screen you push into from the header field, not a tab.
  ///
  /// A tab implies somewhere you go and stay; searching is a thing you do and
  /// come back from, and the header field is where every customer reaches for
  /// it anyway.
  void _openSearch({bool voice = false}) => Navigator.of(context).pushNamed(
        AppRoutes.search,
        arguments: SearchArgs(startWithVoice: voice),
      );

  void _openHome() => _select(0);

  Widget _tab(int index) {
    if (!_visited.contains(index)) return const SizedBox.shrink();
    switch (index) {
      case 0:
        return HomeTab(
          onOpenSearch: () => _openSearch(),
          onOpenVoiceSearch: () => _openSearch(voice: true),
        );
      case 1:
        return OrdersTab(onBrowse: _openHome);
      default:
        return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: <Widget>[for (int i = 0; i < 3; i++) _tab(i)],
      ),
      // The unfinished-basket bar rides above the navigation bar on the
      // browsing tabs; the orders and profile tabs have their own actions.
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_index == 0) const _OpenCartBar(),
          NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: _select,
            destinations: <Widget>[
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: Icon(
                  Icons.home_rounded,
                  color: isDark ? AppColors.greenLight : AppColors.greenDeep,
                ),
                label: l10n.navHome,
              ),
              NavigationDestination(
                icon: const Icon(Icons.receipt_long_outlined),
                selectedIcon: Icon(
                  Icons.receipt_long_rounded,
                  color: isDark ? AppColors.greenLight : AppColors.greenDeep,
                ),
                label: l10n.navOrders,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(
                  Icons.person_rounded,
                  color: isDark ? AppColors.greenLight : AppColors.greenDeep,
                ),
                label: l10n.profileTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// "You left something at ___" — an unfinished basket, from `GET /v1/carts`.
///
/// Only the first is offered. There can be several, one per restaurant, but a
/// stack of bars would eat the screen and the rest are one tap away inside
/// their own restaurants.
class _OpenCartBar extends StatelessWidget {
  const _OpenCartBar();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<OpenCart> carts = context.watch<CartController>().openCarts;

    if (carts.isEmpty) return const SizedBox.shrink();
    final OpenCart cart = carts.first;

    // Slides up from behind the navigation bar the first time an unfinished
    // basket is found, rather than appearing mid-air.
    return Reveal(
      from: AxisDirection.up,
      duration: AppMotion.settled,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Material(
          color: AppColors.greenDeep,
          borderRadius: BorderRadius.circular(AppTheme.radius),
          elevation: 8,
          shadowColor: AppColors.greenDeep.withValues(alpha: 0.45),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            onTap:
                () => Navigator.of(context).pushNamed(
                  AppRoutes.cart,
                  arguments: CartArgs(restaurantId: cart.restaurantId),
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          cart.restaurantName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          l10n.itemsInCart(cart.itemCount),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Rupees(
                    cart.grandTotal,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20,
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
