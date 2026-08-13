import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'address.dart';

/// The customer address book — all six `/v1/addresses` endpoints.
abstract class AddressRepository {
  /// `GET /v1/addresses`
  Future<List<Address>> list();

  /// `GET /v1/addresses/{id}`
  ///
  /// Re-read before editing: the list may be minutes old, and the customer
  /// could have changed this address on another device.
  Future<Address> show(int id);

  /// `POST /v1/addresses`
  Future<Address> create(AddressDraft draft);

  /// `PATCH /v1/addresses/{id}`
  Future<Address> update(int id, AddressDraft draft);

  /// `DELETE /v1/addresses/{id}`
  Future<void> delete(int id);

  /// `POST /v1/addresses/{id}/default`
  Future<Address> makeDefault(int id);
}

class ApiAddressRepository implements AddressRepository {
  const ApiAddressRepository(this._client);

  final ApiClient _client;

  @override
  Future<List<Address>> list() async {
    final Map<String, dynamic> response = await _client.get('/v1/addresses');
    final Object? data = response['data'];
    if (data is! List) {
      throw const ApiException(
        kind: ApiErrorKind.server,
        message: 'Address list did not contain a data array',
      );
    }
    return data
        .whereType<Map<String, dynamic>>()
        .map(Address.fromJson)
        .toList(growable: false);
  }

  @override
  Future<Address> show(int id) async {
    final Map<String, dynamic> response =
        await _client.get('/v1/addresses/$id');
    return Address.fromJson(_data(response));
  }

  @override
  Future<Address> create(AddressDraft draft) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/addresses',
      body: draft.toJson(),
    );
    return Address.fromJson(_data(response));
  }

  @override
  Future<Address> update(int id, AddressDraft draft) async {
    final Map<String, dynamic> response = await _client.patch(
      '/v1/addresses/$id',
      body: draft.toJson(),
    );
    return Address.fromJson(_data(response));
  }

  @override
  Future<void> delete(int id) => _client.delete('/v1/addresses/$id');

  @override
  Future<Address> makeDefault(int id) async {
    final Map<String, dynamic> response =
        await _client.post('/v1/addresses/$id/default');
    return Address.fromJson(_data(response));
  }

  static Map<String, dynamic> _data(Map<String, dynamic> response) {
    final Object? data = response['data'];
    if (data is Map<String, dynamic>) return data;
    throw const ApiException(
      kind: ApiErrorKind.server,
      message: 'Response did not contain a data object',
    );
  }
}
