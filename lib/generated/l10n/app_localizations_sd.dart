// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'تيز ڊليوري. تازا مرڪون.';

  @override
  String get chooseLanguageTitle => 'پنهنجي ٻولي چونڊيو';

  @override
  String get chooseLanguageSubtitle => 'اها ٻولي چونڊيو جنهن ۾ توهان کي آساني ٿئي. توهان ان کي ڪنهن به وقت سيٽنگون ۾ تبديل ڪري سگهو ٿا.';

  @override
  String get searchLanguageHint => 'ٻولي ڳوليو';

  @override
  String get noLanguageFound => 'ڪا به ٻولي نه ملي';

  @override
  String languagesAvailable(int count) {
    return '$count ٻوليون موجود آهن';
  }

  @override
  String get continueLabel => 'اڳتي وڌو';

  @override
  String get selectedLabel => 'چونڊيل';

  @override
  String get defaultLabel => 'ڊفالٽ';

  @override
  String get homeTitle => 'Nexmile ۾ ڀلي ڪري آيا';

  @override
  String get homeSubtitle => 'تازو راشن، گرم کاڌو ۽ روزمره جون ضرورتون توهان جي ويجهن دڪانن مان.';

  @override
  String get changeLanguage => 'ٻولي تبديل ڪريو';

  @override
  String get languageUpdated => 'ٻولي تبديل ٿي وئي';

  @override
  String get appLanguageLabel => 'ايپ جي ٻولي';
}
