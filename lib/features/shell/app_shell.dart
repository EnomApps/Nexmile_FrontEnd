import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../generated/l10n/app_localizations.dart';
import '../catalogue/presentation/home_tab.dart';
import '../catalogue/presentation/orders_tab.dart';
import '../catalogue/presentation/restaurant_screen.dart';
import '../catalogue/presentation/search_tab.dart';
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
  final GlobalKey<SearchTabState> _searchKey = GlobalKey<SearchTabState>();

  /// Tabs the customer has actually opened.
  ///
  /// [IndexedStack] builds every child eagerly, which would make the profile
  /// tab call `GET /v1/profile` on launch even for someone who never opens it.
  /// Building a tab only once visited avoids that wasted request while still
  /// keeping its state alive from then on.
  final Set<int> _visited = <int>{0};

  int _index = 0;

  void _select(int index) {
    setState(() {
      _index = index;
      _visited.add(index);
    });
  }

  void _openSearch() {
    _select(1);
    // Focus after the tab is actually on screen.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _searchKey.currentState?.focusInput(),
    );
  }

  void _openHome() => _select(0);

  Widget _tab(int index) {
    if (!_visited.contains(index)) return const SizedBox.shrink();
    switch (index) {
      case 0:
        return HomeTab(onOpenSearch: _openSearch);
      case 1:
        return SearchTab(key: _searchKey);
      case 2:
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
    final int cartCount = context.watch<CartController>().itemCount;

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: <Widget>[for (int i = 0; i < 4; i++) _tab(i)],
      ),
      // The cart bar rides above the navigation bar on the browsing tabs; the
      // profile tab has its own actions and does not need it.
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_index != 3) const CartBar(),
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
                icon: const Icon(Icons.search_outlined),
                selectedIcon: Icon(
                  Icons.search_rounded,
                  color: isDark ? AppColors.greenLight : AppColors.greenDeep,
                ),
                label: l10n.navSearch,
              ),
              NavigationDestination(
                icon: Badge.count(
                  count: cartCount,
                  isLabelVisible: cartCount > 0,
                  child: const Icon(Icons.receipt_long_outlined),
                ),
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
