// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Santali (`sat`).
class AppLocalizationsSat extends AppLocalizations {
  AppLocalizationsSat([String locale = 'sat']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'ᱞᱚᱜᱚᱱ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ᱾ ᱱᱟᱶᱟ ᱞᱟᱸᱰᱟ᱾';

  @override
  String get chooseLanguageTitle => 'ᱟᱢᱟᱜ ᱯᱟᱹᱨᱥᱤ ᱵᱟᱪᱷᱟᱣ ᱢᱮ';

  @override
  String get chooseLanguageSubtitle => 'ᱟᱢ ᱡᱟᱦᱟᱸ ᱯᱟᱹᱨᱥᱤ ᱨᱮ ᱥᱩᱦᱩᱞ ᱟᱢ ᱚᱱᱟ ᱵᱟᱪᱷᱟᱣ ᱢᱮ᱾ ᱟᱢ ᱱᱚᱶᱟ ᱡᱟᱦᱟᱸ ᱚᱠᱛᱚ ᱥᱮᱴᱤᱝᱥ ᱨᱮ ᱵᱚᱫᱚᱞ ᱫᱟᱲᱮᱭᱟᱜ-ᱟᱢ᱾';

  @override
  String get searchLanguageHint => 'ᱯᱟᱹᱨᱥᱤ ᱯᱟᱱᱛᱮ ᱢᱮ';

  @override
  String get noLanguageFound => 'ᱡᱟᱦᱟᱸ ᱯᱟᱹᱨᱥᱤ ᱵᱟᱝ ᱧᱟᱢ ᱞᱮᱱᱟ';

  @override
  String languagesAvailable(int count) {
    return '$count ᱯᱟᱹᱨᱥᱤ ᱢᱮᱱᱟᱜ-ᱟ';
  }

  @override
  String get continueLabel => 'ᱞᱟᱦᱟ ᱪᱟᱞᱟᱣ ᱢᱮ';

  @override
  String get selectedLabel => 'ᱵᱟᱪᱷᱟᱣᱟᱠᱟᱱ';

  @override
  String get defaultLabel => 'ᱰᱤᱯᱷᱚᱞᱴ';

  @override
  String get homeTitle => 'Nexmile ᱨᱮ ᱡᱚᱦᱟᱨ';

  @override
  String get homeSubtitle => 'ᱱᱟᱶᱟ ᱠᱤᱨᱟᱱᱟ, ᱨᱟᱹᱲᱟᱹ ᱡᱚᱢᱟᱜ ᱟᱨ ᱫᱤᱱ ᱫᱤᱱᱟᱜ ᱡᱤᱱᱤᱥ ᱟᱢᱟᱜ ᱡᱟᱹᱛᱤᱭᱟᱹᱨ ᱫᱳᱠᱟᱱ ᱠᱷᱚᱱ᱾';

  @override
  String get changeLanguage => 'ᱯᱟᱹᱨᱥᱤ ᱵᱚᱫᱚᱞ ᱢᱮ';

  @override
  String get languageUpdated => 'ᱯᱟᱹᱨᱥᱤ ᱵᱚᱫᱚᱞ ᱮᱱᱟ';

  @override
  String get appLanguageLabel => 'ᱮᱯ ᱯᱟᱹᱨᱥᱤ';

  @override
  String greetingNamed(String name) {
    return 'ᱡᱚᱦᱟᱨ, $name';
  }

  @override
  String get loginTitle => 'Nexmile ᱨᱮ ᱥᱟᱭᱤᱱ ᱤᱱ ᱢᱮ';

  @override
  String get loginSubtitle => 'ᱟᱢᱟᱜ ᱤᱢᱮᱞ ᱵᱟᱝᱠᱷᱟᱱ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ ᱚᱞ ᱢᱮ, ᱟᱞᱮ ᱡᱟᱸᱪ ᱠᱳᱰ ᱠᱩᱞ ᱟᱞᱮᱭᱟ᱾';

  @override
  String get emailOrPhoneLabel => 'ᱤᱢᱮᱞ ᱵᱟᱝᱠᱷᱟᱱ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ';

  @override
  String get emailOrPhoneHint => 'name@example.com ᱵᱟᱝᱠᱷᱟᱱ 9876543210';

  @override
  String get invalidEmailOrPhone => 'ᱴᱷᱤᱠ ᱤᱢᱮᱞ ᱴᱷᱤᱠᱱᱟ ᱵᱟᱝᱠᱷᱟᱱ 10 ᱮᱞ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ ᱚᱞ ᱢᱮ';

  @override
  String get sendCode => 'ᱠᱳᱰ ᱠᱩᱞ ᱢᱮ';

  @override
  String get agreeToTermsOnContinue => 'ᱞᱟᱦᱟ ᱪᱟᱞᱟᱣ ᱠᱟᱛᱮ ᱟᱢ ᱟᱞᱮᱭᱟᱜ ᱥᱮᱵᱟ ᱱᱮᱢ ᱟᱨ ᱩᱠᱩ ᱱᱤᱛᱤ ᱨᱮ ᱨᱟᱡᱤ ᱠᱟᱱᱟᱢ᱾';

  @override
  String get otpTitle => 'ᱱᱚᱶᱟ ᱟᱢᱜᱮ ᱠᱟᱱᱟ ᱡᱟᱸᱪ ᱢᱮ';

  @override
  String otpSubtitle(String target) {
    return '$target ᱛᱮ ᱠᱩᱞ ᱟᱠᱟᱱ 6 ᱮᱞ ᱠᱳᱰ ᱚᱞ ᱢᱮ';
  }

  @override
  String get verifyCode => 'ᱡᱟᱸᱪ ᱢᱮ';

  @override
  String get resendCode => 'ᱠᱳᱰ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱞ ᱢᱮ';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ᱥᱮᱠᱮᱱᱰ ᱨᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱞ ᱢᱮ';
  }

  @override
  String get codeResent => 'ᱱᱟᱶᱟ ᱠᱳᱰ ᱠᱩᱞ ᱮᱱᱟ';

  @override
  String get incorrectCode => 'ᱱᱚᱶᱟ ᱠᱳᱰ ᱵᱟᱝ ᱴᱷᱤᱠᱟ ᱵᱟᱝᱠᱷᱟᱱ ᱚᱠᱛᱚ ᱪᱟᱵᱟ ᱮᱱᱟ᱾ ᱱᱟᱶᱟ ᱠᱳᱰ ᱢᱟᱹᱜ ᱢᱮ᱾';

  @override
  String get enterFullCode => 'ᱯᱩᱨᱟᱹ 6 ᱮᱞ ᱚᱞ ᱢᱮ';

  @override
  String get accountSuspended => 'ᱱᱚᱶᱟ ᱠᱷᱟᱛᱟ ᱵᱚᱸᱫ ᱠᱟᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱜᱚᱲᱚ ᱥᱟᱶ ᱡᱚᱲᱟᱣ ᱢᱮ᱾';

  @override
  String get tooManyAttempts => 'ᱟᱫᱚᱢ ᱛᱟᱞᱟᱛᱮ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱛᱤᱸᱜᱩ ᱚᱠᱛᱚ ᱛᱟᱭᱚᱢ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get sessionExpired => 'ᱟᱢᱟᱜ ᱥᱮᱥᱚᱱ ᱪᱟᱵᱟ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱥᱟᱭᱤᱱ ᱤᱱ ᱢᱮ᱾';

  @override
  String get networkError => 'ᱤᱱᱴᱟᱨᱱᱮᱴ ᱡᱚᱲᱟᱣ ᱵᱟᱹᱱᱩᱜ-ᱟ᱾ ᱡᱚᱲᱟᱣ ᱧᱮᱞ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get developmentCode => 'ᱰᱮᱵᱷᱞᱚᱯᱢᱮᱱᱴ ᱠᱳᱰ';

  @override
  String get signOut => 'ᱥᱟᱭᱤᱱ ᱟᱣᱴ';

  @override
  String get signedOut => 'ᱟᱢ ᱥᱟᱭᱤᱱ ᱟᱣᱴ ᱮᱱᱟᱢ';

  @override
  String get somethingWentWrong => 'ᱚᱠᱟ ᱦᱚᱸ ᱵᱷᱩᱞ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get profileTitle => 'ᱯᱨᱚᱯᱷᱟᱭᱤᱞ';

  @override
  String get viewProfile => 'ᱯᱨᱚᱯᱷᱟᱭᱤᱞ ᱧᱮᱞ ᱢᱮ';

  @override
  String get nameLabel => 'ᱧᱩᱛᱩᱢ';

  @override
  String get emailLabel => 'ᱤᱢᱮᱞ';

  @override
  String get mobileLabel => 'ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ';

  @override
  String get accountStatusLabel => 'ᱠᱷᱟᱛᱟ ᱫᱚᱥᱟ';

  @override
  String get statusActive => 'ᱪᱟᱹᱞᱩ';

  @override
  String get statusPending => 'ᱛᱟᱸᱜᱤ ᱟᱠᱟᱱ';

  @override
  String get statusSuspended => 'ᱵᱚᱸᱫ ᱟᱠᱟᱱ';

  @override
  String get verifiedLabel => 'ᱡᱟᱸᱪ ᱟᱠᱟᱱ';

  @override
  String get notProvided => 'ᱵᱟᱝ ᱥᱮᱞᱮᱫ ᱟᱠᱟᱱᱟ';

  @override
  String get retry => 'ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ';
}
