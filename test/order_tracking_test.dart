import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:nexmile/core/network/api_client.dart';
import 'package:nexmile/features/catalogue/data/order_models.dart';
import 'package:nexmile/features/catalogue/state/orders_controller.dart';

void main() {
  test('reads dispatch status and its translated label', () {
    final Order order = Order.fromJson(<String, dynamic>{
      'id': 9,
      'order_number': 'NX9',
      'status': 'preparing',
      'status_label': 'Preparing',
      'fulfilment_type': 'delivery',
      'grand_total': 100,
      'items': <Object>[],
      'timeline': <Object>[],
      'dispatch_status': 'searching',
      'dispatch_status_label': 'டெலிவரி பார்ட்னரைத் தேடுகிறோம்',
    });

    expect(order.dispatchStatus, DispatchStatus.searching);
    expect(order.dispatchStatus.isNews, isTrue);
    expect(order.dispatchLabel, 'டெலிவரி பார்ட்னரைத் தேடுகிறோம்');
    expect(DispatchStatus.fromWire('no_rider_found'),
        DispatchStatus.noRiderFound);
    expect(DispatchStatus.assigned.isNews, isFalse);
  });

  test('every request carries the chosen language', () async {
    late http.Request sent;
    final ApiClient client = ApiClient(
      baseUrl: 'https://api.test/api',
      httpClient: MockClient((http.Request request) async {
        sent = request;
        return http.Response(jsonEncode(<String, dynamic>{'data': null}), 200,
            headers: <String, String>{'content-type': 'application/json'});
      }),
    )..languageProvider = () => 'ta';

    await client.get('/v1/orders', authenticated: false);
    expect(sent.headers['Accept-Language'], 'ta');
  });

  test('the newest order is listed first', () {
    Order order(int id, String? placedAt) => Order.fromJson(<String, dynamic>{
          'id': id,
          'order_number': 'NX$id',
          'status': 'delivered',
          'status_label': 'Delivered',
          'fulfilment_type': 'delivery',
          'grand_total': 100,
          'items': <Object>[],
          'timeline': <Object>[],
          if (placedAt != null) 'placed_at': placedAt,
        });

    // As the server sends them: oldest first, one with no time at all.
    final List<int> ids = newestFirst(<Order>[
      order(1, '2026-11-10T09:00:00Z'),
      order(2, '2026-11-12T19:30:00Z'),
      order(3, '2026-11-14T13:05:00Z'),
      order(4, null),
    ]).map((Order o) => o.id).toList();

    expect(ids.indexOf(3), lessThan(ids.indexOf(2)));
    expect(ids.indexOf(2), lessThan(ids.indexOf(1)));
  });

  group('route polyline', () {
    test('decodes the reference polyline from Google\'s documentation', () {
      final List<GeoPoint> points =
          decodePolyline(r'_p~iF~ps|U_ulLnnqC_mqNvxq`@');

      expect(points, hasLength(3));
      expect(points[0].latitude, closeTo(38.5, 1e-5));
      expect(points[0].longitude, closeTo(-120.2, 1e-5));
      expect(points[1].latitude, closeTo(40.7, 1e-5));
      expect(points[1].longitude, closeTo(-120.95, 1e-5));
      expect(points[2].latitude, closeTo(43.252, 1e-5));
      expect(points[2].longitude, closeTo(-126.453, 1e-5));
    });

    test('a truncated string keeps the points it got through', () {
      // Cut partway into the third point.
      final List<GeoPoint> points = decodePolyline(r'_p~iF~ps|U_ulLnnqC_mqN');

      expect(points, hasLength(2));
    });
  });

  test('a rider at the door keeps the order active', () {
    // An unknown status reads as finished, which would stop tracking at the
    // doorstep. Both "reached" statuses must decode and stay active.
    expect(orderStatusFrom('reached_restaurant'), OrderStatus.reachedRestaurant);
    expect(orderStatusFrom('reached_customer'), OrderStatus.reachedCustomer);
    expect(OrderStatus.reachedRestaurant.isActive, isTrue);
    expect(OrderStatus.reachedCustomer.isActive, isTrue);
  });

  group('tracking', () {
    Map<String, dynamic> trackJson({Object? route, String? updatedAt}) =>
        <String, dynamic>{
          'status': 'picked_up',
          'status_label': 'On the way',
          'estimated_minutes': 8,
          'rider': <String, dynamic>{
            'name': 'Ravi',
            'latitude': 9.92,
            'longitude': 78.12,
            'heading': 135,
            'vehicle_number': 'TN 37 AB 1234',
            'vehicle_type': 'scooter',
            if (updatedAt != null) 'updated_at': updatedAt,
          },
          if (route != null) 'route': route,
        };

    test('reads heading, fix time and route', () {
      final OrderTracking tracking = OrderTracking.fromJson(
        trackJson(
          route: r'_p~iF~ps|U_ulLnnqC_mqNvxq`@',
          updatedAt: '2026-11-09T10:15:30Z',
        ),
      );

      expect(tracking.riderHeading, 135);
      expect(tracking.riderUpdatedAt, DateTime.utc(2026, 11, 9, 10, 15, 30));
      expect(tracking.route, hasLength(3));
      expect(tracking.riderVehicleNumber, 'TN 37 AB 1234');
      expect(tracking.riderVehicleType, 'scooter');
    });

    test('uses the server\'s stale window when it sends one', () {
      final OrderTracking tracking = OrderTracking.fromJson(
        <String, dynamic>{
          ...trackJson(updatedAt: '2026-11-09T10:15:00Z'),
          'stale_after_seconds': 20,
        },
      );

      expect(tracking.isStale(DateTime.utc(2026, 11, 9, 10, 15, 25)), isTrue);
    });

    test('a null route and a null rider are both normal', () {
      final OrderTracking tracking = OrderTracking.fromJson(<String, dynamic>{
        'status': 'confirmed',
        'status_label': 'Preparing',
        'rider': null,
        'route': null,
      });

      expect(tracking.hasRiderPosition, isFalse);
      expect(tracking.route, isEmpty);
    });

    test('a server that sends none of it still tracks', () {
      final OrderTracking tracking = OrderTracking.fromJson(trackJson());

      expect(tracking.hasRiderPosition, isTrue);
      expect(tracking.route, isEmpty);
      expect(tracking.riderUpdatedAt, isNull);
      // No fix time means nothing to call stale.
      expect(tracking.isStale(DateTime.now()), isFalse);
    });

    test('goes stale after 45 seconds without a fix', () {
      final OrderTracking tracking = OrderTracking.fromJson(
        trackJson(updatedAt: '2026-11-09T10:15:00Z'),
      );

      expect(tracking.isStale(DateTime.utc(2026, 11, 9, 10, 15, 40)), isFalse);
      expect(tracking.isStale(DateTime.utc(2026, 11, 9, 10, 15, 50)), isTrue);
    });
  });
}
