// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'വേഗത്തിലുള്ള ഡെലിവറി. പുതിയ പുഞ്ചിരികൾ.';

  @override
  String get chooseLanguageTitle => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get chooseLanguageSubtitle => 'നിങ്ങൾക്ക് സൗകര്യപ്രദമായ ഭാഷ തിരഞ്ഞെടുക്കുക. ഇത് എപ്പോൾ വേണമെങ്കിലും ക്രമീകരണങ്ങളിൽ മാറ്റാം.';

  @override
  String get searchLanguageHint => 'ഭാഷ തിരയുക';

  @override
  String get noLanguageFound => 'ഭാഷയൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String languagesAvailable(int count) {
    return '$count ഭാഷകൾ ലഭ്യമാണ്';
  }

  @override
  String get continueLabel => 'തുടരുക';

  @override
  String get selectedLabel => 'തിരഞ്ഞെടുത്തു';

  @override
  String get defaultLabel => 'ഡിഫോൾട്ട്';

  @override
  String get homeTitle => 'Nexmile ലേക്ക് സ്വാഗതം';

  @override
  String get homeSubtitle => 'പുതിയ പലവ്യഞ്ജനങ്ങൾ, ചൂടുള്ള ഭക്ഷണം, ദൈനംദിന ആവശ്യസാധനങ്ങൾ എന്നിവ അടുത്തുള്ള കടകളിൽ നിന്ന്.';

  @override
  String get changeLanguage => 'ഭാഷ മാറ്റുക';

  @override
  String get languageUpdated => 'ഭാഷ മാറ്റി';

  @override
  String get appLanguageLabel => 'ആപ്പ് ഭാഷ';
}
