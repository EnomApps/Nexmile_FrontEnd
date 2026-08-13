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
  String get fieldRequired => 'यो फिल्ड आवश्यक छ';

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
  String placeOrderFor(String amount) {
    return 'अर्डर गर्नुहोस् · $amount';
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

  @override
  String get locationTitle => 'कहाँ डेलिभरी गर्ने?';

  @override
  String get locationSubtitle => 'Nexmile ले 1 किमी भित्रका पसलहरूबाट मात्र डेलिभरी गर्छ, त्यसैले तपाईंको ठ्याक्कै स्थान चाहिन्छ।';

  @override
  String get locationReasonRadiusTitle => '1 किमी भित्रका पसल';

  @override
  String get locationReasonRadiusBody => 'जहाँबाट खाना तातो पुग्छ, त्यही भान्साहरू मात्र देखाउँछौं।';

  @override
  String get locationReasonAccuracyTitle => 'ठीक ढोकासम्म';

  @override
  String get locationReasonAccuracyBody => 'सही पिन भए डेलिभरी पार्टनरले फोन नगरी तपाईंलाई भेट्टाउँछन्।';

  @override
  String get locationReasonPrivacyTitle => 'एप चलाउँदा मात्र';

  @override
  String get locationReasonPrivacyBody => 'हामी पृष्ठभूमिमा तपाईंलाई ट्र्याक गर्दैनौं, र ठेगाना तपाईं आफैँ लेख्न सक्नुहुन्छ।';

  @override
  String get allowLocation => 'स्थानको अनुमति दिनुहोस्';

  @override
  String get enterAddressManually => 'म आफैँ ठेगाना लेख्छु';

  @override
  String get locationDenied => 'स्थानको अनुमति अस्वीकार भयो। तपाईं पिन आफैँ राख्न सक्नुहुन्छ।';

  @override
  String get locationDeniedForever => 'Nexmile का लागि स्थान बन्द छ। सेटिङमा खोल्नुहोस् वा पिन आफैँ राख्नुहोस्।';

  @override
  String get locationServiceOff => 'यो यन्त्रमा स्थान बन्द छ।';

  @override
  String get locationUnavailable => 'स्थान पाउन सकिएन। कृपया पिन आफैँ राख्नुहोस्।';

  @override
  String get openSettings => 'सेटिङ';

  @override
  String get pinLocationTitle => 'आफ्नो डेलिभरी पिन राख्नुहोस्';

  @override
  String get deliveryRadiusHint => 'वृत्तले Nexmile ले डेलिभरी गर्ने 1 किमी देखाउँछ।';

  @override
  String get useMyLocation => 'मेरो स्थान प्रयोग गर्नुहोस्';

  @override
  String get deliveringHere => 'यहाँ डेलिभरी';

  @override
  String get dragToAdjust => 'पिन मिलाउन नक्सा तान्नुहोस्';

  @override
  String get confirmLocation => 'स्थान पुष्टि गर्नुहोस्';

  @override
  String get addressDetailsTitle => 'ठेगानाको विवरण';

  @override
  String get addressDetailsSubtitle => 'ठीक ढोकामा पुग्न घर नम्बर र चिनारी थप्नुहोस्।';

  @override
  String get pinnedLocation => 'छानिएको स्थान';

  @override
  String get changePin => 'बदल्नुहोस्';

  @override
  String get saveAddressAs => 'यो ठेगाना यसरी सुरक्षित गर्नुहोस्';

  @override
  String get labelHome => 'घर';

  @override
  String get labelWork => 'कार्यालय';

  @override
  String get labelOther => 'अन्य';

  @override
  String get addressLine1Label => 'घर, फ्ल्याट वा भवन';

  @override
  String get addressLine1Hint => '12A, ग्रीन रेजिडेन्सी';

  @override
  String get addressLine2Label => 'सडक वा क्षेत्र';

  @override
  String get addressLine2Hint => 'दोस्रो एभेन्यू, अन्ना नगर';

  @override
  String get landmarkLabel => 'चिनारी';

  @override
  String get landmarkHint => 'बस स्टपको सामुन्ने';

  @override
  String get cityLabel => 'सहर';

  @override
  String get stateLabel => 'राज्य';

  @override
  String get pincodeLabel => 'पिन कोड';

  @override
  String get invalidPincode => 'सही 6 अंकको पिन कोड लेख्नुहोस्';

  @override
  String get contactNameLabel => 'सम्पर्क नाम';

  @override
  String get contactPhoneLabel => 'सम्पर्क नम्बर';

  @override
  String get invalidMobileNumber => 'सही 10 अंकको मोबाइल नम्बर लेख्नुहोस्';

  @override
  String get makeDefaultAddress => 'पूर्वनिर्धारित रूपमा यहीँ डेलिभरी';

  @override
  String get saveAddress => 'ठेगाना सुरक्षित गर्नुहोस्';

  @override
  String get addressSaved => 'ठेगाना सुरक्षित भयो';

  @override
  String get addressBookTitle => 'डेलिभरी ठेगाना';

  @override
  String get manageAddresses => 'सुरक्षित ठेगानाहरू व्यवस्थापन गर्नुहोस्';

  @override
  String get noAddressesTitle => 'अझै कुनै ठेगाना छैन';

  @override
  String get noAddressesSubtitle => 'तपाईंकहाँ डेलिभरी गर्ने पसलहरू देखाउन एउटा ठेगाना थप्नुहोस्।';

  @override
  String get addAddress => 'ठेगाना थप्नुहोस्';

  @override
  String get setAsDefault => 'पूर्वनिर्धारित बनाउनुहोस्';

  @override
  String get editLabel => 'सम्पादन';

  @override
  String get addressUpdated => 'ठेगाना अद्यावधिक भयो';

  @override
  String get deleteLabel => 'मेटाउनुहोस्';

  @override
  String get deleteAddressTitle => 'यो ठेगाना मेटाउने?';

  @override
  String get deleteAddressMessage => 'तपाईं यसलाई पछि फेरि थप्न सक्नुहुन्छ।';

  @override
  String get rescueDealsTitle => 'फूड रेस्क्यू';

  @override
  String get notTakingOrders => 'अर्डर लिइरहेको छैन';

  @override
  String get closedRightNow => 'अहिले बन्द छ';

  @override
  String minimumOrder(String amount) {
    return 'न्यूनतम $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count बाँकी';
  }

  @override
  String get soldOut => 'सकियो';

  @override
  String get menuEmptyTitle => 'अझै कुनै परिकार छैन';

  @override
  String get menuEmptySubtitle => 'यो रेस्टुरेन्टले आफ्नो मेनु थपेको छैन।';

  @override
  String get moreDishesTitle => 'थप परिकार';

  @override
  String get customisable => 'रुचिअनुसार';

  @override
  String get requiredLabel => 'अनिवार्य';

  @override
  String get optionalLabel => 'वैकल्पिक';

  @override
  String get chooseOne => 'एउटा छान्नुहोस्';

  @override
  String chooseUpTo(int count) {
    return 'बढीमा $count छान्नुहोस्';
  }

  @override
  String chooseAtLeast(int count) {
    return 'कम्तीमा $count छान्नुहोस्';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min देखि $max सम्म छान्नुहोस्';
  }

  @override
  String get specialInstructions => 'विशेष निर्देशन';

  @override
  String get specialInstructionsHint => 'कम पिरो, प्याज नराख्नू…';

  @override
  String addForAmount(String amount) {
    return 'थप्नुहोस् · $amount';
  }

  @override
  String get deliveryLabel => 'डेलिभरी';

  @override
  String get pickupLabel => 'आफैँ लैजाने';

  @override
  String get packagingLabel => 'प्याकिङ';

  @override
  String get discountLabel => 'छुट';

  @override
  String get billDetailsTitle => 'बिल विवरण';

  @override
  String get clearCart => 'कार्ट खाली गर्नुहोस्';

  @override
  String get clearCartTitle => 'यो कार्ट खाली गर्ने?';

  @override
  String get clearCartMessage => 'यसभित्रका सबै कुरा हटाइनेछ।';

  @override
  String unavailableItemsNotice(String items) {
    return 'अब उपलब्ध छैन: $items';
  }

  @override
  String get removeUnavailable => 'ती हटाउनुहोस्';

  @override
  String minimumNotMet(String amount) {
    return 'न्यूनतम अर्डर $amount हो';
  }

  @override
  String get checkoutTitle => 'चेकआउट';

  @override
  String get deliveryAddressLabel => 'डेलिभरी ठेगाना';

  @override
  String get noAddressSelected => 'कुनै ठेगाना छानिएको छैन';

  @override
  String get paymentMethodLabel => 'भुक्तानी';

  @override
  String get payOnDelivery => 'डेलिभरीमा नगद';

  @override
  String get noteToRestaurant => 'रेस्टुरेन्टका लागि नोट';

  @override
  String get noteToRestaurantHint => 'घण्टी दुई पटक बजाउनुहोस्…';

  @override
  String get activeOrdersTitle => 'चलिरहेका अर्डर';

  @override
  String get pastOrdersTitle => 'पुराना अर्डर';

  @override
  String get orderItemsTitle => 'परिकार';

  @override
  String get orderProgressTitle => 'प्रगति';

  @override
  String get arrivingIn => 'पुग्न';

  @override
  String get pickupCodeLabel => 'पिकअप कोड';

  @override
  String get cancellationReasonLabel => 'रद्द भएको कारण';

  @override
  String get riderLabel => 'डेलिभरी पार्टनर';

  @override
  String get callRider => 'कल गर्नुहोस्';

  @override
  String get viewInvoice => 'कर बिजक';

  @override
  String get cancelOrder => 'अर्डर रद्द गर्नुहोस्';

  @override
  String get cancelOrderTitle => 'यो अर्डर रद्द गर्ने?';

  @override
  String get cancelOrderMessage => 'रेस्टुरेन्टले स्वीकार गर्नुअघि मात्र रद्द गर्न सकिन्छ।';

  @override
  String get cancelReasonLabel => 'कारण';

  @override
  String get cancelReasonFallback => 'ग्राहकले रद्द गरे';

  @override
  String get orderCancelled => 'अर्डर रद्द भयो';

  @override
  String get currentLocationLabel => 'हालको स्थान';
}
