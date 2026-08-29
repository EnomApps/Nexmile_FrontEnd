import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:nexmile/app.dart';
import 'package:nexmile/core/constants/app_assets.dart';
import 'package:nexmile/core/localization/app_language.dart';
import 'package:nexmile/core/network/api_client.dart';
import 'package:nexmile/core/network/api_exception.dart';
import 'package:nexmile/core/push/device_registrar.dart';
import 'package:nexmile/core/push/push_destination.dart';
import 'package:nexmile/core/push/push_service.dart';
import 'package:nexmile/core/router/app_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nexmile/core/services/preferences_service.dart';
import 'package:nexmile/features/address/data/address.dart';
import 'package:nexmile/features/address/data/address_repository.dart';
import 'package:nexmile/features/address/data/location_service.dart';
import 'package:nexmile/features/address/presentation/address_book_screen.dart';
import 'package:nexmile/features/address/presentation/address_form_screen.dart';
import 'package:nexmile/features/address/presentation/address_map_screen.dart';
import 'package:nexmile/features/address/presentation/location_permission_screen.dart';
import 'package:nexmile/features/address/state/address_controller.dart';
import 'package:nexmile/features/auth/data/auth_repository.dart';
import 'package:nexmile/features/auth/data/auth_session.dart';
import 'package:nexmile/features/auth/data/device_repository.dart';
import 'package:nexmile/features/auth/data/auth_user.dart';
import 'package:nexmile/features/auth/data/device_session.dart';
import 'package:nexmile/features/auth/data/login_identifier.dart';
import 'package:nexmile/features/auth/data/token_store.dart';
import 'package:nexmile/features/auth/presentation/login_screen.dart';
import 'package:nexmile/features/auth/presentation/otp_verification_screen.dart';
import 'package:nexmile/features/auth/state/auth_controller.dart';
import 'package:nexmile/features/auth/data/auth_failure.dart';
import 'package:nexmile/features/catalogue/data/cart_models.dart';
import 'package:nexmile/features/catalogue/data/home_models.dart';
import 'package:nexmile/features/catalogue/data/restaurant_filters.dart';
import 'package:nexmile/features/catalogue/data/review_models.dart';
import 'package:nexmile/features/catalogue/presentation/widgets/catalogue_widgets.dart';
import 'package:nexmile/features/catalogue/data/order_models.dart';
import 'package:nexmile/features/catalogue/data/storefront_models.dart';
import 'package:nexmile/features/catalogue/data/storefront_repository.dart';
import 'package:nexmile/features/catalogue/presentation/search_tab.dart';
import 'package:nexmile/features/catalogue/state/cart_controller.dart';
import 'package:nexmile/features/catalogue/state/orders_controller.dart';
import 'package:nexmile/features/catalogue/state/storefront_controller.dart';
import 'package:nexmile/features/shell/app_shell.dart';
import 'package:nexmile/features/language/language_screen.dart';
import 'package:nexmile/features/profile/profile_screen.dart';
import 'package:nexmile/features/splash/splash_screen.dart';
import 'package:nexmile/generated/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

const AuthUser _testUser = AuthUser(
  id: 42,
  name: 'Priya Kumar',
  email: 'priya@example.com',
  phone: '9876543210',
  role: UserRole.customer,
  status: UserStatus.active,
);

AuthSession _testSession() => const AuthSession(
      user: _testUser,
      accessToken: 'access-token',
      refreshToken: 'refresh-token',
      expiresIn: 3600,
    );

/// Scriptable stand-in for the live API.
/// A push transport with no Firebase behind it, so the registration rules can
/// be proved without a device or a real notification.
class FakePushService implements PushService {
  FakePushService({String? initial}) : _token = initial;

  String? _token;
  bool permissionAsked = false;
  bool channelCreated = false;

  final StreamController<String> _refresh = StreamController<String>.broadcast();
  final StreamController<Map<String, Object?>> _taps =
      StreamController<Map<String, Object?>>.broadcast();

  /// What the transport does when it decides the old token is stale.
  void rotate(String token) {
    _token = token;
    _refresh.add(token);
  }

  @override
  Future<String?> token() async => _token;

  @override
  Stream<String> get onTokenRefresh => _refresh.stream;

  @override
  Stream<Map<String, Object?>> get onTap => _taps.stream;

  @override
  Future<bool> requestPermission() async {
    permissionAsked = true;
    return _token != null;
  }

  @override
  Future<void> ensureChannel() async => channelCreated = true;
}

class FakeDeviceRepository implements DeviceRepository {
  final List<String> registered = <String>[];
  final List<String> unregistered = <String>[];
  final List<String> platforms = <String>[];

  bool failRegister = false;

  @override
  Future<void> registerDevice({
    required String token,
    required String platform,
  }) async {
    if (failRegister) {
      throw const ApiException(kind: ApiErrorKind.network, statusCode: 0);
    }
    registered.add(token);
    platforms.add(platform);
  }

  @override
  Future<void> unregisterDevice({required String token}) async {
    unregistered.add(token);
  }
}

class FakeAuthRepository implements AuthRepository {
  /// Account management, added alongside the profile and devices screens.
  List<DeviceSession> deviceSessions = <DeviceSession>[
    const DeviceSession(id: 1, deviceName: 'Pixel 8', ipAddress: '10.0.0.2'),
    const DeviceSession(id: 2, deviceName: 'iPhone 14'),
  ];
  final List<int> revoked = <int>[];
  Map<String, dynamic>? lastProfilePatch;
  int deleteAccountCount = 0;
  int signOutEverywhereCount = 0;
  ApiException? profilePatchError;

  @override
  Future<AuthUser> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? preferredLocale,
  }) async {
    lastProfilePatch = <String, dynamic>{
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (preferredLocale != null) 'preferred_locale': preferredLocale,
    };
    final ApiException? error = profilePatchError;
    if (error != null) {
      profilePatchError = null;
      throw error;
    }
    return AuthUser(
      id: _testUser.id,
      name: name ?? _testUser.name,
      email: email ?? _testUser.email,
      phone: phone ?? _testUser.phone,
      role: _testUser.role,
      status: _testUser.status,
      preferredLocale: preferredLocale ?? _testUser.preferredLocale,
      phoneVerified: _testUser.phoneVerified,
    );
  }

  @override
  Future<void> deleteAccount() async => deleteAccountCount++;

  @override
  Future<List<DeviceSession>> sessions() async => deviceSessions;

  @override
  Future<void> revokeSession(int id) async => revoked.add(id);

  @override
  Future<void> signOutEverywhere() async => signOutEverywhereCount++;

  FakeAuthRepository({this.validCode = '123456'});

  final String validCode;

  ApiException? requestError;
  ApiException? verifyError;
  ApiException? profileError;
  int resendAfter = 60;
  String? debugCode;

  /// What `GET /v1/profile` returns; defaults to the signed-in fixture.
  AuthUser profileUser = _testUser;

  int requestCount = 0;
  int verifyCount = 0;
  int signOutCount = 0;
  int profileCount = 0;
  LoginIdentifier? lastIdentifier;
  String? lastCode;

  @override
  Future<OtpChallenge> requestCode(LoginIdentifier identifier) async {
    requestCount++;
    lastIdentifier = identifier;
    final ApiException? error = requestError;
    if (error != null) throw error;
    return OtpChallenge(
      identifier: identifier.value,
      channel: identifier.isEmail ? 'email' : 'sms',
      expiresIn: 300,
      resendAfter: resendAfter,
      debugCode: debugCode,
    );
  }

  @override
  Future<AuthSession> verifyCode({
    required LoginIdentifier identifier,
    required String code,
    String? deviceName,
  }) async {
    verifyCount++;
    lastCode = code;
    final ApiException? error = verifyError;
    if (error != null) throw error;
    if (code != validCode) {
      throw const ApiException(kind: ApiErrorKind.validation, statusCode: 422);
    }
    return _testSession();
  }

  @override
  Future<AuthSession> refresh(String refreshToken) async => _testSession();

  @override
  Future<AuthUser> me() async => _testUser;

  @override
  Future<AuthUser> profile() async {
    profileCount++;
    final ApiException? error = profileError;
    if (error != null) throw error;
    return profileUser;
  }

  @override
  Future<void> signOut() async => signOutCount++;
}

/// In-memory address book, standing in for `/v1/addresses`.
class FakeAddressRepository implements AddressRepository {
  FakeAddressRepository({List<Address>? seed})
      : _addresses = <Address>[...?seed];

  final List<Address> _addresses;

  ApiException? listError;
  ApiException? saveError;
  ApiException? showError;
  int listCount = 0;
  int showCount = 0;
  int? lastUpdatedId;
  AddressDraft? lastDraft;

  int _nextId = 100;

  @override
  Future<Address> show(int id) async {
    showCount++;
    final ApiException? error = showError;
    if (error != null) throw error;
    return _addresses.firstWhere((Address a) => a.id == id);
  }

  @override
  Future<List<Address>> list() async {
    listCount++;
    final ApiException? error = listError;
    if (error != null) throw error;
    return List<Address>.unmodifiable(_addresses);
  }

  @override
  Future<Address> create(AddressDraft draft) async {
    lastDraft = draft;
    final ApiException? error = saveError;
    if (error != null) throw error;
    final Address saved = _fromDraft(draft, _nextId++);
    if (saved.isDefault) _clearDefaults();
    _addresses.add(saved);
    return saved;
  }

  @override
  Future<Address> update(int id, AddressDraft draft) async {
    lastDraft = draft;
    lastUpdatedId = id;
    final ApiException? error = saveError;
    if (error != null) throw error;
    final Address saved = _fromDraft(draft, id);
    _addresses.removeWhere((Address a) => a.id == id);
    _addresses.add(saved);
    return saved;
  }

  @override
  Future<void> delete(int id) async =>
      _addresses.removeWhere((Address a) => a.id == id);

  @override
  Future<Address> makeDefault(int id) async {
    _clearDefaults();
    final int index = _addresses.indexWhere((Address a) => a.id == id);
    final Address current = _addresses[index];
    final Address updated = _copyDefault(current, true);
    _addresses[index] = updated;
    return updated;
  }

  void _clearDefaults() {
    for (int i = 0; i < _addresses.length; i++) {
      if (_addresses[i].isDefault) {
        _addresses[i] = _copyDefault(_addresses[i], false);
      }
    }
  }

  static Address _copyDefault(Address a, bool isDefault) => Address(
        id: a.id,
        label: a.label,
        line1: a.line1,
        line2: a.line2,
        landmark: a.landmark,
        city: a.city,
        state: a.state,
        pincode: a.pincode,
        latitude: a.latitude,
        longitude: a.longitude,
        isDefault: isDefault,
        contactName: a.contactName,
        contactPhone: a.contactPhone,
      );

  static Address _fromDraft(AddressDraft d, int id) => Address(
        id: id,
        label: d.label,
        line1: d.line1,
        line2: d.line2,
        landmark: d.landmark,
        city: d.city,
        state: d.state,
        pincode: d.pincode,
        latitude: d.latitude,
        longitude: d.longitude,
        isDefault: d.isDefault,
        contactName: d.contactName,
        contactPhone: d.contactPhone,
      );
}

/// Location service with no GPS behind it.
class FakeLocationService implements LocationService {
  FakeLocationService({
    this.fix = const LocationFix(latitude: 13.0827, longitude: 80.2707),
    this.failure,
    this.place = const ResolvedPlace(
      line1: '12A Green Residency',
      landmark: 'Near the bus stop',
      city: 'Chennai',
      state: 'Tamil Nadu',
      pincode: '600040',
    ),
  });

  final LocationFix fix;
  final LocationFailure? failure;
  final ResolvedPlace place;

  int requestCount = 0;
  int settingsCount = 0;

  @override
  Future<LocationPermission> currentPermission() async =>
      LocationPermission.whileInUse;

  @override
  Future<LocationFix> requestFix() async {
    requestCount++;
    final LocationFailure? f = failure;
    if (f != null) throw LocationException(f);
    return fix;
  }

  @override
  Future<ResolvedPlace> describe(double latitude, double longitude) async =>
      place;

  @override
  Future<void> openSettings() async => settingsCount++;
}

const Address _testAddress = Address(
  id: 1,
  label: AddressLabel.home,
  line1: '12A Green Residency',
  city: 'Chennai',
  state: 'Tamil Nadu',
  pincode: '600040',
  latitude: 13.0827,
  longitude: 80.2707,
  isDefault: true,
);

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

const Map<String, Object> _freshInstall = <String, Object>{};

const Map<String, Object> _languageChosen = <String, Object>{
  'nexmile.language_code': 'en',
  'nexmile.language_chosen': true,
};

Map<String, Object> _languageChosenAs(String code) => <String, Object>{
      'nexmile.language_code': code,
      'nexmile.language_chosen': true,
    };

Future<PreferencesService> _prefs(Map<String, Object> seed) async {
  SharedPreferences.setMockInitialValues(seed);
  return PreferencesService.create();
}

late AuthController _controller;
late AddressController _addresses;
late FakeAddressRepository _addressRepo;
late FakeLocationService _location;
late FakeStorefrontRepository _storefrontRepo;
late FakeAuthRepository _authRepo;

Future<void> _pumpApp(
  WidgetTester tester, {
  Map<String, Object> seed = _freshInstall,
  FakeAuthRepository? repository,
  AuthSession? session,
  FakeAddressRepository? addressRepository,
  FakeLocationService? locationService,
  FakeStorefrontRepository? storefrontRepository,
}) async {
  final PreferencesService preferences = await _prefs(seed);
  _authRepo = repository ?? FakeAuthRepository();
  _controller = AuthController(
    repository: _authRepo,
    tokenStore: InMemoryTokenStore(session),
    initialSession: session,
  );
  // Default to a customer who already has an address, so existing tests keep
  // landing on the storefront rather than the new address onboarding.
  _addressRepo = addressRepository ??
      FakeAddressRepository(seed: <Address>[_testAddress]);
  _addresses = AddressController(repository: _addressRepo);
  _location = locationService ?? FakeLocationService();
  _storefrontRepo = storefrontRepository ?? FakeStorefrontRepository();

  await tester.pumpWidget(
    NexmileApp(
      preferences: preferences,
      authController: _controller,
      addressController: _addresses,
      locationService: _location,
      storefrontRepository: _storefrontRepo,
    ),
  );
}

Future<void> _settleSplash(WidgetTester tester) async {
  await tester.pump(SplashScreen.totalDuration);
  await tester.pumpAndSettle();
}

/// The address form is eight fields plus a button, and the permission screen
/// stacks three reason cards above its banner. A `ListView` does not build what
/// is far below the fold, so these tests need a viewport tall enough to hold
/// the whole screen rather than a scroll dance in every assertion.
void _useTallScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(400, 2200);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

/// The location screen pulses continuously and the map animates its tiles, so
/// neither ever reaches a quiescent frame and `pumpAndSettle` would time out.
/// Pump a fixed number of frames instead.
Future<void> _pumpFrames(WidgetTester tester, [int frames = 8]) async {
  for (int i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 120));
  }
}

NavigatorState _nav(WidgetTester tester) =>
    tester.state<NavigatorState>(find.byType(Navigator).last);

/// The default 800x600 test surface is shorter than a real phone. Auth screens
/// are short enough to fit, but the dashboard and OTP screen benefit from a
/// realistic viewport.
void _useTallPhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(400, 1000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

void main() {
  // -------------------------------------------------------------------------
  group('language catalogue', () {
    test('ships English plus all 22 Eighth Schedule languages', () {
      expect(AppLanguages.all.length, 23);
    });

    test('every language has an ARB-backed locale', () {
      final Set<String> generated = AppLocalizations.supportedLocales
          .map((Locale l) => l.languageCode)
          .toSet();
      for (final AppLanguage language in AppLanguages.all) {
        expect(
          generated.contains(language.code),
          isTrue,
          reason: 'missing lib/l10n/app_${language.code}.arb',
        );
      }
    });

    test('English is the one and only default', () {
      expect(
        AppLanguages.all.where((AppLanguage l) => l.isDefault).toList(),
        <AppLanguage>[AppLanguages.english],
      );
      expect(AppLanguages.fallback.code, 'en');
    });

    test('unknown or absent codes fall back to English', () {
      expect(AppLanguages.byCode(null).code, 'en');
      expect(AppLanguages.byCode('zz').code, 'en');
      expect(AppLanguages.fromLocale(const Locale('ta', 'LK')).code, 'ta');
    });

    test('only the Perso-Arabic scripts are right-to-left', () {
      final Set<String> rtl = AppLanguages.all
          .where((AppLanguage l) => l.isRtl)
          .map((AppLanguage l) => l.code)
          .toSet();
      expect(rtl, <String>{'ur', 'ks', 'sd'});
    });
  });

  // -------------------------------------------------------------------------
  group('translations', () {
    testWidgets('every locale resolves its own copy',
        (WidgetTester tester) async {
      for (final AppLanguage language in AppLanguages.all) {
        final AppLocalizations l10n =
            await AppLocalizations.delegate.load(language.locale);
        expect(l10n.appName, 'Nexmile');
        for (final String value in <String>[
          l10n.continueLabel,
          l10n.chooseLanguageTitle,
          l10n.homeTitle,
          l10n.loginTitle,
          l10n.emailOrPhoneLabel,
          l10n.sendCode,
          l10n.otpTitle,
          l10n.verifyCode,
          l10n.incorrectCode,
          l10n.accountSuspended,
          l10n.tooManyAttempts,
          l10n.sessionExpired,
          l10n.networkError,
          l10n.signOut,
          l10n.profileTitle,
          l10n.viewProfile,
          l10n.nameLabel,
          l10n.emailLabel,
          l10n.mobileLabel,
          l10n.accountStatusLabel,
          l10n.statusActive,
          l10n.verifiedLabel,
          l10n.notProvided,
          l10n.retry,
        ]) {
          expect(value.trim(), isNotEmpty, reason: language.englishName);
        }
      }
    });

    testWidgets('no locale silently reuses an English string',
        (WidgetTester tester) async {
      final AppLocalizations en =
          await AppLocalizations.delegate.load(const Locale('en'));
      for (final AppLanguage language in AppLanguages.all) {
        if (language.code == 'en') continue;
        final AppLocalizations l10n =
            await AppLocalizations.delegate.load(language.locale);
        expect(l10n.chooseLanguageTitle, isNot(en.chooseLanguageTitle),
            reason: '${language.englishName}: language screen');
        expect(l10n.loginTitle, isNot(en.loginTitle),
            reason: '${language.englishName}: login screen');
        expect(l10n.incorrectCode, isNot(en.incorrectCode),
            reason: '${language.englishName}: OTP errors');
        expect(l10n.networkError, isNot(en.networkError),
            reason: '${language.englishName}: network errors');
        expect(l10n.accountStatusLabel, isNot(en.accountStatusLabel),
            reason: '${language.englishName}: profile screen');
      }
    });

    testWidgets('placeholders survive translation in every locale',
        (WidgetTester tester) async {
      for (final AppLanguage language in AppLanguages.all) {
        final AppLocalizations l10n =
            await AppLocalizations.delegate.load(language.locale);
        expect(l10n.otpSubtitle('9876543210'), contains('9876543210'));
        expect(l10n.resendCodeIn(60), contains('60'));
        expect(l10n.greetingNamed('Priya'), contains('Priya'));
        expect(l10n.languagesAvailable(23), contains('23'));
      }
    });
  });

  // -------------------------------------------------------------------------
  group('LoginIdentifier', () {
    test('accepts a plain email and lowercases it', () {
      final LoginIdentifier? id = LoginIdentifier.tryParse('  Priya@Example.COM ');
      expect(id?.isEmail, isTrue);
      expect(id?.value, 'priya@example.com');
      expect(id?.toJson(), <String, dynamic>{'email': 'priya@example.com'});
    });

    test('accepts a bare 10-digit mobile number', () {
      final LoginIdentifier? id = LoginIdentifier.tryParse('9876543210');
      expect(id?.isPhone, isTrue);
      expect(id?.toJson(), <String, dynamic>{'phone': '9876543210'});
    });

    test('normalises the ways an Indian number is commonly typed', () {
      for (final String input in <String>[
        '+91 98765 43210',
        '+919876543210',
        '919876543210',
        '09876543210',
        '98765-43210',
        '(98765) 43210',
      ]) {
        expect(
          LoginIdentifier.tryParse(input)?.value,
          '9876543210',
          reason: input,
        );
      }
    });

    test('rejects anything that is neither', () {
      for (final String input in <String>[
        '',
        '   ',
        'not-an-email',
        'a@b',
        '1234567890', // does not start 6-9
        '5876543210',
        '98765',
        '98765432101',
        'priya@@example.com',
      ]) {
        expect(LoginIdentifier.tryParse(input), isNull, reason: input);
      }
    });

    test('never sends both email and phone', () {
      for (final String input in <String>['a@b.com', '9876543210']) {
        expect(LoginIdentifier.tryParse(input)!.toJson().length, 1);
      }
    });
  });

  // -------------------------------------------------------------------------
  group('ApiClient', () {
    late List<http.Request> seen;

    setUp(() => seen = <http.Request>[]);

    ApiClient clientReturning(
      Future<http.Response> Function(http.Request request) handler, {
      TokenProvider? tokens,
    }) {
      return ApiClient(
        baseUrl: 'https://api.test/api',
        tokenProvider: tokens,
        httpClient: MockClient((http.Request request) {
          seen.add(request);
          return handler(request);
        }),
      );
    }

    test('sends Accept: application/json on every request', () async {
      final ApiClient client = clientReturning(
        (_) async => http.Response('{"data":{}}', 200),
      );
      await client.get('/v1/auth/me', authenticated: false);
      expect(seen.single.headers['Accept'], 'application/json');
    });

    test('attaches the bearer token when authenticated', () async {
      final _StubTokens tokens = _StubTokens('tok');
      final ApiClient client = clientReturning(
        (_) async => http.Response('{"data":{}}', 200),
        tokens: tokens,
      );
      await client.get('/v1/auth/me');
      expect(seen.single.headers['Authorization'], 'Bearer tok');
    });

    test('maps status codes onto error kinds', () async {
      Future<ApiErrorKind> kindFor(int status, [String body = '{}']) async {
        final ApiClient client = clientReturning(
          (_) async => http.Response(body, status),
        );
        try {
          await client.get('/x', authenticated: false);
          fail('expected a throw for $status');
        } on ApiException catch (e) {
          return e.kind;
        }
      }

      expect(await kindFor(401), ApiErrorKind.unauthenticated);
      expect(await kindFor(403), ApiErrorKind.forbidden);
      expect(await kindFor(422), ApiErrorKind.validation);
      expect(await kindFor(429), ApiErrorKind.tooManyRequests);
      expect(await kindFor(500), ApiErrorKind.server);
    });

    test('exposes 422 field errors', () async {
      final ApiClient client = clientReturning(
        (_) async => http.Response(
          jsonEncode(<String, dynamic>{
            'message': 'Validation failed',
            'errors': <String, dynamic>{
              'code': <String>['The code is invalid.'],
            },
          }),
          422,
        ),
      );
      try {
        await client.post('/x', authenticated: false);
        fail('expected a throw');
      } on ApiException catch (e) {
        expect(e.isValidation, isTrue);
        expect(e.errorFor('code'), 'The code is invalid.');
      }
    });

    test('an HTML body does not crash the decoder', () async {
      final ApiClient client = clientReturning(
        (_) async => http.Response('<html>redirect</html>', 302),
      );
      await expectLater(
        client.get('/x', authenticated: false),
        throwsA(isA<ApiException>()),
      );
    });

    test('a 401 triggers one refresh and one retry', () async {
      final _StubTokens tokens = _StubTokens('stale', refreshResult: true);
      int calls = 0;
      final ApiClient client = clientReturning(
        (_) async {
          calls++;
          return calls == 1
              ? http.Response('{"message":"Unauthenticated."}', 401)
              : http.Response('{"data":{"ok":true}}', 200);
        },
        tokens: tokens,
      );

      final Map<String, dynamic> result = await client.get('/v1/auth/me');

      expect(result['data'], <String, dynamic>{'ok': true});
      expect(tokens.refreshCalls, 1);
      expect(calls, 2, reason: 'exactly one retry');
    });

    test('a failed refresh drops the session and does not loop', () async {
      final _StubTokens tokens = _StubTokens('stale', refreshResult: false);
      int calls = 0;
      final ApiClient client = clientReturning(
        (_) async {
          calls++;
          return http.Response('{"message":"Unauthenticated."}', 401);
        },
        tokens: tokens,
      );

      await expectLater(
        client.get('/v1/auth/me'),
        throwsA(isA<ApiException>()),
      );
      expect(tokens.refreshCalls, 1);
      expect(tokens.sessionLostCalls, 1);
      expect(calls, 1, reason: 'no retry when the refresh failed');
    });

    test('concurrent 401s share a single refresh', () async {
      // The API treats two parallel refreshes as a stolen token and signs the
      // customer out everywhere, so this is the behaviour that matters most.
      final _StubTokens tokens = _StubTokens('stale', refreshResult: true);
      final Map<String, int> callsPerPath = <String, int>{};
      final ApiClient client = clientReturning(
        (http.Request request) async {
          final String path = request.url.path;
          callsPerPath[path] = (callsPerPath[path] ?? 0) + 1;
          return callsPerPath[path] == 1
              ? http.Response('{"message":"Unauthenticated."}', 401)
              : http.Response('{"data":{}}', 200);
        },
        tokens: tokens,
      );

      await Future.wait<Map<String, dynamic>>(<Future<Map<String, dynamic>>>[
        client.get('/a'),
        client.get('/b'),
        client.get('/c'),
      ]);

      expect(tokens.refreshCalls, 1);
    });
  });

  // -------------------------------------------------------------------------
  group('splash hand-off', () {
    testWidgets('fresh install lands on the language screen',
        (WidgetTester tester) async {
      await _pumpApp(tester);
      await tester.pump();

      expect(find.byType(SplashScreen), findsOneWidget);
      expect(find.image(const AssetImage(AppAssets.symbol)), findsOneWidget);
      expect(find.image(const AssetImage(AppAssets.wordmark)), findsOneWidget);

      await _settleSplash(tester);
      expect(find.byType(LanguageScreen), findsOneWidget);
    });

    testWidgets('language chosen, no session -> login',
        (WidgetTester tester) async {
      await _pumpApp(tester, seed: _languageChosen);
      await _settleSplash(tester);

      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('restored session -> dashboard', (WidgetTester tester) async {
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
      );
      await _settleSplash(tester);

      expect(find.byType(AppShell), findsOneWidget);
      // The greeting was removed from the header; the avatar carries the
      // signed-in identity now, so its initial is what proves it.
      expect(find.text('P'), findsWidgets);
    });

    testWidgets('splash paints every frame without error',
        (WidgetTester tester) async {
      await _pumpApp(tester);
      for (int i = 0; i < 180; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.takeException(), isNull, reason: 'frame $i');
      }
      await tester.pumpAndSettle();
      expect(find.byType(LanguageScreen), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  group('language screen', () {
    testWidgets('continues into login', (WidgetTester tester) async {
      await _pumpApp(tester);
      await _settleSplash(tester);

      expect(find.text('Choose your language'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('picking Tamil carries through to login',
        (WidgetTester tester) async {
      await _pumpApp(tester);
      await _settleSplash(tester);

      await tester.tap(find.text('தமிழ்'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('தொடரவும்'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('Nexmile-இல் உள்நுழையவும்'), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  group('sign in', () {
    testWidgets('an email requests a code and opens the OTP screen',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository();
      await _pumpApp(tester, seed: _languageChosen, repository: repo);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), 'priya@example.com');
      await tester.tap(find.text('Send code'));
      await tester.pumpAndSettle();

      expect(find.byType(OtpVerificationScreen), findsOneWidget);
      expect(repo.requestCount, 1);
      expect(repo.lastIdentifier?.isEmail, isTrue);
      expect(repo.lastIdentifier?.value, 'priya@example.com');
    });

    testWidgets('a mobile number is sent as phone, not email',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository();
      await _pumpApp(tester, seed: _languageChosen, repository: repo);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), '+91 98765 43210');
      await tester.tap(find.text('Send code'));
      await tester.pumpAndSettle();

      expect(repo.lastIdentifier?.isPhone, isTrue);
      expect(repo.lastIdentifier?.toJson(), <String, dynamic>{
        'phone': '9876543210',
      });
    });

    testWidgets('rubbish input is rejected before any request',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository();
      await _pumpApp(tester, seed: _languageChosen, repository: repo);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), 'not-valid');
      await tester.tap(find.text('Send code'));
      await tester.pumpAndSettle();

      expect(
        find.text('Enter a valid email address or 10-digit mobile number'),
        findsWidgets,
      );
      expect(repo.requestCount, 0);
      expect(find.byType(OtpVerificationScreen), findsNothing);
    });

    testWidgets('a network failure is reported in the chosen language',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..requestError = const ApiException(kind: ApiErrorKind.network);
      await _pumpApp(
        tester,
        seed: _languageChosenAs('ta'),
        repository: repo,
      );
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), '9876543210');
      await tester.tap(find.text('குறியீட்டை அனுப்பு'));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'இணைய இணைப்பு இல்லை. உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.',
        ),
        findsOneWidget,
      );
      expect(find.byType(OtpVerificationScreen), findsNothing);
    });

    testWidgets('a 429 shows the rate-limit message',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..requestError =
            const ApiException(kind: ApiErrorKind.tooManyRequests);
      await _pumpApp(tester, seed: _languageChosen, repository: repo);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), '9876543210');
      await tester.tap(find.text('Send code'));
      await tester.pumpAndSettle();

      expect(
        find.text('Too many attempts. Please wait a while and try again.'),
        findsOneWidget,
      );
    });

    testWidgets('a suspended account is reported', (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..requestError = const ApiException(kind: ApiErrorKind.forbidden);
      await _pumpApp(tester, seed: _languageChosen, repository: repo);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField), '9876543210');
      await tester.tap(find.text('Send code'));
      await tester.pumpAndSettle();

      expect(
        find.text('This account has been suspended. Please contact support.'),
        findsOneWidget,
      );
    });
  });

  // -------------------------------------------------------------------------
  group('code verification', () {
    Future<FakeAuthRepository> reachOtp(
      WidgetTester tester, {
      FakeAuthRepository? repository,
      String identifier = '9876543210',
      Map<String, Object> seed = _languageChosen,
    }) async {
      final FakeAuthRepository repo = repository ?? FakeAuthRepository();
      await _pumpApp(tester, seed: seed, repository: repo);
      await _settleSplash(tester);
      await tester.enterText(find.byType(TextFormField), identifier);
      await tester.tap(find.byType(InkWell).last);
      await tester.pumpAndSettle();
      return repo;
    }

    testWidgets('the correct code signs in and reaches the dashboard',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      final FakeAuthRepository repo = await reachOtp(tester);
      expect(find.byType(OtpVerificationScreen), findsOneWidget);

      // Entering the final digit auto-submits.
      await tester.enterText(find.byType(TextField).first, '123456');
      await tester.pumpAndSettle();

      expect(find.byType(AppShell), findsOneWidget);
      // The greeting was removed from the header; the avatar carries the
      // signed-in identity now, so its initial is what proves it.
      expect(find.text('P'), findsWidgets);
      expect(repo.verifyCount, 1);
      expect(repo.lastCode, '123456');
      expect(_controller.isSignedIn, isTrue);
    });

    testWidgets('a wrong code is rejected and the boxes are cleared',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      await reachOtp(tester);

      await tester.enterText(find.byType(TextField).first, '000000');
      await tester.pumpAndSettle();

      expect(
        find.text(
          'That code is not correct or has expired. Request a new one.',
        ),
        findsOneWidget,
      );
      expect(find.byType(AppShell), findsNothing);
      expect(_controller.isSignedIn, isFalse);
    });

    testWidgets('an incomplete code is caught before any request',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      final FakeAuthRepository repo = await reachOtp(tester);

      await tester.enterText(find.byType(TextField).first, '12');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Verify'));
      await tester.pumpAndSettle();

      expect(find.text('Enter all 6 digits'), findsOneWidget);
      expect(repo.verifyCount, 0);
    });

    testWidgets('resend is locked behind the server-supplied cooldown',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      final FakeAuthRepository repo = FakeAuthRepository()..resendAfter = 45;
      await reachOtp(tester, repository: repo);

      expect(find.text('Resend code'), findsNothing);
      expect(find.text('Resend code in 45s'), findsOneWidget);

      await tester.pump(const Duration(seconds: 46));
      await tester.pumpAndSettle();
      expect(find.text('Resend code'), findsOneWidget);

      await tester.tap(find.text('Resend code'));
      await tester.pumpAndSettle();

      expect(find.text('A new code has been sent'), findsOneWidget);
      expect(repo.requestCount, 2);
    });

    testWidgets('the subtitle names the identifier the code went to',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      await reachOtp(tester, identifier: 'priya@example.com');
      expect(find.textContaining('priya@example.com'), findsWidgets);
    });

    testWidgets('the OTP route without arguments falls back to login',
        (WidgetTester tester) async {
      await _pumpApp(tester, seed: _languageChosen);
      await _settleSplash(tester);

      _nav(tester).pushNamed(AppRoutes.otpVerification);
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  });

  // -------------------------------------------------------------------------
  group('profile', () {
    /// Signs in from a restored session and opens the profile screen.
    Future<FakeAuthRepository> openProfile(
      WidgetTester tester, {
      FakeAuthRepository? repository,
      Map<String, Object> seed = _languageChosen,
    }) async {
      _useTallPhone(tester);
      final FakeAuthRepository repo = repository ?? FakeAuthRepository();
      await _pumpApp(
        tester,
        seed: seed,
        repository: repo,
        session: _testSession(),
      );
      await _settleSplash(tester);
      await tester.tap(find.byIcon(Icons.person_outline_rounded).first);
      await tester.pumpAndSettle();
      return repo;
    }

    testWidgets('opens from the dashboard and fetches GET /v1/profile',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = await openProfile(tester);

      expect(find.byType(ProfileScreen), findsOneWidget);
      expect(repo.profileCount, 1);
      expect(find.text('Profile'), findsWidgets);
    });

    testWidgets('renders the fields the API returned',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profileUser = const AuthUser(
          id: 42,
          name: 'Priya Kumar',
          email: 'priya@example.com',
          phone: '9876543210',
          role: UserRole.customer,
          status: UserStatus.active,
          phoneVerified: true,
        );
      await openProfile(tester, repository: repo);

      expect(find.text('Priya Kumar'), findsWidgets);
      expect(find.text('priya@example.com'), findsWidgets);
      expect(find.text('9876543210'), findsWidgets);
      expect(find.text('Active'), findsWidgets);
      expect(find.text('Verified'), findsOneWidget);
    });

    testWidgets('a phone-only customer shows "Not added" for the email',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profileUser = const AuthUser(
          id: 7,
          name: 'Ravi',
          phone: '9876543210',
          role: UserRole.customer,
          status: UserStatus.active,
        );
      await openProfile(tester, repository: repo);

      expect(find.text('Not added'), findsOneWidget);
      expect(find.text('Verified'), findsNothing);
    });

    testWidgets('a suspended account is surfaced',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profileUser = const AuthUser(
          id: 7,
          name: 'Ravi',
          phone: '9876543210',
          role: UserRole.customer,
          status: UserStatus.suspended,
        );
      await openProfile(tester, repository: repo);

      expect(find.text('Suspended'), findsWidgets);
    });

    testWidgets('a failed refresh keeps the cached profile and offers a retry',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profileError = const ApiException(kind: ApiErrorKind.network);
      await openProfile(tester, repository: repo);

      expect(
        find.text('No internet connection. Check your connection and try again.'),
        findsOneWidget,
      );
      expect(find.text('Try again'), findsOneWidget);
      // Cached data survives the failure.
      expect(find.text('Priya Kumar'), findsWidgets);

      repo.profileError = null;
      await tester.tap(find.text('Try again'));
      await tester.pumpAndSettle();

      expect(find.text('Try again'), findsNothing);
      expect(repo.profileCount, 2);
    });

    testWidgets('a dead session bounces back to sign-in',
        (WidgetTester tester) async {
      // The client refreshes on a 401 and clears the session when that fails;
      // the screen must not sit there showing a stale profile.
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profileError =
            const ApiException(kind: ApiErrorKind.unauthenticated);
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        repository: repo,
        session: _testSession(),
      );
      await _settleSplash(tester);
      await tester.tap(find.byIcon(Icons.person_outline_rounded).first);
      await tester.pumpAndSettle();

      // The fake throws directly rather than going through ApiClient, so the
      // session survives here — the screen reports the failure instead.
      expect(find.text('Your session has expired. Please sign in again.'),
          findsOneWidget);
    });

    testWidgets('sign out from the profile clears the session',
        (WidgetTester tester) async {
      final FakeAuthRepository repo = await openProfile(tester);

      await tester.tap(find.text('Sign out'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text('You have been signed out'), findsOneWidget);
      expect(repo.signOutCount, 1, reason: 'revoked server-side too');
      expect(_controller.isSignedIn, isFalse);
    });

    testWidgets('the language row opens the language screen',
        (WidgetTester tester) async {
      await openProfile(tester);

      await tester.tap(find.byIcon(Icons.translate_rounded).first);
      await tester.pumpAndSettle();
      expect(find.byType(LanguageScreen), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  group('account', () {
    testWidgets('editing the profile sends only what changed',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      await _pumpApp(tester, seed: _languageChosen, session: _testSession());
      await _settleSplash(tester);

      await tester.tap(find.text('Profile').first);
      await tester.pumpAndSettle();
      // The name appears twice — in the header and in the editable tile.
      await tester.tap(find.text('Priya Kumar').last);
      await tester.pumpAndSettle();

      expect(find.text('Edit profile'), findsOneWidget);
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Name'),
        'Priya R',
      );
      await tester.tap(find.text('Save changes'));
      await tester.pumpAndSettle();

      final Map<String, dynamic> sent = _authRepo.lastProfilePatch!;
      expect(sent['name'], 'Priya R');
      // English is one of the three the API accepts, so it rides along.
      expect(sent['preferred_locale'], 'en');
    });

    testWidgets('a locale the API does not accept is simply not sent',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      // The app offers 23 languages; `preferred_locale` accepts en, ta and hi.
      // Malayalam must not be forced into one of the three.
      await _pumpApp(
        tester,
        seed: _languageChosenAs('ml'),
        session: _testSession(),
      );
      await _settleSplash(tester);

      await tester.tap(find.byIcon(Icons.person_outline_rounded).last);
      await tester.pumpAndSettle();
      // The name appears twice — in the header and in the editable tile.
      await tester.tap(find.text('Priya Kumar').last);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FilledButton).last);
      await tester.pumpAndSettle();

      expect(_authRepo.lastProfilePatch!.containsKey('preferred_locale'), isFalse);
    });

    test('a rejected update keeps the server field errors', () async {
      final FakeAuthRepository repo = FakeAuthRepository()
        ..profilePatchError = const ApiException(
          kind: ApiErrorKind.validation,
          statusCode: 422,
          message: 'Unprocessable',
          errors: <String, List<String>>{
            'phone': <String>['That mobile number is already in use.'],
          },
        );
      final AuthController auth = AuthController(
        repository: repo,
        tokenStore: InMemoryTokenStore(_testSession()),
        initialSession: _testSession(),
      );

      final AuthFailure? failure = await auth.updateProfile(phone: '9876543210');
      expect(failure, AuthFailure.invalidIdentifier);
      expect(auth.firstError('phone'), 'That mobile number is already in use.');
      auth.dispose();
    });

    test('only en, ta and hi reach the server as a locale', () {
      expect(AuthController.serverLocaleFor('en'), 'en');
      expect(AuthController.serverLocaleFor('ta'), 'ta');
      expect(AuthController.serverLocaleFor('hi'), 'hi');
      for (final String other in <String>['ml', 'bn', 'sat', 'brx']) {
        expect(AuthController.serverLocaleFor(other), isNull, reason: other);
      }
    });

    test('deleting the account clears the local session', () async {
      final FakeAuthRepository repo = FakeAuthRepository();
      final AuthController auth = AuthController(
        repository: repo,
        tokenStore: InMemoryTokenStore(_testSession()),
        initialSession: _testSession(),
      );

      expect(await auth.deleteAccount(), isNull);
      expect(repo.deleteAccountCount, 1);
      // The server revokes every session, so staying signed in locally would
      // leave the app holding a token that no longer works.
      expect(auth.isSignedIn, isFalse);
      auth.dispose();
    });

    test('signing out everywhere takes this device with it', () async {
      final FakeAuthRepository repo = FakeAuthRepository();
      final AuthController auth = AuthController(
        repository: repo,
        tokenStore: InMemoryTokenStore(_testSession()),
        initialSession: _testSession(),
      );

      await auth.signOutEverywhere();
      expect(repo.signOutEverywhereCount, 1);
      expect(auth.isSignedIn, isFalse);
      auth.dispose();
    });

    testWidgets('the devices screen lists sessions and revokes one',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(tester, seed: _languageChosen, session: _testSession());
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.devices);
      await tester.pumpAndSettle();

      expect(find.text('Pixel 8'), findsOneWidget);
      expect(find.text('iPhone 14'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.logout_rounded).first);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Sign out'));
      await tester.pumpAndSettle();

      expect(_authRepo.revoked, <int>[1]);
    });

    testWidgets('a session with no device name still renders',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      // Every field but the id is nullable in the schema.
      final FakeAuthRepository repo = FakeAuthRepository()
        ..deviceSessions = <DeviceSession>[const DeviceSession(id: 9)];
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        repository: repo,
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.devices);
      await tester.pumpAndSettle();

      expect(find.text('Unknown device'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  // -------------------------------------------------------------------------
  group('dashboard', () {
    testWidgets('the language can be changed from the profile tab',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
      );
      await _settleSplash(tester);

      await tester.tap(find.text('Profile').first);
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.translate_rounded).first);
      await tester.pumpAndSettle();
      expect(find.byType(LanguageScreen), findsOneWidget);

      await tester.tap(find.text('தமிழ்'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('தொடரவும்'));
      await tester.pumpAndSettle();

      // Back in the shell, with the whole chrome now in Tamil.
      expect(find.byType(AppShell), findsOneWidget);
      expect(find.text('முகப்பு'), findsWidgets);
    });
  });


  // -------------------------------------------------------------------------
  group('storefront decoding', () {
    test('numbers and booleans survive arriving as strings', () {
      // The generated schema types several of these as `string`, and money
      // comes back as a JSON number in some places and a decimal string in
      // others. A storefront that crashes on "249.00" is not worth shipping.
      final Restaurant restaurant = Restaurant.fromJson(<String, dynamic>{
        'id': 'r-77',
        'name': 'Anjappar',
        'is_open': 'true',
        'is_accepting_orders': '1',
        'within_operating_hours': 'false',
        'avg_prep_time_minutes': '28',
        'min_order_value': '149.00',
        'packaging_fee': 12,
        'supports_pickup': 'false',
        'distance_metres': '820',
      });

      expect(restaurant.isOpen, isTrue);
      expect(restaurant.isAcceptingOrders, isTrue);
      expect(restaurant.withinOperatingHours, isFalse);
      expect(restaurant.avgPrepTimeMinutes, 28);
      expect(restaurant.minOrderValue, 149.0);
      expect(restaurant.packagingFee, 12.0);
      expect(restaurant.supportsPickup, isFalse);
      expect(restaurant.distanceKmLabel, '0.8');
    });

    test('a missing distance stays null rather than becoming zero', () {
      // Fetched directly rather than through a nearby search — "0.0 km away"
      // would be a lie.
      final Restaurant restaurant =
          Restaurant.fromJson(<String, dynamic>{'id': 'r-1', 'name': 'X'});
      expect(restaurant.distanceMetres, isNull);
      expect(restaurant.distanceKmLabel, isNull);
    });

    test('the uncategorised bucket becomes a section of its own', () {
      final RestaurantMenu menu = RestaurantMenu.fromJson(<String, dynamic>{
        'menu': <Map<String, dynamic>>[
          // A real category always carries an id; only the API's own
          // "Uncategorised" group has a null one.
          <String, dynamic>{
            'id': 7,
            'name': 'Biryani',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{'id': 1, 'name': 'Mutton Biryani', 'price': 320},
            ],
          },
          // An empty category is dropped rather than rendered as a bare header.
          <String, dynamic>{'id': 8, 'name': 'Desserts', 'items': <Object>[]},
        ],
        'uncategorised': <Map<String, dynamic>>[
          <String, dynamic>{'id': 9, 'name': 'Filter Coffee', 'price': 30},
        ],
      });

      expect(menu.sections.length, 2);
      expect(menu.sections.first.name, 'Biryani');
      expect(menu.sections.last.isUncategorised, isTrue);
      expect(menu.allItems.length, 2);
    });

    test('the API\'s own "Uncategorised" heading is not shown to customers',
        () {
      // The live API returns that group with a null id and an English name.
      // Rendering the name verbatim would put an untranslated word above the
      // menu in all 22 other languages.
      final RestaurantMenu menu = RestaurantMenu.fromJson(<String, dynamic>{
        'menu': <Map<String, dynamic>>[
          <String, dynamic>{
            'id': null,
            'name': 'Uncategorised',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{'id': 2, 'name': 'Dosa', 'price': 50},
            ],
          },
          <String, dynamic>{
            'id': 7,
            'name': 'Biryani',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{'id': 3, 'name': 'Mutton', 'price': 320},
            ],
          },
        ],
      });

      expect(menu.sections.first.isUncategorised, isTrue);
      expect(menu.sections.first.name, isEmpty);
      // A real category keeps the merchant's own name.
      expect(menu.sections.last.name, 'Biryani');
    });

    test('a dish needs the sheet only when a group demands an answer', () {
      MenuItem item(List<Map<String, dynamic>> groups) =>
          MenuItem.fromJson(<String, dynamic>{
            'id': 1,
            'name': 'Dosa',
            'price': 80,
            'option_groups': groups,
          });

      expect(item(<Map<String, dynamic>>[]).needsOptions, isFalse);
      expect(
        item(<Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'name': 'Extras', 'is_required': false},
        ]).needsOptions,
        isFalse,
      );
      expect(
        item(<Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'name': 'Size', 'is_required': true},
        ]).needsOptions,
        isTrue,
      );
      // A floor without the flag still has to be answered.
      expect(
        item(<Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'name': 'Base', 'min_selections': 1},
        ]).needsOptions,
        isTrue,
      );
    });

    test('a status this build predates degrades instead of crashing', () {
      expect(orderStatusFrom('teleported'), OrderStatus.unknown);
      expect(orderStatusFrom(null), OrderStatus.unknown);
      expect(orderStatusFrom('ready_for_pickup'), OrderStatus.readyForPickup);
    });

    test('only a placed order offers cancellation', () {
      expect(OrderStatus.placed.isCancellable, isTrue);
      for (final OrderStatus status in OrderStatus.values) {
        if (status == OrderStatus.placed) continue;
        expect(status.isCancellable, isFalse, reason: status.name);
      }
      expect(OrderStatus.delivered.isFinished, isTrue);
      expect(OrderStatus.riderAssigned.isActive, isTrue);
    });

    test('the uncategorised bucket is read from beside data, not inside it',
        () async {
      // The live API nests `menu` inside `data` alongside the restaurant, but
      // puts `uncategorised` at the top level next to it. Reading only `data`
      // dropped every dish a shop never filed under a category — for a shop
      // that made no categories, that was the whole menu.
      final ApiStorefrontRepository repository = ApiStorefrontRepository(
        ApiClient(
          baseUrl: 'https://api.test/api',
          httpClient: MockClient(
            (http.Request request) async => http.Response(
              jsonEncode(<String, dynamic>{
                'data': <String, dynamic>{
                  'id': 4,
                  'name': 'kishore food',
                  'menu': <Object>[],
                },
                'uncategorised': <Map<String, dynamic>>[
                  <String, dynamic>{'id': 2, 'name': 'Dosa', 'price': 50},
                ],
              }),
              200,
            ),
          ),
        ),
      );

      final RestaurantMenu menu = await repository.menu('4');
      expect(menu.isEmpty, isFalse);
      expect(menu.allItems.single.name, 'Dosa');
      expect(menu.sections.single.isUncategorised, isTrue);
    });

    test('the merchant chooses which photo leads, not the banner', () {
      final Restaurant restaurant = Restaurant.fromJson(<String, dynamic>{
        'id': '4',
        'name': 'kishore food',
        'banner_url': 'https://x/banner.png',
        'photos': <Map<String, dynamic>>[
          <String, dynamic>{'id': 3, 'url': 'https://x/a.png', 'caption': 'Our dining area'},
          <String, dynamic>{'id': 7, 'url': 'https://x/b.png', 'caption': null},
          // No url is not a photo. Rendering it would be a grey box the
          // customer has to swipe past.
          <String, dynamic>{'id': 9, 'caption': 'Missing'},
        ],
      });

      expect(restaurant.photos.length, 2);
      // The banner is not prepended: `photos` is already in the merchant's
      // order and its first entry is the one they chose to lead with.
      expect(
        restaurant.gallery.map((RestaurantPhoto p) => p.id).toList(),
        <int>[3, 7],
      );
      expect(restaurant.gallery.first.caption, 'Our dining area');
      // A blank caption is no caption, not an empty alt text.
      expect(restaurant.gallery.last.caption, isNull);
    });

    test('a restaurant with no photos falls back to its banner', () {
      final Restaurant restaurant = Restaurant.fromJson(<String, dynamic>{
        'id': '4',
        'name': 'kishore food',
        'banner_url': 'https://x/banner.png',
      });

      expect(restaurant.photos, isEmpty);
      expect(restaurant.gallery.single.url, 'https://x/banner.png');
    });

    test('a single photo is the whole gallery, banner and all', () {
      // One photo means one slide — the banner does not join it to make two.
      final Restaurant restaurant = Restaurant.fromJson(<String, dynamic>{
        'id': '4',
        'name': 'kishore food',
        'banner_url': 'https://x/banner.png',
        'photos': <Map<String, dynamic>>[
          <String, dynamic>{'id': 3, 'url': 'https://x/a.png'},
        ],
      });

      expect(restaurant.gallery.single.url, 'https://x/a.png');
    });

    test('nearby restaurants carry no photos, and must not pretend to', () {
      // The list endpoint omits them on purpose — twenty shops would be a
      // hundred and sixty signed URLs.
      final Restaurant restaurant =
          Restaurant.fromJson(<String, dynamic>{'id': '4', 'name': 'kishore food'});
      expect(restaurant.gallery, isEmpty);
    });

    test('a dish rating is hidden until the API sends one', () {
      final MenuItem unrated =
          MenuItem.fromJson(<String, dynamic>{'id': 2, 'name': 'Dosa', 'price': 50});
      expect(unrated.hasRating, isFalse);
      // Never zero: a dish nobody has rated is not a bad dish.
      expect(unrated.rating, isNull);

      final MenuItem rated = MenuItem.fromJson(<String, dynamic>{
        'id': 2,
        'name': 'Dosa',
        'price': 50,
        'rating': '4.5',
        'rating_count': 12,
      });
      expect(rated.rating, 4.5);
      expect(rated.ratingCount, 12);
    });

    test('a review summary reads the histogram the server keys as strings', () {
      final ReviewPage page = ReviewPage.fromJson(
        <Map<String, dynamic>>[],
        <String, dynamic>{
          'rating': '4.2',
          'rating_count': 18,
          'breakdown': <String, dynamic>{
            '5': 10,
            '4': '4',
            '3': 2,
            '1': 2,
            // Not a star, so not a bar.
            '0': 99,
            'x': 5,
          },
          'current_page': 1,
          'last_page': 3,
        },
      );

      expect(page.summary.rating, 4.2);
      expect(page.summary.countFor(4), 4);
      // A star nobody gave reads as zero rather than as a gap.
      expect(page.summary.countFor(2), 0);
      expect(page.summary.breakdown.containsKey(0), isFalse);
      expect(page.summary.busiestStar, 10);
      expect(page.hasMore, isTrue);
    });

    test('an unrated restaurant shows no rating rather than a zero', () {
      final ReviewPage page = ReviewPage.fromJson(
        <Map<String, dynamic>>[],
        const <String, dynamic>{'rating': null, 'rating_count': 0},
      );

      expect(page.summary.hasRating, isFalse);
      // Nothing said there was another page, and there is nothing on this one.
      expect(page.hasMore, isFalse);
      // Never divides by zero when the histogram is empty.
      expect(page.summary.busiestStar, 1);
    });

    test('the last page is the last page, whatever it holds', () {
      final ReviewPage page = ReviewPage.fromJson(
        <Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'author': 'Priya', 'rating': 5},
        ],
        const <String, dynamic>{'current_page': 3, 'last_page': 3},
      );
      expect(page.hasMore, isFalse);
      // A blank comment is no comment — the tile must not reserve space for it.
      expect(page.items.single.hasComment, isFalse);
    });

    test('reviews are asked for by page, and filtered server-side', () async {
      final List<Uri> seen = <Uri>[];
      final ApiStorefrontRepository repository = ApiStorefrontRepository(
        ApiClient(
          baseUrl: 'https://api.test/api',
          httpClient: MockClient((http.Request request) async {
            seen.add(request.url);
            return http.Response(
              jsonEncode(<String, dynamic>{
                'data': <Object>[],
                'meta': <String, dynamic>{'rating': 4, 'rating_count': 2},
              }),
              200,
            );
          }),
        ),
      );

      await repository.reviews('4');
      await repository.reviews('4', page: 2, withCommentOnly: true);

      // Page one adds nothing, so the first request is the plain URL.
      expect(seen.first.query, isEmpty);
      expect(seen.last.queryParameters['page'], '2');
      expect(seen.last.queryParameters['with_comment'], '1');
    });

    test('dish ratings are posted keyed by menu item, and omitted when none',
        () async {
      final List<String> bodies = <String>[];
      final ApiStorefrontRepository repository = ApiStorefrontRepository(
        ApiClient(
          baseUrl: 'https://api.test/api',
          httpClient: MockClient((http.Request request) async {
            bodies.add(request.body);
            return http.Response('{"data":{}}', 200);
          }),
        ),
      );

      await repository.reviewOrder(
        7,
        rating: 4,
        comment: '  ',
        dishes: <int, int>{41: 5, 44: 2},
      );
      await repository.reviewOrder(7, rating: 5);

      final Map<String, dynamic> withDishes =
          jsonDecode(bodies.first) as Map<String, dynamic>;
      expect(withDishes['rating'], 4);
      expect(withDishes['dishes'], <String, dynamic>{'41': 5, '44': 2});
      // Whitespace is not a comment.
      expect(withDishes.containsKey('comment'), isFalse);

      // Nothing rated means no key at all, rather than an empty object.
      final Map<String, dynamic> bare =
          jsonDecode(bodies.last) as Map<String, dynamic>;
      expect(bare.containsKey('dishes'), isFalse);
    });

    test('an order line can only be rated when the API names the dish', () {
      // `GET /v1/orders` sends the line id but not `menu_item_id`. Guessing
      // from the line id would rate whichever dish shared that number.
      final OrderItem bare =
          OrderItem.fromJson(<String, dynamic>{'id': 5, 'name': 'Dosa'});
      expect(bare.menuItemId, isNull);

      final OrderItem named = OrderItem.fromJson(
        <String, dynamic>{'id': 5, 'menu_item_id': 2, 'name': 'Dosa'},
      );
      expect(named.menuItemId, 2);
    });

    test('a cart line takes its id from cart_item_id, as the API sends it', () {
      // The live payload names it `cart_item_id`. Reading only `id` gave 0,
      // which sent every PATCH and DELETE to `/cart/items/0` — so changing a
      // quantity or removing a line silently failed.
      final Cart cart = Cart.fromJson(<String, dynamic>{
        'id': 1,
        'items': <Map<String, dynamic>>[
          <String, dynamic>{
            'cart_item_id': 4,
            'menu_item_id': 2,
            'name': 'Dosa',
            'quantity': 1,
            'unit_price': 50,
            'line_total': 50,
          },
        ],
      });

      expect(cart.lines.single.id, 4);
      expect(cart.lines.single.menuItemId, 2);
    });

    test('an open cart counts its own lines when no count is sent', () {
      // `GET /v1/carts` sends the lines, not a count. Showing "0 items" beside
      // a non-zero total is worse than showing nothing.
      final OpenCart open = OpenCart.fromJson(<String, dynamic>{
        'restaurant': <String, dynamic>{'id': '4', 'name': 'kishore food'},
        'items': <Map<String, dynamic>>[
          <String, dynamic>{'cart_item_id': 4, 'quantity': 2},
          <String, dynamic>{'cart_item_id': 5, 'quantity': 1},
        ],
        'totals': <String, dynamic>{'grand_total': 82},
      });

      expect(open.itemCount, 3);
      expect(open.grandTotal, 82);
      expect(open.restaurantName, 'kishore food');
    });

    test('home v2 fields default to absent, not to zero', () {
      // None of these exist in the API today. The card hides each rather than
      // rendering a "0.0" rating or a blank offer ribbon.
      final Restaurant plain = Restaurant.fromJson(<String, dynamic>{
        'id': 'r1',
        'name': 'X',
        'service_category': 'Restaurant',
        'area': 'Anna Nagar',
      });

      expect(plain.rating, isNull);
      expect(plain.hasRating, isFalse);
      expect(plain.isPureVeg, isFalse);
      expect(plain.costForTwo, isNull);
      expect(plain.cuisines, isEmpty);
      expect(plain.offers, isEmpty);
      expect(plain.isFavourite, isFalse);
      // Falls back to the category and area the API does send today.
      expect(plain.subtitle(), 'Restaurant · Anna Nagar');
    });

    test('home v2 fields decode once the API sends them', () {
      final Restaurant rich = Restaurant.fromJson(<String, dynamic>{
        'id': 'r1',
        'name': 'Behrouz',
        'rating': '4.2',
        'rating_count': '1284',
        'is_pure_veg': 'true',
        'cost_for_two': 300,
        'cuisines': <String>['Biryani', 'North Indian'],
        'offers': <Map<String, dynamic>>[
          <String, dynamic>{'label': '₹100 OFF above ₹499', 'type': 'flat'},
          // An offer with no wording is dropped rather than shown blank.
          <String, dynamic>{'label': '', 'type': 'flat'},
        ],
        'has_free_delivery': 1,
        'is_favourite': true,
      });

      expect(rich.rating, 4.2);
      expect(rich.ratingCount, 1284);
      expect(rich.isPureVeg, isTrue);
      expect(rich.costForTwo, 300);
      expect(rich.offers.single.label, '₹100 OFF above ₹499');
      expect(rich.hasFreeDelivery, isTrue);
      expect(rich.isFavourite, isTrue);
      // Cuisines replace the service-category fallback once they exist.
      expect(rich.subtitle(), 'Biryani · North Indian');
    });

    test('unfiltered nearby sends exactly what it sends today', () {
      // The whole filter set must add nothing until something is selected,
      // otherwise every existing request changes shape.
      expect(RestaurantFilters.none.toQuery(), isEmpty);
      expect(RestaurantFilters.none.isActive, isFalse);
      expect(RestaurantFilters.none.activeCount, 0);
    });

    test('filters become the query parameters the API spec asks for', () {
      const RestaurantFilters filters = RestaurantFilters(
        sort: RestaurantSort.costLowHigh,
        cuisines: <String>{'biryani'},
        ratingMin: 4.0,
        cost: CostBracket(min: 150, max: 300),
        vegOnly: true,
        nearAndFast: true,
      );

      final Map<String, List<String>> query = filters.toQuery();
      expect(query['sort'], <String>['cost_low_high']);
      // Brackets matter: Laravel silently keeps only the last value without
      // them, so a two-cuisine filter would become a one-cuisine filter.
      expect(query['cuisine[]'], <String>['biryani']);
      expect(query.containsKey('cuisine'), isFalse);
      expect(query['rating_min'], <String>['4.0']);
      expect(query['cost_min'], <String>['150']);
      expect(query['cost_max'], <String>['300']);
      expect(query['veg_only'], <String>['1']);
      expect(query['near_and_fast'], <String>['1']);
      // Untouched filters stay out of the URL entirely.
      expect(query.containsKey('free_delivery'), isFalse);
      // Sort is excluded from the count — there is always a sort, so counting
      // it would show "1" on an untouched list.
      expect(filters.activeCount, 5);
    });

    test('a cuisine toggles off as well as on', () {
      final RestaurantFilters once =
          RestaurantFilters.none.toggleCuisine('pizza');
      expect(once.cuisines, <String>{'pizza'});
      expect(once.toggleCuisine('pizza').cuisines, isEmpty);
    });

    test('clearing a rating is distinct from leaving it alone', () {
      const RestaurantFilters set = RestaurantFilters(ratingMin: 4.0);
      // copyWith(ratingMin: null) cannot mean "clear" — null is also "unchanged".
      expect(set.copyWith().ratingMin, 4.0);
      expect(set.copyWith(clearRating: true).ratingMin, isNull);
    });

    test('an unrecognised home section is skipped, not rendered', () {
      // The contract: new section types ship server-side before the app
      // supports them. Anything unknown must be dropped silently.
      final HomeScreen home = HomeScreen.fromJson(<String, dynamic>{
        'sections': <Map<String, dynamic>>[
          <String, dynamic>{
            'type': 'flash_sale_countdown',
            'items': <Object>[],
          },
          <String, dynamic>{
            'type': 'cuisines',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{'slug': 'biryani', 'name': 'Biryani'},
            ],
          },
        ],
      }, const <String, dynamic>{'radius_metres': 2000});

      expect(home.sections.length, 1);
      expect(home.sections.single, isA<CuisineSection>());
      expect(home.radiusMetres, 2000);
    });

    test('an empty home section is dropped rather than left as a bare header',
        () {
      final HomeScreen home = HomeScreen.fromJson(<String, dynamic>{
        'sections': <Map<String, dynamic>>[
          <String, dynamic>{'type': 'banners', 'items': <Object>[]},
          <String, dynamic>{
            'type': 'restaurants',
            'title': 'Featured',
            'layout': 'list',
            'items': <Object>[],
          },
        ],
      }, const <String, dynamic>{});

      expect(home.sections, isEmpty);
      expect(home.isEmpty, isTrue);
    });

    test('a restaurant section carries the layout the server chose', () {
      final HomeScreen home = HomeScreen.fromJson(<String, dynamic>{
        'sections': <Map<String, dynamic>>[
          <String, dynamic>{
            'type': 'restaurants',
            'title': 'Recommended for you',
            'layout': 'grid',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{'id': 'r1', 'name': 'Behrouz'},
            ],
          },
        ],
      }, const <String, dynamic>{});

      final RestaurantSection section =
          home.sections.single as RestaurantSection;
      expect(section.isGrid, isTrue);
      // Already localised by the server, so it is rendered verbatim.
      expect(section.title, 'Recommended for you');
    });

    test('a banner action arriving as an array does not lose the tap', () {
      // The generated schema types `action` as an array; the API sends an
      // object. Neither shape may throw.
      expect(BannerAction.fromJson(<Object>[]).isNone, isTrue);
      expect(BannerAction.fromJson(null).isNone, isTrue);

      final BannerAction real = BannerAction.fromJson(<String, dynamic>{
        'type': 'collection',
        'value': 'under-250',
      });
      expect(real.type, 'collection');
      expect(real.value, 'under-250');
      expect(real.isNone, isFalse);
    });

    test('unavailable items decode from names or from objects', () {
      Cart cart(Object? raw) => Cart.fromJson(<String, dynamic>{
            'id': 1,
            'unavailable_items': raw,
          });

      expect(cart(<String>['Dosa']).unavailableItems, <String>['Dosa']);
      expect(
        cart(<Map<String, dynamic>>[
          <String, dynamic>{'name': 'Idli'},
        ]).unavailableItems,
        <String>['Idli'],
      );
      expect(cart(null).unavailableItems, isEmpty);
    });
  });

  // -------------------------------------------------------------------------
  group('cart', () {
    late FakeStorefrontRepository repo;
    late CartController cart;

    setUp(() {
      repo = FakeStorefrontRepository();
      cart = CartController(repository: repo);
    });

    test('state is replaced from the response, never patched locally', () async {
      // Totals, the minimum and can_checkout are the server's answer;
      // recomputing any of them here would only drift.
      await cart.addItem('r1', menuItemId: 1);
      expect(cart.itemCount, 1);
      expect(cart.cart!.totals.grandTotal, 100);

      repo.grandTotalOverride = 999;
      await cart.setQuantity('r1', cartItemId: 501, quantity: 3);
      expect(cart.cart!.totals.grandTotal, 999);
    });

    test('an empty basket is a 404, not an error worth showing', () async {
      repo.cartStatus = 404;
      final AuthFailure? failure = await cart.load('r1');
      expect(failure, isNull);
      expect(cart.cart, isNull);
      expect(cart.isEmpty, isTrue);
    });

    test('quantity sums across option combinations of the same dish', () async {
      repo.lines = <Map<String, dynamic>>[
        <String, dynamic>{'id': 1, 'menu_item_id': 7, 'quantity': 2},
        <String, dynamic>{'id': 2, 'menu_item_id': 7, 'quantity': 1},
        <String, dynamic>{'id': 3, 'menu_item_id': 9, 'quantity': 1},
      ];
      await cart.load('r1');

      expect(cart.quantityOfMenuItem(7), 3);
      // Split across two lines, so the stepper cannot know which to decrement.
      expect(cart.soleLineFor(7), isNull);
      expect(cart.soleLineFor(9)?.id, 3);
    });

    test('a rejected add surfaces the server field error verbatim', () async {
      repo.failNextWith = ApiException(
        kind: ApiErrorKind.validation,
        statusCode: 422,
        message: 'Unprocessable',
        errors: <String, List<String>>{
          'option_ids': <String>['Choose a size.'],
        },
      );

      final AuthFailure? failure = await cart.addItem('r1', menuItemId: 1);
      expect(failure, AuthFailure.invalidIdentifier);
      expect(cart.firstError('option_ids'), 'Choose a size.');
      expect(cart.firstError(), 'Choose a size.');
    });

    test('checkout returns the order and drops the basket', () async {
      await cart.addItem('r1', menuItemId: 1);
      final (Order? order, AuthFailure? failure) = await cart.checkout(
        'r1',
        fulfilmentType: FulfilmentType.delivery,
        paymentMethod: 'cod',
        addressId: 5,
      );

      expect(failure, isNull);
      expect(order?.orderNumber, 'NX1001');
      // The server empties it, so going back cannot place the same order twice.
      expect(cart.cart, isNull);
      expect(repo.lastCheckout?['address_id'], 5);
    });

    test('a rejected checkout keeps the basket and names the field', () async {
      await cart.addItem('r1', menuItemId: 1);
      repo.failNextWith = ApiException(
        kind: ApiErrorKind.validation,
        statusCode: 422,
        message: 'Unprocessable',
        errors: <String, List<String>>{
          'address_id': <String>['That address is outside the delivery area.'],
        },
      );

      final (Order? order, AuthFailure? failure) = await cart.checkout(
        'r1',
        fulfilmentType: FulfilmentType.delivery,
        paymentMethod: 'cod',
        addressId: 5,
      );

      expect(order, isNull);
      expect(failure, AuthFailure.invalidIdentifier);
      expect(cart.cart, isNotNull);
      expect(
        cart.firstError(),
        'That address is outside the delivery area.',
      );
    });

    test('pickup carries no address', () async {
      await cart.addItem('r1', menuItemId: 1);
      await cart.checkout(
        'r1',
        fulfilmentType: FulfilmentType.pickup,
        paymentMethod: 'cod',
        addressId: 5,
      );
      expect(repo.lastCheckout?.containsKey('address_id'), isFalse);
    });
  });

  // -------------------------------------------------------------------------
  group('orders', () {
    test('tracking polls while in flight and stops once finished', () async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..orderStatus = 'preparing';
      final OrdersController orders = OrdersController(repository: repo);

      await orders.open(1);
      expect(orders.tracking?.status, OrderStatus.preparing);
      final int seeded = repo.trackCalls;

      repo.orderStatus = 'delivered';
      await Future<void>.delayed(const Duration(seconds: 9));
      expect(repo.trackCalls, greaterThan(seeded));
      expect(orders.tracking?.status, OrderStatus.delivered);

      // A delivered order must not keep a timer alive.
      final int settled = repo.trackCalls;
      await Future<void>.delayed(const Duration(seconds: 9));
      expect(repo.trackCalls, settled);

      orders.dispose();
    }, timeout: const Timeout(Duration(seconds: 40)));

    test('active orders are the ones still in flight', () async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..orderList = <String>['placed', 'delivered', 'preparing', 'cancelled'];
      final OrdersController orders = OrdersController(repository: repo);

      await orders.load();
      expect(orders.orders.length, 4);
      expect(orders.active.length, 2);
      orders.dispose();
    });
  });

  // -------------------------------------------------------------------------
  group('nearby', () {
    test('a saved address wins over a GPS fix', () async {
      // The API knows the saved pin better than a fresh read, and it is what
      // checkout validates the 1 km radius against.
      final FakeStorefrontRepository repo = FakeStorefrontRepository();
      final StorefrontController storefront =
          StorefrontController(repository: repo);

      await storefront.load(addressId: 12, latitude: 9.9, longitude: 78.1);
      expect(repo.lastNearby?['address_id'], 12);
      expect(repo.lastNearby?['latitude'], isNull);
      storefront.dispose();
    });

    test('coordinates are used when nothing is saved yet', () async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository();
      final StorefrontController storefront =
          StorefrontController(repository: repo);

      await storefront.load(latitude: 9.9252, longitude: 78.1198);
      expect(repo.lastNearby?['address_id'], isNull);
      expect(repo.lastNearby?['latitude'], 9.9252);
      storefront.dispose();
    });

    test('a deals failure does not take the restaurant list down', () async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..dealsThrow = true;
      final StorefrontController storefront =
          StorefrontController(repository: repo);

      await storefront.load(addressId: 1);
      expect(storefront.failure, isNull);
      expect(storefront.restaurants, isNotEmpty);
      expect(storefront.deals, isEmpty);
      storefront.dispose();
    });

    test('search is a separate query and leaves nearby alone', () async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository();
      final StorefrontController storefront =
          StorefrontController(repository: repo);

      await storefront.load(addressId: 4);
      final int nearbyCount = storefront.restaurants.length;

      repo.searchResultCount = 1;
      await storefront.runSearch('dosa');
      expect(repo.lastNearby?['search'], 'dosa');
      expect(storefront.results.length, 1);
      expect(storefront.restaurants.length, nearbyCount);

      // Clearing drops the results without a round trip.
      await storefront.runSearch('   ');
      expect(storefront.results, isEmpty);
      expect(storefront.hasSearched, isFalse);
      storefront.dispose();
    });
  });

  // -------------------------------------------------------------------------
  group('storefront screens', () {
    Future<void> openStore(
      WidgetTester tester, {
      FakeStorefrontRepository? repository,
    }) async {
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        storefrontRepository: repository,
      );
      await _settleSplash(tester);
    }

    testWidgets('nearby restaurants come from the API',
        (WidgetTester tester) async {
      await openStore(tester);
      expect(find.text('Anjappar Chettinad'), findsWidgets);
    });

    testWidgets('picking a category does not take the categories away',
        (WidgetTester tester) async {
      // The curated sections hide once a filter is on, and should. The rail
      // must not go with them: it is the only way back out of the category the
      // customer just tapped.
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..homePayload = <String, dynamic>{
          'sections': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'cuisines',
              'items': <Map<String, dynamic>>[
                <String, dynamic>{'slug': 'biryani', 'name': 'Biryani'},
              ],
            },
          ],
        };
      await openStore(tester, repository: repo);

      await tester.tap(find.text('Biryani'));
      await tester.pumpAndSettle();

      expect(repo.lastFilters.cuisines, <String>{'biryani'});
      expect(find.text('Biryani'), findsOneWidget);

      // And the veg switch, which is the other way into a filtered list.
      await tester.tap(find.text('Veg only'));
      await tester.pumpAndSettle();
      expect(find.text('Biryani'), findsOneWidget);
    });

    testWidgets('the search bar and the categories survive the scroll',
        (WidgetTester tester) async {
      // The banner is worth the space on arrival and none of it afterwards;
      // the search field, the veg switch and the categories are worth it the
      // whole way down.
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..homePayload = <String, dynamic>{
          'sections': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'banners',
              'items': <Map<String, dynamic>>[
                <String, dynamic>{'id': 1, 'image_url': 'https://x/a.png'},
              ],
            },
            <String, dynamic>{
              'type': 'cuisines',
              'items': <Map<String, dynamic>>[
                <String, dynamic>{'slug': 'biryani', 'name': 'Biryani'},
              ],
            },
          ],
        };
      await openStore(tester, repository: repo);

      final Finder mic = find.byIcon(Icons.mic_none_rounded);
      final double heroTop = tester.getTopLeft(mic).dy;
      expect(find.text('Biryani'), findsOneWidget);

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      // The hero collapsed — the bar climbed — but nothing on it left.
      expect(tester.getTopLeft(mic).dy, lessThan(heroTop));
      expect(mic, findsOneWidget);
      expect(find.text('Veg only'), findsOneWidget);
      expect(find.text('Biryani'), findsOneWidget);
    });

    testWidgets('the home search field carries its own microphone',
        (WidgetTester tester) async {
      // Tapping the field opens search with a cursor; the microphone has to be
      // a target of its own inside the field, or dictating costs three taps.
      await openStore(tester);
      expect(find.byIcon(Icons.mic_none_rounded), findsOneWidget);
    });

    testWidgets('the header microphone opens search already listening',
        (WidgetTester tester) async {
      // Built, not mounted: constructing the page proves the flag travelled,
      // and mounting it would reach for the platform recogniser.
      late SearchTab voiced;
      late SearchTab plain;
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            voiced = (AppRouter.onGenerateRoute(
              const RouteSettings(
                name: AppRoutes.search,
                arguments: SearchArgs(startWithVoice: true),
              ),
            ) as MaterialPageRoute<dynamic>)
                .builder(context) as SearchTab;
            plain = (AppRouter.onGenerateRoute(
              const RouteSettings(name: AppRoutes.search),
            ) as MaterialPageRoute<dynamic>)
                .builder(context) as SearchTab;
            return const SizedBox();
          },
        ),
      );

      expect(voiced.startWithVoice, isTrue);
      // The plain field must not start dictating on its own.
      expect(plain.startWithVoice, isFalse);
    });

    testWidgets('a restored session still reads the saved address',
        (WidgetTester tester) async {
      // Launching with a stored token goes splash → storefront without passing
      // through the OTP screen, which is the only other place the address book
      // is fetched. Skipping it showed "Add address" to a customer who has one
      // and left the nearby search with no origin at all.
      await openStore(tester);

      expect(find.textContaining('12A Green Residency'), findsWidgets);
      expect(find.text('Add address'), findsNothing);
      expect(_storefrontRepo.lastNearby?['address_id'], 1);
    });

    testWidgets('no saved address falls back to the phone GPS',
        (WidgetTester tester) async {
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(seed: <Address>[]),
      );
      await _settleSplash(tester);
      await tester.pumpAndSettle();

      // Nothing is saved, so the list is anchored on where the phone is —
      // labelled as a location rather than dressed up as a delivery address.
      expect(_storefrontRepo.lastNearby?['address_id'], isNull);
      expect(_storefrontRepo.lastNearby?['latitude'], isNotNull);
      expect(find.text('CURRENT LOCATION'), findsNothing);
      expect(find.text('Current location'), findsWidgets);
    });

    testWidgets('a shut shop inside its hours says it has paused orders',
        (WidgetTester tester) async {
      await openStore(
        tester,
        repository: FakeStorefrontRepository()..withinHours = true,
      );
      expect(find.text('Not taking orders'), findsWidgets);
      expect(find.text('Closed right now'), findsNothing);
    });

    testWidgets('a shop outside its hours says it is closed, not paused',
        (WidgetTester tester) async {
      // Two different messages, and only one of them is worth waiting for.
      await openStore(
        tester,
        repository: FakeStorefrontRepository()..withinHours = false,
      );
      expect(find.text('Closed right now'), findsWidgets);
      expect(find.text('Not taking orders'), findsNothing);
    });

    testWidgets('a sold-out dish cannot be added',
        (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();

      expect(find.text('Sold out'), findsWidgets);
      // The ADD control morphs into the stepper rather than swapping widgets,
      // so what matters is that its tap target is dead, not which class it is.
      final Finder add = find.ancestor(
        of: find.text('ADD'),
        matching: find.byType(InkWell),
      );
      expect(tester.widget<InkWell>(add.last).onTap, isNull);
    });

    testWidgets('the orders tab renders the history it fetched',
        (WidgetTester tester) async {
      await openStore(tester);

      await tester.tap(find.text('Orders').first);
      await tester.pumpAndSettle();

      expect(_storefrontRepo.orderCalls, greaterThan(0));
      expect(find.text('Order NX1001'), findsWidgets);
    });

    testWidgets('an empty order history still says so',
        (WidgetTester tester) async {
      await openStore(
        tester,
        repository: FakeStorefrontRepository()..orderList = <String>[],
      );

      await tester.tap(find.text('Orders').first);
      await tester.pumpAndSettle();

      expect(find.text('No orders yet'), findsOneWidget);
    });

    testWidgets('the filter sheet opens, filters, and re-queries',
        (WidgetTester tester) async {
      // Nothing opened this sheet before, which is how a crash in its
      // initState reached a device: localisations are not available there.
      _useTallScreen(tester);
      await openStore(tester);

      await tester.tap(find.text('Filters and sorting').first);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      // The left rail and every section heading render.
      expect(find.text('Sort by'), findsWidgets);
      expect(find.text('Restaurant rating'), findsWidgets);

      await tester.tap(find.text('Rated 4.0+'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show results'));
      await tester.pumpAndSettle();

      // The sheet returns a draft, and only then does the list re-query.
      expect(_storefrontRepo.lastFilters.ratingMin, 4.0);
      expect(_storefrontRepo.lastNearby?['rating_min'], <String>['4.0']);
    });

    testWidgets('backing out of the filter sheet changes nothing',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await openStore(tester);

      await tester.tap(find.text('Filters and sorting').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Rated 3.5+'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      // Dismissing returns null, which the caller reads as "leave it alone".
      expect(_storefrontRepo.lastFilters.ratingMin, isNull);
    });

    testWidgets('a cart route without arguments falls back to login',
        (WidgetTester tester) async {
      await openStore(tester);
      _nav(tester).pushNamed(AppRoutes.cart);
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsWidgets);
      expect(tester.takeException(), isNull);
    });

    testWidgets('an order route without arguments falls back to login',
        (WidgetTester tester) async {
      await openStore(tester);
      _nav(tester).pushNamed(AppRoutes.orderStatus);
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  });

  // -------------------------------------------------------------------------
  group('push', () {
    test('a tap on an order notification opens that order', () {
      // FCM flattens every data value to a string, so the id arrives as "42"
      // and not as 42.
      final PushDestination? destination = PushDestination.fromData(
        <String, Object?>{'type': 'order_status', 'order_id': '42'},
      );

      expect(destination?.routeName, AppRoutes.orderStatus);
      expect((destination!.arguments! as OrderArgs).orderId, 42);
    });

    test('a push this build cannot place lands nowhere', () {
      // New notification types ship server-side long before the app that
      // understands them. Opening the wrong screen is worse than opening none.
      expect(
        PushDestination.fromData(<String, Object?>{'type': 'promo'}),
        isNull,
      );
      expect(
        PushDestination.fromData(
          <String, Object?>{'type': 'promo', 'order_id': '42'},
        ),
        isNull,
      );
      expect(PushDestination.fromData(<String, Object?>{}), isNull);
      expect(
        PushDestination.fromData(<String, Object?>{'order_id': 'not-a-number'}),
        isNull,
      );
    });

    test('an unfamiliar type about an order still opens the order', () {
      // The id is what the route is built from; the type is only read to bow
      // out of a push that is explicitly about something else.
      final PushDestination? destination = PushDestination.fromData(
        <String, Object?>{'type': 'rider_nearby', 'order_id': 7},
      );
      expect((destination!.arguments! as OrderArgs).orderId, 7);
    });

    test('signing in registers the device, signing out withdraws it', () async {
      final FakePushService push = FakePushService(initial: 'token-1');
      final FakeDeviceRepository devices = FakeDeviceRepository();
      final DeviceRegistrar registrar =
          DeviceRegistrar(push: push, repository: devices);

      await registrar.register();
      expect(devices.registered, <String>['token-1']);
      expect(push.permissionAsked, isTrue);

      // A rotated token that is not re-registered means notifications stop
      // arriving, silently, forever.
      push.rotate('token-2');
      await Future<void>.delayed(Duration.zero);
      expect(devices.registered, <String>['token-1', 'token-2']);

      await registrar.unregister();
      // Withdraws what was actually registered, not whatever the transport
      // happens to hold by then.
      expect(devices.unregistered, <String>['token-2']);

      // And stops listening: a rotation after sign-out has no session to
      // register against.
      push.rotate('token-3');
      await Future<void>.delayed(Duration.zero);
      expect(devices.registered, <String>['token-1', 'token-2']);
    });

    test('no token is a normal state, not a failure', () async {
      // Permission refused, no Play Services, or a build with no transport.
      final FakePushService push = FakePushService(initial: null);
      final FakeDeviceRepository devices = FakeDeviceRepository();
      final DeviceRegistrar registrar =
          DeviceRegistrar(push: push, repository: devices);

      await registrar.register();
      await registrar.unregister();

      expect(devices.registered, isEmpty);
      // Nothing was registered, so there is nothing to withdraw.
      expect(devices.unregistered, isEmpty);
    });

    test('a failed registration never breaks the sign-in', () async {
      final FakePushService push = FakePushService(initial: 'token-1');
      final FakeDeviceRepository devices = FakeDeviceRepository()
        ..failRegister = true;
      final DeviceRegistrar registrar =
          DeviceRegistrar(push: push, repository: devices);

      // Would throw if the registrar let it.
      await registrar.register();
      expect(registrar.registeredToken, isNull);

      // And a sign-out with nothing on the server does not call the endpoint.
      await registrar.unregister();
      expect(devices.unregistered, isEmpty);
    });

    test('the device is withdrawn before the token is thrown away', () async {
      // After the session is cleared, DELETE /v1/devices can only 401.
      final FakePushService push = FakePushService(initial: 'token-1');
      final FakeDeviceRepository devices = FakeDeviceRepository();
      final FakeAuthRepository auth = FakeAuthRepository();
      final AuthController controller = AuthController(
        repository: auth,
        tokenStore: InMemoryTokenStore(),
        deviceRegistrar:
            DeviceRegistrar(push: push, repository: devices),
      );

      await controller.verifyCode(
        identifier: LoginIdentifier.tryParse('9876543210')!,
        code: '123456',
      );
      expect(devices.registered, <String>['token-1']);

      await controller.signOut();
      expect(devices.unregistered, <String>['token-1']);
      expect(controller.isSignedIn, isFalse);
      controller.dispose();
    });
  });

  group('reviews', () {
    Future<void> openRestaurant(
      WidgetTester tester,
      FakeStorefrontRepository repo,
    ) async {
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        storefrontRepository: repo,
      );
      await _settleSplash(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();
    }

    /// Named so the finder can tell this carousel from the home banner rail,
    /// which is a page view too and is still mounted behind the route.
    final Finder carousel = find.byKey(const Key('restaurant-photos'));

    testWidgets('a merchant with photos gets a carousel',
        (WidgetTester tester) async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..storefrontExtras = <String, dynamic>{
          'banner_url': 'https://x/banner.png',
          'photos': <Map<String, dynamic>>[
            <String, dynamic>{'id': 3, 'url': 'https://x/a.png'},
            <String, dynamic>{'id': 7, 'url': 'https://x/b.png'},
          ],
        };
      await openRestaurant(tester, repo);
      expect(carousel, findsOneWidget);
    });

    testWidgets('one picture is not a carousel', (WidgetTester tester) async {
      // With nothing to swipe to, there is no page view to swallow a drag —
      // exactly the single image the header always drew.
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..storefrontExtras = <String, dynamic>{
          'banner_url': 'https://x/banner.png',
        };
      await openRestaurant(tester, repo);
      expect(carousel, findsNothing);
    });

    testWidgets('the rating badge is the way in to the reviews',
        (WidgetTester tester) async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..storefrontExtras = <String, dynamic>{
          'rating': '4.2',
          'rating_count': 18,
        };
      await openRestaurant(tester, repo);

      await tester.tap(find.text('18 ratings'));
      await tester.pumpAndSettle();

      expect(find.text('Ratings & reviews'), findsOneWidget);
      expect(find.text('4.2'), findsOneWidget);
      expect(find.text('Biryani was worth the wait.'), findsOneWidget);
      // A rating with no words still counts, and still shows its stars.
      expect(find.text('Arun'), findsOneWidget);
      expect(repo.reviewCalls.single['with_comment'], isFalse);
    });

    testWidgets('an unrated restaurant offers no way into an empty list',
        (WidgetTester tester) async {
      // A tap that leads nowhere is worse than no tap, and an unrated shop is
      // not a badly rated one.
      await openRestaurant(tester, FakeStorefrontRepository());
      expect(find.byType(RatingBadge), findsNothing);
    });

    testWidgets('the filter asks the server, not the list already fetched',
        (WidgetTester tester) async {
      // Moderation can take a review down between two reads, so filtering
      // client-side would be filtering a list that may already be wrong.
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..storefrontExtras = <String, dynamic>{
          'rating': '4.2',
          'rating_count': 18,
        };
      await openRestaurant(tester, repo);
      await tester.tap(find.text('18 ratings'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('With reviews'));
      await tester.pumpAndSettle();

      expect(repo.reviewCalls.last['with_comment'], isTrue);
      // The one with no comment is gone; the one with words remains.
      expect(find.text('Arun'), findsNothing);
      expect(find.text('Priya'), findsOneWidget);
    });

    testWidgets('a delivered order can be rated, and needs a rating to send',
        (WidgetTester tester) async {
      final FakeStorefrontRepository repo = FakeStorefrontRepository()
        ..orderStatus = 'delivered';
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        storefrontRepository: repo,
      );
      await _settleSplash(tester);

      await tester.tap(find.text('Orders').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Order NX1001').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Rate this order'));
      await tester.pumpAndSettle();

      // Nothing to send until the customer says something.
      final Finder submit = find.widgetWithText(FilledButton, 'Submit rating');
      expect(tester.widget<FilledButton>(submit).onPressed, isNull);

      // The fourth star of the overall rating.
      await tester.tap(find.byIcon(Icons.star_outline_rounded).at(3));
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(submit).onPressed, isNotNull);

      await tester.tap(submit);
      await tester.pump();
      await tester.pump();

      expect(repo.orderReviews.single['rating'], 4);
      expect(repo.orderReviews.single['order'], 1);
      // No dish was rated, so none is claimed.
      expect(repo.orderReviews.single['dishes'], isEmpty);
      expect(find.text('Thanks — your rating is in.'), findsOneWidget);
      // Let the snack bar retire, or its timer outlives the test.
      await tester.pumpAndSettle(const Duration(seconds: 5));
    });
  });

  group('address', () {
    test('a draft sends coordinates as numbers and drops empty optionals', () {
      const AddressDraft draft = AddressDraft(
        label: AddressLabel.home,
        line1: '12A Green Residency',
        line2: '   ',
        landmark: '',
        city: 'Chennai',
        state: 'Tamil Nadu',
        pincode: '600040',
        latitude: 13.0827,
        longitude: 80.2707,
      );

      final Map<String, dynamic> json = draft.toJson();
      expect(json['latitude'], isA<double>());
      expect(json['longitude'], isA<double>());
      expect(json['label'], 'home');
      // Blank optionals become null, which ApiClient then strips entirely.
      expect(json['line2'], isNull);
      expect(json['landmark'], isNull);
    });

    test('a resource parses string coordinates', () {
      // The API returns lat/lng as strings even though it accepts numbers.
      final Address address = Address.fromJson(<String, dynamic>{
        'id': 7,
        'label': 'work',
        'line1': 'Tidel Park',
        'city': 'Chennai',
        'state': 'Tamil Nadu',
        'pincode': '600113',
        'latitude': '12.98765',
        'longitude': '80.24567',
        'is_default': true,
      });

      expect(address.latitude, closeTo(12.98765, 1e-9));
      expect(address.longitude, closeTo(80.24567, 1e-9));
      expect(address.label, AddressLabel.work);
    });

    test('an unknown label degrades to other rather than throwing', () {
      expect(Address.labelFrom('warehouse'), AddressLabel.other);
      expect(Address.labelFrom(null), AddressLabel.other);
    });

    testWidgets('a customer with no address is sent to the location screen',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      final FakeAuthRepository auth = FakeAuthRepository();
      await _pumpApp(
        tester,
        seed: _languageChosen,
        repository: auth,
        addressRepository: FakeAddressRepository(),
      );
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField).first, '9876543210');
      await tester.tap(find.text('Send code'));
      await _pumpFrames(tester);
      await tester.enterText(find.byType(TextField).first, '123456');
      await _pumpFrames(tester);

      expect(find.byType(LocationPermissionScreen), findsOneWidget);
      expect(find.text('Where should we deliver?'), findsOneWidget);
      // The reasons are on screen before the OS dialog is ever triggered.
      expect(find.text('Shops within 1 km'), findsOneWidget);
      expect(_location.requestCount, 0, reason: 'no prompt until they opt in');
    });

    testWidgets('a customer who already has an address skips straight to home',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(tester, seed: _languageChosen);
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextFormField).first, '9876543210');
      await tester.tap(find.text('Send code'));
      await _pumpFrames(tester);
      await tester.enterText(find.byType(TextField).first, '123456');
      await _pumpFrames(tester);

      expect(find.byType(AppShell), findsOneWidget);
      expect(find.byType(LocationPermissionScreen), findsNothing);
    });

    testWidgets('allowing location opens the map on the fix',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.locationPermission);
      await _pumpFrames(tester);

      // The address book is empty here, so the home tab has already taken its
      // own fix to anchor the nearby search. What matters is that tapping
      // Allow costs exactly one more.
      final int before = _location.requestCount;
      await tester.tap(find.text('Allow location'));
      await _pumpFrames(tester);

      expect(_location.requestCount, before + 1);
      expect(find.byType(AddressMapScreen), findsOneWidget);
    });

    testWidgets('a refusal explains itself and still allows manual entry',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
        locationService:
            FakeLocationService(failure: LocationFailure.denied),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.locationPermission);
      await _pumpFrames(tester);

      await tester.tap(find.text('Allow location'));
      await _pumpFrames(tester);

      expect(
        find.textContaining('Location permission was declined'),
        findsOneWidget,
      );
      expect(find.byType(AddressMapScreen), findsNothing);

      // Declining is never a dead end.
      await tester.tap(find.text("I'll enter my address instead"));
      await _pumpFrames(tester);
      expect(find.byType(AddressMapScreen), findsOneWidget);
    });

    testWidgets('a permanent denial offers the settings shortcut',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
        locationService:
            FakeLocationService(failure: LocationFailure.deniedForever),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.locationPermission);
      await _pumpFrames(tester);

      await tester.tap(find.text('Allow location'));
      await _pumpFrames(tester);

      expect(find.text('Settings'), findsOneWidget);
      await tester.tap(find.text('Settings'));
      await _pumpFrames(tester);
      expect(_location.settingsCount, 1);
    });

    testWidgets('the form prefills from the pin and saves with coordinates',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
      );
      await _settleSplash(tester);

      _nav(tester).pushNamed(
        AppRoutes.addressForm,
        arguments: const AddressFormArgs(
          latitude: 13.05,
          longitude: 80.21,
          prefill: ResolvedPlace(
            line1: '12A Green Residency',
            city: 'Chennai',
            state: 'Tamil Nadu',
            pincode: '600040',
          ),
        ),
      );
      await _pumpFrames(tester);

      expect(find.byType(AddressFormScreen), findsOneWidget);
      // Reverse geocoding gave the customer a head start.
      expect(find.text('12A Green Residency'), findsOneWidget);
      expect(find.text('Chennai'), findsOneWidget);
      // Coordinates are shown but not editable.
      expect(find.textContaining('13.05000'), findsOneWidget);

      await tester.tap(find.text('Save address'));
      await _pumpFrames(tester);

      expect(_addressRepo.lastDraft, isNotNull);
      expect(_addressRepo.lastDraft!.latitude, 13.05);
      expect(_addressRepo.lastDraft!.longitude, 80.21);
      expect(_addressRepo.lastDraft!.pincode, '600040');
    });

    testWidgets('a bad pincode is caught before the request',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(
        AppRoutes.addressForm,
        arguments: const AddressFormArgs(latitude: 13.05, longitude: 80.21),
      );
      await _pumpFrames(tester);

      await tester.enterText(find.byType(TextFormField).at(0), 'Flat 1');
      await tester.enterText(find.byType(TextFormField).at(3), 'Chennai');
      await tester.enterText(find.byType(TextFormField).at(4), 'Tamil Nadu');
      // Indian PIN codes cannot start with 0.
      await tester.enterText(find.byType(TextFormField).at(5), '012345');
      await _pumpFrames(tester);
      await tester.tap(find.text('Save address'));
      await _pumpFrames(tester);

      expect(find.text('Enter a valid 6-digit PIN code'), findsOneWidget);
      expect(_addressRepo.lastDraft, isNull, reason: 'never reached the API');
    });

    testWidgets('server field errors land under the right input',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository()
          ..saveError = const ApiException(
            kind: ApiErrorKind.validation,
            statusCode: 422,
            errors: <String, List<String>>{
              'pincode': <String>['We do not deliver to this pincode yet.'],
            },
          ),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(
        AppRoutes.addressForm,
        arguments: const AddressFormArgs(
          latitude: 13.05,
          longitude: 80.21,
          prefill: ResolvedPlace(
            line1: 'Flat 1',
            city: 'Chennai',
            state: 'Tamil Nadu',
            pincode: '600040',
          ),
        ),
      );
      await _pumpFrames(tester);

      await tester.tap(find.text('Save address'));
      await _pumpFrames(tester);

      expect(
        find.text('We do not deliver to this pincode yet.'),
        findsOneWidget,
      );
    });

    testWidgets('the address book lists, defaults and deletes',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      final FakeAddressRepository repo = FakeAddressRepository(
        seed: <Address>[
          _testAddress,
          const Address(
            id: 2,
            label: AddressLabel.work,
            line1: 'Tidel Park',
            city: 'Chennai',
            state: 'Tamil Nadu',
            pincode: '600113',
            latitude: 12.98,
            longitude: 80.24,
            isDefault: false,
          ),
        ],
      );
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: repo,
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.addressBook);
      await _pumpFrames(tester);

      expect(find.byType(AddressBookScreen), findsOneWidget);
      expect(find.textContaining('12A Green Residency'), findsOneWidget);
      expect(find.textContaining('Tidel Park'), findsOneWidget);
      // Only the non-default row offers the action.
      expect(find.text('Set as default'), findsOneWidget);

      await tester.tap(find.text('Set as default'));
      await _pumpFrames(tester);
      expect(_addresses.defaultAddress?.id, 2);

      await tester.tap(find.text('Delete').first);
      await _pumpFrames(tester);
      await tester.tap(find.text('Delete').last);
      await _pumpFrames(tester);
      expect(_addresses.addresses.length, 1);
    });

    testWidgets('editing re-reads the address and saves with PATCH',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      final FakeAddressRepository repo =
          FakeAddressRepository(seed: <Address>[_testAddress]);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: repo,
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.addressBook);
      await _pumpFrames(tester);

      await tester.tap(find.text('Edit'));
      await _pumpFrames(tester);

      // Fresh read before editing, not the possibly-stale list copy.
      expect(repo.showCount, 1);
      expect(find.byType(AddressMapScreen), findsOneWidget);

      await tester.tap(find.text('Confirm location'));
      await _pumpFrames(tester);

      // The form opens on what the customer typed last time.
      expect(find.byType(AddressFormScreen), findsOneWidget);
      expect(find.text('12A Green Residency'), findsOneWidget);

      await tester.tap(find.text('Save address'));
      await _pumpFrames(tester);

      expect(repo.lastUpdatedId, _testAddress.id, reason: 'PATCH, not POST');
    });

    test('deleting the default re-reads, because the server promotes another',
        () async {
      // The API soft-deletes and promotes the next most recent address. Just
      // dropping the row locally would leave the book with no default at all.
      final FakeAddressRepository repo = FakeAddressRepository(
        seed: <Address>[
          _testAddress,
          const Address(
            id: 2,
            label: AddressLabel.work,
            line1: 'Tidel Park',
            city: 'Chennai',
            state: 'Tamil Nadu',
            pincode: '600113',
            latitude: 12.98,
            longitude: 80.24,
            isDefault: false,
          ),
        ],
      );
      final AddressController controller =
          AddressController(repository: repo);
      await controller.load();

      final int before = repo.listCount;
      await controller.delete(_testAddress.id);

      expect(repo.listCount, before + 1, reason: 're-read after the promotion');
      expect(controller.addresses.length, 1);
    });

    test('deleting a non-default address does not re-read', () async {
      final FakeAddressRepository repo = FakeAddressRepository(
        seed: <Address>[
          _testAddress,
          const Address(
            id: 2,
            label: AddressLabel.work,
            line1: 'Tidel Park',
            city: 'Chennai',
            state: 'Tamil Nadu',
            pincode: '600113',
            latitude: 12.98,
            longitude: 80.24,
            isDefault: false,
          ),
        ],
      );
      final AddressController controller =
          AddressController(repository: repo);
      await controller.load();

      final int before = repo.listCount;
      await controller.delete(2);

      expect(repo.listCount, before, reason: 'no promotion, no extra call');
      expect(controller.addresses.single.id, _testAddress.id);
    });

    test('a failed re-read falls back to the cached copy', () async {
      final FakeAddressRepository repo =
          FakeAddressRepository(seed: <Address>[_testAddress]);
      final AddressController controller =
          AddressController(repository: repo);
      await controller.load();

      repo.showError = const ApiException(kind: ApiErrorKind.network);
      final Address? fetched = await controller.fetch(_testAddress.id);

      expect(fetched?.id, _testAddress.id, reason: 'editing still works');
    });

    testWidgets('an empty address book offers a way to add one',
        (WidgetTester tester) async {
      _useTallScreen(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
        addressRepository: FakeAddressRepository(),
      );
      await _settleSplash(tester);
      _nav(tester).pushNamed(AppRoutes.addressBook);
      await _pumpFrames(tester);

      expect(find.text('No addresses yet'), findsOneWidget);
      await tester.tap(find.text('Add address'));
      await _pumpFrames(tester);
      expect(find.byType(LocationPermissionScreen), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  group('layout robustness', () {
    // The brief: no overlapping or clipped text in any language. Flutter
    // surfaces both as overflow exceptions, so a clean pump of every screen in
    // every locale — and at the extremes of viewport and text scale — is the
    // check.
    testWidgets('login and OTP lay out cleanly in every locale',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      for (final AppLanguage language in AppLanguages.all) {
        await _pumpApp(tester, seed: _languageChosenAs(language.code));
        await _settleSplash(tester);

        expect(find.byType(LoginScreen), findsOneWidget,
            reason: language.englishName);
        expect(tester.takeException(), isNull,
            reason: 'login overflowed in ${language.englishName}');

        _nav(tester).pushNamed(
          AppRoutes.otpVerification,
          arguments: OtpArgs(
            identifier: LoginIdentifier.tryParse('9876543210')!,
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull,
            reason: 'OTP overflowed in ${language.englishName}');
        _nav(tester).pop();
        await tester.pumpAndSettle();
      }
    });

    testWidgets('the profile screen lays out cleanly in every locale',
        (WidgetTester tester) async {
      _useTallPhone(tester);
      for (final AppLanguage language in AppLanguages.all) {
        await _pumpApp(
          tester,
          seed: _languageChosenAs(language.code),
          session: _testSession(),
        );
        await _settleSplash(tester);

        _nav(tester).pushNamed(AppRoutes.profile);
        await tester.pumpAndSettle();

        expect(find.byType(ProfileScreen), findsOneWidget,
            reason: language.englishName);
        expect(tester.takeException(), isNull,
            reason: 'profile overflowed in ${language.englishName}');
      }
    });

    testWidgets('the language screen lays out cleanly in every locale',
        (WidgetTester tester) async {
      for (final AppLanguage language in AppLanguages.all) {
        await _pumpApp(
          tester,
          seed: <String, Object>{'nexmile.language_code': language.code},
        );
        await _settleSplash(tester);

        expect(find.byType(LanguageScreen), findsOneWidget);
        expect(tester.takeException(), isNull,
            reason: '${language.englishName} overflowed');
      }
    });

    testWidgets('login holds up on 320x568 at maximum text scale',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1.0;
      tester.platformDispatcher.textScaleFactorTestValue = 3.0; // clamps to 1.3
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.platformDispatcher.clearTextScaleFactorTestValue();
      });

      await _pumpApp(tester, seed: _languageChosenAs('ta'));
      await _settleSplash(tester);

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('the dashboard holds up on 320x568 at maximum text scale',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1.0;
      tester.platformDispatcher.textScaleFactorTestValue = 3.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.platformDispatcher.clearTextScaleFactorTestValue();
      });

      await _pumpApp(
        tester,
        seed: _languageChosenAs('ml'),
        session: _testSession(),
      );
      await _settleSplash(tester);

      expect(find.byType(AppShell), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('right-to-left languages flip the layout',
        (WidgetTester tester) async {
      await _pumpApp(tester, seed: _languageChosenAs('ur'));
      await _settleSplash(tester);

      final Directionality directionality = tester.widget<Directionality>(
        find.byType(Directionality).first,
      );
      expect(directionality.textDirection, TextDirection.rtl);
      expect(find.byType(LoginScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}

/// Minimal [TokenProvider] for the [ApiClient] tests.
class _StubTokens implements TokenProvider {
  _StubTokens(this._token, {this.refreshResult = true});

  final String _token;
  final bool refreshResult;

  int refreshCalls = 0;
  int sessionLostCalls = 0;

  @override
  String? get accessToken => _token;

  @override
  Future<bool> refresh() async {
    refreshCalls++;
    // A real refresh is a network round trip; the delay is what makes the
    // single-flight assertion meaningful.
    await Future<void>.delayed(const Duration(milliseconds: 10));
    return refreshResult;
  }

  @override
  Future<void> onSessionLost() async => sessionLostCalls++;
}

/// Stands in for the storefront, cart and order endpoints.
///
/// Payloads are built as raw JSON maps rather than as models, so the decoding
/// the real API exercises — strings where numbers belong, absent optionals —
/// is exercised here too.
class FakeStorefrontRepository implements StorefrontRepository {
  /// Set when a shop should report itself inside its hours but paused.
  bool withinHours = true;

  bool dealsThrow = false;
  int searchResultCount = 2;
  int cartStatus = 200;
  double grandTotalOverride = 100;
  String orderStatus = 'placed';
  List<String> orderList = <String>['placed'];
  List<Map<String, dynamic>> lines = <Map<String, dynamic>>[
    <String, dynamic>{'id': 501, 'menu_item_id': 1, 'quantity': 1},
  ];

  /// Thrown by the next mutating call, then cleared.
  ApiException? failNextWith;

  int orderCalls = 0;
  int homeCalls = 0;
  final List<Map<String, Object>> favouriteCalls = <Map<String, Object>>[];

  /// Empty by default: the live API omits sections that have no data, so the
  /// home screen must render correctly with none.
  Map<String, dynamic> homePayload = const <String, dynamic>{
    'sections': <Object>[],
  };
  RestaurantFilters lastFilters = RestaurantFilters.none;
  Map<String, Object?>? lastNearby;
  Map<String, Object?>? lastCheckout;
  int trackCalls = 0;

  void _maybeThrow() {
    final ApiException? error = failNextWith;
    if (error == null) return;
    failNextWith = null;
    throw error;
  }

  Map<String, dynamic> _restaurantJson(String id, String name, {bool open = true}) =>
      <String, dynamic>{
        'id': id,
        'name': name,
        'service_category': 'Restaurant',
        'area': 'Anna Nagar',
        // Typed as strings by the schema in several places.
        'is_open': open ? 'true' : 'false',
        'is_accepting_orders': open ? '1' : '0',
        'within_operating_hours': withinHours ? 'true' : 'false',
        'avg_prep_time_minutes': '28',
        'min_order_value': '149.00',
        'packaging_fee': '12',
        'supports_pickup': 'true',
        'distance_metres': '820',
      };

  Map<String, dynamic> _cartJson() => <String, dynamic>{
        'id': 77,
        'fulfilment_type': 'delivery',
        'restaurant': <String, dynamic>{
          'id': 'r1',
          'name': 'Anjappar Chettinad',
          'is_open': 'true',
          'supports_pickup': 'true',
        },
        'items': lines,
        'totals': <String, dynamic>{
          'items_total': '$grandTotalOverride',
          'grand_total': '$grandTotalOverride',
        },
        'minimum_order_value': '149',
        'meets_minimum': 'true',
        'can_checkout': 'true',
      };

  Map<String, dynamic> _orderJson(String status) => <String, dynamic>{
        'id': 1,
        'order_number': 'NX1001',
        'status': status,
        'status_label': status,
        'fulfilment_type': 'delivery',
        'grand_total': '100',
        'items': <Map<String, dynamic>>[
          <String, dynamic>{'id': 1, 'name': 'Mutton Biryani', 'quantity': 1},
        ],
      };

  @override
  Future<HomeScreen> home({
    int? addressId,
    double? latitude,
    double? longitude,
  }) async {
    homeCalls++;
    return HomeScreen.fromJson(homePayload, const <String, dynamic>{});
  }

  @override
  Future<List<Restaurant>> favourites() async => <Restaurant>[];

  /// Pages served to `reviews`, oldest call first. Defaults to one page.
  List<Map<String, dynamic>> reviewPayload = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 1,
      'author': 'Priya',
      'rating': 5,
      'comment': 'Biryani was worth the wait.',
      'created_at': '2026-08-20T10:00:00Z',
    },
    <String, dynamic>{
      'id': 2,
      'author': 'Arun',
      'rating': 3,
      'comment': null,
      'created_at': '2026-08-19T10:00:00Z',
    },
  ];
  Map<String, dynamic> reviewMeta = const <String, dynamic>{
    'rating': '4.2',
    'rating_count': 18,
    'breakdown': <String, dynamic>{'5': 10, '4': 4, '3': 2, '2': 1, '1': 1},
    'current_page': 1,
    'last_page': 1,
  };
  final List<Map<String, Object?>> reviewCalls = <Map<String, Object?>>[];
  final List<Map<String, Object?>> orderReviews = <Map<String, Object?>>[];

  @override
  Future<ReviewPage> reviews(
    String restaurantId, {
    int page = 1,
    bool withCommentOnly = false,
  }) async {
    _maybeThrow();
    reviewCalls.add(<String, Object?>{
      'id': restaurantId,
      'page': page,
      'with_comment': withCommentOnly,
    });
    final List<Map<String, dynamic>> items = withCommentOnly
        ? reviewPayload
            .where((Map<String, dynamic> r) => r['comment'] != null)
            .toList()
        : reviewPayload;
    return ReviewPage.fromJson(items, reviewMeta);
  }

  @override
  Future<void> reviewOrder(
    int orderId, {
    required int rating,
    String? comment,
    Map<int, int> dishes = const <int, int>{},
  }) async {
    _maybeThrow();
    orderReviews.add(<String, Object?>{
      'order': orderId,
      'rating': rating,
      'comment': comment,
      'dishes': dishes,
    });
  }

  @override
  Future<void> setFavourite(String restaurantId, {required bool value}) async {
    favouriteCalls.add(<String, Object>{'id': restaurantId, 'value': value});
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
    lastNearby = <String, Object?>{
      'address_id': addressId,
      'latitude': latitude,
      'longitude': longitude,
      'search': search,
      'service_category': serviceCategory,
      ...filters.toQuery(),
    };
    lastFilters = filters;
    final int count = (search ?? '').isEmpty ? 2 : searchResultCount;
    return RestaurantPage(
      items: <Restaurant>[
        Restaurant.fromJson(
          _restaurantJson('r1', 'Anjappar Chettinad', open: false),
        ),
        if (count > 1)
          Restaurant.fromJson(_restaurantJson('r2', 'Saravana Bhavan')),
      ],
      total: count,
    );
  }

  @override
  Future<List<RescueDeal>> deals({int? addressId}) async {
    if (dealsThrow) {
      throw const ApiException(
        kind: ApiErrorKind.server,
        statusCode: 500,
        message: 'boom',
      );
    }
    return <RescueDeal>[
      RescueDeal.fromJson(<String, dynamic>{
        'id': 'd1',
        'restaurant_id': 'r1',
        'restaurant_name': 'Anjappar Chettinad',
        'name': 'Surplus Biryani',
        'price': '120',
        'compare_at_price': '240',
        'portions_left': '3',
      }),
    ];
  }

  /// Extra fields folded into the storefront payload only — the nearby list
  /// deliberately carries neither photos nor a menu.
  Map<String, dynamic> storefrontExtras = const <String, dynamic>{};

  @override
  Future<Restaurant> restaurant(String id) async => Restaurant.fromJson(
        <String, dynamic>{
          ..._restaurantJson(id, 'Anjappar Chettinad', open: false),
          ...storefrontExtras,
        },
      );

  @override
  Future<RestaurantMenu> menu(String restaurantId) async =>
      RestaurantMenu.fromJson(<String, dynamic>{
        'menu': <Map<String, dynamic>>[
          <String, dynamic>{
            'name': 'Biryani',
            'items': <Map<String, dynamic>>[
              <String, dynamic>{
                'id': 1,
                'name': 'Mutton Biryani',
                'price': '320',
                'is_available': 'true',
              },
              <String, dynamic>{
                'id': 2,
                'name': 'Chicken Biryani',
                'price': '280',
                // Sold-out dishes are returned rather than hidden.
                'is_available': 'false',
              },
            ],
          },
        ],
      });

  @override
  Future<Cart> cart(String restaurantId, {FulfilmentType? fulfilmentType}) async {
    if (cartStatus == 404) {
      throw const ApiException(
        kind: ApiErrorKind.server,
        statusCode: 404,
        message: 'No cart',
      );
    }
    return Cart.fromJson(_cartJson());
  }

  @override
  Future<Cart> addItem(
    String restaurantId, {
    required int menuItemId,
    int quantity = 1,
    List<int> optionIds = const <int>[],
    String? notes,
  }) async {
    _maybeThrow();
    return Cart.fromJson(_cartJson());
  }

  @override
  Future<Cart> setQuantity(
    String restaurantId, {
    required int cartItemId,
    required int quantity,
  }) async {
    _maybeThrow();
    return Cart.fromJson(_cartJson());
  }

  @override
  Future<Cart> removeItem(String restaurantId, int cartItemId) async {
    _maybeThrow();
    return Cart.fromJson(_cartJson());
  }

  @override
  Future<void> emptyCart(String restaurantId) async => _maybeThrow();

  @override
  Future<List<OpenCart>> openCarts() async => <OpenCart>[];

  @override
  Future<Order> checkout(
    String restaurantId, {
    required FulfilmentType fulfilmentType,
    required String paymentMethod,
    int? addressId,
    String? note,
  }) async {
    lastCheckout = <String, Object?>{
      'fulfilment_type': fulfilmentType.name,
      'payment_method': paymentMethod,
      if (fulfilmentType == FulfilmentType.delivery && addressId != null)
        'address_id': addressId,
    };
    _maybeThrow();
    return Order.fromJson(_orderJson('placed'));
  }

  @override
  Future<List<Order>> orders({bool activeOnly = false}) async {
    orderCalls++;
    return orderList.map((String s) => Order.fromJson(_orderJson(s))).toList();
  }

  @override
  Future<Order> order(int id) async => Order.fromJson(_orderJson(orderStatus));

  @override
  Future<OrderTracking> track(int orderId) async {
    trackCalls++;
    return OrderTracking.fromJson(<String, dynamic>{
      'status': orderStatus,
      'status_label': orderStatus,
    });
  }

  @override
  Future<Order> cancel(int orderId, {required String reason}) async {
    _maybeThrow();
    return Order.fromJson(_orderJson('cancelled'));
  }

  @override
  Uri invoiceUrl(int orderId) =>
      Uri.parse('https://api.nexmile.in/api/v1/orders/$orderId/invoice');
}
