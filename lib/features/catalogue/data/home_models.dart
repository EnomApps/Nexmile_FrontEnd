import 'package:flutter/foundation.dart';

import 'storefront_models.dart';

/// Where tapping a banner goes.
@immutable
class BannerAction {
  const BannerAction({required this.type, required this.value});

  /// `restaurant`, `collection`, `cuisine`, `url`, or `none`. Kept as a string
  /// rather than an enum so a new destination the server invents is inert
  /// rather than a crash.
  final String type;
  final String value;

  bool get isNone => type.isEmpty || type == 'none' || value.isEmpty;

  static const BannerAction none = BannerAction(type: 'none', value: '');

  static BannerAction fromJson(Object? raw) {
    // The generated schema types this as an array; the API sends an object.
    // Accept either rather than losing every banner tap to a shape mismatch.
    if (raw is! Map<String, dynamic>) return none;
    return BannerAction(
      type: asString(raw['type'], 'none'),
      value: asString(raw['value']),
    );
  }
}

@immutable
class HomeBanner {
  const HomeBanner({
    required this.id,
    required this.imageUrl,
    required this.altText,
    required this.action,
  });

  final int id;

  /// Signed and expiring, like every image URL in this API. Cache the bytes,
  /// never the URL.
  final String? imageUrl;

  final String altText;
  final BannerAction action;

  static HomeBanner fromJson(Map<String, dynamic> json) => HomeBanner(
        id: asInt(json['id']),
        imageUrl: json['image_url'] as String?,
        altText: asString(json['alt_text']),
        action: BannerAction.fromJson(json['action']),
      );
}

/// One tile on the cuisine rail — "Biryani", "Cake", "Pizza".
@immutable
class Cuisine {
  const Cuisine({
    required this.slug,
    required this.name,
    required this.imageUrl,
  });

  final String slug;
  final String name;
  final String? imageUrl;

  static Cuisine fromJson(Map<String, dynamic> json) => Cuisine(
        slug: asString(json['slug']),
        name: asString(json['name']),
        imageUrl: json['image_url'] as String?,
      );
}

/// A section of the home screen.
///
/// Sealed on purpose: the screen switches on the runtime type, and an
/// unrecognised `type` from the server decodes to null and is dropped. That is
/// the contract — new section types ship server-side before the app supports
/// them, so the app must never crash on one and must never assume a position.
sealed class HomeSection {
  const HomeSection();

  /// Returns null for a section this build does not understand, or one that
  /// arrived empty.
  static HomeSection? fromJson(Object? raw) {
    if (raw is! Map<String, dynamic>) return null;
    final String type = asString(raw['type']);

    switch (type) {
      case 'banners':
        final List<HomeBanner> items =
            asMapList(raw['items']).map(HomeBanner.fromJson).toList();
        return items.isEmpty ? null : BannerSection(items);

      case 'cuisines':
        final List<Cuisine> items =
            asMapList(raw['items']).map(Cuisine.fromJson).toList();
        return items.isEmpty ? null : CuisineSection(items);

      case 'collection_tile':
        final String slug = asString(raw['slug']);
        return slug.isEmpty
            ? null
            : CollectionTileSection(
                slug: slug,
                title: asString(raw['title']),
                imageUrl: raw['image_url'] as String?,
              );

      case 'restaurants':
        final List<Restaurant> items =
            asMapList(raw['items']).map(Restaurant.fromJson).toList();
        return items.isEmpty
            ? null
            : RestaurantSection(
                // Already localised by the server for the customer's
                // preferred_locale, like `status_label` on an order.
                title: asString(raw['title']),
                isGrid: asString(raw['layout']) == 'grid',
                items: items,
              );

      default:
        return null;
    }
  }
}

class BannerSection extends HomeSection {
  const BannerSection(this.items);
  final List<HomeBanner> items;
}

class CuisineSection extends HomeSection {
  const CuisineSection(this.items);
  final List<Cuisine> items;
}

class CollectionTileSection extends HomeSection {
  const CollectionTileSection({
    required this.slug,
    required this.title,
    this.imageUrl,
  });

  final String slug;
  final String title;
  final String? imageUrl;
}

class RestaurantSection extends HomeSection {
  const RestaurantSection({
    required this.title,
    required this.isGrid,
    required this.items,
  });

  final String title;

  /// `grid` renders two across, `list` one — the server decides which, so a
  /// section can be promoted without an app release.
  final bool isGrid;

  final List<Restaurant> items;
}

/// The whole home payload.
@immutable
class HomeScreen {
  const HomeScreen({required this.sections, this.radiusMetres});

  final List<HomeSection> sections;

  /// How far the server searched. Worth showing when a list comes back short.
  final int? radiusMetres;

  bool get isEmpty => sections.isEmpty;

  static HomeScreen fromJson(
    Map<String, dynamic> data,
    Map<String, dynamic> meta,
  ) {
    final Object? raw = data['sections'];
    final List<HomeSection> sections = <HomeSection>[];
    if (raw is List) {
      for (final Object? entry in raw) {
        final HomeSection? section = HomeSection.fromJson(entry);
        if (section != null) sections.add(section);
      }
    }
    return HomeScreen(
      sections: sections,
      radiusMetres:
          meta['radius_metres'] == null ? null : asInt(meta['radius_metres']),
    );
  }
}

/// One page of `GET /v1/restaurants`, with the paginator's own count.
///
/// `meta.total` is what lets the filter sheet say "Show results (42)" before it
/// closes, which is the entire point of that button.
@immutable
class RestaurantPage {
  const RestaurantPage({
    required this.items,
    this.total,
    this.radiusMetres,
  });

  final List<Restaurant> items;
  final int? total;
  final int? radiusMetres;

  static const RestaurantPage empty = RestaurantPage(items: <Restaurant>[]);
}
