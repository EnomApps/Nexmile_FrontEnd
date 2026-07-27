// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'Fast Delivery. Fresh Smiles.';

  @override
  String get chooseLanguageTitle => 'Choose your language';

  @override
  String get chooseLanguageSubtitle => 'Pick the language you are most comfortable with. You can change it anytime from Settings.';

  @override
  String get searchLanguageHint => 'Search language';

  @override
  String get noLanguageFound => 'No language found';

  @override
  String languagesAvailable(int count) {
    return '$count languages available';
  }

  @override
  String get continueLabel => 'Continue';

  @override
  String get selectedLabel => 'Selected';

  @override
  String get defaultLabel => 'Default';

  @override
  String get homeTitle => 'Welcome to Nexmile';

  @override
  String get homeSubtitle => 'Fresh groceries, hot food and daily essentials delivered from shops near you.';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get languageUpdated => 'Language updated';

  @override
  String get appLanguageLabel => 'App language';
}
