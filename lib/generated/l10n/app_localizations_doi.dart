// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dogri (`doi`).
class AppLocalizationsDoi extends AppLocalizations {
  AppLocalizationsDoi([String locale = 'doi']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'तेज़ डिलीवरी। ताज़ी मुस्कान।';

  @override
  String get chooseLanguageTitle => 'अपनी बोली चुनो';

  @override
  String get chooseLanguageSubtitle => 'जिस बोली च तुसें सौखा लगदा ओह् चुनो। तुस इसनूं कदी बी सेटिंग्स च बदली सकदे ओ।';

  @override
  String get searchLanguageHint => 'बोली तोपो';

  @override
  String get noLanguageFound => 'कोई बी बोली नेईं लब्भी';

  @override
  String languagesAvailable(int count) {
    return '$count बोलियां उपलब्ध न';
  }

  @override
  String get continueLabel => 'अग्गें बधो';

  @override
  String get selectedLabel => 'चुनी गेई';

  @override
  String get defaultLabel => 'डिफ़ॉल्ट';

  @override
  String get homeTitle => 'Nexmile च तुंदा स्वागत ऐ';

  @override
  String get homeSubtitle => 'ताज़ा किराना, गरम खाना ते रोज़ दियां लोड़ां तुंदे नेड़लियां दुकानां थमां।';

  @override
  String get changeLanguage => 'बोली बदलो';

  @override
  String get languageUpdated => 'बोली बदली गेई';

  @override
  String get appLanguageLabel => 'ऐप दी बोली';

  @override
  String greetingNamed(String name) {
    return 'नमस्कार, $name';
  }

  @override
  String get loginTitle => 'Nexmile च साइन इन करो';

  @override
  String get loginSubtitle => 'अपना ईमेल जां मोबाइल नंबर पाओ, अस तस्दीक कोड भेजगे।';

  @override
  String get emailOrPhoneLabel => 'ईमेल जां मोबाइल नंबर';

  @override
  String get emailOrPhoneHint => 'name@example.com जां 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही ईमेल पता जां 10 अंकें दा मोबाइल नंबर पाओ';

  @override
  String get sendCode => 'कोड भेजो';

  @override
  String get agreeToTermsOnContinue => 'अग्गें बधने कन्नै तुस साढ़ियां सेवा शर्तां ते गोपनीयता नीति नाल सैह्मत ओ।';

  @override
  String get otpTitle => 'तस्दीक करो जे एह् तुस ओ';

  @override
  String otpSubtitle(String target) {
    return '$target पर भेजे दा 6 अंकें दा कोड पाओ';
  }

  @override
  String get verifyCode => 'तस्दीक करो';

  @override
  String get resendCode => 'कोड फ्ही भेजो';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सैकिंड च फ्ही भेजो';
  }

  @override
  String get codeResent => 'नमां कोड भेजी दित्ता गेदा ऐ';

  @override
  String get incorrectCode => 'एह् कोड गलत ऐ जां इसदी मियाद खत्म होई गेई। नमां कोड मंगाओ।';

  @override
  String get enterFullCode => 'पूरे 6 अंक पाओ';

  @override
  String get accountSuspended => 'एह् खाता मुअत्तल करी दित्ता गेदा ऐ। किरपा करियै सहायता कन्नै संपर्क करो।';

  @override
  String get tooManyAttempts => 'मते बारी कोशिश होई गेई। किरपा करियै थोह्ड़ी देर बाद फ्ही कोशिश करो।';

  @override
  String get sessionExpired => 'तुंदा सैशन खत्म होई गेदा ऐ। किरपा करियै फ्ही साइन इन करो।';

  @override
  String get networkError => 'इंटरनैट कनैक्शन नेईं ऐ। अपना कनैक्शन जांचो ते फ्ही कोशिश करो।';

  @override
  String get developmentCode => 'डिवैल्पमैंट कोड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'तुस साइन आउट होई गे ओ';

  @override
  String get somethingWentWrong => 'किश गलत होई गेदा। किरपा करियै फ्ही कोशिश करो।';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get viewProfile => 'प्रोफाइल दिक्खो';

  @override
  String get nameLabel => 'नां';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबाइल नंबर';

  @override
  String get accountStatusLabel => 'खाते दी हालत';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'बकाया';

  @override
  String get statusSuspended => 'मुअत्तल';

  @override
  String get verifiedLabel => 'तस्दीकशुदा';

  @override
  String get notProvided => 'जोड़े दा नेईं';

  @override
  String get retry => 'फ्ही कोशिश करो';
}
