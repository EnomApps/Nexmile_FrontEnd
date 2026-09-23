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
  String get fieldRequired => 'ई खाना जरूरी अछि';

  @override
  String get tagline => 'तेज डिलीवरी। ताजा मुस्कान।';

  @override
  String get chooseLanguageTitle => 'अपन भाषा चुनू';

  @override
  String get chooseLanguageSubtitle =>
      'जाहि भाषा मे अहाँ सहज छी, ओ चुनू। अहाँ एकरा कहियो सेटिंग्स मे बदलि सकैत छी।';

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
  String get homeSubtitle =>
      'ताजा किराना, गरम भोजन आ रोजक जरूरतक सामान अहाँक लगक दोकान सँ।';

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
  String get loginSubtitle =>
      'अपन ईमेल वा मोबाइल नंबर लिखू, हम सत्यापन कोड पठाएब।';

  @override
  String get emailOrPhoneLabel => 'ईमेल वा मोबाइल नंबर';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही ईमेल पता वा 10 अंकक मोबाइल नंबर लिखू';

  @override
  String get sendCode => 'कोड पठाबू';

  @override
  String get agreeToTermsOnContinue =>
      'आगू बढ़ला पर अहाँ हमर सेवाक शर्त आ गोपनीयता नीति सँ सहमत होइत छी।';

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
  String get incorrectCode =>
      'ई कोड गलत अछि वा एकर समय बीति गेल। नव कोड मंगाबू।';

  @override
  String get enterFullCode => 'पूरा 6 अंक लिखू';

  @override
  String get accountSuspended =>
      'ई खाता निलंबित कऽ देल गेल अछि। कृपया सहायता सँ संपर्क करू।';

  @override
  String get tooManyAttempts =>
      'बहुत बेर कोशिश भऽ गेल। कृपया किछु समय बाद फेर कोशिश करू।';

  @override
  String get sessionExpired =>
      'अहाँक सत्र समाप्त भऽ गेल। कृपया फेर साइन इन करू।';

  @override
  String get networkError =>
      'इंटरनेट कनेक्शन नहि अछि। कनेक्शन देखू आ फेर कोशिश करू।';

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

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'ताकू';

  @override
  String get navOrders => 'ऑर्डर';

  @override
  String get cancelLabel => 'रद्द करू';

  @override
  String get deliverTo => 'डिलीवरी पता';

  @override
  String get searchDishesHint => 'व्यंजन वा रेस्टोरेंट ताकू';

  @override
  String get searchTitle => 'ताकू';

  @override
  String get searchNoResultsTitle => 'किछु नहि भेटल';

  @override
  String get searchNoResultsSubtitle =>
      'दोसर व्यंजन, पाक-शैली वा रेस्टोरेंटक नाम आजमाउ।';

  @override
  String get cravingTitle => 'आइ की खाय मोन अछि?';

  @override
  String get offersTitle => 'अहाँक लेल ऑफर';

  @override
  String get restaurantsNearby => 'अहाँक लगक रेस्टोरेंट';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रेस्टोरेंट',
      one: '1 रेस्टोरेंट',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'एतय अखन किछु नहि अछि';

  @override
  String get noRestaurantsSubtitle => 'दोसर श्रेणी देखू वा फिल्टर हटाउ।';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रेटिंग',
      one: '1 रेटिंग',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'दू गोटेक लेल ₹$amount';
  }

  @override
  String get freeDelivery => 'मुफ्त डिलीवरी';

  @override
  String percentOff(int percent) {
    return '$percent% छूट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'अहाँक ऑर्डर पर $percent% छूट';
  }

  @override
  String get vegOnly => 'मात्र शाकाहारी';

  @override
  String get bestseller => 'सभसँ बेसी बिकाइत';

  @override
  String get addLabel => 'जोड़ू';

  @override
  String get noVegDishesTitle => 'एतय शाकाहारी व्यंजन नहि अछि';

  @override
  String get noVegDishesSubtitle =>
      'पूरा मेनू देखबाक लेल शाकाहारी फिल्टर बंद करू।';

  @override
  String get replaceCartTitle => 'नव कार्ट शुरू करू?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'अहाँक कार्ट मे $restaurant क सामान अछि। ई जोड़ला सँ ओ हटि जाएत।';
  }

  @override
  String get replaceCartConfirm => 'हटा क\' जोड़ू';

  @override
  String get cartTitle => 'अहाँक कार्ट';

  @override
  String get cartEmptyTitle => 'अहाँक कार्ट खाली अछि';

  @override
  String get cartEmptySubtitle =>
      'शुरू करबाक लेल कोनो रेस्टोरेंट सँ व्यंजन जोड़ू।';

  @override
  String get browseRestaurants => 'रेस्टोरेंट देखू';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count वस्तु',
      one: '1 वस्तु',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'कार्ट देखू';

  @override
  String get itemTotal => 'सामानक कुल';

  @override
  String get deliveryFeeLabel => 'डिलीवरी शुल्क';

  @override
  String get taxesAndCharges => 'कर आ शुल्क';

  @override
  String get freeLabel => 'मुफ्त';

  @override
  String get toPay => 'देय राशि';

  @override
  String placeOrderFor(String amount) {
    return 'ऑर्डर करू · $amount';
  }

  @override
  String get ordersTitle => 'अहाँक ऑर्डर';

  @override
  String get ordersEmptyTitle => 'अखन धरि कोनो ऑर्डर नहि';

  @override
  String get ordersEmptySubtitle => 'अहाँक पहिलुका ऑर्डर एतय देखाएत।';

  @override
  String get reorder => 'फेर ऑर्डर';

  @override
  String orderTitle(String id) {
    return 'ऑर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'ऑर्डर भ\' गेल';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'लगभग $minutes मिनट मे पहुँचत।';
  }

  @override
  String get orderDeliveredTitle => 'डिलीवर भ\' गेल';

  @override
  String get orderDeliveredSubtitle => 'भोजनक आनंद लिअ।';

  @override
  String get statusOrderPlaced => 'ऑर्डर भ\' गेल';

  @override
  String get statusPreparing => 'भोजन तैयार भ\' रहल अछि';

  @override
  String get statusOnTheWay => 'रास्ता मे अछि';

  @override
  String get statusDelivered => 'डिलीवर भ\' गेल';

  @override
  String get keepBrowsing => 'देखैत रहू';

  @override
  String get backToHome => 'होम पर घूरू';

  @override
  String get prototypeNotice =>
      'नमूना स्टोरफ्रंट — असली दोकान कैटलॉग API सँग आओत।';

  @override
  String get prototypeCheckoutNotice =>
      'ई एकटा प्रोटोटाइप अछि। कोनो भुगतान नहि लेल जाइत अछि आ असली ऑर्डर सेहो नहि होइत अछि।';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइपक लेल ट्रैकिंग नकली अछि।';

  @override
  String get locationTitle => 'कतय डिलीवरी करी?';

  @override
  String get locationSubtitle =>
      'Nexmile मात्र 1 किमी भीतरक दोकान सँ डिलीवरी करैत अछि, तेँ अहाँक सही ठाम चाही।';

  @override
  String get locationReasonRadiusTitle => '1 किमी भीतरक दोकान';

  @override
  String get locationReasonRadiusBody =>
      'जतय सँ भोजन गरम पहुँचत, ओहि रसोइयेँ देखबैत छी।';

  @override
  String get locationReasonAccuracyTitle => 'सही दरवाजा धरि';

  @override
  String get locationReasonAccuracyBody =>
      'सही पिन रहला सँ डिलीवरी पार्टनर फोन कएने बिना अहाँ धरि पहुँचि जाइत छथि।';

  @override
  String get locationReasonPrivacyTitle => 'मात्र एप्प चलबैत काल';

  @override
  String get locationReasonPrivacyBody =>
      'हम पृष्ठभूमि मे अहाँक माग नहि करैत छी, आ पता अहाँ स्वयं सेहो लिखि सकैत छी।';

  @override
  String get allowLocation => 'स्थानक अनुमति दिअ';

  @override
  String get enterAddressManually => 'हम स्वयं पता लिखब';

  @override
  String get locationDenied =>
      'स्थानक अनुमति नहि भेटल। अहाँ पिन स्वयं राखि सकैत छी।';

  @override
  String get locationDeniedForever =>
      'Nexmile लेल स्थान बन्द अछि। सेटिंग्स मे चालू करू वा पिन स्वयं राखू।';

  @override
  String get locationServiceOff => 'एहि डिवाइस पर स्थान बन्द अछि।';

  @override
  String get locationUnavailable => 'स्थान नहि भेटल। कृपया पिन स्वयं राखू।';

  @override
  String get openSettings => 'सेटिंग्स';

  @override
  String get pinLocationTitle => 'अपन डिलीवरी पिन राखू';

  @override
  String get deliveryRadiusHint =>
      'घेरा ओ 1 किमी देखबैत अछि जाहि मे Nexmile डिलीवरी करैत अछि।';

  @override
  String get useMyLocation => 'हमर स्थान प्रयोग करू';

  @override
  String get deliveringHere => 'एतय डिलीवरी';

  @override
  String get dragToAdjust => 'पिन बदलबाक लेल नक्शा घीचू';

  @override
  String get confirmLocation => 'स्थान पक्का करू';

  @override
  String get addressDetailsTitle => 'पताक विवरण';

  @override
  String get addressDetailsSubtitle =>
      'सही दरवाजा धरि पहुँचबाक लेल घर नंबर आ चिन्ह जोड़ू।';

  @override
  String get pinnedLocation => 'चुनल ठाम';

  @override
  String get changePin => 'बदलू';

  @override
  String get saveAddressAs => 'ई पता एहि तरहेँ सहेजू';

  @override
  String get labelHome => 'घर';

  @override
  String get labelWork => 'कार्यालय';

  @override
  String get labelOther => 'आन';

  @override
  String get addressLine1Label => 'घर, फ्लैट वा भवन';

  @override
  String get addressLine1Hint => '12A, ग्रीन रेजिडेंसी';

  @override
  String get addressLine2Label => 'गली वा इलाका';

  @override
  String get addressLine2Hint => 'दोसर एवेन्यू, अन्ना नगर';

  @override
  String get landmarkLabel => 'चिन्ह';

  @override
  String get landmarkHint => 'बस स्टॉपक सामने';

  @override
  String get cityLabel => 'शहर';

  @override
  String get stateLabel => 'राज्य';

  @override
  String get pincodeLabel => 'पिन कोड';

  @override
  String get invalidPincode => 'सही 6 अंकक पिन कोड लिखू';

  @override
  String get contactNameLabel => 'संपर्क नाम';

  @override
  String get contactPhoneLabel => 'संपर्क नंबर';

  @override
  String get invalidMobileNumber => 'सही 10 अंकक मोबाइल नंबर लिखू';

  @override
  String get makeDefaultAddress => 'डिफ़ॉल्ट रूप सँ एतहि डिलीवरी';

  @override
  String get saveAddress => 'पता सहेजू';

  @override
  String get addressSaved => 'पता सहेजल गेल';

  @override
  String get addressBookTitle => 'डिलीवरी पता';

  @override
  String get manageAddresses => 'सहेजल पता प्रबंधित करू';

  @override
  String get noAddressesTitle => 'अखन धरि कोनो पता नहि';

  @override
  String get noAddressesSubtitle =>
      'एकटा पता जोड़ू जाहि सँ अहाँ धरि डिलीवरी करय बला दोकान देखा सकी।';

  @override
  String get addAddress => 'पता जोड़ू';

  @override
  String get setAsDefault => 'डिफ़ॉल्ट बनाबू';

  @override
  String get editLabel => 'संपादित करू';

  @override
  String get addressUpdated => 'पता अपडेट भ\' गेल';

  @override
  String get deleteLabel => 'मेटाबू';

  @override
  String get deleteAddressTitle => 'ई पता मेटाएब?';

  @override
  String get deleteAddressMessage => 'अहाँ एकरा बाद मे फेर जोड़ि सकैत छी।';

  @override
  String get rescueDealsTitle => 'फूड रेस्क्यू';

  @override
  String get notTakingOrders => 'ऑर्डर नहि लेल जा रहल';

  @override
  String get closedRightNow => 'अखन बन्न अछि';

  @override
  String minimumOrder(String amount) {
    return 'कम सँ कम $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count बाँकी';
  }

  @override
  String get soldOut => 'खतम भऽ गेल';

  @override
  String get menuEmptyTitle => 'अखन धरि कोनो व्यंजन नहि';

  @override
  String get menuEmptySubtitle => 'ई रेस्टोरेंट अपन मेनू नहि जोड़ने अछि।';

  @override
  String get moreDishesTitle => 'आओर व्यंजन';

  @override
  String get customisable => 'पसन्न अनुसार';

  @override
  String get requiredLabel => 'अनिवार्य';

  @override
  String get optionalLabel => 'वैकल्पिक';

  @override
  String get chooseOne => 'एकटा चुनू';

  @override
  String chooseUpTo(int count) {
    return 'बेसी सँ बेसी $count चुनू';
  }

  @override
  String chooseAtLeast(int count) {
    return 'कम सँ कम $count चुनू';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min सँ $max धरि चुनू';
  }

  @override
  String get specialInstructions => 'खास निर्देश';

  @override
  String get specialInstructionsHint => 'कम तीत, प्याज नहि…';

  @override
  String addForAmount(String amount) {
    return 'जोड़ू · $amount';
  }

  @override
  String get deliveryLabel => 'डिलीवरी';

  @override
  String get pickupLabel => 'अपने लऽ जाउ';

  @override
  String get packagingLabel => 'पैकिंग';

  @override
  String get discountLabel => 'छूट';

  @override
  String get billDetailsTitle => 'बिलक विवरण';

  @override
  String get clearCart => 'कार्ट खाली करू';

  @override
  String get clearCartTitle => 'ई कार्ट खाली करी?';

  @override
  String get clearCartMessage => 'एहि मे राखल सब किछु हटा देल जाएत।';

  @override
  String unavailableItemsNotice(String items) {
    return 'आब उपलब्ध नहि: $items';
  }

  @override
  String get removeUnavailable => 'हिनका हटाउ';

  @override
  String minimumNotMet(String amount) {
    return 'कम सँ कम ऑर्डर $amount अछि';
  }

  @override
  String get checkoutTitle => 'चेकआउट';

  @override
  String get deliveryAddressLabel => 'डिलीवरीक पता';

  @override
  String get noAddressSelected => 'कोनो पता नहि चुनल';

  @override
  String get paymentMethodLabel => 'भुगतान';

  @override
  String get payOnDelivery => 'डिलीवरी पर नगद';

  @override
  String get noteToRestaurant => 'रेस्टोरेंट लेल नोट';

  @override
  String get noteToRestaurantHint => 'घंटी दू बेर बजाउ…';

  @override
  String get activeOrdersTitle => 'चलि रहल ऑर्डर';

  @override
  String get pastOrdersTitle => 'पुरान ऑर्डर';

  @override
  String get orderItemsTitle => 'व्यंजन';

  @override
  String get orderProgressTitle => 'प्रगति';

  @override
  String get arrivingIn => 'पहुँचय मे';

  @override
  String get pickupCodeLabel => 'पिकअप कोड';

  @override
  String get cancellationReasonLabel => 'रद्द होएबाक कारण';

  @override
  String get riderLabel => 'डिलीवरी पार्टनर';

  @override
  String get callRider => 'कॉल करू';

  @override
  String get viewInvoice => 'कर रसीद';

  @override
  String get cancelOrder => 'ऑर्डर रद्द करू';

  @override
  String get cancelOrderTitle => 'ई ऑर्डर रद्द करी?';

  @override
  String get cancelOrderMessage =>
      'रेस्टोरेंटक स्वीकार करबा सँ पहिनहि रद्द कएल जा सकैत अछि।';

  @override
  String get cancelReasonLabel => 'कारण';

  @override
  String get cancelReasonFallback => 'ग्राहक रद्द कयलनि';

  @override
  String get orderCancelled => 'ऑर्डर रद्द भऽ गेल';

  @override
  String get currentLocationLabel => 'वर्तमान ठाम';

  @override
  String get editProfileTitle => 'प्रोफाइल बदलू';

  @override
  String get editProfileSubtitle =>
      'रेस्टोरेंट आ डिलीवरी पार्टनर अहाँक नामे देखैत छथि।';

  @override
  String get saveChanges => 'बदलाव सहेजू';

  @override
  String get profileUpdated => 'प्रोफाइल अपडेट भऽ गेल';

  @override
  String get deleteAccount => 'खाता मेटाउ';

  @override
  String get deleteAccountTitle => 'अपन खाता मेटाबी?';

  @override
  String get deleteAccountMessage =>
      'सब डिवाइस सँ साइन आउट भऽ जाएब। पुरान ऑर्डर आ बिल कर रिकॉर्ड लेल राखल जाइत अछि।';

  @override
  String get accountDeleted => 'अहाँक खाता मेटा देल गेल';

  @override
  String get devicesTitle => 'साइन-इन डिवाइस';

  @override
  String get devicesSubtitle => 'अहाँ कतय साइन इन छी';

  @override
  String get devicesEmptyTitle => 'आन कोनो डिवाइस नहि';

  @override
  String get devicesEmptySubtitle => 'अहाँ खाली एहि डिवाइस पर साइन इन छी।';

  @override
  String get signOutDevice => 'साइन आउट';

  @override
  String get signOutDeviceTitle => 'ई डिवाइस साइन आउट करी?';

  @override
  String get signOutDeviceMessage =>
      'जँ अहाँ एहि डिवाइसक प्रयोग कऽ रहल छी तँ फेर साइन इन करय पड़त।';

  @override
  String get deviceSignedOut => 'डिवाइस साइन आउट भऽ गेल';

  @override
  String get signOutEverywhere => 'सब ठाम सँ साइन आउट';

  @override
  String get signOutEverywhereTitle => 'सब ठाम सँ साइन आउट करी?';

  @override
  String get signOutEverywhereMessage =>
      'एहि डिवाइस सहित सब डिवाइस साइन आउट भऽ जाएत।';

  @override
  String get unknownDevice => 'अज्ञात डिवाइस';

  @override
  String get activeNow => 'एखन सक्रिय';

  @override
  String minutesAgo(int count) {
    return '$count मिनट पहिने';
  }

  @override
  String hoursAgo(int count) {
    return '$count घंटा पहिने';
  }

  @override
  String daysAgo(int count) {
    return '$count दिन पहिने';
  }

  @override
  String get filtersAndSorting => 'फिल्टर आ क्रम';

  @override
  String get clearAll => 'सब हटाउ';

  @override
  String get showResults => 'नतीजा देखू';

  @override
  String get closeLabel => 'बन्न करू';

  @override
  String get sortByTitle => 'क्रम';

  @override
  String get sortRelevance => 'प्रासंगिकता';

  @override
  String get sortRating => 'रेटिंग';

  @override
  String get sortDeliveryTime => 'डिलीवरी समय';

  @override
  String get sortCostLowHigh => 'दाम: कम सँ बेसी';

  @override
  String get sortCostHighLow => 'दाम: बेसी सँ कम';

  @override
  String get timeSection => 'समय';

  @override
  String get nearAndFast => 'लगीच आ तेज';

  @override
  String get openNow => 'अखन खुजल';

  @override
  String get ratingSection => 'रेस्टोरेंट रेटिंग';

  @override
  String ratedAbove(String rating) {
    return '$rating+ रेटिंग';
  }

  @override
  String get offersSection => 'ऑफर';

  @override
  String get hasOffersLabel => 'ऑफर वला';

  @override
  String get dishPriceSection => 'व्यंजनक दाम';

  @override
  String costUnder(String amount) {
    return '$amount सँ कम';
  }

  @override
  String costBetween(String min, String max) {
    return '$min – $max';
  }

  @override
  String costOver(String amount) {
    return '$amount+';
  }

  @override
  String get moreSection => 'आओर';

  @override
  String get noPackagingCharges => 'पैकिंग शुल्क नहि';

  @override
  String get allRestaurantsTitle => 'सब रेस्टोरेंट';

  @override
  String get whatsOnYourMind => 'की खाय के मोन अछि?';

  @override
  String get listeningNow => 'सुनि रहल छी…';

  @override
  String get speakNowHint => 'कोनो व्यंजन वा रेस्टोरेंट बाजू';

  @override
  String get voiceUnavailable => 'वॉइस सर्च उपलब्ध नहि';

  @override
  String get voiceUnavailableBody => 'अहाँ टाइप कऽ कऽ सेहो ताकि सकैत छी।';

  @override
  String get microphoneDenied => 'माइक्रोफोन अनुमति बन्न';

  @override
  String get voiceSearchLabel => 'बाजि कऽ ताकू';

  @override
  String get ratingsAndReviews => 'रेटिंग आ समीक्षा';

  @override
  String get reviewsWithTextOnly => 'समीक्षा वला';

  @override
  String get noReviewsTitle => 'अखन धरि कोनो रेटिंग नै';

  @override
  String get noReviewsSubtitle => 'ऑर्डरक बाद पहिल रेटिंग अहीं दिअ।';

  @override
  String get rateOrderTitle => 'अपन ऑर्डरकेँ रेट करू';

  @override
  String get rateDishesTitle => 'व्यंजन सभकेँ रेट करू';

  @override
  String get reviewHint => 'आर किछु कहय चाहब? (वैकल्पिक)';

  @override
  String get submitRating => 'रेटिंग पठाउ';

  @override
  String get reviewThanks => 'धन्यवाद — अहाँक रेटिंग भेट गेल।';

  @override
  String get rateThisOrder => 'ई ऑर्डरकेँ रेट करू';
}
