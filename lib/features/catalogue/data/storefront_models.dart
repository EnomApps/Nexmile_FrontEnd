import 'package:flutter/foundation.dart';

/// Decoding helpers.
///
/// The generated schema types several numeric and boolean fields as `string`
/// (`CartResource.totals`, `can_checkout`, `meets_minimum`, and friends), and
/// money arrives as a JSON number in some places and a decimal string in
/// others. Rather than trust either, every scalar is coerced here — a storefront
/// that crashes because a price came back as `"249.00"` is not worth shipping.
double asDouble(Object? raw, [double fallback = 0]) {
  if (raw is num) return raw.toDouble();
  if (raw is String) return double.tryParse(raw) ?? fallback;
  return fallback;
}

int asInt(Object? raw, [int fallback = 0]) {
  if (raw is int) return raw;
  if (raw is num) return raw.round();
  if (raw is String) return int.tryParse(raw) ?? fallback;
  return fallback;
}

bool asBool(Object? raw, [bool fallback = false]) {
  if (raw is bool) return raw;
  if (raw is num) return raw != 0;
  if (raw is String) {
    final String v = raw.toLowerCase();
    if (v == 'true' || v == '1') return true;
    if (v == 'false' || v == '0') return false;
  }
  return fallback;
}

String asString(Object? raw, [String fallback = '']) =>
    raw is String ? raw : (raw == null ? fallback : '$raw');

List<Map<String, dynamic>> asMapList(Object? raw) {
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw.whereType<Map<String, dynamic>>().toList(growable: false);
}

DateTime? asDate(Object? raw) =>
    raw is String ? DateTime.tryParse(raw)?.toLocal() : null;

// ---------------------------------------------------------------------------
// Restaurant
// ---------------------------------------------------------------------------

@immutable
class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.serviceCategory,
    required this.description,
    required this.logoUrl,
    required this.bannerUrl,
    required this.isOpen,
    required this.isAcceptingOrders,
    required this.withinOperatingHours,
    required this.avgPrepTimeMinutes,
    required this.packagingFee,
    required this.minOrderValue,
    required this.supportsPickup,
    required this.area,
    this.distanceMetres,
  });

  /// The API types this as a string; treat it as opaque.
  final String id;
  final String name;
  final String serviceCategory;
  final String description;
  final String logoUrl;
  final String bannerUrl;

  /// The single flag the UI gates ordering on.
  final bool isOpen;

  /// Why it is shut. "Closed until 6pm" and "not taking orders right now" are
  /// different messages, and only one of them is worth waiting for.
  final bool isAcceptingOrders;
  final bool withinOperatingHours;

  final int avgPrepTimeMinutes;
  final double packagingFee;
  final double minOrderValue;
  final bool supportsPickup;
  final String area;

  /// Only present on a nearby search; null when fetched directly.
  final int? distanceMetres;

  /// Kilometres, one decimal — what the cards show.
  String? get distanceKmLabel => distanceMetres == null
      ? null
      : (distanceMetres! / 1000).toStringAsFixed(1);

  static Restaurant fromJson(Map<String, dynamic> json) => Restaurant(
        id: asString(json['id']),
        name: asString(json['name']),
        serviceCategory: asString(json['service_category']),
        description: asString(json['description']),
        logoUrl: asString(json['logo_url']),
        bannerUrl: asString(json['banner_url']),
        isOpen: asBool(json['is_open']),
        isAcceptingOrders: asBool(json['is_accepting_orders']),
        withinOperatingHours: asBool(json['within_operating_hours']),
        avgPrepTimeMinutes: asInt(json['avg_prep_time_minutes']),
        packagingFee: asDouble(json['packaging_fee']),
        minOrderValue: asDouble(json['min_order_value']),
        supportsPickup: asBool(json['supports_pickup']),
        area: asString(json['area']),
        distanceMetres:
            json['distance_metres'] == null ? null : asInt(json['distance_metres']),
      );

  @override
  bool operator ==(Object other) => other is Restaurant && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// A Food Rescue deal: surplus food, discounted, and time-limited.
@immutable
class RescueDeal {
  const RescueDeal({
    required this.id,
    required this.restaurantId,
    required this.restaurantName,
    required this.itemName,
    required this.price,
    required this.compareAtPrice,
    required this.portionsLeft,
    this.expiresAt,
    this.imageUrl,
  });

  final String id;
  final String restaurantId;
  final String restaurantName;
  final String itemName;
  final double price;
  final double? compareAtPrice;

  /// A rescue deal is a race — this and the countdown are the whole point.
  final int portionsLeft;
  final DateTime? expiresAt;
  final String? imageUrl;

  int? get percentOff {
    final double? was = compareAtPrice;
    if (was == null || was <= 0 || price >= was) return null;
    return (((was - price) / was) * 100).round();
  }

  static RescueDeal fromJson(Map<String, dynamic> json) {
    // The deals payload nests the restaurant when it comes from the list.
    final Object? restaurant = json['restaurant'];
    final Map<String, dynamic> r =
        restaurant is Map<String, dynamic> ? restaurant : const <String, dynamic>{};
    return RescueDeal(
      id: asString(json['id']),
      restaurantId: asString(json['restaurant_id'] ?? r['id']),
      restaurantName: asString(json['restaurant_name'] ?? r['name']),
      itemName: asString(json['name'] ?? json['item_name']),
      price: asDouble(json['price']),
      compareAtPrice: json['compare_at_price'] == null
          ? null
          : asDouble(json['compare_at_price']),
      portionsLeft: asInt(json['portions_left'] ?? json['quantity_left']),
      expiresAt: asDate(json['expires_at'] ?? json['available_until']),
      imageUrl: json['image_url'] as String?,
    );
  }
}

// ---------------------------------------------------------------------------
// Menu
// ---------------------------------------------------------------------------

@immutable
class MenuOption {
  const MenuOption({
    required this.id,
    required this.name,
    required this.priceDelta,
    required this.isAvailable,
  });

  final int id;
  final String name;
  final double priceDelta;
  final bool isAvailable;

  static MenuOption fromJson(Map<String, dynamic> json) => MenuOption(
        id: asInt(json['id']),
        name: asString(json['name']),
        priceDelta: asDouble(json['price_delta']),
        isAvailable: asBool(json['is_available'], true),
      );
}

@immutable
class OptionGroup {
  const OptionGroup({
    required this.id,
    required this.name,
    required this.isRequired,
    required this.minSelections,
    required this.options,
    this.maxSelections,
  });

  final int id;
  final String name;
  final bool isRequired;
  final int minSelections;

  /// Null means unlimited.
  final int? maxSelections;
  final List<MenuOption> options;

  /// A group that can only take one choice renders as radios, not checkboxes.
  bool get isSingleChoice => maxSelections == 1;

  static OptionGroup fromJson(Map<String, dynamic> json) => OptionGroup(
        id: asInt(json['id']),
        name: asString(json['name']),
        isRequired: asBool(json['is_required']),
        minSelections: asInt(json['min_selections']),
        maxSelections:
            json['max_selections'] == null ? null : asInt(json['max_selections']),
        options: asMapList(json['options'])
            .map(MenuOption.fromJson)
            .toList(growable: false),
      );
}

@immutable
class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.isVeg,
    required this.containsEgg,
    required this.isAvailable,
    required this.prepTimeMinutes,
    required this.optionGroups,
    this.categoryId,
    this.categoryName,
    this.description,
    this.imageUrl,
    this.compareAtPrice,
    this.isDiscounted = false,
  });

  final int id;
  final int? categoryId;
  final String? categoryName;
  final String name;
  final String? description;

  /// Signed and expiring — re-fetch the item for a fresh link.
  final String? imageUrl;

  final double price;
  final double? compareAtPrice;
  final bool isDiscounted;
  final bool isVeg;
  final bool containsEgg;

  /// Sold-out items are returned rather than hidden, and shown struck through.
  final bool isAvailable;

  final int prepTimeMinutes;
  final List<OptionGroup> optionGroups;

  /// True when adding needs the customisation sheet rather than a bare tap.
  bool get needsOptions =>
      optionGroups.any((OptionGroup g) => g.isRequired || g.minSelections > 0);

  int? get percentOff {
    final double? was = compareAtPrice;
    if (was == null || was <= 0 || price >= was) return null;
    return (((was - price) / was) * 100).round();
  }

  static MenuItem fromJson(Map<String, dynamic> json) => MenuItem(
        id: asInt(json['id']),
        categoryId:
            json['category_id'] == null ? null : asInt(json['category_id']),
        categoryName: json['category_name'] as String?,
        name: asString(json['name']),
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        price: asDouble(json['price']),
        compareAtPrice: json['compare_at_price'] == null
            ? null
            : asDouble(json['compare_at_price']),
        isDiscounted: asBool(json['is_discounted']),
        isVeg: asBool(json['is_veg']),
        containsEgg: asBool(json['contains_egg']),
        isAvailable: asBool(json['is_available'], true),
        prepTimeMinutes: asInt(json['prep_time_minutes']),
        optionGroups: asMapList(json['option_groups'])
            .map(OptionGroup.fromJson)
            .toList(growable: false),
      );
}

/// One menu section. Items with no category come back under `uncategorised`
/// and are folded in here as a section with an empty name — render both, or a
/// shop that never made categories looks empty.
@immutable
class MenuSection {
  const MenuSection({required this.name, required this.items});

  final String name;
  final List<MenuItem> items;

  bool get isUncategorised => name.isEmpty;
}

@immutable
class RestaurantMenu {
  const RestaurantMenu({required this.sections});

  final List<MenuSection> sections;

  List<MenuItem> get allItems =>
      sections.expand((MenuSection s) => s.items).toList(growable: false);

  bool get isEmpty => allItems.isEmpty;

  /// Decodes `data.menu` (categories with items) plus the separate
  /// `uncategorised` bucket.
  static RestaurantMenu fromJson(Map<String, dynamic> data) {
    final List<MenuSection> sections = <MenuSection>[];

    for (final Map<String, dynamic> category in asMapList(data['menu'])) {
      final List<MenuItem> items = asMapList(category['items'])
          .map(MenuItem.fromJson)
          .toList(growable: false);
      if (items.isEmpty) continue;
      sections.add(
        MenuSection(name: asString(category['name']), items: items),
      );
    }

    final List<MenuItem> loose = asMapList(data['uncategorised'])
        .map(MenuItem.fromJson)
        .toList(growable: false);
    if (loose.isNotEmpty) {
      sections.add(MenuSection(name: '', items: loose));
    }

    return RestaurantMenu(sections: sections);
  }
}
