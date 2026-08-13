import 'package:flutter/foundation.dart';

import '../../../core/network/api_exception.dart';
import '../../auth/data/auth_failure.dart';
import '../data/address.dart';
import '../data/address_repository.dart';

/// Owns the customer's address book.
///
/// The post-login flow branches on [hasAddresses], so the list is loaded once
/// after sign-in and kept in memory; every mutation writes through to the API
/// and refreshes local state from the response rather than guessing.
class AddressController extends ChangeNotifier {
  AddressController({required AddressRepository repository})
      : _repository = repository;

  final AddressRepository _repository;

  List<Address> _addresses = <Address>[];
  bool _isLoading = false;
  bool _hasLoaded = false;

  List<Address> get addresses => List<Address>.unmodifiable(_addresses);

  bool get isLoading => _isLoading;

  /// False until [load] has completed once, so the router can tell "no
  /// addresses" apart from "not asked yet".
  bool get hasLoaded => _hasLoaded;

  bool get hasAddresses => _addresses.isNotEmpty;

  Address? get defaultAddress {
    for (final Address address in _addresses) {
      if (address.isDefault) return address;
    }
    return _addresses.isEmpty ? null : _addresses.first;
  }

  Future<AuthFailure?> load() async {
    _isLoading = true;
    notifyListeners();
    try {
      _addresses = await _repository.list();
      _hasLoaded = true;
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } catch (_) {
      return AuthFailure.unknown;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Field-level errors from the last 422, keyed by API field name, so the form
  /// can put "The pincode is invalid" under the pincode input rather than in a
  /// generic banner.
  Map<String, List<String>> _fieldErrors = const <String, List<String>>{};

  Map<String, List<String>> get fieldErrors => _fieldErrors;

  Future<AuthFailure?> save(AddressDraft draft, {int? id}) async {
    _isLoading = true;
    _fieldErrors = const <String, List<String>>{};
    notifyListeners();
    try {
      final Address saved = id == null
          ? await _repository.create(draft)
          : await _repository.update(id, draft);

      // The API owns default-flag bookkeeping: saving a new default clears the
      // old one server-side, so re-read rather than patching locally.
      if (saved.isDefault) {
        await _refreshQuietly();
      } else {
        _upsert(saved);
      }
      return null;
    } on ApiException catch (error) {
      _fieldErrors = error.errors;
      return authFailureFrom(
        error,
        validationFailure: AuthFailure.invalidIdentifier,
      );
    } catch (_) {
      return AuthFailure.unknown;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<AuthFailure?> makeDefault(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.makeDefault(id);
      await _refreshQuietly();
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetches one address fresh from the server, for the edit screen.
  Future<Address?> fetch(int id) async {
    try {
      return await _repository.show(id);
    } on ApiException {
      // Fall back to the cached copy rather than blocking the edit.
      for (final Address address in _addresses) {
        if (address.id == id) return address;
      }
      return null;
    }
  }

  Future<AuthFailure?> delete(int id) async {
    _isLoading = true;
    notifyListeners();

    // Deleting the default makes the server promote the next most recent
    // address, so dropping the row locally would leave the app showing a book
    // with no default at all. Re-read in that case.
    final bool wasDefault =
        _addresses.any((Address a) => a.id == id && a.isDefault);

    try {
      await _repository.delete(id);
      if (wasDefault) {
        await _refreshQuietly();
      } else {
        _addresses = _addresses.where((Address a) => a.id != id).toList();
      }
      return null;
    } on ApiException catch (error) {
      return authFailureFrom(error, validationFailure: AuthFailure.unknown);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Re-reads the list without touching the loading flag, for use inside an
  /// operation that is already showing a spinner.
  Future<void> _refreshQuietly() async {
    try {
      _addresses = await _repository.list();
      _hasLoaded = true;
    } on ApiException {
      // Keep whatever is on screen; the next explicit load will correct it.
    }
  }

  void _upsert(Address address) {
    final int index = _addresses.indexWhere((Address a) => a.id == address.id);
    if (index == -1) {
      _addresses = <Address>[..._addresses, address];
    } else {
      final List<Address> next = <Address>[..._addresses];
      next[index] = address;
      _addresses = next;
    }
  }

  /// Called on sign-out so the next customer does not inherit the list.
  void clear() {
    _addresses = <Address>[];
    _hasLoaded = false;
    _fieldErrors = const <String, List<String>>{};
    notifyListeners();
  }
}
