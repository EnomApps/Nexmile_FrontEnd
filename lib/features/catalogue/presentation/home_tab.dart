import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' show LocationPermission;
import 'package:provider/provider.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/l10n/app_localizations.dart';
import '../../address/data/address.dart';
import '../../address/data/location_service.dart';
import '../../address/state/address_controller.dart';
import '../../auth/data/auth_failure.dart';
import '../../auth/state/auth_controller.dart';
import '../data/storefront_models.dart';
import '../state/storefront_controller.dart';
import 'widgets/catalogue_widgets.dart';

/// Nearby restaurants for the customer's delivery address.
class HomeTab extends StatefulWidget {
  const HomeTab({super.key, required this.onOpenSearch});

  final VoidCallback onOpenSearch;

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
      await storefront.load(
        addressId: address.id,
        latitude: address.latitude,
        longitude: address.longitude,
      );
      return;
    }

    // Nothing saved yet. Fall back to where the phone actually is, so the list
    // is at least nearby rather than empty. Nothing is stored — checkout needs
    // an address_id, so the address book still has to be filled in.
    final LocationFix? fix = await _currentFix();
    if (!mounted) return;
    await storefront.load(
      latitude: fix?.latitude,
      longitude: fix?.longitude,
    );
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

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _load,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(child: _HomeHeader(currentArea: _currentArea)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: _SearchEntry(onTap: widget.onOpenSearch),
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
            SliverToBoxAdapter(
              child: SectionHeader(title: l10n.restaurantsNearby),
            ),
            if (storefront.isLoading && restaurants.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
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
            const SliverToBoxAdapter(child: SizedBox(height: 110)),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({this.currentArea});

  /// Where the phone is, when there is no saved address to deliver to.
  final String? currentArea;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppLocalizations l10n = AppLocalizations.of(context);
    final String? name = context.watch<AuthController>().user?.firstName;
    final Address? address = context.watch<AddressController>().defaultAddress;

    // A saved address is what orders are actually delivered to, so it wins.
    // The GPS reading is a stand-in until one exists, and is labelled as such
    // rather than dressed up as a delivery address.
    final bool onGps = address == null && currentArea != null;
    final String heading = address != null
        ? address.summary
        : (currentArea ?? l10n.addAddress);

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
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Icon(
                  onGps ? Icons.my_location_rounded : Icons.location_on_rounded,
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
                      onGps ? l10n.currentLocationLabel : l10n.deliverTo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
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
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.white, size: 20),
                        ],
                      ),
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
                Icon(Icons.search_rounded,
                    size: 22, color: theme.colorScheme.onSurfaceVariant),
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
