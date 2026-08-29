import 'package:flutter/foundation.dart';

import 'cart_models.dart';
import 'storefront_models.dart';

/// Order lifecycle. Delivery and pickup share states up to [readyForPickup],
/// then branch.
enum OrderStatus {
  pendingPayment,
  placed,
  accepted,
  rejected,
  preparing,
  readyForPickup,
  riderAssigned,
  pickedUp,
  delivered,
  cancelled,
  unknown,
}

OrderStatus orderStatusFrom(Object? raw) {
  switch (asString(raw)) {
    case 'pending_payment':
      return OrderStatus.pendingPayment;
    case 'placed':
      return OrderStatus.placed;
    case 'accepted':
      return OrderStatus.accepted;
    case 'rejected':
      return OrderStatus.rejected;
    case 'preparing':
      return OrderStatus.preparing;
    case 'ready_for_pickup':
      return OrderStatus.readyForPickup;
    case 'rider_assigned':
      return OrderStatus.riderAssigned;
    case 'picked_up':
      return OrderStatus.pickedUp;
    case 'delivered':
      return OrderStatus.delivered;
    case 'cancelled':
      return OrderStatus.cancelled;
    default:
      // A status this build predates should degrade, not crash. The server
      // also sends `status_label`, which is what the UI actually renders.
      return OrderStatus.unknown;
  }
}

extension OrderStatusX on OrderStatus {
  /// Still in flight — worth polling and worth showing a tracker for.
  bool get isActive => switch (this) {
        OrderStatus.placed ||
        OrderStatus.accepted ||
        OrderStatus.preparing ||
        OrderStatus.readyForPickup ||
        OrderStatus.riderAssigned ||
        OrderStatus.pickedUp =>
          true,
        _ => false,
      };

  bool get isFinished => switch (this) {
        OrderStatus.delivered ||
        OrderStatus.cancelled ||
        OrderStatus.rejected =>
          true,
        _ => false,
      };

  /// Cancelling is only allowed before the restaurant accepts; afterwards the
  /// API returns 422, so the button is hidden rather than left to fail.
  bool get isCancellable => this == OrderStatus.placed;
}

@immutable
class OrderItemOption {
  const OrderItemOption({
    required this.groupName,
    required this.name,
    required this.priceDelta,
  });

  final String groupName;
  final String name;
  final double priceDelta;

  static OrderItemOption fromJson(Map<String, dynamic> json) => OrderItemOption(
        groupName: asString(json['group_name']),
        name: asString(json['name']),
        priceDelta: asDouble(json['price_delta']),
      );
}

@immutable
class OrderItem {
  const OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.optionsTotal,
    required this.lineTotal,
    required this.isVeg,
    required this.options,
    this.notes,
    this.menuItemId,
  });

  final int id;

  /// The dish this line was ordered from, which is what a rating is keyed by.
  ///
  /// Null when the API omits it — `GET /v1/orders` sends only the line id
  /// today, where the cart sends both. A line without one simply cannot be
  /// rated, rather than being rated against the wrong dish.
  final int? menuItemId;

  /// The snapshot, not the live menu item — a renamed dish must not change
  /// what the kitchen reads off an existing ticket.
  final String name;

  final int quantity;
  final double unitPrice;
  final double optionsTotal;
  final double lineTotal;
  final bool isVeg;
  final String? notes;
  final List<OrderItemOption> options;

  static OrderItem fromJson(Map<String, dynamic> json) => OrderItem(
        id: asInt(json['id']),
        menuItemId:
            json['menu_item_id'] == null ? null : asInt(json['menu_item_id']),
        name: asString(json['name']),
        quantity: asInt(json['quantity'], 1),
        unitPrice: asDouble(json['unit_price']),
        optionsTotal: asDouble(json['options_total']),
        lineTotal: asDouble(json['line_total']),
        isVeg: asBool(json['is_veg']),
        notes: json['notes'] as String?,
        options: asMapList(json['options'])
            .map(OrderItemOption.fromJson)
            .toList(growable: false),
      );
}

@immutable
class OrderTimelineEntry {
  const OrderTimelineEntry({
    required this.status,
    required this.label,
    this.note,
    this.at,
  });

  final OrderStatus status;

  /// Server-authored and already localised for the customer; rendered verbatim.
  final String label;
  final String? note;
  final DateTime? at;

  static OrderTimelineEntry fromJson(Map<String, dynamic> json) =>
      OrderTimelineEntry(
        status: orderStatusFrom(json['to_status']),
        label: asString(json['label']),
        note: json['note'] as String?,
        at: asDate(json['at']),
      );
}

@immutable
class Order {
  const Order({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.statusLabel,
    required this.fulfilmentType,
    required this.itemsTotal,
    required this.packagingFee,
    required this.deliveryFee,
    required this.discountTotal,
    required this.taxTotal,
    required this.grandTotal,
    required this.items,
    required this.timeline,
    this.restaurantName,
    this.customerNote,
    this.pickupCode,
    this.estimatedPrepMinutes,
    this.distanceMetres,
    this.placedAt,
    this.deliveredAt,
    this.cancelledAt,
    this.cancellationReason,
  });

  final int id;
  final String orderNumber;
  final OrderStatus status;

  /// Server-authored label. Preferred over any client mapping, because the
  /// server knows about statuses this build may not.
  final String statusLabel;

  final FulfilmentType fulfilmentType;
  final String? restaurantName;
  final String? customerNote;

  final double itemsTotal;
  final double packagingFee;
  final double deliveryFee;
  final double discountTotal;
  final double taxTotal;
  final double grandTotal;

  /// Shown to the customer at the counter on a self-pickup order.
  final String? pickupCode;
  final int? estimatedPrepMinutes;
  final int? distanceMetres;

  final DateTime? placedAt;
  final DateTime? deliveredAt;
  final DateTime? cancelledAt;

  /// Written by the merchant for the customer — shown verbatim.
  final String? cancellationReason;

  final List<OrderItem> items;
  final List<OrderTimelineEntry> timeline;

  int get itemCount => items.fold(0, (int s, OrderItem i) => s + i.quantity);

  static Order fromJson(Map<String, dynamic> json) {
    final Object? restaurant = json['restaurant'];
    final Map<String, dynamic> r =
        restaurant is Map<String, dynamic> ? restaurant : const <String, dynamic>{};

    return Order(
      id: asInt(json['id']),
      orderNumber: asString(json['order_number']),
      status: orderStatusFrom(json['status']),
      statusLabel: asString(json['status_label']),
      fulfilmentType: fulfilmentFrom(json['fulfilment_type']),
      restaurantName: (json['restaurant_name'] ?? r['name']) as String?,
      customerNote: json['customer_note'] as String?,
      itemsTotal: asDouble(json['items_total']),
      packagingFee: asDouble(json['packaging_fee']),
      deliveryFee: asDouble(json['delivery_fee']),
      discountTotal: asDouble(json['discount_total']),
      taxTotal: asDouble(json['tax_total']),
      grandTotal: asDouble(json['grand_total']),
      pickupCode: json['pickup_code'] as String?,
      estimatedPrepMinutes: json['estimated_prep_minutes'] == null
          ? null
          : asInt(json['estimated_prep_minutes']),
      distanceMetres: json['distance_metres'] == null
          ? null
          : asInt(json['distance_metres']),
      placedAt: asDate(json['placed_at']),
      deliveredAt: asDate(json['delivered_at']),
      cancelledAt: asDate(json['cancelled_at']),
      cancellationReason: json['cancellation_reason'] as String?,
      items: asMapList(json['items'])
          .map(OrderItem.fromJson)
          .toList(growable: false),
      timeline: asMapList(json['timeline'])
          .map(OrderTimelineEntry.fromJson)
          .toList(growable: false),
    );
  }
}

/// `GET /v1/orders/{id}/track` — small and cheap, polled while in flight.
@immutable
class OrderTracking {
  const OrderTracking({
    required this.status,
    required this.statusLabel,
    this.estimatedMinutes,
    this.pickupCode,
    this.riderName,
    this.riderPhone,
    this.riderLatitude,
    this.riderLongitude,
    this.cancellationReason,
  });

  final OrderStatus status;
  final String statusLabel;
  final int? estimatedMinutes;
  final String? pickupCode;

  final String? riderName;
  final String? riderPhone;

  /// Live position, present only while a rider is carrying the order.
  final double? riderLatitude;
  final double? riderLongitude;

  final String? cancellationReason;

  bool get hasRiderPosition =>
      riderLatitude != null && riderLongitude != null;

  static OrderTracking fromJson(Map<String, dynamic> json) {
    final Object? rider = json['rider'];
    final Map<String, dynamic> r =
        rider is Map<String, dynamic> ? rider : const <String, dynamic>{};
    final Object? position = r['location'] ?? r['position'];
    final Map<String, dynamic> p =
        position is Map<String, dynamic> ? position : r;

    return OrderTracking(
      status: orderStatusFrom(json['status']),
      statusLabel: asString(json['status_label']),
      estimatedMinutes: json['estimated_minutes'] == null
          ? (json['estimated_prep_minutes'] == null
              ? null
              : asInt(json['estimated_prep_minutes']))
          : asInt(json['estimated_minutes']),
      pickupCode: json['pickup_code'] as String?,
      riderName: r['name'] as String?,
      riderPhone: r['phone'] as String?,
      riderLatitude:
          p['latitude'] == null ? null : asDouble(p['latitude']),
      riderLongitude:
          p['longitude'] == null ? null : asDouble(p['longitude']),
      cancellationReason: json['cancellation_reason'] as String?,
    );
  }
}
