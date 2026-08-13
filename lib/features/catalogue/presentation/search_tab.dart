import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/storefront_models.dart';
import '../state/storefront_controller.dart';
import 'widgets/catalogue_widgets.dart';

/// Server-side search over the same nearby set as the home tab.
class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  /// Each keystroke would otherwise be a request. A short debounce keeps the
  /// list feeling live without hammering the API.
  static const Duration _debounce = Duration(milliseconds: 350);

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<StorefrontController>().query;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Called by the shell when the customer taps the search box on the home tab,
  /// so the keyboard is already up when this tab appears.
  void focusInput() => _focus.requestFocus();

  void _onChanged(String value) {
    _timer?.cancel();
    _timer = Timer(_debounce, () {
      if (!mounted) return;
      context.read<StorefrontController>().runSearch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final StorefrontController storefront = context.watch<StorefrontController>();
    final List<Restaurant> results = storefront.results;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.searchTitle)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: TextField(
              controller: _controller,
              focusNode: _focus,
              autofocus: false,
              textInputAction: TextInputAction.search,
              onChanged: _onChanged,
              onSubmitted: (String value) {
                _timer?.cancel();
                context.read<StorefrontController>().runSearch(value);
              },
              decoration: InputDecoration(
                hintText: l10n.searchDishesHint,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {
                          _timer?.cancel();
                          _controller.clear();
                          context.read<StorefrontController>().runSearch('');
                          setState(() {});
                        },
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                ),
              ),
            ),
          ),
          if (storefront.isSearching)
            const LinearProgressIndicator(minHeight: 2)
          else
            const SizedBox(height: 2),
          Expanded(
            child: Builder(
              builder: (BuildContext context) {
                if (!storefront.hasSearched && results.isEmpty) {
                  return SingleChildScrollView(
                    child: EmptyState(
                      emoji: '🔎',
                      title: l10n.searchTitle,
                      subtitle: l10n.searchDishesHint,
                    ),
                  );
                }
                if (results.isEmpty) {
                  return SingleChildScrollView(
                    child: EmptyState(
                      emoji: '🤔',
                      title: l10n.searchNoResultsTitle,
                      subtitle: l10n.searchNoResultsSubtitle,
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (BuildContext context, int index) {
                    final Restaurant restaurant = results[index];
                    return RestaurantCard(
                      restaurant: restaurant,
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.restaurant,
                        arguments: RestaurantArgs(restaurantId: restaurant.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.surface,
    );
  }
}
