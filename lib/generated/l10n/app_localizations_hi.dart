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
  String get fieldRequired => 'यह फ़ील्ड आवश्यक है';

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
  String placeOrderFor(String amount) {
    return 'ऑर्डर करें · $amount';
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

  @override
  String get locationTitle => 'डिलीवरी कहाँ करनी है?';

  @override
  String get locationSubtitle => 'Nexmile सिर्फ़ 1 किमी के भीतर की दुकानों से डिलीवरी करता है, इसलिए हमें आपकी सही जगह चाहिए.';

  @override
  String get locationReasonRadiusTitle => '1 किमी के भीतर की दुकानें';

  @override
  String get locationReasonRadiusBody => 'हम सिर्फ़ वही रसोइयाँ दिखाते हैं जहाँ से खाना गरम पहुँचे.';

  @override
  String get locationReasonAccuracyTitle => 'सही दरवाज़े तक';

  @override
  String get locationReasonAccuracyBody => 'सटीक पिन से डिलीवरी पार्टनर बिना फ़ोन किए आप तक पहुँच जाता है.';

  @override
  String get locationReasonPrivacyTitle => 'सिर्फ़ ऐप इस्तेमाल करते समय';

  @override
  String get locationReasonPrivacyBody => 'हम बैकग्राउंड में आपको ट्रैक नहीं करते, और आप पता खुद भी लिख सकते हैं.';

  @override
  String get allowLocation => 'लोकेशन की अनुमति दें';

  @override
  String get enterAddressManually => 'मैं पता खुद लिखूँगा';

  @override
  String get locationDenied => 'लोकेशन की अनुमति नहीं मिली. आप पिन खुद भी लगा सकते हैं.';

  @override
  String get locationDeniedForever => 'Nexmile के लिए लोकेशन बंद है. सेटिंग्स में चालू करें या पिन खुद लगाएँ.';

  @override
  String get locationServiceOff => 'इस डिवाइस पर लोकेशन बंद है.';

  @override
  String get locationUnavailable => 'लोकेशन नहीं मिल सकी. कृपया पिन खुद लगाएँ.';

  @override
  String get openSettings => 'सेटिंग्स';

  @override
  String get pinLocationTitle => 'अपना डिलीवरी पिन लगाएँ';

  @override
  String get deliveryRadiusHint => 'यह घेरा वह 1 किमी दिखाता है जिसमें Nexmile डिलीवरी करता है.';

  @override
  String get useMyLocation => 'मेरी लोकेशन इस्तेमाल करें';

  @override
  String get deliveringHere => 'यहाँ डिलीवरी';

  @override
  String get dragToAdjust => 'पिन बदलने के लिए मैप खिसकाएँ';

  @override
  String get confirmLocation => 'लोकेशन पक्की करें';

  @override
  String get addressDetailsTitle => 'पते का विवरण';

  @override
  String get addressDetailsSubtitle => 'सही दरवाज़े तक पहुँचने के लिए मकान नंबर और लैंडमार्क जोड़ें.';

  @override
  String get pinnedLocation => 'चुनी गई जगह';

  @override
  String get changePin => 'बदलें';

  @override
  String get saveAddressAs => 'इस पते को ऐसे सहेजें';

  @override
  String get labelHome => 'घर';

  @override
  String get labelWork => 'ऑफ़िस';

  @override
  String get labelOther => 'अन्य';

  @override
  String get addressLine1Label => 'मकान, फ़्लैट या इमारत';

  @override
  String get addressLine1Hint => '12A, ग्रीन रेजिडेंसी';

  @override
  String get addressLine2Label => 'गली या इलाक़ा';

  @override
  String get addressLine2Hint => 'दूसरी एवेन्यू, अन्ना नगर';

  @override
  String get landmarkLabel => 'लैंडमार्क';

  @override
  String get landmarkHint => 'बस स्टॉप के सामने';

  @override
  String get cityLabel => 'शहर';

  @override
  String get stateLabel => 'राज्य';

  @override
  String get pincodeLabel => 'पिन कोड';

  @override
  String get invalidPincode => 'सही 6 अंकों का पिन कोड दर्ज करें';

  @override
  String get contactNameLabel => 'संपर्क नाम';

  @override
  String get contactPhoneLabel => 'संपर्क नंबर';

  @override
  String get invalidMobileNumber => 'सही 10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get makeDefaultAddress => 'डिफ़ॉल्ट रूप से यहीं डिलीवरी';

  @override
  String get saveAddress => 'पता सहेजें';

  @override
  String get addressSaved => 'पता सहेज लिया गया';

  @override
  String get addressBookTitle => 'डिलीवरी पते';

  @override
  String get manageAddresses => 'सहेजे गए पते प्रबंधित करें';

  @override
  String get noAddressesTitle => 'अभी कोई पता नहीं';

  @override
  String get noAddressesSubtitle => 'एक पता जोड़ें ताकि हम आप तक डिलीवरी करने वाली दुकानें दिखा सकें.';

  @override
  String get addAddress => 'पता जोड़ें';

  @override
  String get setAsDefault => 'डिफ़ॉल्ट बनाएँ';

  @override
  String get editLabel => 'बदलें';

  @override
  String get addressUpdated => 'पता अपडेट हो गया';

  @override
  String get deleteLabel => 'मिटाएँ';

  @override
  String get deleteAddressTitle => 'यह पता मिटाएँ?';

  @override
  String get deleteAddressMessage => 'आप इसे बाद में फिर जोड़ सकते हैं.';

  @override
  String get rescueDealsTitle => 'फ़ूड रेस्क्यू';

  @override
  String get notTakingOrders => 'ऑर्डर नहीं ले रहे';

  @override
  String get closedRightNow => 'अभी बंद है';

  @override
  String minimumOrder(String amount) {
    return 'कम से कम $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count बचे';
  }

  @override
  String get soldOut => 'खत्म हो गया';

  @override
  String get menuEmptyTitle => 'अभी कोई व्यंजन नहीं';

  @override
  String get menuEmptySubtitle => 'इस रेस्टोरेंट ने अपना मेन्यू नहीं जोड़ा है।';

  @override
  String get moreDishesTitle => 'और व्यंजन';

  @override
  String get customisable => 'पसंद के अनुसार';

  @override
  String get requiredLabel => 'ज़रूरी';

  @override
  String get optionalLabel => 'वैकल्पिक';

  @override
  String get chooseOne => 'एक चुनें';

  @override
  String chooseUpTo(int count) {
    return 'ज़्यादा से ज़्यादा $count चुनें';
  }

  @override
  String chooseAtLeast(int count) {
    return 'कम से कम $count चुनें';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min से $max तक चुनें';
  }

  @override
  String get specialInstructions => 'खास निर्देश';

  @override
  String get specialInstructionsHint => 'कम तीखा, प्याज़ नहीं…';

  @override
  String addForAmount(String amount) {
    return 'जोड़ें · $amount';
  }

  @override
  String get deliveryLabel => 'डिलीवरी';

  @override
  String get pickupLabel => 'खुद ले जाएँ';

  @override
  String get packagingLabel => 'पैकिंग';

  @override
  String get discountLabel => 'छूट';

  @override
  String get billDetailsTitle => 'बिल का ब्योरा';

  @override
  String get clearCart => 'कार्ट खाली करें';

  @override
  String get clearCartTitle => 'यह कार्ट खाली करें?';

  @override
  String get clearCartMessage => 'इसमें रखी हर चीज़ हट जाएगी।';

  @override
  String unavailableItemsNotice(String items) {
    return 'अब उपलब्ध नहीं: $items';
  }

  @override
  String get removeUnavailable => 'इन्हें हटाएँ';

  @override
  String minimumNotMet(String amount) {
    return 'कम से कम ऑर्डर $amount है';
  }

  @override
  String get checkoutTitle => 'चेकआउट';

  @override
  String get deliveryAddressLabel => 'डिलीवरी का पता';

  @override
  String get noAddressSelected => 'कोई पता नहीं चुना';

  @override
  String get paymentMethodLabel => 'भुगतान';

  @override
  String get payOnDelivery => 'डिलीवरी पर नकद';

  @override
  String get noteToRestaurant => 'रेस्टोरेंट के लिए नोट';

  @override
  String get noteToRestaurantHint => 'घंटी दो बार बजाएँ…';

  @override
  String get activeOrdersTitle => 'चल रहे ऑर्डर';

  @override
  String get pastOrdersTitle => 'पुराने ऑर्डर';

  @override
  String get orderItemsTitle => 'व्यंजन';

  @override
  String get orderProgressTitle => 'प्रगति';

  @override
  String get arrivingIn => 'पहुँचने में';

  @override
  String get pickupCodeLabel => 'पिकअप कोड';

  @override
  String get cancellationReasonLabel => 'रद्द होने की वजह';

  @override
  String get riderLabel => 'डिलीवरी पार्टनर';

  @override
  String get callRider => 'कॉल करें';

  @override
  String get viewInvoice => 'टैक्स इनवॉइस';

  @override
  String get cancelOrder => 'ऑर्डर रद्द करें';

  @override
  String get cancelOrderTitle => 'यह ऑर्डर रद्द करें?';

  @override
  String get cancelOrderMessage => 'रेस्टोरेंट के स्वीकार करने से पहले ही रद्द किया जा सकता है।';

  @override
  String get cancelReasonLabel => 'वजह';

  @override
  String get cancelReasonFallback => 'ग्राहक ने रद्द किया';

  @override
  String get orderCancelled => 'ऑर्डर रद्द हो गया';

  @override
  String get currentLocationLabel => 'वर्तमान स्थान';
}
