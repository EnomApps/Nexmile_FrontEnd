import 'package:flutter/foundation.dart';

import '../../../core/network/api_exception.dart';
import '../../auth/data/auth_failure.dart';
import '../data/storefront_models.dart';
import '../data/storefront_repository.dart';

/// What is nearby: the restaurant list, the Food Rescue deals, and one
/// restaurant's menu once opened.
///
/// Nearby is resolved from the customer's default address when there is one,
/// which is what the API prefers — it knows the saved pin better than a fresh
/// GPS read, and it is what checkout will validate the 1 km radius against.
class StorefrontController extends ChangeNotifier {
  StorefrontController({required StorefrontRepository repository})
      : _repository = repository;

  final StorefrontRepository _repository;

  List<Restaurant> _restaurants = <Restaurant>[];
  List<RescueDeal> _deals = <RescueDeal>[];
  bool _isLoading = false;
  bool _hasLoaded = false;
  AuthFailure? _failure;

  String? _serviceCategory;

  // Where "nearby" is anchored, remembered so search and category changes can
  // re-query against the same origin without the caller passing it again.
  int? _addressId;
  double? _latitude;
  double? _longitude;

  List<Restaurant> get restaurants => List<Restaurant>.unmodifiable(_restaurants);

  List<RescueDeal> get deals => List<RescueDeal>.unmodifiable(_deals);

  bool get isLoading => _isLoading;

  bool get hasLoaded => _hasLoaded;

  AuthFailure? get failure => _failure;

  String? get serviceCategory => _serviceCategory;

  /// Reloads the list. [addressId] comes from the customer's default address;
  /// coordinates are the fallback when nothing is saved yet.
  Future<void> load({
    int? addressId,
    double? latitude,
    double? longitude,
  }) async {
    _addressId = addressId;
    _latitude = latitude;
    _longitude = longitude;

    _isLoading = true;
    _failure = null;
    notifyListeners();

    try {
      _restaurants = await _repository.nearby(
        addressId: addressId,
        latitude: addressId == null ? latitude : null,
        longitude: addressId == null ? longitude : null,
        serviceCategory: _serviceCategory,
      );
      _hasLoaded = true;

      // Deals are a separate call and a nice-to-have: a failure there must not
      // take the restaurant list down with it.
      try {
        _deals = await _repository.deals(addressId: addressId);
      } on ApiException {
        _deals = <RescueDeal>[];
      }
    } on ApiException catch (error) {
      _failure = authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } catch (_) {
      _failure = AuthFailure.unknown;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Categories run server-side, so this re-queries rather than filtering the
  /// page already on screen.
  Future<void> setServiceCategory(String? value) async {
    if (_serviceCategory == value) return;
    _serviceCategory = value;
    await load(
      addressId: _addressId,
      latitude: _latitude,
      longitude: _longitude,
    );
  }

  // --- Search --------------------------------------------------------------
  //
  // Kept apart from the nearby list: searching must not replace what the home
  // tab is showing, and coming back from search should not need a reload.

  String _query = '';
  List<Restaurant> _results = <Restaurant>[];
  bool _isSearching = false;
  bool _hasSearched = false;

  String get query => _query;

  List<Restaurant> get results => List<Restaurant>.unmodifiable(_results);

  bool get isSearching => _isSearching;

  bool get hasSearched => _hasSearched;

  /// The search runs on the server against the same origin as the nearby list,
  /// so results are still inside the delivery radius.
  Future<void> runSearch(String value) async {
    _query = value;
    if (value.trim().isEmpty) {
      _results = <Restaurant>[];
      _hasSearched = false;
      _isSearching = false;
      notifyListeners();
      return;
    }

    _isSearching = true;
    notifyListeners();
    try {
      _results = await _repository.nearby(
        addressId: _addressId,
        latitude: _addressId == null ? _latitude : null,
        longitude: _addressId == null ? _longitude : null,
        search: value.trim(),
      );
      _hasSearched = true;
    } on ApiException {
      _results = <Restaurant>[];
      _hasSearched = true;
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }

  // --- One restaurant ------------------------------------------------------

  Restaurant? _current;
  RestaurantMenu? _menu;
  bool _isMenuLoading = false;
  AuthFailure? _menuFailure;

  Restaurant? get current => _current;

  RestaurantMenu? get menu => _menu;

  bool get isMenuLoading => _isMenuLoading;

  AuthFailure? get menuFailure => _menuFailure;

  Future<void> openRestaurant(String id) async {
    _isMenuLoading = true;
    _menuFailure = null;
    // Clear rather than keep the previous shop's menu on screen while loading.
    _current = null;
    _menu = null;
    notifyListeners();

    try {
      final Restaurant restaurant = await _repository.restaurant(id);
      final RestaurantMenu menu = await _repository.menu(id);
      _current = restaurant;
      _menu = menu;
    } on ApiException catch (error) {
      _menuFailure =
          authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } catch (_) {
      _menuFailure = AuthFailure.unknown;
    } finally {
      _isMenuLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _restaurants = <Restaurant>[];
    _deals = <RescueDeal>[];
    _current = null;
    _menu = null;
    _hasLoaded = false;
    _serviceCategory = null;
    _query = '';
    _results = <Restaurant>[];
    _hasSearched = false;
    notifyListeners();
  }
}
