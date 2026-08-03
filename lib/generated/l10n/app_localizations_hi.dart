// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'तेज़ डिलीवरी. ताज़ी मुस्कान.';

  @override
  String get chooseLanguageTitle => 'अपनी भाषा चुनें';

  @override
  String get chooseLanguageSubtitle => 'वह भाषा चुनें जिसमें आप सहज हों. आप इसे कभी भी सेटिंग्स में बदल सकते हैं.';

  @override
  String get searchLanguageHint => 'भाषा खोजें';

  @override
  String get noLanguageFound => 'कोई भाषा नहीं मिली';

  @override
  String languagesAvailable(int count) {
    return '$count भाषाएँ उपलब्ध हैं';
  }

  @override
  String get continueLabel => 'आगे बढ़ें';

  @override
  String get selectedLabel => 'चयनित';

  @override
  String get defaultLabel => 'डिफ़ॉल्ट';

  @override
  String get homeTitle => 'Nexmile में आपका स्वागत है';

  @override
  String get homeSubtitle => 'ताज़ा किराना, गरम खाना और रोज़मर्रा की ज़रूरतें आपके पास की दुकानों से.';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get languageUpdated => 'भाषा बदल दी गई';

  @override
  String get appLanguageLabel => 'ऐप की भाषा';

  @override
  String greetingNamed(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get loginTitle => 'Nexmile में साइन इन करें';

  @override
  String get loginSubtitle => 'अपना ईमेल या मोबाइल नंबर दर्ज करें, हम आपको सत्यापन कोड भेजेंगे.';

  @override
  String get emailOrPhoneLabel => 'ईमेल या मोबाइल नंबर';

  @override
  String get emailOrPhoneHint => 'name@example.com या 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही ईमेल पता या 10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get sendCode => 'कोड भेजें';

  @override
  String get agreeToTermsOnContinue => 'आगे बढ़ने पर आप हमारी सेवा की शर्तों और गोपनीयता नीति से सहमत होते हैं.';

  @override
  String get otpTitle => 'पुष्टि करें कि यह आप हैं';

  @override
  String otpSubtitle(String target) {
    return '$target पर भेजा गया 6 अंकों का कोड दर्ज करें';
  }

  @override
  String get verifyCode => 'सत्यापित करें';

  @override
  String get resendCode => 'कोड दोबारा भेजें';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकंड में दोबारा भेजें';
  }

  @override
  String get codeResent => 'नया कोड भेज दिया गया है';

  @override
  String get incorrectCode => 'यह कोड ग़लत है या समाप्त हो चुका है. नया कोड मँगाएँ.';

  @override
  String get enterFullCode => 'पूरे 6 अंक दर्ज करें';

  @override
  String get accountSuspended => 'यह खाता निलंबित कर दिया गया है. कृपया सहायता से संपर्क करें.';

  @override
  String get tooManyAttempts => 'बहुत अधिक प्रयास हो गए. कृपया कुछ देर बाद फिर कोशिश करें.';

  @override
  String get sessionExpired => 'आपका सत्र समाप्त हो गया है. कृपया फिर से साइन इन करें.';

  @override
  String get networkError => 'इंटरनेट कनेक्शन नहीं है. अपना कनेक्शन जाँचें और फिर कोशिश करें.';

  @override
  String get developmentCode => 'डेवलपमेंट कोड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'आप साइन आउट हो गए हैं';

  @override
  String get somethingWentWrong => 'कुछ ग़लत हो गया. कृपया फिर कोशिश करें.';

  @override
  String get profileTitle => 'प्रोफ़ाइल';

  @override
  String get viewProfile => 'प्रोफ़ाइल देखें';

  @override
  String get nameLabel => 'नाम';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबाइल नंबर';

  @override
  String get accountStatusLabel => 'खाते की स्थिति';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'लंबित';

  @override
  String get statusSuspended => 'निलंबित';

  @override
  String get verifiedLabel => 'सत्यापित';

  @override
  String get notProvided => 'जोड़ा नहीं गया';

  @override
  String get retry => 'फिर कोशिश करें';
}
