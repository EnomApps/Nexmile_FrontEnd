import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'cart_models.dart';
import 'home_models.dart';
import 'restaurant_filters.dart';
import 'order_models.dart';
import 'review_models.dart';
import 'storefront_models.dart';

/// The customer storefront: what is nearby, what is on the menu, what is in the
/// basket, and what happened to the order.
///
/// One interface over three tag groups in the API (Restaurant, Cart, Order)
/// because the screens treat them as one surface — you cannot look at a menu
/// without a restaurant, or a cart without both.
abstract class StorefrontRepository {
  /// `GET /v1/home` — the whole home screen as ordered sections.
  ///
  /// Sections the app does not recognise are dropped rather than rendered, and
  /// an empty section is omitted by the server entirely, so the list is never
  /// indexed by position.
  Future<HomeScreen> home({
    int? addressId,
    double? latitude,
    double? longitude,
  });

  /// `GET /v1/favourites`
  Future<List<Restaurant>> favourites();

  /// `POST` / `DELETE /v1/restaurants/{id}/favourite`. Idempotent server-side.
  Future<void> setFavourite(String restaurantId, {required bool value});

  /// `GET /v1/restaurants` — nearby, by saved address or raw coordinates.
  Future<RestaurantPage> nearby({
    int? addressId,
    double? latitude,
    double? longitude,
    String? search,
    String? serviceCategory,
    RestaurantFilters filters,
  });

  /// `GET /v1/restaurants/deals` — Food Rescue, soonest to expire first.
  Future<List<RescueDeal>> deals({int? addressId});

  /// `GET /v1/restaurants/{id}`
  Future<Restaurant> restaurant(String id);

  /// `GET /v1/restaurants/{id}/menu`
  Future<RestaurantMenu> menu(String restaurantId);

  /// `GET /v1/restaurants/{id}/reviews` — newest first, paginated.
  ///
  /// Never cached: moderation can take a review down between two reads, so a
  /// page is a snapshot of now and the screen always starts again at page 1.
  Future<ReviewPage> reviews(
    String restaurantId, {
    int page,
    bool withCommentOnly,
  });

  /// `POST /v1/orders/{id}/review`
  ///
  /// [dishes] maps a menu item id to its rating. Anything not actually on the
  /// order is dropped server-side, so a stale menu cannot poison the request.
  Future<void> reviewOrder(
    int orderId, {
    required int rating,
    String? comment,
    Map<int, int> dishes,
  });

  /// `GET /v1/restaurants/{id}/cart`
  Future<Cart> cart(String restaurantId, {FulfilmentType? fulfilmentType});

  /// `POST /v1/restaurants/{id}/cart/items`
  ///
  /// Required option groups are enforced here, not at checkout: a 422 on
  /// `option_ids` means the customisation sheet has to be opened.
  Future<Cart> addItem(
    String restaurantId, {
    required int menuItemId,
    int quantity = 1,
    List<int> optionIds = const <int>[],
    String? notes,
  });

  /// `PATCH /v1/restaurants/{id}/cart/items/{item}`
  ///
  /// Quantity 0 removes the line, so the minus button needs no special case.
  Future<Cart> setQuantity(
    String restaurantId, {
    required int cartItemId,
    required int quantity,
  });

  /// `DELETE /v1/restaurants/{id}/cart/items/{item}`
  Future<Cart> removeItem(String restaurantId, int cartItemId);

  /// `DELETE /v1/restaurants/{id}/cart`
  Future<void> emptyCart(String restaurantId);

  /// `GET /v1/carts` — every restaurant with an unfinished basket.
  Future<List<OpenCart>> openCarts();

  /// `POST /v1/restaurants/{id}/cart/checkout`
  Future<Order> checkout(
    String restaurantId, {
    required FulfilmentType fulfilmentType,
    required String paymentMethod,
    int? addressId,
    String? note,
  });

  /// `GET /v1/orders`
  Future<List<Order>> orders({bool activeOnly = false});

  /// `GET /v1/orders/{id}`
  Future<Order> order(int id);

  /// `GET /v1/orders/{id}/track`
  Future<OrderTracking> track(int orderId);

  /// `POST /v1/orders/{id}/cancel`
  Future<Order> cancel(int orderId, {required String reason});

  /// The tax invoice is a printable HTML page rather than JSON, so it is opened
  /// in a browser or webview rather than parsed.
  Uri invoiceUrl(int orderId);
}

class ApiStorefrontRepository implements StorefrontRepository {
  const ApiStorefrontRepository(this._client);

  final ApiClient _client;

  @override
  Future<HomeScreen> home({
    int? addressId,
    double? latitude,
    double? longitude,
  }) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/home',
      query: <String, dynamic>{
        if (addressId != null) 'address_id': '$addressId',
        if (addressId == null && latitude != null) 'latitude': '$latitude',
        if (addressId == null && longitude != null) 'longitude': '$longitude',
      },
    );
    return HomeScreen.fromJson(_data(response), _meta(response));
  }

  @override
  Future<List<Restaurant>> favourites() async {
    final Map<String, dynamic> response = await _client.get('/v1/favourites');
    return _list(response).map(Restaurant.fromJson).toList(growable: false);
  }

  @override
  Future<void> setFavourite(String restaurantId, {required bool value}) {
    final String path = '/v1/restaurants/$restaurantId/favourite';
    return value ? _client.post(path) : _client.delete(path);
  }

  @override
  Future<RestaurantPage> nearby({
    int? addressId,
    double? latitude,
    double? longitude,
    String? search,
    String? serviceCategory,
    RestaurantFilters filters = RestaurantFilters.none,
  }) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/restaurants',
      query: <String, dynamic>{
        if (addressId != null) 'address_id': '$addressId',
        if (latitude != null) 'latitude': '$latitude',
        if (longitude != null) 'longitude': '$longitude',
        if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
        if (serviceCategory != null && serviceCategory.isNotEmpty)
          'service_category': serviceCategory,
        // Adds nothing while no filter is set, so the request is byte-for-byte
        // what it is today until the customer touches the sheet.
        ...filters.toQuery(),
      },
    );

    final Map<String, dynamic> meta = _meta(response);
    return RestaurantPage(
      items: _list(response).map(Restaurant.fromJson).toList(growable: false),
      total: meta['total'] == null ? null : asInt(meta['total']),
      radiusMetres:
          meta['radius_metres'] == null ? null : asInt(meta['radius_metres']),
    );
  }

  @override
  Future<List<RescueDeal>> deals({int? addressId}) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/restaurants/deals',
      query: <String, String>{
        if (addressId != null) 'address_id': '$addressId',
      },
    );
    return _list(response).map(RescueDeal.fromJson).toList(growable: false);
  }

  @override
  Future<Restaurant> restaurant(String id) async {
    final Map<String, dynamic> response =
        await _client.get('/v1/restaurants/$id');
    return Restaurant.fromJson(_data(response));
  }

  @override
  Future<RestaurantMenu> menu(String restaurantId) async {
    final Map<String, dynamic> response =
        await _client.get('/v1/restaurants/$restaurantId/menu');
    final Map<String, dynamic> data = _data(response);

    // The two halves of a menu are not at the same level: the live API nests
    // `menu` inside `data` (alongside the restaurant) but puts
    // `uncategorised` beside it at the top level. Reading only `data` loses
    // every dish a shop never filed under a category — which, for a shop that
    // made no categories, is the entire menu.
    return RestaurantMenu.fromJson(<String, dynamic>{
      'menu': data['menu'] ?? response['menu'],
      'uncategorised': data['uncategorised'] ?? response['uncategorised'],
    });
  }

  @override
  Future<ReviewPage> reviews(
    String restaurantId, {
    int page = 1,
    bool withCommentOnly = false,
  }) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/restaurants/$restaurantId/reviews',
      query: <String, String>{
        if (page > 1) 'page': '$page',
        if (withCommentOnly) 'with_comment': '1',
      },
    );
    return ReviewPage.fromJson(_list(response), _meta(response));
  }

  @override
  Future<void> reviewOrder(
    int orderId, {
    required int rating,
    String? comment,
    Map<int, int> dishes = const <int, int>{},
  }) {
    return _client.post(
      '/v1/orders/$orderId/review',
      body: <String, dynamic>{
        'rating': rating,
        if (comment != null && comment.trim().isNotEmpty)
          'comment': comment.trim(),
        // Keyed by id as a string, which is what a JSON object gives Laravel
        // either way. Omitted entirely when nothing was rated, rather than
        // sent as an empty object.
        if (dishes.isNotEmpty)
          'dishes': <String, int>{
            for (final MapEntry<int, int> e in dishes.entries) '${e.key}': e.value,
          },
      },
    );
  }

  @override
  Future<Cart> cart(String restaurantId, {FulfilmentType? fulfilmentType}) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/restaurants/$restaurantId/cart',
      query: <String, String>{
        if (fulfilmentType != null) 'fulfilment_type': fulfilmentType.name,
      },
    );
    return Cart.fromJson(_data(response));
  }

  @override
  Future<Cart> addItem(
    String restaurantId, {
    required int menuItemId,
    int quantity = 1,
    List<int> optionIds = const <int>[],
    String? notes,
  }) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/restaurants/$restaurantId/cart/items',
      body: <String, dynamic>{
        'menu_item_id': menuItemId,
        'quantity': quantity,
        'option_ids': optionIds,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      },
    );
    return Cart.fromJson(_data(response));
  }

  @override
  Future<Cart> setQuantity(
    String restaurantId, {
    required int cartItemId,
    required int quantity,
  }) async {
    final Map<String, dynamic> response = await _client.patch(
      '/v1/restaurants/$restaurantId/cart/items/$cartItemId',
      body: <String, dynamic>{'quantity': quantity},
    );
    return Cart.fromJson(_data(response));
  }

  @override
  Future<Cart> removeItem(String restaurantId, int cartItemId) async {
    final Map<String, dynamic> response = await _client
        .delete('/v1/restaurants/$restaurantId/cart/items/$cartItemId');
    return Cart.fromJson(_data(response));
  }

  @override
  Future<void> emptyCart(String restaurantId) =>
      _client.delete('/v1/restaurants/$restaurantId/cart');

  @override
  Future<List<OpenCart>> openCarts() async {
    final Map<String, dynamic> response = await _client.get('/v1/carts');
    return _list(response).map(OpenCart.fromJson).toList(growable: false);
  }

  @override
  Future<Order> checkout(
    String restaurantId, {
    required FulfilmentType fulfilmentType,
    required String paymentMethod,
    int? addressId,
    String? note,
  }) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/restaurants/$restaurantId/cart/checkout',
      body: <String, dynamic>{
        'fulfilment_type': fulfilmentType.name,
        'payment_method': paymentMethod,
        // Pickup carries no address and no delivery fee.
        if (fulfilmentType == FulfilmentType.delivery && addressId != null)
          'address_id': addressId,
        if (note != null && note.trim().isNotEmpty) 'note': note.trim(),
      },
    );
    return Order.fromJson(_data(response));
  }

  @override
  Future<List<Order>> orders({bool activeOnly = false}) async {
    final Map<String, dynamic> response = await _client.get(
      '/v1/orders',
      query: <String, String>{if (activeOnly) 'active': '1'},
    );
    return _list(response).map(Order.fromJson).toList(growable: false);
  }

  @override
  Future<Order> order(int id) async {
    final Map<String, dynamic> response = await _client.get('/v1/orders/$id');
    return Order.fromJson(_data(response));
  }

  @override
  Future<OrderTracking> track(int orderId) async {
    final Map<String, dynamic> response =
        await _client.get('/v1/orders/$orderId/track');
    return OrderTracking.fromJson(_data(response));
  }

  @override
  Future<Order> cancel(int orderId, {required String reason}) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/orders/$orderId/cancel',
      body: <String, dynamic>{'reason': reason},
    );
    return Order.fromJson(_data(response));
  }

  @override
  Uri invoiceUrl(int orderId) =>
      Uri.parse('${_client.baseUrl}/v1/orders/$orderId/invoice');

  static Map<String, dynamic> _data(Map<String, dynamic> response) {
    final Object? data = response['data'];
    if (data is Map<String, dynamic>) return data;
    throw const ApiException(
      kind: ApiErrorKind.server,
      message: 'Response did not contain a data object',
    );
  }

  /// The `meta` block, or empty when there is none. Carries `total` for the
  /// filter sheet's result count and `radius_metres` for how far the server
  /// looked.
  static Map<String, dynamic> _meta(Map<String, dynamic> response) {
    final Object? meta = response['meta'];
    if (meta is Map<String, dynamic>) return meta;
    // A paginated collection nests its own meta one level deeper.
    final Object? data = response['data'];
    if (data is Map<String, dynamic> && data['meta'] is Map<String, dynamic>) {
      return data['meta'] as Map<String, dynamic>;
    }
    return const <String, dynamic>{};
  }

  static List<Map<String, dynamic>> _list(Map<String, dynamic> response) {
    final Object? data = response['data'];
    if (data is List) return asMapList(data);
    // Paginated collections nest the rows one level deeper.
    if (data is Map<String, dynamic>) return asMapList(data['data']);
    throw const ApiException(
      kind: ApiErrorKind.server,
      message: 'Response did not contain a data array',
    );
  }
}
