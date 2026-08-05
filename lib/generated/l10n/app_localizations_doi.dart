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

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'तोपो';

  @override
  String get navOrders => 'ऑर्डर';

  @override
  String get cancelLabel => 'रद्द करो';

  @override
  String get deliverTo => 'डिलीवरी दा पता';

  @override
  String get searchDishesHint => 'खाना जां रेस्टोरेंट तोपो';

  @override
  String get searchTitle => 'तोपो';

  @override
  String get searchNoResultsTitle => 'किश नेईं लब्भा';

  @override
  String get searchNoResultsSubtitle => 'कोई होर खाना, खाने दी शैली जां रेस्टोरेंट दा नां अजमाओ।';

  @override
  String get cravingTitle => 'अज्ज कीह् खाने दा मन ऐ?';

  @override
  String get offersTitle => 'तुंदे आस्तै ऑफर';

  @override
  String get restaurantsNearby => 'तुंदे नेड़ले रेस्टोरेंट';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टोरेंट';
  }

  @override
  String get noRestaurantsTitle => 'इत्थै हाल्ली किश नेईं ऐ';

  @override
  String get noRestaurantsSubtitle => 'कोई होर श्रेणी दिक्खो जां फिल्टर हटाओ।';

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
    return 'दो जनें आस्तै ₹$amount';
  }

  @override
  String get freeDelivery => 'मुफ्त डिलीवरी';

  @override
  String percentOff(int percent) {
    return '$percent% छूट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'तुंदे ऑर्डर उप्पर $percent% छूट';
  }

  @override
  String get vegOnly => 'सिर्फ शाकाहारी';

  @override
  String get bestseller => 'सारें शा बद्ध बिकदा';

  @override
  String get addLabel => 'जोड़ो';

  @override
  String get noVegDishesTitle => 'इत्थै शाकाहारी खाना नेईं ऐ';

  @override
  String get noVegDishesSubtitle => 'पूरा मेन्यू दिक्खने आस्तै शाकाहारी फिल्टर बंद करो।';

  @override
  String get replaceCartTitle => 'नमीं कार्ट शुरू करचै?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'तुंदी कार्ट च $restaurant दियां चीजां न। एह् जोड़ने पर ओह् हटी जाङन।';
  }

  @override
  String get replaceCartConfirm => 'हटाइयै जोड़ो';

  @override
  String get cartTitle => 'तुंदी कार्ट';

  @override
  String get cartEmptyTitle => 'तुंदी कार्ट खाली ऐ';

  @override
  String get cartEmptySubtitle => 'शुरू करने आस्तै कुसै रेस्टोरेंट थमां खाना जोड़ो।';

  @override
  String get browseRestaurants => 'रेस्टोरेंट दिक्खो';

  @override
  String itemsInCart(int count) {
    return '$count चीजां';
  }

  @override
  String get viewCart => 'कार्ट दिक्खो';

  @override
  String get itemTotal => 'चीजें दा कुल';

  @override
  String get deliveryFeeLabel => 'डिलीवरी फीस';

  @override
  String get taxesAndCharges => 'कर ते खर्चे';

  @override
  String get freeLabel => 'मुफ्त';

  @override
  String get toPay => 'देने आह्ला';

  @override
  String placeOrderFor(int amount) {
    return 'ऑर्डर करो · ₹$amount';
  }

  @override
  String get ordersTitle => 'तुंदे ऑर्डर';

  @override
  String get ordersEmptyTitle => 'हाल्ली कोई ऑर्डर नेईं';

  @override
  String get ordersEmptySubtitle => 'तुंदे पैह्ले ऑर्डर इत्थै दिक्खने गी मिलङन।';

  @override
  String get reorder => 'फ्ही ऑर्डर';

  @override
  String orderTitle(String id) {
    return 'ऑर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'ऑर्डर होई गेदा';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'लगभग $minutes मिनटें च पुज्जग।';
  }

  @override
  String get orderDeliveredTitle => 'डिलीवर होई गेदा';

  @override
  String get orderDeliveredSubtitle => 'खाने दा मजा लैओ।';

  @override
  String get statusOrderPlaced => 'ऑर्डर होई गेदा';

  @override
  String get statusPreparing => 'खाना त्यार होआ करदा ऐ';

  @override
  String get statusOnTheWay => 'रस्ते च ऐ';

  @override
  String get statusDelivered => 'डिलीवर होई गेदा';

  @override
  String get keepBrowsing => 'दिक्खदे रौह्ओ';

  @override
  String get backToHome => 'होम पर वापस';

  @override
  String get prototypeNotice => 'नमूना स्टोरफ्रंट — असली दुकानां कैटलॉग API कन्नै औङन।';

  @override
  String get prototypeCheckoutNotice => 'एह् इक प्रोटोटाइप ऐ। कोई भुगतान नेईं लैता जंदा ते कोई असली ऑर्डर बी नेईं होंदा।';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइप आस्तै ट्रैकिंग नकली ऐ।';
}
