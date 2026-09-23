import 'package:flutter_test/flutter_test.dart';
import 'package:nexmile/core/push/push_destination.dart';
import 'package:nexmile/core/router/app_router.dart';

/// Every `type` the server sends. Kept as a literal list rather than read from
/// the app, so that a type going missing from the routing rule fails here
/// instead of passing quietly.
const List<String> kServerTypes = <String>[
  'order.placed',
  'order.accepted',
  'order.rejected',
  'order.ready',
  'order.offer',
  'order.rider_assigned',
  'order.picked_up',
  'order.delivered',
  'order.cancelled',
];

void main() {
  group('PushDestination.fromData', () {
    test('every order type opens the order screen', () {
      for (final String type in kServerTypes) {
        final PushDestination? destination = PushDestination.fromData(
          <String, Object?>{'type': type, 'order_id': '123'},
        );

        expect(destination, isNotNull, reason: '$type routed nowhere');
        expect(destination!.routeName, AppRoutes.orderStatus);
        expect(
          destination.arguments,
          isA<OrderArgs>().having((OrderArgs a) => a.orderId, 'orderId', 123),
        );
      }
    });

    test('order_id is read as a string, which is all FCM ever sends', () {
      // Android flattens every data value; a local test harness may not.
      expect(
        PushDestination.fromData(<String, Object?>{'order_id': '42'}),
        PushDestination.fromData(<String, Object?>{'order_id': 42}),
      );
    });

    test('a push with no order lands nowhere rather than somewhere wrong', () {
      expect(PushDestination.fromData(const <String, Object?>{}), isNull);
      expect(
        PushDestination.fromData(<String, Object?>{'type': 'order.placed'}),
        isNull,
      );
      expect(
        PushDestination.fromData(<String, Object?>{'order_id': 'not-a-number'}),
        isNull,
      );
    });

    test('a promotion is not an order', () {
      for (final String type in <String>['promo', 'promotion', 'news']) {
        expect(
          PushDestination.fromData(
            <String, Object?>{'type': type, 'order_id': '7'},
          ),
          isNull,
          reason: '$type opened an order screen',
        );
      }
    });
  });
}
