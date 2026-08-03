// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maithili (`mai`).
class AppLocalizationsMai extends AppLocalizations {
  AppLocalizationsMai([String locale = 'mai']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'तेज डिलीवरी। ताजा मुस्कान।';

  @override
  String get chooseLanguageTitle => 'अपन भाषा चुनू';

  @override
  String get chooseLanguageSubtitle => 'जाहि भाषा मे अहाँ सहज छी, ओ चुनू। अहाँ एकरा कहियो सेटिंग्स मे बदलि सकैत छी।';

  @override
  String get searchLanguageHint => 'भाषा ताकू';

  @override
  String get noLanguageFound => 'कोनो भाषा नहि भेटल';

  @override
  String languagesAvailable(int count) {
    return '$count भाषा उपलब्ध अछि';
  }

  @override
  String get continueLabel => 'आगू बढ़ू';

  @override
  String get selectedLabel => 'चुनल गेल';

  @override
  String get defaultLabel => 'डिफ़ॉल्ट';

  @override
  String get homeTitle => 'Nexmile मे अहाँक स्वागत अछि';

  @override
  String get homeSubtitle => 'ताजा किराना, गरम भोजन आ रोजक जरूरतक सामान अहाँक लगक दोकान सँ।';

  @override
  String get changeLanguage => 'भाषा बदलू';

  @override
  String get languageUpdated => 'भाषा बदलि गेल';

  @override
  String get appLanguageLabel => 'एप्पक भाषा';

  @override
  String greetingNamed(String name) {
    return 'प्रणाम, $name';
  }

  @override
  String get loginTitle => 'Nexmile मे साइन इन करू';

  @override
  String get loginSubtitle => 'अपन ईमेल वा मोबाइल नंबर लिखू, हम सत्यापन कोड पठाएब।';

  @override
  String get emailOrPhoneLabel => 'ईमेल वा मोबाइल नंबर';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही ईमेल पता वा 10 अंकक मोबाइल नंबर लिखू';

  @override
  String get sendCode => 'कोड पठाबू';

  @override
  String get agreeToTermsOnContinue => 'आगू बढ़ला पर अहाँ हमर सेवाक शर्त आ गोपनीयता नीति सँ सहमत होइत छी।';

  @override
  String get otpTitle => 'पुष्टि करू जे ई अहाँ छी';

  @override
  String otpSubtitle(String target) {
    return '$target पर पठाओल 6 अंकक कोड लिखू';
  }

  @override
  String get verifyCode => 'सत्यापित करू';

  @override
  String get resendCode => 'कोड फेर पठाबू';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकंड मे फेर पठाबू';
  }

  @override
  String get codeResent => 'नव कोड पठाओल गेल अछि';

  @override
  String get incorrectCode => 'ई कोड गलत अछि वा एकर समय बीति गेल। नव कोड मंगाबू।';

  @override
  String get enterFullCode => 'पूरा 6 अंक लिखू';

  @override
  String get accountSuspended => 'ई खाता निलंबित कऽ देल गेल अछि। कृपया सहायता सँ संपर्क करू।';

  @override
  String get tooManyAttempts => 'बहुत बेर कोशिश भऽ गेल। कृपया किछु समय बाद फेर कोशिश करू।';

  @override
  String get sessionExpired => 'अहाँक सत्र समाप्त भऽ गेल। कृपया फेर साइन इन करू।';

  @override
  String get networkError => 'इंटरनेट कनेक्शन नहि अछि। कनेक्शन देखू आ फेर कोशिश करू।';

  @override
  String get developmentCode => 'डेवलपमेंट कोड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'अहाँ साइन आउट भऽ गेलहुँ';

  @override
  String get somethingWentWrong => 'किछु गलत भऽ गेल। कृपया फेर कोशिश करू।';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get viewProfile => 'प्रोफाइल देखू';

  @override
  String get nameLabel => 'नाम';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबाइल नंबर';

  @override
  String get accountStatusLabel => 'खाताक स्थिति';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'विचाराधीन';

  @override
  String get statusSuspended => 'निलंबित';

  @override
  String get verifiedLabel => 'सत्यापित';

  @override
  String get notProvided => 'जोड़ल नहि गेल';

  @override
  String get retry => 'फेर कोशिश करू';
}
