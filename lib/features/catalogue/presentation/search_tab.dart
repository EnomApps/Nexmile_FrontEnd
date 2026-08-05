import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/catalogue_models.dart';
import '../data/sample_catalogue.dart';
import 'widgets/catalogue_widgets.dart';

/// Search across restaurant names, cuisines and dish names.
class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  static const CatalogueRepository _catalogue = SampleCatalogue();

  final TextEditingController _query = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _query.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _query.dispose();
    _focus.dispose();
    super.dispose();
  }

  /// Called by the shell when the customer arrives from the home tab's search
  /// bar, so the keyboard is already up.
  void focusInput() => _focus.requestFocus();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String query = _query.text.trim();
    final List<Restaurant> results = _catalogue.search(query);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.searchTitle)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: TextField(
              controller: _query,
              focusNode: _focus,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: l10n.searchDishesHint,
                hintMaxLines: 1,
                prefixIcon: const Icon(Icons.search_rounded, size: 22),
                suffixIcon: query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close_rounded, size: 20),
                        onPressed: _query.clear,
                        tooltip: MaterialLocalizations.of(context)
                            .closeButtonTooltip,
                      ),
              ),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? EmptyState(
                    emoji: '🔍',
                    title: l10n.searchNoResultsTitle,
                    subtitle: l10n.searchNoResultsSubtitle,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 110),
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (BuildContext context, int index) {
                      final Restaurant restaurant = results[index];
                      return RestaurantCard(
                        restaurant: restaurant,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.restaurant,
                          arguments:
                              RestaurantArgs(restaurantId: restaurant.id),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
