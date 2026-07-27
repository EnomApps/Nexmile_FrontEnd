// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Manipuri (`mni`).
class AppLocalizationsMni extends AppLocalizations {
  AppLocalizationsMni([String locale = 'mni']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'থুনা ডেলিভরি। অনৌবা নোকপা।';

  @override
  String get chooseLanguageTitle => 'নহাক্কী লোল খল্লু';

  @override
  String get chooseLanguageSubtitle => 'নহাক্না লাইনা খংবা লোল অদু খল্লু। মসিবু মতম খুদিংদা সেটিংস্তা হোংদোকপা য়াই।';

  @override
  String get searchLanguageHint => 'লোল থিয়ু';

  @override
  String get noLanguageFound => 'লোল অমত্তা ফংদে';

  @override
  String languagesAvailable(int count) {
    return 'লোল $count ফংই';
  }

  @override
  String get continueLabel => 'মখা চত্থৌ';

  @override
  String get selectedLabel => 'খল্লবা';

  @override
  String get defaultLabel => 'ডিফোল্ট';

  @override
  String get homeTitle => 'Nexmile-দা তরাম্না ওকচরি';

  @override
  String get homeSubtitle => 'অনৌবা কিরানা, অসাবা চাক অমসুং নুমিৎ খুদিংগী দরকার ওইবা পোৎলমশিং নহাক্কী নকপা দোকানশিংদগী।';

  @override
  String get changeLanguage => 'লোল হোংদোকউ';

  @override
  String get languageUpdated => 'লোল হোংদোক্লে';

  @override
  String get appLanguageLabel => 'এপকী লোল';
}
