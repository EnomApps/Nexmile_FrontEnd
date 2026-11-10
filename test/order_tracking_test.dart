import 'package:flutter_test/flutter_test.dart';
import 'package:nexmile/features/catalogue/data/order_models.dart';

void main() {
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
