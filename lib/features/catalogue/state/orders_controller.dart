import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/network/api_exception.dart';
import '../../auth/data/auth_failure.dart';
import '../data/order_models.dart';
import '../data/storefront_repository.dart';

/// Order history, one order's detail, and live tracking.
///
/// Tracking polls `GET /v1/orders/{id}/track`, which the API documents as
/// small and cheap for exactly this. Polling stops the moment the order
/// finishes, so a delivered order does not keep a timer alive.
class OrdersController extends ChangeNotifier {
  OrdersController({required StorefrontRepository repository})
      : _repository = repository;

  static const Duration _pollInterval = Duration(seconds: 8);

  final StorefrontRepository _repository;

  List<Order> _orders = <Order>[];
  bool _isLoading = false;
  bool _hasLoaded = false;

  Order? _current;
  OrderTracking? _tracking;
  Timer? _poll;

  List<Order> get orders => List<Order>.unmodifiable(_orders);

  bool get isLoading => _isLoading;

  bool get hasLoaded => _hasLoaded;

  Order? get current => _current;

  OrderTracking? get tracking => _tracking;

  /// Orders still in flight, for the "track your order" banner.
  List<Order> get active =>
      _orders.where((Order o) => o.status.isActive).toList(growable: false);

  Future<AuthFailure?> load({bool activeOnly = false}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _orders = await _repository.orders(activeOnly: activeOnly);
      _hasLoaded = true;
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<AuthFailure?> open(int orderId) async {
    _isLoading = true;
    _current = null;
    _tracking = null;
    notifyListeners();
    try {
      _current = await _repository.order(orderId);
      // Seed the tracker immediately so the screen is not blank for a beat.
      await _refreshTracking(orderId);
      _startPolling(orderId);
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _startPolling(int orderId) {
    _poll?.cancel();
    if (!(_current?.status.isActive ?? false)) return;
    _poll = Timer.periodic(_pollInterval, (Timer timer) async {
      await _refreshTracking(orderId);
      if (_tracking?.status.isFinished ?? false) {
        timer.cancel();
        // Re-read the full order so the timeline and totals settle.
        try {
          _current = await _repository.order(orderId);
        } on ApiException {
          // Keep what is on screen.
        }
      }
      notifyListeners();
    });
  }

  Future<void> _refreshTracking(int orderId) async {
    try {
      _tracking = await _repository.track(orderId);
    } on ApiException {
      // A dropped poll is not worth a visible error; the next tick retries.
    }
  }

  /// Cancelling is only permitted while the order is `placed`; the button is
  /// hidden after that, so reaching a 422 here means the restaurant accepted
  /// in the gap between render and tap.
  Future<AuthFailure?> cancel(int orderId, {required String reason}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _current = await _repository.cancel(orderId, reason: reason);
      _poll?.cancel();
      await load();
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(
        error,
        validationFailure: AuthFailure.invalidIdentifier,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Uri invoiceUrl(int orderId) => _repository.invoiceUrl(orderId);

  /// Called when the tracking screen closes.
  void stopPolling() {
    _poll?.cancel();
    _poll = null;
  }

  void clear() {
    stopPolling();
    _orders = <Order>[];
    _current = null;
    _tracking = null;
    _hasLoaded = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }
}
