import 'package:flutter/foundation.dart';

import '../data/catalogue_models.dart';

/// Cart and order history for the prototype.
///
/// Two rules, both matching how Indian delivery apps actually behave:
///
/// * **One restaurant at a time.** Adding a dish from a different kitchen asks
///   the customer to clear the cart first — orders cannot be split across
///   restaurants, so silently mixing them would only fail at checkout.
/// * **Removing the last unit drops the line**, so an item never lingers at
///   quantity zero.
///
/// State is in memory only: restarting the app empties the cart. Persistence
/// belongs with the real API, which will own the cart server-side.
class CartController extends ChangeNotifier {
  final List<CartLine> _lines = <CartLine>[];
  final List<PlacedOrder> _orders = <PlacedOrder>[];

  Restaurant? _restaurant;
  int _orderCounter = 0;

  List<CartLine> get lines => List<CartLine>.unmodifiable(_lines);

  /// The kitchen the current cart belongs to, or null when empty.
  Restaurant? get restaurant => _restaurant;

  bool get isEmpty => _lines.isEmpty;

  List<PlacedOrder> get orders => List<PlacedOrder>.unmodifiable(_orders);

  int get itemCount =>
      _lines.fold(0, (int sum, CartLine line) => sum + line.quantity);

  int get itemTotal =>
      _lines.fold(0, (int sum, CartLine line) => sum + line.lineTotal);

  BillSummary get bill => BillSummary.forItems(
        itemTotal,
        restaurantFreeDelivery: _restaurant?.freeDelivery ?? false,
      );

  int quantityOf(Dish dish) {
    for (final CartLine line in _lines) {
      if (line.dish.id == dish.id) return line.quantity;
    }
    return 0;
  }

  /// True when [restaurant] is not the one the cart already holds, so the UI
  /// can ask before discarding.
  bool wouldReplaceCart(Restaurant restaurant) =>
      _lines.isNotEmpty && _restaurant != null && _restaurant!.id != restaurant.id;

  /// Adds one unit. Caller must have resolved [wouldReplaceCart] first;
  /// passing [replace] clears the previous kitchen's cart.
  void add(Dish dish, Restaurant restaurant, {bool replace = false}) {
    if (wouldReplaceCart(restaurant)) {
      if (!replace) return;
      _lines.clear();
    }
    _restaurant = restaurant;

    for (final CartLine line in _lines) {
      if (line.dish.id == dish.id) {
        line.quantity++;
        notifyListeners();
        return;
      }
    }
    _lines.add(CartLine(dish: dish));
    notifyListeners();
  }

  void remove(Dish dish) {
    for (int i = 0; i < _lines.length; i++) {
      if (_lines[i].dish.id != dish.id) continue;
      if (_lines[i].quantity > 1) {
        _lines[i].quantity--;
      } else {
        _lines.removeAt(i);
      }
      break;
    }
    if (_lines.isEmpty) _restaurant = null;
    notifyListeners();
  }

  void clear() {
    _lines.clear();
    _restaurant = null;
    notifyListeners();
  }

  /// Freezes the cart into an order and empties it.
  ///
  /// Returns null when there is nothing to place — the UI disables checkout in
  /// that state, so this is belt-and-braces.
  PlacedOrder? placeOrder() {
    final Restaurant? restaurant = _restaurant;
    if (restaurant == null || _lines.isEmpty) return null;

    final PlacedOrder order = PlacedOrder(
      id: 'NX${(1000 + (++_orderCounter)).toString()}',
      restaurant: restaurant,
      // Copied out of the cart so later edits cannot rewrite history.
      items: _lines
          .map((CartLine l) => (
                name: l.dish.name,
                quantity: l.quantity,
                price: l.dish.price,
              ))
          .toList(),
      total: bill.toPay,
      status: OrderStatus.placed,
      placedAtLabel: 'Just now',
    );

    _orders.insert(0, order);
    _lines.clear();
    _restaurant = null;
    notifyListeners();
    return order;
  }

  /// Advances an order through the tracking stages. The prototype drives this
  /// from a timer on the tracking screen; the real app will take it from the
  /// order API or a socket.
  void advance(String orderId) {
    final int index = _orders.indexWhere((PlacedOrder o) => o.id == orderId);
    if (index == -1) return;

    final PlacedOrder order = _orders[index];
    final int next = order.status.index + 1;
    if (next >= OrderStatus.values.length) return;

    _orders[index] = order.copyWith(status: OrderStatus.values[next]);
    notifyListeners();
  }

  PlacedOrder? orderById(String id) {
    for (final PlacedOrder order in _orders) {
      if (order.id == id) return order;
    }
    return null;
  }

  /// Refills the cart from a past order, replacing whatever is there.
  void reorder(PlacedOrder order) {
    _lines.clear();
    _restaurant = order.restaurant;
    for (final ({String name, int quantity, int price}) item in order.items) {
      Dish? dish;
      for (final Dish d in order.restaurant.allDishes) {
        if (d.name == item.name) {
          dish = d;
          break;
        }
      }
      // A dish pulled from the menu since the order was placed is skipped
      // rather than resurrected from the order snapshot.
      if (dish == null) continue;
      _lines.add(CartLine(dish: dish, quantity: item.quantity));
    }
    if (_lines.isEmpty) _restaurant = null;
    notifyListeners();
  }
}
