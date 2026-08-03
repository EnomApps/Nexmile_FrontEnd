// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'जलद डिलिव्हरी. ताजे स्मित.';

  @override
  String get chooseLanguageTitle => 'तुमची भाषा निवडा';

  @override
  String get chooseLanguageSubtitle => 'तुम्हाला सोयीची वाटेल ती भाषा निवडा. तुम्ही ती कधीही सेटिंग्जमध्ये बदलू शकता.';

  @override
  String get searchLanguageHint => 'भाषा शोधा';

  @override
  String get noLanguageFound => 'कोणतीही भाषा सापडली नाही';

  @override
  String languagesAvailable(int count) {
    return '$count भाषा उपलब्ध आहेत';
  }

  @override
  String get continueLabel => 'पुढे चला';

  @override
  String get selectedLabel => 'निवडलेली';

  @override
  String get defaultLabel => 'डीफॉल्ट';

  @override
  String get homeTitle => 'Nexmile मध्ये आपले स्वागत आहे';

  @override
  String get homeSubtitle => 'ताजा किराणा, गरम जेवण आणि दैनंदिन गरजा तुमच्या जवळच्या दुकानांमधून.';

  @override
  String get changeLanguage => 'भाषा बदला';

  @override
  String get languageUpdated => 'भाषा बदलली';

  @override
  String get appLanguageLabel => 'ॲपची भाषा';

  @override
  String greetingNamed(String name) {
    return 'नमस्कार, $name';
  }

  @override
  String get loginTitle => 'Nexmile मध्ये साइन इन करा';

  @override
  String get loginSubtitle => 'तुमचा ईमेल किंवा मोबाइल क्रमांक टाका, आम्ही पडताळणी कोड पाठवू.';

  @override
  String get emailOrPhoneLabel => 'ईमेल किंवा मोबाइल क्रमांक';

  @override
  String get emailOrPhoneHint => 'name@example.com किंवा 9876543210';

  @override
  String get invalidEmailOrPhone => 'वैध ईमेल पत्ता किंवा 10 अंकी मोबाइल क्रमांक टाका';

  @override
  String get sendCode => 'कोड पाठवा';

  @override
  String get agreeToTermsOnContinue => 'पुढे जाऊन तुम्ही आमच्या सेवा अटी आणि गोपनीयता धोरणाशी सहमत होता.';

  @override
  String get otpTitle => 'तुम्हीच आहात याची खात्री करा';

  @override
  String otpSubtitle(String target) {
    return '$target वर पाठवलेला 6 अंकी कोड टाका';
  }

  @override
  String get verifyCode => 'पडताळा';

  @override
  String get resendCode => 'कोड पुन्हा पाठवा';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकंदांत पुन्हा पाठवा';
  }

  @override
  String get codeResent => 'नवीन कोड पाठवला आहे';

  @override
  String get incorrectCode => 'हा कोड चुकीचा आहे किंवा त्याची मुदत संपली आहे. नवीन कोड मागवा.';

  @override
  String get enterFullCode => 'पूर्ण 6 अंक टाका';

  @override
  String get accountSuspended => 'हे खाते निलंबित करण्यात आले आहे. कृपया सहाय्यताशी संपर्क साधा.';

  @override
  String get tooManyAttempts => 'खूप वेळा प्रयत्न झाले. कृपया थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get sessionExpired => 'तुमचे सत्र संपले आहे. कृपया पुन्हा साइन इन करा.';

  @override
  String get networkError => 'इंटरनेट कनेक्शन नाही. तुमचे कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get developmentCode => 'डेव्हलपमेंट कोड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'तुम्ही साइन आउट झाला आहात';

  @override
  String get somethingWentWrong => 'काहीतरी चूक झाली. पुन्हा प्रयत्न करा.';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get viewProfile => 'प्रोफाइल पहा';

  @override
  String get nameLabel => 'नाव';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबाइल क्रमांक';

  @override
  String get accountStatusLabel => 'खात्याची स्थिती';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'प्रलंबित';

  @override
  String get statusSuspended => 'निलंबित';

  @override
  String get verifiedLabel => 'पडताळलेले';

  @override
  String get notProvided => 'जोडलेले नाही';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';
}
