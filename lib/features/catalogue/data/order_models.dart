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

/// A point on the map, as the API gives it.
///
/// Plain doubles rather than a `LatLng`: the map package is a presentation
/// choice, and the decoding layer should not have to change if it does.
@immutable
class GeoPoint {
  const GeoPoint({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  /// Null unless **both** halves are present.
  ///
  /// The API returns null for either when a merchant has not set their
  /// location or an address predates the coordinate requirement, and half a
  /// coordinate is not a place — it is a pin in the Gulf of Guinea.
  static GeoPoint? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final Object? lat = json['latitude'];
    final Object? lng = json['longitude'];
    if (lat == null || lng == null) return null;

    final double latitude = asDouble(lat);
    final double longitude = asDouble(lng);
    // A string the parser could not read comes back as zero, which is a real
    // coordinate off the coast of Africa rather than a missing one.
    if (latitude == 0 && longitude == 0) return null;
    return GeoPoint(latitude: latitude, longitude: longitude);
  }

  @override
  bool operator ==(Object other) =>
      other is GeoPoint &&
      other.latitude == latitude &&
      other.longitude == longitude;

  @override
  int get hashCode => Object.hash(latitude, longitude);
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
    this.walletAmount = 0,
    this.codAmount,
    required this.items,
    required this.timeline,
    this.restaurantName,
    this.restaurantLocation,
    this.deliveryLocation,
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

  /// Where the food is coming from, and where it is going.
  ///
  /// Either can be null — a merchant who never set their location, an address
  /// saved before coordinates were required. The map draws what it has rather
  /// than waiting for both.
  final GeoPoint? restaurantLocation;
  final GeoPoint? deliveryLocation;

  final String? customerNote;

  final double itemsTotal;
  final double packagingFee;
  final double deliveryFee;
  final double discountTotal;
  final double taxTotal;
  final double grandTotal;

  /// What the wallet paid. Zero for an order paid entirely in cash.
  final double walletAmount;

  /// What the rider collects at the door. Null from a server that predates
  /// the wallet, where it is the whole [grandTotal].
  final double? codAmount;

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
      restaurantLocation: GeoPoint.fromJson(r),
      // Taken from the saved address rather than geocoded from its text: the
      // customer dropped that pin themselves, and reverse-geocoding a narrow
      // street puts it on the wrong side often enough to matter.
      deliveryLocation: GeoPoint.fromJson(
        json['delivery_address'] is Map<String, dynamic>
            ? json['delivery_address'] as Map<String, dynamic>
            : null,
      ),
      customerNote: json['customer_note'] as String?,
      itemsTotal: asDouble(json['items_total']),
      packagingFee: asDouble(json['packaging_fee']),
      deliveryFee: asDouble(json['delivery_fee']),
      discountTotal: asDouble(json['discount_total']),
      taxTotal: asDouble(json['tax_total']),
      grandTotal: asDouble(json['grand_total']),
      walletAmount: asDouble(json['wallet_amount']),
      codAmount: json['cod_amount'] == null
          ? null
          : asDouble(json['cod_amount']),
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
    this.riderVehicleNumber,
    this.riderLatitude,
    this.riderLongitude,
    this.riderHeading,
    this.riderUpdatedAt,
    this.route = const <GeoPoint>[],
    this.staleAfter = const Duration(seconds: 45),
    this.cancellationReason,
  });

  final OrderStatus status;
  final String statusLabel;
  final int? estimatedMinutes;
  final String? pickupCode;

  final String? riderName;
  final String? riderPhone;

  /// The plate, so the customer can pick the right bike out of a crowd.
  final String? riderVehicleNumber;

  /// Live position, present only while a rider is carrying the order.
  final double? riderLatitude;
  final double? riderLongitude;

  /// Direction of travel, 0-360 clockwise from north. Null while the rider is
  /// standing still or the server does not send it yet.
  final double? riderHeading;

  /// When the rider's phone took the fix, not when we polled for it.
  final DateTime? riderUpdatedAt;

  /// The road the rider is expected to take, rider first. Empty until the
  /// server computes one, in which case the map falls back to a dashed line
  /// of sight.
  final List<GeoPoint> route;

  /// How old a fix may get before the map says it is updating. Published by
  /// the server as `stale_after_seconds` so both ends use the same number.
  final Duration staleAfter;

  final String? cancellationReason;

  bool get hasRiderPosition =>
      riderLatitude != null && riderLongitude != null;

  /// True when the last fix is older than [staleAfter], which usually means a
  /// patch of no signal. The rider sends every 10 seconds and we poll every
  /// 8, so the default of 45 seconds is several misses.
  bool isStale(DateTime now) {
    final DateTime? at = riderUpdatedAt;
    return at != null && now.difference(at) > staleAfter;
  }

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
      riderVehicleNumber: r['vehicle_number'] as String?,
      riderLatitude:
          p['latitude'] == null ? null : asDouble(p['latitude']),
      riderLongitude:
          p['longitude'] == null ? null : asDouble(p['longitude']),
      riderHeading: p['heading'] == null ? null : asDouble(p['heading']),
      riderUpdatedAt: DateTime.tryParse(
        (p['updated_at'] ?? r['updated_at'] ?? '').toString(),
      ),
      route: json['route'] is String
          ? decodePolyline(json['route'] as String)
          : const <GeoPoint>[],
      staleAfter: json['stale_after_seconds'] == null
          ? const Duration(seconds: 45)
          : Duration(seconds: asInt(json['stale_after_seconds'], 45)),
      cancellationReason: json['cancellation_reason'] as String?,
    );
  }
}

/// Decodes a Google encoded polyline, the format the Directions API returns
/// its route in.
///
/// A malformed string decodes to as many points as it got through rather than
/// throwing: half a route line is still better than no tracking screen.
List<GeoPoint> decodePolyline(String encoded) {
  final List<GeoPoint> points = <GeoPoint>[];
  int index = 0;
  int lat = 0;
  int lng = 0;

  int? next() {
    int result = 0;
    int shift = 0;
    int byte;
    do {
      if (index >= encoded.length) return null;
      byte = encoded.codeUnitAt(index++) - 63;
      result |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20);
    return (result & 1) != 0 ? ~(result >> 1) : result >> 1;
  }

  while (index < encoded.length) {
    final int? dLat = next();
    final int? dLng = next();
    if (dLat == null || dLng == null) break;
    lat += dLat;
    lng += dLng;
    points.add(GeoPoint(latitude: lat / 1e5, longitude: lng / 1e5));
  }
  return points;
}
