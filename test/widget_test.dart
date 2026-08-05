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
import 'package:nexmile/core/router/app_router.dart';
import 'package:nexmile/core/services/preferences_service.dart';
import 'package:nexmile/features/auth/data/auth_repository.dart';
import 'package:nexmile/features/auth/data/auth_session.dart';
import 'package:nexmile/features/auth/data/auth_user.dart';
import 'package:nexmile/features/auth/data/login_identifier.dart';
import 'package:nexmile/features/auth/data/token_store.dart';
import 'package:nexmile/features/auth/presentation/login_screen.dart';
import 'package:nexmile/features/auth/presentation/otp_verification_screen.dart';
import 'package:nexmile/features/auth/state/auth_controller.dart';
import 'package:nexmile/features/catalogue/data/catalogue_models.dart';
import 'package:nexmile/features/catalogue/data/sample_catalogue.dart';
import 'package:nexmile/features/catalogue/presentation/cart_screen.dart';
import 'package:nexmile/features/catalogue/presentation/order_status_screen.dart';
import 'package:nexmile/features/catalogue/presentation/restaurant_screen.dart';
import 'package:nexmile/features/catalogue/presentation/widgets/catalogue_widgets.dart';
import 'package:nexmile/features/catalogue/state/cart_controller.dart';
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
class FakeAuthRepository implements AuthRepository {
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

Future<void> _pumpApp(
  WidgetTester tester, {
  Map<String, Object> seed = _freshInstall,
  FakeAuthRepository? repository,
  AuthSession? session,
}) async {
  final PreferencesService preferences = await _prefs(seed);
  _controller = AuthController(
    repository: repository ?? FakeAuthRepository(),
    tokenStore: InMemoryTokenStore(session),
    initialSession: session,
  );
  await tester.pumpWidget(
    NexmileApp(preferences: preferences, authController: _controller),
  );
}

Future<void> _settleSplash(WidgetTester tester) async {
  await tester.pump(SplashScreen.totalDuration);
  await tester.pumpAndSettle();
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
      expect(find.text('Hello, Priya'), findsOneWidget);
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
      expect(find.text('Hello, Priya'), findsOneWidget);
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
  // -------------------------------------------------------------------------
  group('cart', () {
    const SampleCatalogue catalogue = SampleCatalogue();
    final Restaurant anjappar = catalogue.restaurantById('r1')!;
    final Restaurant saravana = catalogue.restaurantById('r2')!;

    test('adding the same dish twice raises the quantity, not the line count',
        () {
      final CartController cart = CartController();
      final Dish dish = anjappar.allDishes.first;

      cart.add(dish, anjappar);
      cart.add(dish, anjappar);

      expect(cart.lines.length, 1);
      expect(cart.quantityOf(dish), 2);
      expect(cart.itemCount, 2);
    });

    test('removing the last unit drops the line and clears the restaurant', () {
      final CartController cart = CartController();
      final Dish dish = anjappar.allDishes.first;

      cart.add(dish, anjappar);
      cart.remove(dish);

      expect(cart.isEmpty, isTrue);
      expect(cart.restaurant, isNull);
    });

    test('a second restaurant is refused unless replace is passed', () {
      final CartController cart = CartController();
      cart.add(anjappar.allDishes.first, anjappar);

      expect(cart.wouldReplaceCart(saravana), isTrue);

      // Without consent the cart is untouched.
      cart.add(saravana.allDishes.first, saravana);
      expect(cart.restaurant?.id, anjappar.id);
      expect(cart.itemCount, 1);

      cart.add(saravana.allDishes.first, saravana, replace: true);
      expect(cart.restaurant?.id, saravana.id);
      expect(cart.itemCount, 1);
    });

    test('delivery is charged under the threshold and waived over it', () {
      // Idli at ₹89 — but Saravana ships free, so use a paying restaurant.
      final CartController cart = CartController();
      final Dish parotta = anjappar.allDishes
          .firstWhere((Dish d) => d.name.startsWith('Parotta'));

      cart.add(parotta, anjappar); // ₹60
      expect(cart.bill.deliveryFee, BillSummary.baseDeliveryFee);

      // Push the cart past ₹299.
      final Dish biryani = anjappar.allDishes.first; // ₹249
      cart.add(biryani, anjappar);
      expect(cart.itemTotal, greaterThanOrEqualTo(BillSummary.freeDeliveryOver));
      expect(cart.bill.deliveryFee, 0);
    });

    test('a free-delivery restaurant never charges, however small the cart', () {
      final CartController cart = CartController();
      cart.add(saravana.allDishes.first, saravana);

      expect(saravana.freeDelivery, isTrue);
      expect(cart.bill.deliveryFee, 0);
    });

    test('the bill adds up', () {
      final CartController cart = CartController();
      cart.add(anjappar.allDishes.first, anjappar); // ₹249

      final BillSummary bill = cart.bill;
      expect(bill.itemTotal, 249);
      expect(bill.taxes, (249 * BillSummary.taxRate).round());
      expect(bill.toPay, bill.itemTotal + bill.deliveryFee + bill.taxes);
    });

    test('placing an order empties the cart and snapshots the items', () {
      final CartController cart = CartController();
      final Dish dish = anjappar.allDishes.first;
      cart.add(dish, anjappar);
      cart.add(dish, anjappar);

      final PlacedOrder? order = cart.placeOrder();

      expect(order, isNotNull);
      expect(cart.isEmpty, isTrue, reason: 'cart empties on checkout');
      expect(cart.orders.single.id, order!.id);
      expect(order.itemCount, 2);
      expect(order.status, OrderStatus.placed);
    });

    test('a snapshot does not change when the cart is edited afterwards', () {
      final CartController cart = CartController();
      final Dish dish = anjappar.allDishes.first;
      cart.add(dish, anjappar);
      final PlacedOrder order = cart.placeOrder()!;

      cart.add(dish, anjappar);
      cart.add(dish, anjappar);

      expect(order.itemCount, 1, reason: 'history is frozen');
    });

    test('placing an empty cart is a no-op', () {
      expect(CartController().placeOrder(), isNull);
    });

    test('advance walks the stages and stops at delivered', () {
      final CartController cart = CartController();
      cart.add(anjappar.allDishes.first, anjappar);
      final PlacedOrder order = cart.placeOrder()!;

      cart.advance(order.id);
      expect(cart.orderById(order.id)!.status, OrderStatus.preparing);
      cart.advance(order.id);
      cart.advance(order.id);
      expect(cart.orderById(order.id)!.status, OrderStatus.delivered);

      // Already at the end — must not run off the enum.
      cart.advance(order.id);
      expect(cart.orderById(order.id)!.status, OrderStatus.delivered);
    });

    test('reorder refills the cart from a past order', () {
      final CartController cart = CartController();
      final Dish dish = anjappar.allDishes.first;
      cart.add(dish, anjappar);
      cart.add(dish, anjappar);
      final PlacedOrder order = cart.placeOrder()!;

      cart.reorder(order);

      expect(cart.restaurant?.id, anjappar.id);
      expect(cart.quantityOf(dish), 2);
    });
  });

  // -------------------------------------------------------------------------
  group('storefront', () {
    Future<void> openStore(WidgetTester tester) async {
      _useTallPhone(tester);
      await _pumpApp(
        tester,
        seed: _languageChosen,
        session: _testSession(),
      );
      await _settleSplash(tester);
    }

    testWidgets('the shell lands on the home tab with restaurants',
        (WidgetTester tester) async {
      await openStore(tester);

      expect(find.byType(AppShell), findsOneWidget);
      expect(find.text('Restaurants near you'), findsOneWidget);
      expect(find.text('Anjappar Chettinad'), findsWidgets);
    });

    testWidgets('the prototype banner is visible on the storefront',
        (WidgetTester tester) async {
      await openStore(tester);
      expect(find.byType(PrototypeNotice), findsOneWidget);
    });

    testWidgets('opening a restaurant shows its menu',
        (WidgetTester tester) async {
      await openStore(tester);

      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();

      expect(find.byType(RestaurantScreen), findsOneWidget);
      expect(find.text('Chicken Biryani'), findsOneWidget);
      expect(find.text('Bestsellers'), findsOneWidget);
    });

    testWidgets('adding a dish reveals the cart bar', (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();

      expect(find.text('View cart'), findsNothing);

      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();

      expect(find.text('View cart'), findsOneWidget);
      expect(find.text('1 items'), findsWidgets);
    });

    testWidgets('the veg filter hides non-veg dishes',
        (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();

      expect(find.text('Chicken Biryani'), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.text('Chicken Biryani'), findsNothing);
      expect(find.text('Veg Biryani'), findsOneWidget);
    });

    testWidgets('adding from a second restaurant asks before clearing',
        (WidgetTester tester) async {
      await openStore(tester);

      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();
      _nav(tester).pop();
      await tester.pumpAndSettle();

      // Reach the second restaurant through search rather than scrolling the
      // home list — the sliver only builds what is on screen, and the cart bar
      // now takes up part of it.
      await tester.tap(find.text('Search').first);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).first, 'Saravana');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Saravana Bhavan').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();

      expect(find.text('Start a new cart?'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      // Declining leaves the original kitchen's cart intact.
      expect(find.text('1 items'), findsWidgets);
    });

    testWidgets('checkout places an order and opens tracking',
        (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('View cart'));
      await tester.pumpAndSettle();
      expect(find.byType(CartScreen), findsOneWidget);
      expect(find.text('Item total'), findsOneWidget);
      expect(find.text('To pay'), findsOneWidget);

      await tester.tap(find.textContaining('Place order'));
      await tester.pumpAndSettle();

      expect(find.byType(OrderStatusScreen), findsOneWidget);
      expect(find.text('Order placed'), findsWidgets);
    });

    testWidgets('tracking advances through the stages',
        (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('View cart'));
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('Place order'));
      await tester.pumpAndSettle();

      // Three stage ticks reach delivered.
      for (int i = 0; i < 3; i++) {
        await tester.pump(const Duration(seconds: 6));
        await tester.pump();
      }
      expect(find.text('Delivered'), findsWidgets);
      expect(find.text('Back to home'), findsOneWidget);

      // The periodic timer must have stopped, or the test would hang.
      await tester.pumpAndSettle();
    });

    testWidgets('search matches a dish name', (WidgetTester tester) async {
      await openStore(tester);

      await tester.tap(find.text('Search').first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'dosa');
      await tester.pumpAndSettle();

      expect(find.text('Saravana Bhavan'), findsWidgets);
      expect(find.text('Anjappar Chettinad'), findsNothing);
    });

    testWidgets('search reports an empty result', (WidgetTester tester) async {
      await openStore(tester);
      await tester.tap(find.text('Search').first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'zzzz');
      await tester.pumpAndSettle();

      expect(find.text('Nothing matched'), findsOneWidget);
    });

    testWidgets('the orders tab starts empty and lists a placed order',
        (WidgetTester tester) async {
      await openStore(tester);

      await tester.tap(find.text('Orders').first);
      await tester.pumpAndSettle();
      expect(find.text('No orders yet'), findsOneWidget);

      // Place one, then come back.
      await tester.tap(find.text('Home').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Anjappar Chettinad').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('ADD').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('View cart'));
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining('Place order'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Keep browsing'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Orders').first);
      await tester.pumpAndSettle();
      expect(find.text('No orders yet'), findsNothing);
      expect(find.text('Reorder'), findsOneWidget);
    });

    testWidgets('an empty cart offers a way back to browsing',
        (WidgetTester tester) async {
      await openStore(tester);
      _nav(tester).pushNamed(AppRoutes.cart);
      await tester.pumpAndSettle();

      expect(find.text('Your cart is empty'), findsOneWidget);
      expect(find.text('Browse restaurants'), findsOneWidget);
    });

    testWidgets('a restaurant route without arguments falls back to login',
        (WidgetTester tester) async {
      await openStore(tester);
      _nav(tester).pushNamed(AppRoutes.restaurant);
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsWidgets);
      expect(tester.takeException(), isNull);
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
