import 'package:flutter/foundation.dart';

/// Prototype domain model for the storefront.
///
/// These shapes are deliberately close to what a delivery API usually returns,
/// so swapping [SampleCatalogue] for an HTTP repository later is a data-source
/// change rather than a UI rewrite. Nothing here is localised: names,
/// descriptions and cuisines stand in for backend content.

@immutable
class FoodCategory {
  const FoodCategory({
    required this.id,
    required this.name,
    required this.emoji,
  });

  final String id;
  final String name;
  final String emoji;
}

@immutable
class Offer {
  const Offer({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.code,
  });

  final String id;
  final String title;
  final String subtitle;
  final String code;
}

@immutable
class Dish {
  const Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isVeg,
    required this.emoji,
    this.isBestseller = false,
    this.rating,
  });

  final String id;
  final String name;
  final String description;

  /// Whole rupees. Prototype prices are round numbers on purpose.
  final int price;

  /// Drives the green/red square that Indian menus are required to carry.
  final bool isVeg;
  final String emoji;
  final bool isBestseller;
  final double? rating;
}

@immutable
class MenuSection {
  const MenuSection({required this.title, required this.dishes});

  final String title;
  final List<Dish> dishes;
}

@immutable
class Restaurant {
  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisines,
    required this.rating,
    required this.ratingsCount,
    required this.deliveryMinutes,
    required this.priceForTwo,
    required this.distanceKm,
    required this.emoji,
    required this.menu,
    this.offerPercent,
    this.isPureVeg = false,
    this.freeDelivery = false,
  });

  final String id;
  final String name;
  final List<String> cuisines;
  final double rating;
  final int ratingsCount;
  final int deliveryMinutes;
  final int priceForTwo;
  final double distanceKm;

  /// Stands in for a hero image. The prototype ships no photography, so each
  /// restaurant gets a dish emoji on a brand gradient — which also keeps the
  /// build free of network image loads.
  final String emoji;

  final List<MenuSection> menu;
  final int? offerPercent;
  final bool isPureVeg;
  final bool freeDelivery;

  List<Dish> get allDishes =>
      menu.expand((MenuSection section) => section.dishes).toList();

  bool get hasVegOptions => allDishes.any((Dish d) => d.isVeg);
}

/// A line in the cart. Quantity is mutable state, so this is not immutable.
class CartLine {
  CartLine({required this.dish, this.quantity = 1});

  final Dish dish;
  int quantity;

  int get lineTotal => dish.price * quantity;
}

enum OrderStatus { placed, preparing, onTheWay, delivered }

@immutable
class PlacedOrder {
  const PlacedOrder({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.total,
    required this.status,
    required this.placedAtLabel,
  });

  final String id;
  final Restaurant restaurant;

  /// Flattened at checkout so a later cart change cannot mutate history.
  final List<({String name, int quantity, int price})> items;

  final int total;
  final OrderStatus status;

  /// Pre-formatted because the prototype has no real clock behind it.
  final String placedAtLabel;

  int get itemCount =>
      items.fold(0, (int sum, ({String name, int quantity, int price}) i) =>
          sum + i.quantity);

  PlacedOrder copyWith({OrderStatus? status}) => PlacedOrder(
        id: id,
        restaurant: restaurant,
        items: items,
        total: total,
        status: status ?? this.status,
        placedAtLabel: placedAtLabel,
      );
}

/// Bill breakdown. Kept as a value type so the cart screen and the order
/// summary cannot disagree about the arithmetic.
@immutable
class BillSummary {
  const BillSummary({
    required this.itemTotal,
    required this.deliveryFee,
    required this.taxes,
  });

  final int itemTotal;
  final int deliveryFee;
  final int taxes;

  int get toPay => itemTotal + deliveryFee + taxes;

  /// Free delivery over this cart value — the usual Indian threshold.
  static const int freeDeliveryOver = 299;
  static const int baseDeliveryFee = 29;

  /// 5% GST, rounded to whole rupees.
  static const double taxRate = 0.05;

  factory BillSummary.forItems(int itemTotal, {bool restaurantFreeDelivery = false}) {
    final int delivery = (itemTotal == 0 ||
            restaurantFreeDelivery ||
            itemTotal >= freeDeliveryOver)
        ? 0
        : baseDeliveryFee;
    return BillSummary(
      itemTotal: itemTotal,
      deliveryFee: delivery,
      taxes: (itemTotal * taxRate).round(),
    );
  }
}
