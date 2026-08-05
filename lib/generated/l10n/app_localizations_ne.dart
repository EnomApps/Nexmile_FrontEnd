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

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'खोज्नुहोस्';

  @override
  String get navOrders => 'अर्डर';

  @override
  String get cancelLabel => 'रद्द गर्नुहोस्';

  @override
  String get deliverTo => 'डेलिभरी ठेगाना';

  @override
  String get searchDishesHint => 'परिकार वा रेस्टुरेन्ट खोज्नुहोस्';

  @override
  String get searchTitle => 'खोज्नुहोस्';

  @override
  String get searchNoResultsTitle => 'केही भेटिएन';

  @override
  String get searchNoResultsSubtitle => 'अर्को परिकार, पाकशैली वा रेस्टुरेन्टको नाम प्रयास गर्नुहोस्।';

  @override
  String get cravingTitle => 'आज के खान मन छ?';

  @override
  String get offersTitle => 'तपाईंका लागि अफर';

  @override
  String get restaurantsNearby => 'तपाईंको नजिकैका रेस्टुरेन्ट';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टुरेन्ट';
  }

  @override
  String get noRestaurantsTitle => 'यहाँ अझै केही छैन';

  @override
  String get noRestaurantsSubtitle => 'अर्को वर्ग हेर्नुहोस् वा फिल्टर हटाउनुहोस्।';

  @override
  String minutesAway(int minutes) {
    return '$minutes मिनेट';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance किमी';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ रेटिङ';
  }

  @override
  String priceForTwo(int amount) {
    return 'दुई जनाका लागि ₹$amount';
  }

  @override
  String get freeDelivery => 'निःशुल्क डेलिभरी';

  @override
  String percentOff(int percent) {
    return '$percent% छुट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'तपाईंको अर्डरमा $percent% छुट';
  }

  @override
  String get vegOnly => 'शाकाहारी मात्र';

  @override
  String get bestseller => 'सबैभन्दा बिक्री हुने';

  @override
  String get addLabel => 'थप्नुहोस्';

  @override
  String get noVegDishesTitle => 'यहाँ शाकाहारी परिकार छैनन्';

  @override
  String get noVegDishesSubtitle => 'पूरा मेनु हेर्न शाकाहारी फिल्टर बन्द गर्नुहोस्।';

  @override
  String get replaceCartTitle => 'नयाँ कार्ट सुरु गर्ने?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'तपाईंको कार्टमा $restaurant का सामान छन्। यो थप्दा तिनीहरू हट्नेछन्।';
  }

  @override
  String get replaceCartConfirm => 'हटाएर थप्नुहोस्';

  @override
  String get cartTitle => 'तपाईंको कार्ट';

  @override
  String get cartEmptyTitle => 'तपाईंको कार्ट खाली छ';

  @override
  String get cartEmptySubtitle => 'सुरु गर्न कुनै रेस्टुरेन्टबाट परिकार थप्नुहोस्।';

  @override
  String get browseRestaurants => 'रेस्टुरेन्ट हेर्नुहोस्';

  @override
  String itemsInCart(int count) {
    return '$count वस्तु';
  }

  @override
  String get viewCart => 'कार्ट हेर्नुहोस्';

  @override
  String get itemTotal => 'वस्तुहरूको जम्मा';

  @override
  String get deliveryFeeLabel => 'डेलिभरी शुल्क';

  @override
  String get taxesAndCharges => 'कर र शुल्क';

  @override
  String get freeLabel => 'निःशुल्क';

  @override
  String get toPay => 'तिर्नुपर्ने';

  @override
  String placeOrderFor(int amount) {
    return 'अर्डर गर्नुहोस् · ₹$amount';
  }

  @override
  String get ordersTitle => 'तपाईंका अर्डर';

  @override
  String get ordersEmptyTitle => 'अझै कुनै अर्डर छैन';

  @override
  String get ordersEmptySubtitle => 'तपाईंका विगतका अर्डर यहाँ देखिनेछन्।';

  @override
  String get reorder => 'पुनः अर्डर';

  @override
  String orderTitle(String id) {
    return 'अर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'अर्डर भयो';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'लगभग $minutes मिनेटमा आइपुग्नेछ।';
  }

  @override
  String get orderDeliveredTitle => 'डेलिभर भयो';

  @override
  String get orderDeliveredSubtitle => 'खानाको आनन्द लिनुहोस्।';

  @override
  String get statusOrderPlaced => 'अर्डर भयो';

  @override
  String get statusPreparing => 'खाना तयार हुँदैछ';

  @override
  String get statusOnTheWay => 'बाटोमा छ';

  @override
  String get statusDelivered => 'डेलिभर भयो';

  @override
  String get keepBrowsing => 'हेर्दै रहनुहोस्';

  @override
  String get backToHome => 'होममा फर्कनुहोस्';

  @override
  String get prototypeNotice => 'नमुना स्टोरफ्रन्ट — वास्तविक पसलहरू क्याटलग APIसँगै आउनेछन्।';

  @override
  String get prototypeCheckoutNotice => 'यो एउटा प्रोटोटाइप हो। कुनै भुक्तानी लिइँदैन र वास्तविक अर्डर पनि हुँदैन।';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइपका लागि ट्र्याकिङ कृत्रिम हो।';
}
