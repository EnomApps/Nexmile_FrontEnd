import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/motion/app_motion.dart';
import '../../../../core/motion/pressable.dart';
import '../../../../core/motion/reveal.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../data/home_models.dart';
import '../../data/storefront_models.dart';
import 'catalogue_widgets.dart';

/// The banner carousel at the top of the home screen.
///
/// Auto-advances slowly and stops the moment the customer swipes — a carousel
/// that keeps moving under a finger is the most irritating thing on a home
/// screen.
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    required this.banners,
    required this.onTap,
    this.fullBleed = false,
    this.height,
  });

  final List<HomeBanner> banners;
  final ValueChanged<HomeBanner> onTap;

  /// Edge to edge with no corner radius, for the home hero where the banner is
  /// the header's background rather than a card sitting on the page.
  final bool fullBleed;

  /// Fills its parent when null, which is what the hero needs.
  final double? height;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  /// Exposed so the hero can drive the dots from outside the carousel.
  int get index => _index;
  static const Duration _dwell = Duration(seconds: 5);

  final PageController _pages = PageController();
  Timer? _timer;
  int _index = 0;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    if (widget.banners.length > 1) _start();
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(_dwell, (_) {
      if (!mounted || _touched || !_pages.hasClients) return;
      _pages.animateToPage(
        (_index + 1) % widget.banners.length,
        duration: AppMotion.settled,
        curve: AppMotion.enter,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final Widget pager = SizedBox(
      height: widget.height,
      child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification n) {
              // One deliberate swipe ends the automatic rotation for good.
              if (n is UserScrollNotification) {
                _touched = true;
                _timer?.cancel();
              }
              return false;
            },
            child: PageView.builder(
              controller: _pages,
              itemCount: widget.banners.length,
              onPageChanged: (int i) => setState(() => _index = i),
              itemBuilder: (BuildContext context, int i) {
                final HomeBanner banner = widget.banners[i];
                final Widget image = FoodImage(
                  seed: '${banner.id}',
                  url: banner.imageUrl,
                  emoji: '🎉',
                  size: double.infinity,
                  radius: widget.fullBleed ? 0 : AppTheme.radiusLarge,
                );

                final Widget tappable = Pressable(
                  onTap:
                      banner.action.isNone ? null : () => widget.onTap(banner),
                  child: Semantics(
                    label: banner.altText,
                    image: true,
                    child: widget.fullBleed
                        ? image
                        : ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusLarge),
                            child: image,
                          ),
                  ),
                );

                return widget.fullBleed
                    ? tappable
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: tappable,
                      );
              },
            ),
          ),
    );

    if (widget.banners.length < 2) return pager;

    final Widget dots = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < widget.banners.length; i++)
          AnimatedContainer(
            duration: AppMotion.quick,
            curve: AppMotion.enter,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == _index ? 18 : 6,
            height: 6,
            decoration: BoxDecoration(
              // Over a photograph the dots need their own contrast rather than
              // the page's outline colour, which vanishes on a bright image.
              color: i == _index
                  ? (widget.fullBleed ? Colors.white : AppColors.greenDeep)
                  : (widget.fullBleed
                      ? Colors.white.withValues(alpha: 0.45)
                      : theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
      ],
    );

    // Full bleed puts the dots *on* the banner; the card form stacks them below.
    return widget.fullBleed
        ? Stack(
            children: <Widget>[
              Positioned.fill(child: pager),
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 10,
                child: dots,
              ),
            ],
          )
        : Column(
            children: <Widget>[
              SizedBox(height: 168, child: pager),
              const SizedBox(height: 10),
              dots,
            ],
          );
  }
}

/// The horizontal rail of cuisines — Biryani, Cake, Pizza.
class CuisineRail extends StatelessWidget {
  const CuisineRail({
    super.key,
    required this.cuisines,
    required this.selected,
    required this.onTap,
  });

  final List<Cuisine> cuisines;
  final Set<String> selected;
  final ValueChanged<Cuisine> onTap;

  /// The rail's height, shared with the pinned header that hosts it — two
  /// numbers that have to agree, so there is only one of them.
  ///
  /// Grows with the text scale, or the label clips at 1.3.
  static double heightFor(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(84).clamp(84.0, 120.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFor(context),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: cuisines.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (BuildContext context, int i) {
          final Cuisine cuisine = cuisines[i];
          return Reveal(
            index: i,
            from: AxisDirection.right,
            child: _CuisineTile(
              cuisine: cuisine,
              selected: selected.contains(cuisine.slug),
              onTap: () => onTap(cuisine),
            ),
          );
        },
      ),
    );
  }
}

class _CuisineTile extends StatelessWidget {
  const _CuisineTile({
    required this.cuisine,
    required this.selected,
    required this.onTap,
  });

  final Cuisine cuisine;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Pressable(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedContainer(
              duration: AppMotion.quick,
              curve: AppMotion.enter,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      selected ? AppColors.greenDeep : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: FoodImage(
                  seed: cuisine.slug,
                  url: cuisine.imageUrl,
                  size: 52,
                  radius: 26,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              cuisine.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
                color: selected ? AppColors.greenDeep : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The "Meals under ₹250" style promo tile.
class CollectionTile extends StatelessWidget {
  const CollectionTile({
    super.key,
    required this.section,
    required this.onTap,
  });

  final CollectionTileSection section;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Pressable(
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            border: Border.all(color: theme.colorScheme.outline),
            color: theme.colorScheme.surfaceContainerLow,
          ),
          child: Row(
            children: <Widget>[
              FoodImage(
                seed: section.slug,
                url: section.imageUrl,
                emoji: '🏷️',
                size: 72,
                radius: 0,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  section.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Icon(Icons.arrow_forward_rounded, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A two-across grid of restaurant cards, for a `grid` section.
class RestaurantGrid extends StatelessWidget {
  const RestaurantGrid({
    super.key,
    required this.items,
    required this.onTap,
    required this.onFavourite,
  });

  final List<Restaurant> items;
  final ValueChanged<Restaurant> onTap;
  final ValueChanged<Restaurant> onFavourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // Both required, and for the same reason: a vertical scroll view with
        // no controller is `primary` by default, and a primary view with no
        // padding of its own inherits the status bar inset from MediaQuery.
        // Nested inside the page that already handles that, it showed up as a
        // phone-dependent band of dead space under the section heading.
        primary: false,
        padding: EdgeInsets.zero,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          // Sized to the content: a 4:3 image band plus a name and one
          // subtitle line. Grows with the text scale, or the name clips at
          // 1.3 — but not more than that, or the card is mostly dead space.
          childAspectRatio:
              1 / MediaQuery.textScalerOf(context).scale(1.18).clamp(1.18, 1.6),
        ),
        itemBuilder: (BuildContext context, int i) => Reveal(
          index: i,
          child: RestaurantCard(
            restaurant: items[i],
            compact: true,
            onTap: () => onTap(items[i]),
            onFavourite: () => onFavourite(items[i]),
          ),
        ),
      ),
    );
  }
}

/// "What's on your mind?" — the full cuisine grid, shown on the search screen
/// before anything is typed.
///
/// Three across rather than the home rail's single row: this is a menu of
/// answers, not a teaser, so the whole taxonomy should be reachable without a
/// horizontal scroll.
class CuisineGrid extends StatelessWidget {
  const CuisineGrid({
    super.key,
    required this.cuisines,
    required this.onTap,
  });

  final List<Cuisine> cuisines;
  final ValueChanged<Cuisine> onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 14),
            child: Text(
              AppLocalizations.of(context).whatsOnYourMind,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 18,
              crossAxisSpacing: 14,
              // Image plus a label, growing with the text scale so a long
              // cuisine name in Malayalam does not clip.
              childAspectRatio: 1 /
                  MediaQuery.textScalerOf(context).scale(1.28).clamp(1.28, 1.7),
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) => Reveal(
                index: i,
                child: _GridTile(
                  cuisine: cuisines[i],
                  onTap: () => onTap(cuisines[i]),
                ),
              ),
              childCount: cuisines.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _GridTile extends StatelessWidget {
  const _GridTile({required this.cuisine, required this.onTap});

  final Cuisine cuisine;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Pressable(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radius),
              child: FoodImage(
                seed: cuisine.slug,
                url: cuisine.imageUrl,
                size: double.infinity,
                radius: AppTheme.radius,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            cuisine.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
