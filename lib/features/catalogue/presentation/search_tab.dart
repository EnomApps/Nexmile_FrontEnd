import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../data/home_models.dart';
import '../data/storefront_models.dart';
import '../state/storefront_controller.dart';
import 'widgets/catalogue_widgets.dart';
import 'widgets/home_sections.dart';
import 'widgets/voice_search_sheet.dart';

/// Server-side search over the same nearby set as the home tab.
class SearchTab extends StatefulWidget {
  const SearchTab({super.key, this.startWithVoice = false});

  /// Opens straight into the voice sheet, for the microphone on the home
  /// header — tapping it should start listening, not park a cursor in a field.
  final bool startWithVoice;

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
    if (widget.startWithVoice) {
      // After the push settles, or the sheet fights the route transition.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _dictate();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// The cuisines the home screen already fetched, reused rather than
  /// re-requested — the customer arrived here from that very screen.
  List<Cuisine> _cuisines(StorefrontController storefront) {
    final HomeScreen? home = storefront.home;
    if (home == null) return const <Cuisine>[];
    for (final HomeSection section in home.sections) {
      if (section is CuisineSection) return section.items;
    }
    return const <Cuisine>[];
  }

  /// Dictates a query. The sheet returns the transcript, or null when the
  /// customer cancelled or nothing was heard — either way the field is left
  /// exactly as they had it.
  Future<void> _dictate() async {
    _focus.unfocus();
    final String? spoken = await showVoiceSearchSheet(context);
    if (spoken == null || !mounted) return;

    _timer?.cancel();
    _controller.text = spoken;
    context.read<StorefrontController>().runSearch(spoken);
    setState(() {});
  }

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
              // The keyboard would otherwise rise behind the voice sheet and
              // be waiting underneath when it closes.
              autofocus: !widget.startWithVoice,
              textInputAction: TextInputAction.search,
              onChanged: _onChanged,
              onSubmitted: (String value) {
                _timer?.cancel();
                context.read<StorefrontController>().runSearch(value);
              },
              decoration: InputDecoration(
                hintText: l10n.searchDishesHint,
                prefixIcon: const Icon(Icons.search_rounded),
                // The microphone gives way to the clear button once there is
                // something to clear — two trailing icons in a search field is
                // one too many.
                suffixIcon: _controller.text.isEmpty
                    ? IconButton(
                        icon: const Icon(Icons.mic_none_rounded),
                        tooltip: l10n.voiceSearchLabel,
                        onPressed: _dictate,
                      )
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
                  // Nothing typed yet. An empty screen with a magnifying glass
                  // asks the customer to think of something; the cuisine grid
                  // hands them fifteen answers.
                  final List<Cuisine> cuisines = _cuisines(storefront);
                  if (cuisines.isEmpty) {
                    return SingleChildScrollView(
                      child: EmptyState(
                        emoji: '🔎',
                        title: l10n.searchTitle,
                        subtitle: l10n.searchDishesHint,
                      ),
                    );
                  }
                  return CuisineGrid(
                    cuisines: cuisines,
                    onTap: (Cuisine c) {
                      _timer?.cancel();
                      _controller.text = c.name;
                      context.read<StorefrontController>().runSearch(c.name);
                      setState(() {});
                    },
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
