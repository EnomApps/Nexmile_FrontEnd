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
  String get fieldRequired => 'हे क्षेत्र आवश्यक आहे';

  @override
  String get tagline => 'जलद डिलिव्हरी. ताजे स्मित.';

  @override
  String get chooseLanguageTitle => 'तुमची भाषा निवडा';

  @override
  String get chooseLanguageSubtitle =>
      'तुम्हाला सोयीची वाटेल ती भाषा निवडा. तुम्ही ती कधीही सेटिंग्जमध्ये बदलू शकता.';

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
  String get homeSubtitle =>
      'ताजा किराणा, गरम जेवण आणि दैनंदिन गरजा तुमच्या जवळच्या दुकानांमधून.';

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
  String get loginSubtitle =>
      'तुमचा ईमेल किंवा मोबाइल क्रमांक टाका, आम्ही पडताळणी कोड पाठवू.';

  @override
  String get emailOrPhoneLabel => 'ईमेल किंवा मोबाइल क्रमांक';

  @override
  String get emailOrPhoneHint => 'name@example.com किंवा 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'वैध ईमेल पत्ता किंवा 10 अंकी मोबाइल क्रमांक टाका';

  @override
  String get sendCode => 'कोड पाठवा';

  @override
  String get agreeToTermsOnContinue =>
      'पुढे जाऊन तुम्ही आमच्या सेवा अटी आणि गोपनीयता धोरणाशी सहमत होता.';

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
  String get incorrectCode =>
      'हा कोड चुकीचा आहे किंवा त्याची मुदत संपली आहे. नवीन कोड मागवा.';

  @override
  String get enterFullCode => 'पूर्ण 6 अंक टाका';

  @override
  String get accountSuspended =>
      'हे खाते निलंबित करण्यात आले आहे. कृपया सहाय्यताशी संपर्क साधा.';

  @override
  String get tooManyAttempts =>
      'खूप वेळा प्रयत्न झाले. कृपया थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get sessionExpired =>
      'तुमचे सत्र संपले आहे. कृपया पुन्हा साइन इन करा.';

  @override
  String get networkError =>
      'इंटरनेट कनेक्शन नाही. तुमचे कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

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

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'शोधा';

  @override
  String get navOrders => 'ऑर्डर';

  @override
  String get cancelLabel => 'रद्द करा';

  @override
  String get deliverTo => 'डिलिव्हरी पत्ता';

  @override
  String get searchDishesHint => 'पदार्थ किंवा रेस्टॉरंट शोधा';

  @override
  String get searchTitle => 'शोधा';

  @override
  String get searchNoResultsTitle => 'काहीही सापडले नाही';

  @override
  String get searchNoResultsSubtitle =>
      'दुसरा पदार्थ, पाककृती किंवा रेस्टॉरंटचे नाव वापरून पहा.';

  @override
  String get cravingTitle => 'आज काय खावंसं वाटतंय?';

  @override
  String get offersTitle => 'तुमच्यासाठी ऑफर';

  @override
  String get restaurantsNearby => 'तुमच्या जवळची रेस्टॉरंट';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रेस्टॉरंट',
      one: '1 रेस्टॉरंट',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'इथे अजून काही नाही';

  @override
  String get noRestaurantsSubtitle => 'दुसरी श्रेणी पहा किंवा फिल्टर काढा.';

  @override
  String minutesAway(int minutes) {
    return '$minutes मिनिटे';
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
    return 'दोघांसाठी ₹$amount';
  }

  @override
  String get freeDelivery => 'मोफत डिलिव्हरी';

  @override
  String percentOff(int percent) {
    return '$percent% सूट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'तुमच्या ऑर्डरवर $percent% सूट';
  }

  @override
  String get vegOnly => 'फक्त शाकाहारी';

  @override
  String get bestseller => 'सर्वाधिक विकले';

  @override
  String get addLabel => 'जोडा';

  @override
  String get noVegDishesTitle => 'इथे शाकाहारी पदार्थ नाहीत';

  @override
  String get noVegDishesSubtitle =>
      'पूर्ण मेन्यू पाहण्यासाठी शाकाहारी फिल्टर बंद करा.';

  @override
  String get replaceCartTitle => 'नवीन कार्ट सुरू करायची?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'तुमच्या कार्टमध्ये $restaurant मधील वस्तू आहेत. हे जोडल्यास त्या काढल्या जातील.';
  }

  @override
  String get replaceCartConfirm => 'काढून जोडा';

  @override
  String get cartTitle => 'तुमची कार्ट';

  @override
  String get cartEmptyTitle => 'तुमची कार्ट रिकामी आहे';

  @override
  String get cartEmptySubtitle =>
      'सुरू करण्यासाठी एखाद्या रेस्टॉरंटमधून पदार्थ जोडा.';

  @override
  String get browseRestaurants => 'रेस्टॉरंट पहा';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count वस्तू',
      one: '1 वस्तू',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'कार्ट पहा';

  @override
  String get itemTotal => 'वस्तूंची एकूण';

  @override
  String get deliveryFeeLabel => 'डिलिव्हरी शुल्क';

  @override
  String get taxesAndCharges => 'कर आणि शुल्क';

  @override
  String get freeLabel => 'मोफत';

  @override
  String get toPay => 'देय रक्कम';

  @override
  String placeOrderFor(String amount) {
    return 'ऑर्डर करा · $amount';
  }

  @override
  String get ordersTitle => 'तुमच्या ऑर्डर';

  @override
  String get ordersEmptyTitle => 'अजून ऑर्डर नाहीत';

  @override
  String get ordersEmptySubtitle => 'तुमच्या मागील ऑर्डर इथे दिसतील.';

  @override
  String get reorder => 'पुन्हा ऑर्डर';

  @override
  String orderTitle(String id) {
    return 'ऑर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'ऑर्डर झाली';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'सुमारे $minutes मिनिटांत पोहोचेल.';
  }

  @override
  String get orderDeliveredTitle => 'डिलिव्हर झाली';

  @override
  String get orderDeliveredSubtitle => 'जेवणाचा आनंद घ्या.';

  @override
  String get statusOrderPlaced => 'ऑर्डर झाली';

  @override
  String get statusPreparing => 'जेवण तयार होत आहे';

  @override
  String get statusOnTheWay => 'वाटेवर आहे';

  @override
  String get statusDelivered => 'डिलिव्हर झाली';

  @override
  String get keepBrowsing => 'पाहत रहा';

  @override
  String get backToHome => 'होमवर परत';

  @override
  String get prototypeNotice =>
      'नमुना स्टोअरफ्रंट — खरी दुकाने कॅटलॉग API सोबत येतील.';

  @override
  String get prototypeCheckoutNotice =>
      'हा एक प्रोटोटाइप आहे. कोणतेही पैसे घेतले जात नाहीत आणि खरी ऑर्डरही होत नाही.';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइपसाठी ट्रॅकिंग कृत्रिम आहे.';

  @override
  String get locationTitle => 'डिलिव्हरी कुठे करायची?';

  @override
  String get locationSubtitle =>
      'Nexmile फक्त 1 किमीच्या आतल्या दुकानांमधून डिलिव्हरी करते, म्हणून तुमचे नेमके ठिकाण हवे.';

  @override
  String get locationReasonRadiusTitle => '1 किमीच्या आतली दुकाने';

  @override
  String get locationReasonRadiusBody =>
      'जिथून जेवण गरम पोहोचेल तीच स्वयंपाकघरे आम्ही दाखवतो.';

  @override
  String get locationReasonAccuracyTitle => 'अगदी योग्य दारापर्यंत';

  @override
  String get locationReasonAccuracyBody =>
      'अचूक पिन असल्यास डिलिव्हरी पार्टनर फोन न करता तुम्हाला शोधतो.';

  @override
  String get locationReasonPrivacyTitle => 'फक्त ॲप वापरताना';

  @override
  String get locationReasonPrivacyBody =>
      'आम्ही पार्श्वभूमीत तुमचा माग काढत नाही, आणि पत्ता तुम्ही स्वतःही लिहू शकता.';

  @override
  String get allowLocation => 'लोकेशनला परवानगी द्या';

  @override
  String get enterAddressManually => 'मी पत्ता स्वतः लिहीन';

  @override
  String get locationDenied =>
      'लोकेशनची परवानगी नाकारली. तुम्ही पिन स्वतः ठेवू शकता.';

  @override
  String get locationDeniedForever =>
      'Nexmile साठी लोकेशन बंद आहे. सेटिंग्जमध्ये चालू करा किंवा पिन स्वतः ठेवा.';

  @override
  String get locationServiceOff => 'या डिव्हाइसवर लोकेशन बंद आहे.';

  @override
  String get locationUnavailable => 'लोकेशन मिळाले नाही. कृपया पिन स्वतः ठेवा.';

  @override
  String get openSettings => 'सेटिंग्ज';

  @override
  String get pinLocationTitle => 'तुमचा डिलिव्हरी पिन ठेवा';

  @override
  String get deliveryRadiusHint =>
      'वर्तुळ Nexmile डिलिव्हरी करत असलेली 1 किमी दाखवते.';

  @override
  String get useMyLocation => 'माझे लोकेशन वापरा';

  @override
  String get deliveringHere => 'इथे डिलिव्हरी';

  @override
  String get dragToAdjust => 'पिन बदलण्यासाठी नकाशा हलवा';

  @override
  String get confirmLocation => 'लोकेशन निश्चित करा';

  @override
  String get addressDetailsTitle => 'पत्त्याचा तपशील';

  @override
  String get addressDetailsSubtitle =>
      'योग्य दारापर्यंत पोहोचण्यासाठी घर क्रमांक आणि खूण द्या.';

  @override
  String get pinnedLocation => 'निवडलेले ठिकाण';

  @override
  String get changePin => 'बदला';

  @override
  String get saveAddressAs => 'हा पत्ता असा जतन करा';

  @override
  String get labelHome => 'घर';

  @override
  String get labelWork => 'ऑफिस';

  @override
  String get labelOther => 'इतर';

  @override
  String get addressLine1Label => 'घर, फ्लॅट किंवा इमारत';

  @override
  String get addressLine1Hint => '12A, ग्रीन रेसिडेन्सी';

  @override
  String get addressLine2Label => 'रस्ता किंवा परिसर';

  @override
  String get addressLine2Hint => 'दुसरा अव्हेन्यू, अण्णा नगर';

  @override
  String get landmarkLabel => 'खूण';

  @override
  String get landmarkHint => 'बस स्टॉपसमोर';

  @override
  String get cityLabel => 'शहर';

  @override
  String get stateLabel => 'राज्य';

  @override
  String get pincodeLabel => 'पिन कोड';

  @override
  String get invalidPincode => 'वैध 6 अंकी पिन कोड टाका';

  @override
  String get contactNameLabel => 'संपर्क नाव';

  @override
  String get contactPhoneLabel => 'संपर्क क्रमांक';

  @override
  String get invalidMobileNumber => 'वैध 10 अंकी मोबाइल क्रमांक टाका';

  @override
  String get makeDefaultAddress => 'डीफॉल्टनुसार इथेच डिलिव्हरी';

  @override
  String get saveAddress => 'पत्ता जतन करा';

  @override
  String get addressSaved => 'पत्ता जतन झाला';

  @override
  String get addressBookTitle => 'डिलिव्हरी पत्ते';

  @override
  String get manageAddresses => 'जतन केलेले पत्ते व्यवस्थापित करा';

  @override
  String get noAddressesTitle => 'अजून पत्ता नाही';

  @override
  String get noAddressesSubtitle =>
      'तुमच्यापर्यंत डिलिव्हरी करणारी दुकाने दाखवण्यासाठी एक पत्ता जोडा.';

  @override
  String get addAddress => 'पत्ता जोडा';

  @override
  String get setAsDefault => 'डीफॉल्ट करा';

  @override
  String get editLabel => 'संपादित करा';

  @override
  String get addressUpdated => 'पत्ता अद्ययावत झाला';

  @override
  String get deleteLabel => 'हटवा';

  @override
  String get deleteAddressTitle => 'हा पत्ता हटवायचा?';

  @override
  String get deleteAddressMessage => 'तुम्ही तो नंतर पुन्हा जोडू शकता.';

  @override
  String get rescueDealsTitle => 'फूड रेस्क्यू';

  @override
  String get notTakingOrders => 'ऑर्डर घेत नाही';

  @override
  String get closedRightNow => 'सध्या बंद आहे';

  @override
  String minimumOrder(String amount) {
    return 'किमान $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count शिल्लक';
  }

  @override
  String get soldOut => 'संपले';

  @override
  String get menuEmptyTitle => 'अजून पदार्थ नाहीत';

  @override
  String get menuEmptySubtitle => 'या रेस्टॉरंटने आपला मेनू जोडलेला नाही.';

  @override
  String get moreDishesTitle => 'आणखी पदार्थ';

  @override
  String get customisable => 'आवडीनुसार';

  @override
  String get requiredLabel => 'आवश्यक';

  @override
  String get optionalLabel => 'ऐच्छिक';

  @override
  String get chooseOne => 'एक निवडा';

  @override
  String chooseUpTo(int count) {
    return 'जास्तीत जास्त $count निवडा';
  }

  @override
  String chooseAtLeast(int count) {
    return 'किमान $count निवडा';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ते $max निवडा';
  }

  @override
  String get specialInstructions => 'खास सूचना';

  @override
  String get specialInstructionsHint => 'कमी तिखट, कांदा नको…';

  @override
  String addForAmount(String amount) {
    return 'जोडा · $amount';
  }

  @override
  String get deliveryLabel => 'डिलिव्हरी';

  @override
  String get pickupLabel => 'स्वतः न्या';

  @override
  String get packagingLabel => 'पॅकिंग';

  @override
  String get discountLabel => 'सवलत';

  @override
  String get billDetailsTitle => 'बिलाचा तपशील';

  @override
  String get clearCart => 'कार्ट रिकामी करा';

  @override
  String get clearCartTitle => 'ही कार्ट रिकामी करायची?';

  @override
  String get clearCartMessage => 'यातील सर्व काही काढून टाकले जाईल.';

  @override
  String unavailableItemsNotice(String items) {
    return 'आता उपलब्ध नाही: $items';
  }

  @override
  String get removeUnavailable => 'ते काढून टाका';

  @override
  String minimumNotMet(String amount) {
    return 'किमान ऑर्डर $amount आहे';
  }

  @override
  String get checkoutTitle => 'चेकआउट';

  @override
  String get deliveryAddressLabel => 'डिलिव्हरीचा पत्ता';

  @override
  String get noAddressSelected => 'पत्ता निवडलेला नाही';

  @override
  String get paymentMethodLabel => 'पेमेंट';

  @override
  String get payOnDelivery => 'डिलिव्हरीवर रोख';

  @override
  String get noteToRestaurant => 'रेस्टॉरंटसाठी सूचना';

  @override
  String get noteToRestaurantHint => 'बेल दोनदा वाजवा…';

  @override
  String get activeOrdersTitle => 'सुरू असलेल्या ऑर्डर';

  @override
  String get pastOrdersTitle => 'जुन्या ऑर्डर';

  @override
  String get orderItemsTitle => 'पदार्थ';

  @override
  String get orderProgressTitle => 'प्रगती';

  @override
  String get arrivingIn => 'पोहोचण्यास';

  @override
  String get pickupCodeLabel => 'पिकअप कोड';

  @override
  String get cancellationReasonLabel => 'रद्द होण्याचे कारण';

  @override
  String get riderLabel => 'डिलिव्हरी पार्टनर';

  @override
  String get callRider => 'कॉल करा';

  @override
  String get viewInvoice => 'कर पावती';

  @override
  String get cancelOrder => 'ऑर्डर रद्द करा';

  @override
  String get cancelOrderTitle => 'ही ऑर्डर रद्द करायची?';

  @override
  String get cancelOrderMessage =>
      'रेस्टॉरंटने स्वीकारण्यापूर्वीच रद्द करता येते.';

  @override
  String get cancelReasonLabel => 'कारण';

  @override
  String get cancelReasonFallback => 'ग्राहकाने रद्द केली';

  @override
  String get orderCancelled => 'ऑर्डर रद्द झाली';

  @override
  String get currentLocationLabel => 'सध्याचे ठिकाण';

  @override
  String get editProfileTitle => 'प्रोफाइल संपादित करा';

  @override
  String get editProfileSubtitle =>
      'रेस्टॉरंट आणि डिलिव्हरी पार्टनरला तुमचे नावच दिसते.';

  @override
  String get saveChanges => 'बदल जतन करा';

  @override
  String get profileUpdated => 'प्रोफाइल अद्ययावत झाले';

  @override
  String get deleteAccount => 'खाते हटवा';

  @override
  String get deleteAccountTitle => 'तुमचे खाते हटवायचे?';

  @override
  String get deleteAccountMessage =>
      'सर्व उपकरणांवरून साइन आउट व्हाल. जुन्या ऑर्डर आणि पावत्या कर नोंदींसाठी ठेवल्या जातात.';

  @override
  String get accountDeleted => 'तुमचे खाते हटवले गेले';

  @override
  String get devicesTitle => 'साइन-इन उपकरणे';

  @override
  String get devicesSubtitle => 'तुम्ही कुठे साइन इन आहात';

  @override
  String get devicesEmptyTitle => 'दुसरे कोणतेही उपकरण नाही';

  @override
  String get devicesEmptySubtitle => 'तुम्ही फक्त याच उपकरणावर साइन इन आहात.';

  @override
  String get signOutDevice => 'साइन आउट';

  @override
  String get signOutDeviceTitle => 'हे उपकरण साइन आउट करायचे?';

  @override
  String get signOutDeviceMessage =>
      'तुम्ही हेच उपकरण वापरत असाल तर पुन्हा साइन इन करावे लागेल.';

  @override
  String get deviceSignedOut => 'उपकरण साइन आउट झाले';

  @override
  String get signOutEverywhere => 'सर्वत्र साइन आउट';

  @override
  String get signOutEverywhereTitle => 'सर्वत्र साइन आउट करायचे?';

  @override
  String get signOutEverywhereMessage =>
      'या उपकरणासह प्रत्येक उपकरण साइन आउट होईल.';

  @override
  String get unknownDevice => 'अज्ञात उपकरण';

  @override
  String get activeNow => 'आत्ता सक्रिय';

  @override
  String minutesAgo(int count) {
    return '$count मिनिटांपूर्वी';
  }

  @override
  String hoursAgo(int count) {
    return '$count तासांपूर्वी';
  }

  @override
  String daysAgo(int count) {
    return '$count दिवसांपूर्वी';
  }

  @override
  String get filtersAndSorting => 'फिल्टर आणि क्रम';

  @override
  String get clearAll => 'सर्व काढा';

  @override
  String get showResults => 'निकाल पहा';

  @override
  String get closeLabel => 'बंद करा';

  @override
  String get sortByTitle => 'क्रमवारी';

  @override
  String get sortRelevance => 'सुसंगतता';

  @override
  String get sortRating => 'रेटिंग';

  @override
  String get sortDeliveryTime => 'डिलिव्हरी वेळ';

  @override
  String get sortCostLowHigh => 'किंमत: कमी ते जास्त';

  @override
  String get sortCostHighLow => 'किंमत: जास्त ते कमी';

  @override
  String get timeSection => 'वेळ';

  @override
  String get nearAndFast => 'जवळ आणि जलद';

  @override
  String get openNow => 'आत्ता उघडे';

  @override
  String get ratingSection => 'रेस्टॉरंट रेटिंग';

  @override
  String ratedAbove(String rating) {
    return '$rating+ रेटिंग';
  }

  @override
  String get offersSection => 'ऑफर';

  @override
  String get hasOffersLabel => 'ऑफर असलेले';

  @override
  String get dishPriceSection => 'पदार्थाची किंमत';

  @override
  String costUnder(String amount) {
    return '$amount पेक्षा कमी';
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
  String get moreSection => 'अधिक';

  @override
  String get noPackagingCharges => 'पॅकिंग शुल्क नाही';

  @override
  String get allRestaurantsTitle => 'सर्व रेस्टॉरंट';

  @override
  String get whatsOnYourMind => 'काय खावंसं वाटतंय?';

  @override
  String get listeningNow => 'ऐकत आहोत…';

  @override
  String get speakNowHint => 'पदार्थ किंवा रेस्टॉरंट सांगा';

  @override
  String get voiceUnavailable => 'व्हॉइस सर्च उपलब्ध नाही';

  @override
  String get voiceUnavailableBody => 'तुम्ही टाइप करूनही शोधू शकता.';

  @override
  String get microphoneDenied => 'मायक्रोफोन परवानगी बंद';

  @override
  String get voiceSearchLabel => 'आवाजाने शोधा';

  @override
  String get ratingsAndReviews => 'रेटिंग आणि परीक्षणे';

  @override
  String get reviewsWithTextOnly => 'परीक्षण असलेली';

  @override
  String get noReviewsTitle => 'अजून एकही रेटिंग नाही';

  @override
  String get noReviewsSubtitle => 'ऑर्डरनंतर पहिले रेटिंग तुम्हीच द्या.';

  @override
  String get rateOrderTitle => 'तुमच्या ऑर्डरला रेटिंग द्या';

  @override
  String get rateDishesTitle => 'पदार्थांना रेटिंग द्या';

  @override
  String get reviewHint => 'आणखी काही सांगायचे आहे? (ऐच्छिक)';

  @override
  String get submitRating => 'रेटिंग पाठवा';

  @override
  String get reviewThanks => 'धन्यवाद — तुमचे रेटिंग नोंदले.';

  @override
  String get rateThisOrder => 'या ऑर्डरला रेटिंग द्या';
}
