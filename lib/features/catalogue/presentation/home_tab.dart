import 'package:flutter/foundation.dart' show setEquals;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' show LocationPermission;
import 'package:provider/provider.dart';

import '../../../core/motion/reveal.dart';
import '../../../core/motion/skeleton.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../address/data/address.dart';
import '../../address/data/location_service.dart';
import '../../address/state/address_controller.dart';
import '../../auth/data/auth_failure.dart';
import '../../auth/state/auth_controller.dart';
import '../data/home_models.dart';
import '../data/restaurant_filters.dart';
import '../data/storefront_models.dart';
import '../state/storefront_controller.dart';
import 'widgets/catalogue_widgets.dart';
import 'widgets/filter_bar.dart';
import 'widgets/home_sections.dart';

/// Nearby restaurants for the customer's delivery address.
class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.onOpenSearch,
    required this.onOpenVoiceSearch,
  });

  final VoidCallback onOpenSearch;

  /// Opens search with the microphone already listening.
  final VoidCallback onOpenVoiceSearch;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  /// Reverse-geocoded name of where the phone is, shown in the header when the
  /// customer has no saved address yet. Null the rest of the time.
  String? _currentArea;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  /// Nearby is resolved from the saved default address when there is one. The
  /// API prefers that over a fresh GPS read, and it is the same pin checkout
  /// will validate the 1 km radius against.
  Future<void> _load() async {
    if (!mounted) return;
    final AddressController addresses = context.read<AddressController>();
    final StorefrontController storefront = context.read<StorefrontController>();

    // A restored session goes splash → storefront without passing through the
    // OTP screen, which is the only other place the address book is fetched.
    // Without this, a customer who already has an address is shown "Add
    // address" and the nearby search runs with no origin at all.
    if (!addresses.hasLoaded) await addresses.load();
    if (!mounted) return;

    final Address? address = addresses.defaultAddress;
    if (address != null) {
      if (_currentArea != null) setState(() => _currentArea = null);
      // Both, in parallel: /home carries the curated rails, /restaurants backs
      // the filtered list. Whichever the screen shows, the other is warm.
      await Future.wait(<Future<void>>[
        storefront.loadHome(addressId: address.id),
        storefront.load(
          addressId: address.id,
          latitude: address.latitude,
          longitude: address.longitude,
        ),
      ]);
      return;
    }

    // Nothing saved yet. Fall back to where the phone actually is, so the list
    // is at least nearby rather than empty. Nothing is stored — checkout needs
    // an address_id, so the address book still has to be filled in.
    final LocationFix? fix = await _currentFix();
    if (!mounted) return;
    await Future.wait(<Future<void>>[
      storefront.loadHome(
        latitude: fix?.latitude,
        longitude: fix?.longitude,
      ),
      storefront.load(
        latitude: fix?.latitude,
        longitude: fix?.longitude,
      ),
    ]);
  }

  void _openRestaurant(Restaurant restaurant) => Navigator.of(context).pushNamed(
        AppRoutes.restaurant,
        arguments: RestaurantArgs(restaurantId: restaurant.id),
      );

  /// Where a banner tap goes. An action type this build does not know is inert
  /// rather than an error — the server can add destinations before the app
  /// supports them.
  void _followBanner(HomeBanner banner) {
    final StorefrontController storefront = context.read<StorefrontController>();
    switch (banner.action.type) {
      case 'restaurant':
        Navigator.of(context).pushNamed(
          AppRoutes.restaurant,
          arguments: RestaurantArgs(restaurantId: banner.action.value),
        );
      case 'cuisine':
        storefront.applyFilters(
          storefront.filters.toggleCuisine(banner.action.value),
        );
      case 'collection':
      case 'url':
      default:
        break;
    }
  }

  /// The banner rail that becomes the header background — the first one the
  /// server sent.
  ///
  /// Read straight off the home payload rather than through `showsHome`: the
  /// curated *sections* rightly disappear once a filter is on, but the header
  /// is the header, and having it change height because the customer flipped
  /// the veg switch is just the page lurching under their thumb.
  List<HomeBanner> _heroBanners(StorefrontController storefront) {
    final HomeScreen? home = storefront.home;
    if (home == null) return const <HomeBanner>[];
    for (final HomeSection section in home.sections) {
      if (section is BannerSection) return section.items;
    }
    return const <HomeBanner>[];
  }

  /// The food categories pinned under the search bar — the first rail the
  /// server sent, hoisted out of the page so it stays in reach.
  ///
  /// Also independent of `showsHome`, and this one matters: the rail is how a
  /// category gets *un*selected. Hiding it the moment one is picked strands
  /// the customer inside a filter with no way back to it.
  List<Cuisine> _heroCuisines(StorefrontController storefront) {
    final HomeScreen? home = storefront.home;
    if (home == null) return const <Cuisine>[];
    for (final HomeSection section in home.sections) {
      if (section is CuisineSection) return section.items;
    }
    return const <Cuisine>[];
  }

  /// Renders the server's home sections in the order they arrived.
  List<Widget> _homeSlivers(
    BuildContext context,
    StorefrontController storefront,
  ) {
    final List<Widget> slivers = <Widget>[];
    bool usedHeroBanner = false;
    bool usedHeroCuisines = false;

    for (final HomeSection section in storefront.home!.sections) {
      switch (section) {
        case BannerSection(:final List<HomeBanner> items):
          // The first rail is already the header background; a second one is
          // still rendered where the server placed it.
          if (!usedHeroBanner) {
            usedHeroBanner = true;
            break;
          }
          slivers.add(
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: BannerCarousel(banners: items, onTap: _followBanner),
              ),
            ),
          );

        case CuisineSection(:final List<Cuisine> items):
          // The first rail is pinned under the search bar; a second one is
          // still rendered where the server placed it.
          if (!usedHeroCuisines) {
            usedHeroCuisines = true;
            break;
          }
          slivers.add(
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CuisineRail(
                  cuisines: items,
                  selected: storefront.filters.cuisines,
                  onTap: (Cuisine c) => storefront
                      .applyFilters(storefront.filters.toggleCuisine(c.slug)),
                ),
              ),
            ),
          );

        case CollectionTileSection():
          slivers.add(
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: CollectionTile(
                  section: section,
                  // Collections open as a filtered list until the collection
                  // screen exists; the tile is never a dead tap.
                  onTap: () => storefront.applyFilters(
                    storefront.filters.toggleCuisine(section.slug),
                  ),
                ),
              ),
            ),
          );

        case RestaurantSection(
            :final String title,
            :final bool isGrid,
            :final List<Restaurant> items,
          ):
          slivers.add(SliverToBoxAdapter(child: SectionHeader(title: title)));
          slivers.add(
            SliverToBoxAdapter(
              child: isGrid
                  ? RestaurantGrid(
                      items: items,
                      onTap: _openRestaurant,
                      onFavourite: storefront.toggleFavourite,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          for (int i = 0; i < items.length; i++) ...<Widget>[
                            Reveal(
                              index: i,
                              child: RestaurantCard(
                                restaurant: items[i],
                                onTap: () => _openRestaurant(items[i]),
                                onFavourite: () =>
                                    storefront.toggleFavourite(items[i]),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ],
                      ),
                    ),
            ),
          );
      }
    }
    return slivers;
  }

  /// A fix from permission the customer has already granted.
  ///
  /// Deliberately never prompts: the system dialog belongs to the onboarding
  /// screen that explains why it is being asked for, not to the home screen.
  Future<LocationFix?> _currentFix() async {
    final LocationService location = context.read<LocationService>();
    try {
      final LocationPermission permission = await location.currentPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        return null;
      }

      final LocationFix fix = await location.requestFix();
      final ResolvedPlace place =
          await location.describe(fix.latitude, fix.longitude);
      if (mounted) {
        setState(() => _currentArea = _label(place));
      }
      return fix;
    } on LocationException {
      // No fix is not an error worth a banner — the header falls back to
      // "Add address", which is the action that fixes it anyway.
      return null;
    }
  }

  /// The shortest thing that still tells the customer where they are.
  static String? _label(ResolvedPlace place) {
    for (final String? part in <String?>[
      place.landmark,
      place.line1,
      place.city,
    ]) {
      if (part != null && part.trim().isNotEmpty) return part.trim();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final StorefrontController storefront = context.watch<StorefrontController>();
    final List<Restaurant> restaurants = storefront.restaurants;

    // Watched here rather than inside the header: that widget is built during
    // layout now, which is no place to be subscribing to a controller.
    final Address? address = context.watch<AddressController>().defaultAddress;
    final String? name = context.watch<AuthController>().user?.firstName;

    // The header is measured rather than guessed, because every one of these
    // pieces grows with the text scale and the pinned bar has to be exactly
    // what is left when the hero has finished collapsing.
    final MediaQueryData media = MediaQuery.of(context);
    final double locationHeight = media.textScaler.scale(52).clamp(52.0, 80.0);
    final double barHeight = media.textScaler.scale(66).clamp(66.0, 96.0);
    final List<HomeBanner> heroBanners = _heroBanners(storefront);
    final List<Cuisine> heroCuisines = _heroCuisines(storefront);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: _HomeHeaderDelegate(
                topPadding: media.padding.top,
                locationHeight: locationHeight,
                barHeight: barHeight,
                // The banner keeps a tall hero worth scrolling past; without
                // one there is nothing to look at, so the header is just its
                // controls.
                heroExtent: media.padding.top +
                    locationHeight +
                    barHeight +
                    (heroBanners.isEmpty ? 14 : 186),
                currentArea: _currentArea,
                address: address,
                name: name,
                onOpenSearch: widget.onOpenSearch,
                onOpenVoiceSearch: widget.onOpenVoiceSearch,
                vegOnly: storefront.filters.vegOnly,
                onVegChanged: (bool value) => context
                    .read<StorefrontController>()
                    .applyFilters(storefront.filters.copyWith(vegOnly: value)),
                // The first banner rail becomes the header's background; any
                // later one still renders inline where the server put it.
                banners: heroBanners,
                onBannerTap: _followBanner,
              ),
            ),
            // Pinned directly under the bar, so the categories stay reachable
            // the whole way down the list.
            if (heroCuisines.isNotEmpty)
              SliverPersistentHeader(
                pinned: true,
                delegate: _CuisineRailDelegate(
                  // The rail owns its own height; this only adds the breathing
                  // room above and below it.
                  extent: CuisineRail.heightFor(context) + 12,
                  cuisines: heroCuisines,
                  selected: storefront.filters.cuisines,
                  onTap: (Cuisine c) => context
                      .read<StorefrontController>()
                      .applyFilters(storefront.filters.toggleCuisine(c.slug)),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverToBoxAdapter(
              child: FilterBar(
                filters: storefront.filters,
                onChanged: (RestaurantFilters next) =>
                    context.read<StorefrontController>().applyFilters(next),
              ),
            ),
            if (storefront.deals.isNotEmpty) ...<Widget>[
              SliverToBoxAdapter(
                child: SectionHeader(title: l10n.rescueDealsTitle),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  // A horizontal carousel needs a fixed height, so it has to
                  // grow with the text scale or the card overflows at 1.3.
                  height: MediaQuery.textScalerOf(context)
                      .scale(172)
                      .clamp(172.0, 260.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: storefront.deals.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (BuildContext context, int i) {
                      final RescueDeal deal = storefront.deals[i];
                      return RescueDealCard(
                        deal: deal,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.restaurant,
                          arguments:
                              RestaurantArgs(restaurantId: deal.restaurantId),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            // The curated home, in whatever order the server sent. A section
            // type this build does not recognise was already dropped on decode,
            // so nothing here indexes by position.
            if (storefront.showsHome)
              ..._homeSlivers(context, storefront),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: storefront.showsHome
                    ? l10n.allRestaurantsTitle
                    : l10n.restaurantsNearby,
                trailing: storefront.total == null
                    ? null
                    : Text(
                        l10n.restaurantsCount(storefront.total!),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
              ),
            ),
            if (storefront.isLoading && restaurants.isEmpty)
              // A skeleton in the shape of the list, not a spinner: it tells
              // the customer what is coming and makes the same wait read as
              // shorter.
              const SliverToBoxAdapter(child: NearbySkeleton())
            else if (storefront.failure != null && restaurants.isEmpty)
              SliverToBoxAdapter(
                child: EmptyState(
                  emoji: '📡',
                  title: l10n.somethingWentWrong,
                  subtitle: storefront.failure!.message(l10n),
                  action: OutlinedButton(
                    onPressed: _load,
                    child: Text(l10n.retry),
                  ),
                ),
              )
            else if (restaurants.isEmpty && storefront.hasLoaded)
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
                    // Wrapped inside itemBuilder rather than around the list,
                    // so only rows that actually scroll into view animate.
                    return Reveal(
                      index: index,
                      child: RestaurantCard(
                        restaurant: restaurant,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.restaurant,
                          arguments: RestaurantArgs(restaurantId: restaurant.id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 110)),
          ],
        ),
      ),
    );
  }
}

/// Pins the search field and the veg switch to the top of the storefront.
///
/// Everything above them belongs to the hero and scrolls away: the promotional
/// artwork and the delivery address are worth the space on arrival and worth
/// none of it once the customer is reading the list. The bar itself never
/// leaves, so search is one tap from anywhere in the page.
class _HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _HomeHeaderDelegate({
    required this.topPadding,
    required this.locationHeight,
    required this.barHeight,
    required this.heroExtent,
    required this.currentArea,
    required this.address,
    required this.name,
    required this.onOpenSearch,
    required this.onOpenVoiceSearch,
    required this.vegOnly,
    required this.onVegChanged,
    required this.banners,
    required this.onBannerTap,
  });

  final double topPadding;
  final double locationHeight;
  final double barHeight;
  final double heroExtent;

  final String? currentArea;
  final Address? address;
  final String? name;
  final VoidCallback onOpenSearch;
  final VoidCallback onOpenVoiceSearch;
  final bool vegOnly;
  final ValueChanged<bool> onVegChanged;
  final List<HomeBanner> banners;
  final ValueChanged<HomeBanner> onBannerTap;

  @override
  double get minExtent => topPadding + barHeight;

  @override
  double get maxExtent => heroExtent < minExtent ? minExtent : heroExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double height =
        (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    final double range = maxExtent - minExtent;
    final double collapse =
        range <= 0 ? 1 : ((maxExtent - height) / range).clamp(0.0, 1.0);

    return _HomeHeader(
      height: height,
      collapse: collapse,
      topPadding: topPadding,
      locationHeight: locationHeight,
      barHeight: barHeight,
      currentArea: currentArea,
      address: address,
      name: name,
      onOpenSearch: onOpenSearch,
      onOpenVoiceSearch: onOpenVoiceSearch,
      vegOnly: vegOnly,
      onVegChanged: onVegChanged,
      banners: banners,
      onBannerTap: onBannerTap,
    );
  }

  @override
  bool shouldRebuild(_HomeHeaderDelegate old) =>
      topPadding != old.topPadding ||
      locationHeight != old.locationHeight ||
      barHeight != old.barHeight ||
      heroExtent != old.heroExtent ||
      currentArea != old.currentArea ||
      address?.id != old.address?.id ||
      address?.summary != old.address?.summary ||
      name != old.name ||
      vegOnly != old.vegOnly ||
      !identical(banners, old.banners);
}

/// The green cap at the top of the storefront, drawn at whatever height the
/// scroll position has left it.
///
/// The banner is the background rather than a card below it, and the search
/// row sits inside the header instead of overhanging its edge — a field
/// straddling the boundary would be half on the artwork and half on the page.
class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.height,
    required this.collapse,
    required this.topPadding,
    required this.locationHeight,
    required this.barHeight,
    this.currentArea,
    required this.address,
    required this.name,
    required this.onOpenSearch,
    required this.onOpenVoiceSearch,
    required this.vegOnly,
    required this.onVegChanged,
    this.banners = const <HomeBanner>[],
    required this.onBannerTap,
  });

  /// What the scroll position has left of the header, and how far along that
  /// is: 0 fully open, 1 down to the pinned bar.
  final double height;
  final double collapse;

  final double topPadding;
  final double locationHeight;
  final double barHeight;

  /// Where the phone is, when there is no saved address to deliver to.
  final String? currentArea;

  /// Resolved by the tab rather than watched here: this widget is built during
  /// layout, which is no place to be subscribing to a controller.
  final Address? address;
  final String? name;

  final VoidCallback onOpenSearch;
  final VoidCallback onOpenVoiceSearch;
  final bool vegOnly;
  final ValueChanged<bool> onVegChanged;

  /// Promotions, used as the header's own background rather than as a card
  /// below it. Empty falls back to the brand gradient.
  final List<HomeBanner> banners;
  final ValueChanged<HomeBanner> onBannerTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);

    // A saved address is what orders are actually delivered to, so it wins.
    // The GPS reading is a stand-in until one exists, and is labelled as such
    // rather than dressed up as a delivery address.
    final bool onGps = address == null && currentArea != null;
    final String heading = address != null
        ? address!.summary
        : (currentArea ?? l10n.addAddress);

    final bool hasBanner = banners.isNotEmpty;

    // The artwork and the address are gone well before the bar has finished
    // travelling — a photograph at 20% opacity behind a search field is just
    // dirt on the glass.
    final double fade = (1 - collapse * 1.7).clamp(0.0, 1.0);

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          // Square by the time it is a bar: a rounded strip pinned to the top
          // of the screen reads as a card that failed to scroll away.
          bottom: Radius.circular(28 * (1 - collapse)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Painted under the artwork rather than instead of it. The veg
            // switch and the search hint are drawn in white, so the moment the
            // banner fades they would otherwise be sitting on a white page.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.greenDeep, Color(0xFF1C6606)],
                ),
              ),
            ),
            if (hasBanner)
              IgnorePointer(
                // Stops a half-faded banner from swallowing taps meant for the
                // list scrolling underneath it.
                ignoring: collapse > 0.4,
                child: Opacity(
                  opacity: fade,
                  child: BannerCarousel(
                    banners: banners,
                    onTap: onBannerTap,
                    fullBleed: true,
                  ),
                ),
              ),
            // A photograph cannot be relied on to be dark, so the contrast
            // under the address is painted rather than borrowed: strong at the
            // top, clearing by the middle so the artwork is not muddied.
            if (hasBanner)
              IgnorePointer(
                child: Opacity(
                  opacity: fade,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xCC0B1F04),
                          Color(0x660B1F04),
                          Color(0x000B1F04),
                        ],
                        stops: <double>[0, 0.45, 0.75],
                      ),
                    ),
                  ),
                ),
              ),
            Column(
              children: <Widget>[
                SizedBox(height: topPadding),
                // Collapses to nothing rather than sliding under the status
                // bar, so the search row below climbs at the rate the page
                // scrolls and arrives exactly where it stops.
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: (1 - collapse).clamp(0.0, 1.0),
                    child: Opacity(
                      opacity: fade,
                      child: SizedBox(
                        height: locationHeight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                onGps
                                    ? Icons.my_location_rounded
                                    : Icons.location_on_rounded,
                                color: AppColors.orangeLight,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      onGps
                                          ? l10n.currentLocationLabel
                                          : l10n.deliverTo,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
                                        color:
                                            Colors.white.withValues(alpha: 0.7),
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(AppRoutes.addressBook),
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              heading,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: -0.2,
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
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              _HeaderAvatar(initial: name),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // The row that stays. The veg switch travels with the search
                // field rather than with the address, because it filters the
                // list below and has to survive the collapse.
                SizedBox(
                  height: barHeight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: _SearchEntry(
                            onTap: onOpenSearch,
                            onVoice: onOpenVoiceSearch,
                          ),
                        ),
                        const SizedBox(width: 14),
                        VegToggle(value: vegOnly, onChanged: onVegChanged),
                      ],
                    ),
                  ),
                ),
                // Whatever banner is left below the controls. Absorbs the
                // collapse, so nothing above it has to move twice.
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Keeps the food categories in reach while the customer scrolls.
///
/// Fixed height, so it never rebuilds mid-scroll: it stops travelling once it
/// meets the search bar, and the list slides underneath it.
class _CuisineRailDelegate extends SliverPersistentHeaderDelegate {
  const _CuisineRailDelegate({
    required this.extent,
    required this.cuisines,
    required this.selected,
    required this.onTap,
  });

  final double extent;
  final List<Cuisine> cuisines;
  final Set<String> selected;
  final ValueChanged<Cuisine> onTap;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      // Opaque on purpose: a transparent pinned rail would have restaurant
      // cards running through the cuisine names.
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 3),
        child: CuisineRail(
          cuisines: cuisines,
          selected: selected,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_CuisineRailDelegate old) =>
      extent != old.extent ||
      !identical(cuisines, old.cuisines) ||
      !setEquals(selected, old.selected);
}

/// The profile button, as a circle with the customer's initial.
class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({this.initial});

  final String? initial;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String letter =
        (initial ?? '').trim().isEmpty ? '' : initial!.trim()[0].toUpperCase();

    return Semantics(
      button: true,
      label: l10n.profileTitle,
      child: InkResponse(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.profile),
        radius: 26,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.16),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: letter.isEmpty
              ? const Icon(Icons.person_outline_rounded,
                  color: Colors.white, size: 20)
              : Text(
                  letter,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
        ),
      ),
    );
  }
}

/// Docked search field. Not a real input — tapping it opens the search tab,
/// which is where the keyboard and the results belong.
class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.onTap, required this.onVoice});

  final VoidCallback onTap;
  final VoidCallback onVoice;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final BorderRadius radius = BorderRadius.circular(14);

    return Material(
      color: theme.colorScheme.surfaceContainerLowest,
      borderRadius: radius,
      // Elevated so it reads as sitting on top of the header rather than cut
      // into it.
      elevation: isDark ? 0 : 6,
      shadowColor: AppColors.inkStrong.withValues(alpha: 0.22),
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: isDark
                  ? theme.colorScheme.outline
                  : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: <Widget>[
                Icon(Icons.search_rounded,
                    size: 21, color: AppColors.orangeDeep),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.searchDishesHint,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                // Its own tap target inside the field, so the microphone
                // starts listening rather than opening the keyboard first.
                Semantics(
                  button: true,
                  label: l10n.voiceSearchLabel,
                  child: InkResponse(
                    onTap: onVoice,
                    radius: 24,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.mic_none_rounded,
                        size: 22,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
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
