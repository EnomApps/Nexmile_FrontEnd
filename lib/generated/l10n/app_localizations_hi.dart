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

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'खोजें';

  @override
  String get navOrders => 'ऑर्डर';

  @override
  String get cancelLabel => 'रद्द करें';

  @override
  String get deliverTo => 'डिलीवरी पता';

  @override
  String get searchDishesHint => 'व्यंजन या रेस्टोरेंट खोजें';

  @override
  String get searchTitle => 'खोजें';

  @override
  String get searchNoResultsTitle => 'कुछ नहीं मिला';

  @override
  String get searchNoResultsSubtitle => 'कोई दूसरा व्यंजन, व्यंजन-शैली या रेस्टोरेंट नाम आज़माएँ.';

  @override
  String get cravingTitle => 'आज क्या खाने का मन है?';

  @override
  String get offersTitle => 'आपके लिए ऑफ़र';

  @override
  String get restaurantsNearby => 'आपके पास के रेस्टोरेंट';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टोरेंट';
  }

  @override
  String get noRestaurantsTitle => 'यहाँ अभी कुछ नहीं है';

  @override
  String get noRestaurantsSubtitle => 'कोई दूसरी श्रेणी आज़माएँ या फ़िल्टर हटाएँ.';

  @override
  String minutesAway(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance किमी';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ रेटिंग';
  }

  @override
  String priceForTwo(int amount) {
    return 'दो लोगों के लिए ₹$amount';
  }

  @override
  String get freeDelivery => 'मुफ़्त डिलीवरी';

  @override
  String percentOff(int percent) {
    return '$percent% छूट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'आपके ऑर्डर पर $percent% छूट';
  }

  @override
  String get vegOnly => 'सिर्फ़ शाकाहारी';

  @override
  String get bestseller => 'सबसे लोकप्रिय';

  @override
  String get addLabel => 'जोड़ें';

  @override
  String get noVegDishesTitle => 'यहाँ शाकाहारी व्यंजन नहीं हैं';

  @override
  String get noVegDishesSubtitle => 'पूरा मेन्यू देखने के लिए शाकाहारी फ़िल्टर बंद करें.';

  @override
  String get replaceCartTitle => 'नई कार्ट शुरू करें?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'आपकी कार्ट में $restaurant की चीज़ें हैं. यह जोड़ने पर वे हट जाएँगी.';
  }

  @override
  String get replaceCartConfirm => 'हटाकर जोड़ें';

  @override
  String get cartTitle => 'आपकी कार्ट';

  @override
  String get cartEmptyTitle => 'आपकी कार्ट ख़ाली है';

  @override
  String get cartEmptySubtitle => 'शुरू करने के लिए किसी रेस्टोरेंट से व्यंजन जोड़ें.';

  @override
  String get browseRestaurants => 'रेस्टोरेंट देखें';

  @override
  String itemsInCart(int count) {
    return '$count चीज़ें';
  }

  @override
  String get viewCart => 'कार्ट देखें';

  @override
  String get itemTotal => 'चीज़ों का कुल';

  @override
  String get deliveryFeeLabel => 'डिलीवरी शुल्क';

  @override
  String get taxesAndCharges => 'कर और शुल्क';

  @override
  String get freeLabel => 'मुफ़्त';

  @override
  String get toPay => 'देय राशि';

  @override
  String placeOrderFor(int amount) {
    return 'ऑर्डर करें · ₹$amount';
  }

  @override
  String get ordersTitle => 'आपके ऑर्डर';

  @override
  String get ordersEmptyTitle => 'अभी कोई ऑर्डर नहीं';

  @override
  String get ordersEmptySubtitle => 'आपके पिछले ऑर्डर यहाँ दिखेंगे.';

  @override
  String get reorder => 'दोबारा ऑर्डर';

  @override
  String orderTitle(String id) {
    return 'ऑर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'ऑर्डर हो गया';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'लगभग $minutes मिनट में पहुँचेगा.';
  }

  @override
  String get orderDeliveredTitle => 'डिलीवर हो गया';

  @override
  String get orderDeliveredSubtitle => 'खाने का आनंद लें.';

  @override
  String get statusOrderPlaced => 'ऑर्डर हो गया';

  @override
  String get statusPreparing => 'खाना तैयार हो रहा है';

  @override
  String get statusOnTheWay => 'रास्ते में है';

  @override
  String get statusDelivered => 'डिलीवर हो गया';

  @override
  String get keepBrowsing => 'देखते रहें';

  @override
  String get backToHome => 'होम पर लौटें';

  @override
  String get prototypeNotice => 'नमूना स्टोरफ़्रंट — असली दुकानें कैटलॉग API के साथ आएँगी.';

  @override
  String get prototypeCheckoutNotice => 'यह एक प्रोटोटाइप है. कोई भुगतान नहीं लिया जाता और कोई असली ऑर्डर नहीं होता.';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइप के लिए ट्रैकिंग नकली है.';
}
