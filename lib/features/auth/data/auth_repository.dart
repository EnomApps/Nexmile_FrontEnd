import '../../../core/config/app_config.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'auth_session.dart';
import 'device_session.dart';
import 'auth_user.dart';
import 'login_identifier.dart';

/// Customer authentication.
///
/// The API has no register, forgot-password or reset-password endpoints for
/// customers: an account is created on the first successful code verification,
/// and there are no passwords to reset. Sign-in is therefore exactly two calls.
///
/// Kept as an interface so tests can substitute a fake without a live backend.
abstract class AuthRepository {
  /// `POST /v1/auth/otp/request`
  Future<OtpChallenge> requestCode(LoginIdentifier identifier);

  /// `POST /v1/auth/otp/verify`
  Future<AuthSession> verifyCode({
    required LoginIdentifier identifier,
    required String code,
    String? deviceName,
  });

  /// `POST /v1/auth/refresh`
  Future<AuthSession> refresh(String refreshToken);

  /// `GET /v1/auth/me` — lightweight session check.
  Future<AuthUser> me();

  /// `GET /v1/profile` — the profile screen's source.
  ///
  /// For a customer this returns the same `UserResource` as [me]; the
  /// `merchant` block in the schema is only populated for merchant accounts,
  /// so there is nothing extra to decode here.
  Future<AuthUser> profile();

  /// `POST /v1/auth/logout` — revokes this device only.
  Future<void> signOut();

  /// `PATCH /v1/profile`
  ///
  /// Only the name, contact details and language. Role and account status are
  /// deliberately not editable — a customer must not be able to promote
  /// themselves or lift a suspension.
  Future<AuthUser> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? preferredLocale,
  });

  /// `DELETE /v1/profile`
  ///
  /// A soft delete server-side: past orders, invoices and settlement records
  /// stay intact for tax purposes. Every session is revoked.
  Future<void> deleteAccount();

  /// `GET /v1/auth/sessions` — every device holding a live refresh token.
  Future<List<DeviceSession>> sessions();

  /// `DELETE /v1/auth/sessions/{id}` — signs one other device out.
  Future<void> revokeSession(int id);

  /// `POST /v1/auth/logout-all` — ends every session, this one included.
  Future<void> signOutEverywhere();
}

class ApiAuthRepository implements AuthRepository {
  const ApiAuthRepository(this._client);

  final ApiClient _client;

  @override
  Future<OtpChallenge> requestCode(LoginIdentifier identifier) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/auth/otp/request',
      // Unauthenticated by design — this is how a session begins.
      authenticated: false,
      body: <String, dynamic>{
        ...identifier.toJson(),
        'intended_role': AppConfig.intendedRole,
      },
    );
    return OtpChallenge.fromJson(_data(response));
  }

  @override
  Future<AuthSession> verifyCode({
    required LoginIdentifier identifier,
    required String code,
    String? deviceName,
  }) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/auth/otp/verify',
      authenticated: false,
      body: <String, dynamic>{
        ...identifier.toJson(),
        'code': code,
        'device_name': deviceName ?? AppConfig.deviceNameFallback,
      },
    );
    return AuthSession.fromJson(_data(response));
  }

  @override
  Future<AuthSession> refresh(String refreshToken) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/auth/refresh',
      // Carries its own credential; sending a stale bearer would only invite a
      // 401 loop.
      authenticated: false,
      body: <String, dynamic>{'refresh_token': refreshToken},
    );
    return AuthSession.fromJson(_data(response));
  }

  @override
  Future<AuthUser> me() async {
    final Map<String, dynamic> response = await _client.get('/v1/auth/me');
    return AuthUser.fromJson(_data(response));
  }

  @override
  Future<AuthUser> profile() async {
    final Map<String, dynamic> response = await _client.get('/v1/profile');
    return AuthUser.fromJson(_data(response));
  }

  @override
  Future<AuthUser> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? preferredLocale,
  }) async {
    final Map<String, dynamic> response = await _client.patch(
      '/v1/profile',
      // Only send what is actually being changed. An explicit null clears the
      // field server-side, which is not what "left untouched" should mean.
      body: <String, dynamic>{
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (preferredLocale != null) 'preferred_locale': preferredLocale,
      },
    );
    return AuthUser.fromJson(_data(response));
  }

  @override
  Future<void> deleteAccount() => _client.delete('/v1/profile');

  @override
  Future<List<DeviceSession>> sessions() async {
    final Map<String, dynamic> response =
        await _client.get('/v1/auth/sessions');
    final Object? data = response['data'];
    if (data is! List) return const <DeviceSession>[];
    return data
        .whereType<Map<String, dynamic>>()
        .map(DeviceSession.fromJson)
        .toList(growable: false);
  }

  @override
  Future<void> revokeSession(int id) =>
      _client.delete('/v1/auth/sessions/$id');

  @override
  Future<void> signOutEverywhere() async {
    try {
      await _client.post('/v1/auth/logout-all');
    } on ApiException {
      // Same reasoning as signOut: the local session is cleared either way.
      // Leaving the customer signed in because the revoke call failed would be
      // the worse outcome of the two.
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _client.post('/v1/auth/logout');
    } on ApiException {
      // The local session is cleared regardless. A token that cannot be
      // revoked server-side (offline, already expired) must not trap the
      // customer in a signed-in state.
    }
  }

  /// Every success response wraps its payload in `data`.
  static Map<String, dynamic> _data(Map<String, dynamic> response) {
    final Object? data = response['data'];
    if (data is Map<String, dynamic>) return data;
    throw const ApiException(
      kind: ApiErrorKind.server,
      message: 'Response did not contain a data object',
    );
  }
}
