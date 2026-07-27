import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexmile/app.dart';
import 'package:nexmile/core/constants/app_assets.dart';
import 'package:nexmile/core/localization/app_language.dart';
import 'package:nexmile/core/services/preferences_service.dart';
import 'package:nexmile/features/home/home_screen.dart';
import 'package:nexmile/features/language/language_screen.dart';
import 'package:nexmile/features/splash/splash_screen.dart';
import 'package:nexmile/generated/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<PreferencesService> _prefs([
  Map<String, Object> seed = const <String, Object>{},
]) async {
  SharedPreferences.setMockInitialValues(seed);
  return PreferencesService.create();
}

/// Pumps the splash animation through to completion plus its route transition.
Future<void> _settleSplash(WidgetTester tester) async {
  await tester.pump(SplashScreen.totalDuration);
  await tester.pumpAndSettle();
}

void main() {
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

    test('language codes are unique', () {
      final Set<String> codes =
          AppLanguages.all.map((AppLanguage l) => l.code).toSet();
      expect(codes.length, AppLanguages.all.length);
    });

    test('English is the one and only default', () {
      final List<AppLanguage> defaults =
          AppLanguages.all.where((AppLanguage l) => l.isDefault).toList();
      expect(defaults, <AppLanguage>[AppLanguages.english]);
      expect(AppLanguages.fallback.code, 'en');
    });

    test('unknown or absent codes fall back to English', () {
      expect(AppLanguages.byCode(null).code, 'en');
      expect(AppLanguages.byCode('zz').code, 'en');
      expect(AppLanguages.fromLocale(const Locale('ta', 'LK')).code, 'ta');
    });

    test('search matches native name, English name and code', () {
      expect(AppLanguages.tamil.matches('tam'), isTrue);
      expect(AppLanguages.tamil.matches('தமி'), isTrue);
      expect(AppLanguages.tamil.matches('ta'), isTrue);
      expect(AppLanguages.tamil.matches('hindi'), isFalse);
    });

    test('only the Perso-Arabic scripts are right-to-left', () {
      final Set<String> rtl = AppLanguages.all
          .where((AppLanguage l) => l.isRtl)
          .map((AppLanguage l) => l.code)
          .toSet();
      expect(rtl, <String>{'ur', 'ks', 'sd'});
    });
  });

  group('translations', () {
    testWidgets('every locale resolves its own copy',
        (WidgetTester tester) async {
      for (final AppLanguage language in AppLanguages.all) {
        final AppLocalizations l10n =
            await AppLocalizations.delegate.load(language.locale);
        expect(l10n.appName, 'Nexmile');
        expect(l10n.continueLabel.trim(), isNotEmpty);
        expect(l10n.chooseLanguageTitle.trim(), isNotEmpty);
        expect(l10n.homeTitle.trim(), isNotEmpty);
      }
    });

    testWidgets('no locale silently reuses the English string',
        (WidgetTester tester) async {
      final AppLocalizations en =
          await AppLocalizations.delegate.load(const Locale('en'));
      for (final AppLanguage language in AppLanguages.all) {
        if (language.code == 'en') continue;
        final AppLocalizations l10n =
            await AppLocalizations.delegate.load(language.locale);
        expect(
          l10n.chooseLanguageTitle,
          isNot(en.chooseLanguageTitle),
          reason: '${language.englishName} is untranslated',
        );
      }
    });
  });

  group('app flow', () {
    testWidgets('splash animates the lockup then opens the language screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      await tester.pump();

      expect(find.byType(SplashScreen), findsOneWidget);
      // The symbol and wordmark are separate layers so each can animate on its
      // own beat.
      expect(find.image(const AssetImage(AppAssets.symbol)), findsOneWidget);
      expect(find.image(const AssetImage(AppAssets.wordmark)), findsOneWidget);

      // Halfway through, the sequence is still running and has not navigated.
      await tester.pump(const Duration(milliseconds: 1500));
      expect(find.byType(SplashScreen), findsOneWidget);
      expect(tester.takeException(), isNull);

      await _settleSplash(tester);
      expect(find.byType(LanguageScreen), findsOneWidget);
    });

    testWidgets('splash paints every frame of the sequence without error',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      // Step through at ~60fps and assert nothing throws at any beat.
      for (int i = 0; i < 180; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.takeException(), isNull, reason: 'frame $i');
      }
      await tester.pumpAndSettle();
      expect(find.byType(LanguageScreen), findsOneWidget);
    });

    testWidgets('language screen opens on English by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      await _settleSplash(tester);

      expect(find.text('Choose your language'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.text('தமிழ்'), findsOneWidget);
      expect(find.text('हिन्दी'), findsOneWidget);
    });

    testWidgets('picking Tamil re-renders the screen in Tamil immediately',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      await _settleSplash(tester);

      await tester.tap(find.text('தமிழ்'));
      await tester.pumpAndSettle();

      expect(find.text('உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்'), findsOneWidget);
      expect(find.text('தொடரவும்'), findsOneWidget);
      expect(find.text('Choose your language'), findsNothing);
    });

    testWidgets('Continue persists the choice and lands on home',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      await _settleSplash(tester);

      await tester.tap(find.text('தமிழ்'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('தொடரவும்'));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('Nexmile-க்கு வரவேற்கிறோம்'), findsOneWidget);

      final SharedPreferences stored = await SharedPreferences.getInstance();
      expect(stored.getString('nexmile.language_code'), 'ta');
      expect(stored.getBool('nexmile.language_chosen'), isTrue);
    });

    testWidgets('a returning user skips the language screen',
        (WidgetTester tester) async {
      final PreferencesService preferences = await _prefs(<String, Object>{
        'nexmile.language_code': 'hi',
        'nexmile.language_chosen': true,
      });

      await tester.pumpWidget(NexmileApp(preferences: preferences));
      await _settleSplash(tester);

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(LanguageScreen), findsNothing);
      expect(find.text('Nexmile में आपका स्वागत है'), findsOneWidget);
    });

    testWidgets('search filters the catalogue and reports an empty result',
        (WidgetTester tester) async {
      await tester.pumpWidget(NexmileApp(preferences: await _prefs()));
      await _settleSplash(tester);

      await tester.enterText(find.byType(TextField), 'mala');
      await tester.pumpAndSettle();
      expect(find.text('മലയാളം'), findsOneWidget);
      expect(find.text('தமிழ்'), findsNothing);

      await tester.enterText(find.byType(TextField), 'zzz');
      await tester.pumpAndSettle();
      expect(find.text('No language found'), findsOneWidget);
    });
  });

  group('layout robustness', () {
    // The brief: no overlapping or clipped text. Flutter surfaces both as
    // overflow exceptions, so a clean pump across every locale — and at the
    // extremes of the supported viewport and text-scale range — is the check.
    testWidgets('language screen lays out cleanly in every locale',
        (WidgetTester tester) async {
      for (final AppLanguage language in AppLanguages.all) {
        await tester.pumpWidget(
          NexmileApp(
            preferences: await _prefs(<String, Object>{
              'nexmile.language_code': language.code,
            }),
          ),
        );
        await _settleSplash(tester);

        expect(find.byType(LanguageScreen), findsOneWidget);
        expect(
          tester.takeException(),
          isNull,
          reason: '${language.englishName} overflowed',
        );
      }
    });

    testWidgets('holds up on a 320x568 screen at maximum text scale',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1.0;
      tester.platformDispatcher.textScaleFactorTestValue = 3.0; // clamps to 1.3
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.platformDispatcher.clearTextScaleFactorTestValue();
      });

      await tester.pumpWidget(
        NexmileApp(
          preferences: await _prefs(<String, Object>{
            'nexmile.language_code': 'ta',
          }),
        ),
      );
      await _settleSplash(tester);

      expect(find.byType(LanguageScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('right-to-left languages flip the layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        NexmileApp(
          preferences: await _prefs(<String, Object>{
            'nexmile.language_code': 'ur',
          }),
        ),
      );
      await _settleSplash(tester);

      final Directionality directionality = tester.widget<Directionality>(
        find.byType(Directionality).first,
      );
      expect(directionality.textDirection, TextDirection.rtl);
      expect(tester.takeException(), isNull);
    });
  });
}
