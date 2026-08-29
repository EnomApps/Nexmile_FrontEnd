import 'package:flutter/foundation.dart';

import '../router/app_router.dart';

/// Where a notification tap should land.
///
/// Pure, so the routing rule is provable without a device or a push at all —
/// which matters, because the only other way to test it is to have the server
/// send a real notification to a real phone.
@immutable
class PushDestination {
  const PushDestination({required this.routeName, this.arguments});

  final String routeName;
  final Object? arguments;

  /// Reads the `data` payload the server sends alongside the notification.
  ///
  /// Returns null for anything this build cannot place. Landing nowhere is the
  /// right answer for an unrecognised push: opening the wrong screen is worse
  /// than opening none, and new notification types will ship server-side long
  /// before the app that understands them.
  static PushDestination? fromData(Map<String, Object?> data) {
    final int? orderId = _asInt(data['order_id']);

    // Every notification about an order carries its id, whatever the `type`
    // says, so the id is what the route is built from. The type is read only
    // to bow out of a push that is explicitly about something else.
    final String type = '${data['type'] ?? ''}'.trim().toLowerCase();
    const Set<String> notAboutAnOrder = <String>{'promo', 'promotion', 'news'};
    if (notAboutAnOrder.contains(type)) return null;

    if (orderId != null) {
      return PushDestination(
        routeName: AppRoutes.orderStatus,
        arguments: OrderArgs(orderId: orderId),
      );
    }
    return null;
  }

  /// FCM flattens every data value to a string, so `order_id` arrives as
  /// `"42"` on Android and can arrive as a number in a local test payload.
  static int? _asInt(Object? raw) => switch (raw) {
        final int value => value,
        final String value => int.tryParse(value.trim()),
        final num value => value.toInt(),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      other is PushDestination &&
      other.routeName == routeName &&
      other.arguments.toString() == arguments.toString();

  @override
  int get hashCode => Object.hash(routeName, arguments.toString());
}
