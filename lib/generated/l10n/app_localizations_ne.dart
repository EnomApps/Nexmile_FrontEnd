// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'छिटो डेलिभरी। ताजा मुस्कान।';

  @override
  String get chooseLanguageTitle => 'आफ्नो भाषा छान्नुहोस्';

  @override
  String get chooseLanguageSubtitle => 'तपाईंलाई सहज लाग्ने भाषा छान्नुहोस्। तपाईं यसलाई जुनसुकै बेला सेटिङमा परिवर्तन गर्न सक्नुहुन्छ।';

  @override
  String get searchLanguageHint => 'भाषा खोज्नुहोस्';

  @override
  String get noLanguageFound => 'कुनै भाषा फेला परेन';

  @override
  String languagesAvailable(int count) {
    return '$count भाषा उपलब्ध छन्';
  }

  @override
  String get continueLabel => 'जारी राख्नुहोस्';

  @override
  String get selectedLabel => 'छानिएको';

  @override
  String get defaultLabel => 'पूर्वनिर्धारित';

  @override
  String get homeTitle => 'Nexmile मा स्वागत छ';

  @override
  String get homeSubtitle => 'ताजा किराना, तातो खाना र दैनिक आवश्यकताहरू तपाईंको नजिकैका पसलहरूबाट।';

  @override
  String get changeLanguage => 'भाषा परिवर्तन गर्नुहोस्';

  @override
  String get languageUpdated => 'भाषा परिवर्तन गरियो';

  @override
  String get appLanguageLabel => 'एपको भाषा';

  @override
  String greetingNamed(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get loginTitle => 'Nexmile मा साइन इन गर्नुहोस्';

  @override
  String get loginSubtitle => 'आफ्नो इमेल वा मोबाइल नम्बर लेख्नुहोस्, हामी प्रमाणीकरण कोड पठाउनेछौं।';

  @override
  String get emailOrPhoneLabel => 'इमेल वा मोबाइल नम्बर';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही इमेल ठेगाना वा 10 अंकको मोबाइल नम्बर लेख्नुहोस्';

  @override
  String get sendCode => 'कोड पठाउनुहोस्';

  @override
  String get agreeToTermsOnContinue => 'अगाडि बढेर तपाईं हाम्रा सेवाका सर्तहरू र गोपनीयता नीतिमा सहमत हुनुहुन्छ।';

  @override
  String get otpTitle => 'यो तपाईं नै हो भनी प्रमाणित गर्नुहोस्';

  @override
  String otpSubtitle(String target) {
    return '$target मा पठाइएको 6 अंकको कोड लेख्नुहोस्';
  }

  @override
  String get verifyCode => 'प्रमाणित गर्नुहोस्';

  @override
  String get resendCode => 'कोड पुनः पठाउनुहोस्';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकेन्डमा पुनः पठाउनुहोस्';
  }

  @override
  String get codeResent => 'नयाँ कोड पठाइएको छ';

  @override
  String get incorrectCode => 'यो कोड गलत छ वा म्याद सकिएको छ। नयाँ कोड मगाउनुहोस्।';

  @override
  String get enterFullCode => 'पूरै 6 अंक लेख्नुहोस्';

  @override
  String get accountSuspended => 'यो खाता निलम्बन गरिएको छ। कृपया सहयोग टोलीलाई सम्पर्क गर्नुहोस्।';

  @override
  String get tooManyAttempts => 'धेरै पटक प्रयास भयो। कृपया केही बेरपछि पुनः प्रयास गर्नुहोस्।';

  @override
  String get sessionExpired => 'तपाईंको सत्र समाप्त भयो। कृपया पुनः साइन इन गर्नुहोस्।';

  @override
  String get networkError => 'इन्टरनेट जडान छैन। जडान जाँच गरेर पुनः प्रयास गर्नुहोस्।';

  @override
  String get developmentCode => 'डेभलपमेन्ट कोड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'तपाईं साइन आउट हुनुभयो';

  @override
  String get somethingWentWrong => 'केही गडबड भयो। कृपया पुनः प्रयास गर्नुहोस्।';

  @override
  String get profileTitle => 'प्रोफाइल';

  @override
  String get viewProfile => 'प्रोफाइल हेर्नुहोस्';

  @override
  String get nameLabel => 'नाम';

  @override
  String get emailLabel => 'इमेल';

  @override
  String get mobileLabel => 'मोबाइल नम्बर';

  @override
  String get accountStatusLabel => 'खाताको अवस्था';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'विचाराधीन';

  @override
  String get statusSuspended => 'निलम्बित';

  @override
  String get verifiedLabel => 'प्रमाणित';

  @override
  String get notProvided => 'थपिएको छैन';

  @override
  String get retry => 'पुनः प्रयास गर्नुहोस्';
}
