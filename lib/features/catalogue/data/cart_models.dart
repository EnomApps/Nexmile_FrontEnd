import 'package:flutter/foundation.dart';

import 'storefront_models.dart';

enum FulfilmentType { delivery, pickup }

FulfilmentType fulfilmentFrom(Object? raw) =>
    asString(raw) == 'pickup' ? FulfilmentType.pickup : FulfilmentType.delivery;

@immutable
class CartTotals {
  const CartTotals({
    required this.itemsTotal,
    required this.packagingFee,
    required this.deliveryFee,
    required this.discountTotal,
    required this.taxTotal,
    required this.grandTotal,
  });

  final double itemsTotal;
  final double packagingFee;
  final double deliveryFee;
  final double discountTotal;
  final double taxTotal;
  final double grandTotal;

  static CartTotals fromJson(Map<String, dynamic> json) => CartTotals(
        itemsTotal: asDouble(json['items_total']),
        packagingFee: asDouble(json['packaging_fee']),
        deliveryFee: asDouble(json['delivery_fee']),
        discountTotal: asDouble(json['discount_total']),
        taxTotal: asDouble(json['tax_total']),
        grandTotal: asDouble(json['grand_total']),
      );

  static const CartTotals empty = CartTotals(
    itemsTotal: 0,
    packagingFee: 0,
    deliveryFee: 0,
    discountTotal: 0,
    taxTotal: 0,
    grandTotal: 0,
  );
}

/// A chosen option on a cart line, as the server echoes it back.
@immutable
class CartLineOption {
  const CartLineOption({
    required this.name,
    required this.priceDelta,
    this.groupName,
  });

  final String? groupName;
  final String name;
  final double priceDelta;

  static CartLineOption fromJson(Map<String, dynamic> json) => CartLineOption(
        groupName: json['group_name'] as String?,
        name: asString(json['name']),
        priceDelta: asDouble(json['price_delta']),
      );
}

@immutable
class CartLine {
  const CartLine({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
    required this.isVeg,
    required this.isAvailable,
    required this.options,
    this.notes,
  });

  /// The cart-item id — what PATCH and DELETE address, not the menu item id.
  final int id;
  final int menuItemId;
  final String name;
  final int quantity;
  final double unitPrice;
  final double lineTotal;
  final bool isVeg;

  /// False once the kitchen marks the dish sold out. The line stays in the
  /// cart, struck through, rather than vanishing.
  final bool isAvailable;

  final List<CartLineOption> options;
  final String? notes;

  String get optionsLabel =>
      options.map((CartLineOption o) => o.name).join(', ');

  static CartLine fromJson(Map<String, dynamic> json) => CartLine(
        id: asInt(json['id']),
        menuItemId: asInt(json['menu_item_id']),
        name: asString(json['name']),
        quantity: asInt(json['quantity'], 1),
        unitPrice: asDouble(json['unit_price']),
        lineTotal: asDouble(json['line_total']),
        isVeg: asBool(json['is_veg']),
        isAvailable: asBool(json['is_available'], true),
        notes: json['notes'] as String?,
        options: asMapList(json['options'])
            .map(CartLineOption.fromJson)
            .toList(growable: false),
      );
}

/// The restaurant stub embedded in a cart.
@immutable
class CartRestaurant {
  const CartRestaurant({
    required this.id,
    required this.name,
    required this.isOpen,
    required this.avgPrepTimeMinutes,
    required this.supportsPickup,
  });

  final String id;
  final String name;
  final bool isOpen;
  final int avgPrepTimeMinutes;
  final bool supportsPickup;

  static CartRestaurant fromJson(Map<String, dynamic> json) => CartRestaurant(
        id: asString(json['id']),
        name: asString(json['name']),
        isOpen: asBool(json['is_open'], true),
        avgPrepTimeMinutes: asInt(json['avg_prep_time_minutes']),
        supportsPickup: asBool(json['supports_pickup']),
      );
}

/// A server-side basket. There is one per restaurant, so the app never has to
/// enforce a single-restaurant rule itself.
@immutable
class Cart {
  const Cart({
    required this.id,
    required this.fulfilmentType,
    required this.restaurant,
    required this.lines,
    required this.totals,
    required this.minimumOrderValue,
    required this.meetsMinimum,
    required this.freeDeliveryApplied,
    required this.canCheckout,
    required this.unavailableItems,
  });

  final int id;
  final FulfilmentType fulfilmentType;
  final CartRestaurant restaurant;
  final List<CartLine> lines;
  final CartTotals totals;
  final double minimumOrderValue;
  final bool meetsMinimum;
  final bool freeDeliveryApplied;

  /// The one flag the checkout button is gated on. It already accounts for the
  /// minimum, sold-out lines, an empty cart and the restaurant being closed —
  /// re-deriving any of that on the client would only drift.
  final bool canCheckout;

  /// Dishes that sold out while the cart sat there, named rather than counted.
  final List<String> unavailableItems;

  bool get isEmpty => lines.isEmpty;

  int get itemCount =>
      lines.fold(0, (int sum, CartLine l) => sum + l.quantity);

  static Cart fromJson(Map<String, dynamic> json) {
    final Object? restaurant = json['restaurant'];
    final Object? totals = json['totals'];
    return Cart(
      id: asInt(json['id']),
      fulfilmentType: fulfilmentFrom(json['fulfilment_type']),
      restaurant: CartRestaurant.fromJson(
        restaurant is Map<String, dynamic> ? restaurant : const <String, dynamic>{},
      ),
      lines: asMapList(json['items'])
          .map(CartLine.fromJson)
          .toList(growable: false),
      totals: totals is Map<String, dynamic>
          ? CartTotals.fromJson(totals)
          : CartTotals.empty,
      minimumOrderValue: asDouble(json['minimum_order_value']),
      meetsMinimum: asBool(json['meets_minimum'], true),
      freeDeliveryApplied: asBool(json['free_delivery_applied']),
      canCheckout: asBool(json['can_checkout']),
      unavailableItems: _names(json['unavailable_items']),
    );
  }

  /// The field is documented as names, but tolerate a list of objects too.
  static List<String> _names(Object? raw) {
    if (raw is! List) return const <String>[];
    return raw
        .map((Object? e) {
          if (e is String) return e;
          if (e is Map<String, dynamic>) return asString(e['name']);
          return '';
        })
        .where((String s) => s.isNotEmpty)
        .toList(growable: false);
  }
}

/// One line of `GET /v1/carts` — an unfinished basket at some restaurant.
@immutable
class OpenCart {
  const OpenCart({
    required this.restaurantId,
    required this.restaurantName,
    required this.itemCount,
    required this.grandTotal,
  });

  final String restaurantId;
  final String restaurantName;
  final int itemCount;
  final double grandTotal;

  static OpenCart fromJson(Map<String, dynamic> json) {
    final Object? restaurant = json['restaurant'];
    final Map<String, dynamic> r =
        restaurant is Map<String, dynamic> ? restaurant : const <String, dynamic>{};
    final Object? totals = json['totals'];
    final Map<String, dynamic> t =
        totals is Map<String, dynamic> ? totals : const <String, dynamic>{};

    return OpenCart(
      restaurantId: asString(r['id'] ?? json['restaurant_id']),
      restaurantName: asString(r['name'] ?? json['restaurant_name']),
      itemCount: asInt(json['item_count'] ?? json['items_count']),
      grandTotal: asDouble(t['grand_total'] ?? json['grand_total']),
    );
  }
}
