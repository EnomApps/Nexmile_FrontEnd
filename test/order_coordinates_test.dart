import 'package:flutter_test/flutter_test.dart';
import 'package:nexmile/features/catalogue/data/order_models.dart';

/// The shape `GET /v1/orders/{id}` returns, trimmed to what the map reads.
Map<String, dynamic> orderJson({
  Map<String, dynamic>? address,
  Map<String, dynamic>? restaurant,
}) =>
    <String, dynamic>{
      'id': 8,
      'order_number': 'NX260923JQQC',
      'status': 'picked_up',
      'status_label': 'On the way',
      'fulfilment_type': 'delivery',
      'items_total': 180,
      'packaging_fee': 0,
      'delivery_fee': 25,
      'discount_total': 0,
      'tax_total': 13.5,
      'grand_total': 218.5,
      'items': <Object>[],
      'timeline': <Object>[],
      if (address != null) 'delivery_address': address,
      if (restaurant != null) 'restaurant': restaurant,
    };

void main() {
  group('order coordinates', () {
    test('both ends of the journey decode', () {
      final Order order = Order.fromJson(
        orderJson(
          address: <String, dynamic>{
            'line1': 'New povai audio visual',
            'city': 'Chennai',
            'pincode': '600122',
            'latitude': 9.9201,
            'longitude': 78.1196,
          },
          restaurant: <String, dynamic>{
            'id': 3,
            'name': 'Ponnusamy Hotel',
            'latitude': 9.9195,
            'longitude': 78.1193,
          },
        ),
      );

      expect(
        order.deliveryLocation,
        const GeoPoint(latitude: 9.9201, longitude: 78.1196),
      );
      expect(
        order.restaurantLocation,
        const GeoPoint(latitude: 9.9195, longitude: 78.1193),
      );
    });

    test('a merchant who never set a location leaves the pin off the map', () {
      // Documented as possible by the API: draw what you have.
      final Order order = Order.fromJson(
        orderJson(
          restaurant: <String, dynamic>{'id': 3, 'name': 'Ponnusamy Hotel'},
        ),
      );

      expect(order.restaurantLocation, isNull);
      expect(order.deliveryLocation, isNull);
    });

    test('half a coordinate is not a place', () {
      final Order order = Order.fromJson(
        orderJson(
          address: <String, dynamic>{'latitude': 9.9201, 'longitude': null},
        ),
      );

      // Latitude alone would put the pin on the prime meridian, in the sea.
      expect(order.deliveryLocation, isNull);
    });

    test('a coordinate that arrives as a string still decodes', () {
      // The rider handoff notes warned that numbers arrive as JSON strings in
      // places, so the decoder coerces rather than trusting the type.
      final Order order = Order.fromJson(
        orderJson(
          address: <String, dynamic>{
            'latitude': '9.9201',
            'longitude': '78.1196',
          },
        ),
      );

      expect(order.deliveryLocation?.latitude, 9.9201);
      expect(order.deliveryLocation?.longitude, 78.1196);
    });

    test('an unparseable pair is dropped rather than pinned at zero', () {
      final Order order = Order.fromJson(
        orderJson(
          address: <String, dynamic>{'latitude': 'null', 'longitude': 'null'},
        ),
      );

      expect(order.deliveryLocation, isNull);
    });
  });
}
