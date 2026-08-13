// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Konkani (`kok`).
class AppLocalizationsKok extends AppLocalizations {
  AppLocalizationsKok([String locale = 'kok']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'हें खण गरजेचें आसा';

  @override
  String get tagline => 'वेगान डिलिव्हरी. ताजें हास्य.';

  @override
  String get chooseLanguageTitle => 'तुमची भास वेंचात';

  @override
  String get chooseLanguageSubtitle => 'तुमकां सोंपी दिसता ती भास वेंचात. तुमी ती केन्नाय सेटिंग्जांत बदलूं येता.';

  @override
  String get searchLanguageHint => 'भास सोदात';

  @override
  String get noLanguageFound => 'खंयचीच भास मेळूंक ना';

  @override
  String languagesAvailable(int count) {
    return '$count भासो उपलब्ध आसात';
  }

  @override
  String get continueLabel => 'फुडें वचात';

  @override
  String get selectedLabel => 'वेंचिल्ली';

  @override
  String get defaultLabel => 'डिफॉल्ट';

  @override
  String get homeTitle => 'Nexmile हांगा येवकार';

  @override
  String get homeSubtitle => 'ताजो किराणो, गरम जेवण आनी दिसपट्ट्यो गरजेच्यो वस्तू तुमच्या लागसारच्या दुकानांतल्यान.';

  @override
  String get changeLanguage => 'भास बदलात';

  @override
  String get languageUpdated => 'भास बदल्ली';

  @override
  String get appLanguageLabel => 'ॲपाची भास';

  @override
  String greetingNamed(String name) {
    return 'नमस्कार, $name';
  }

  @override
  String get loginTitle => 'Nexmile हांगा साइन इन करात';

  @override
  String get loginSubtitle => 'तुमचो ईमेल वा मोबायल क्रमांक घालात, आमी सत्यापन कोड धाडटले.';

  @override
  String get emailOrPhoneLabel => 'ईमेल वा मोबायल क्रमांक';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'योग्य ईमेल नामो वा 10 आंकड्यांचो मोबायल क्रमांक घालात';

  @override
  String get sendCode => 'कोड धाडात';

  @override
  String get agreeToTermsOnContinue => 'फुडें वचून तुमी आमच्यो सेवा अटी आनी गुपीतपण धोरण मान्य करतात.';

  @override
  String get otpTitle => 'हो तुमीच अशें सत्यापित करात';

  @override
  String otpSubtitle(String target) {
    return '$target हाका धाडिल्लो 6 आंकड्यांचो कोड घालात';
  }

  @override
  String get verifyCode => 'सत्यापित करात';

  @override
  String get resendCode => 'कोड परत धाडात';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकंदांनी परत धाडात';
  }

  @override
  String get codeResent => 'नवो कोड धाडला';

  @override
  String get incorrectCode => 'हो कोड चुकीचो आसा वा ताची मुजत सोंपली. नवो कोड मागात.';

  @override
  String get enterFullCode => 'पुराय 6 आंकडे घालात';

  @override
  String get accountSuspended => 'हें खातें निलंबित केलां. उपकार करून आदाराक संपर्क करात.';

  @override
  String get tooManyAttempts => 'खूब फावटीं यत्न जाले. उपकार करून थोड्या वेळान परत यत्न करात.';

  @override
  String get sessionExpired => 'तुमचें सत्र सोंपलां. उपकार करून परत साइन इन करात.';

  @override
  String get networkError => 'इंटरनॅट जोडणी ना. जोडणी तपासात आनी परत यत्न करात.';

  @override
  String get developmentCode => 'डेव्हलपमेंट कोड';

  @override
  String get signOut => 'साइन आवट';

  @override
  String get signedOut => 'तुमी साइन आवट जाल्यात';

  @override
  String get somethingWentWrong => 'कितें तरी चुकलें. उपकार करून परत यत्न करात.';

  @override
  String get profileTitle => 'प्रोफायल';

  @override
  String get viewProfile => 'प्रोफायल पळयात';

  @override
  String get nameLabel => 'नांव';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबायल क्रमांक';

  @override
  String get accountStatusLabel => 'खात्याची स्थिती';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'प्रलंबीत';

  @override
  String get statusSuspended => 'निलंबीत';

  @override
  String get verifiedLabel => 'सत्यापीत';

  @override
  String get notProvided => 'जोडूंक ना';

  @override
  String get retry => 'परत यत्न करात';

  @override
  String get navHome => 'होम';

  @override
  String get navSearch => 'सोदात';

  @override
  String get navOrders => 'ऑर्डर';

  @override
  String get cancelLabel => 'रद्द करात';

  @override
  String get deliverTo => 'डिलिव्हरी नामो';

  @override
  String get searchDishesHint => 'जेवण वा रेस्टॉरंट सोदात';

  @override
  String get searchTitle => 'सोदात';

  @override
  String get searchNoResultsTitle => 'कितेंच मेळूंक ना';

  @override
  String get searchNoResultsSubtitle => 'हेर जेवण, पाकशैली वा रेस्टॉरंटाचें नांव यत्न करात.';

  @override
  String get cravingTitle => 'आयज कितें खावंक जाय?';

  @override
  String get offersTitle => 'तुमकां खातीर ऑफर';

  @override
  String get restaurantsNearby => 'तुमच्या लागसारचीं रेस्टॉरंटां';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टॉरंटां';
  }

  @override
  String get noRestaurantsTitle => 'हांगा अजून कितेंच ना';

  @override
  String get noRestaurantsSubtitle => 'हेर वर्ग पळयात वा फिल्टर काडात.';

  @override
  String minutesAway(int minutes) {
    return '$minutes मिनटां';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance किमी';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ रेटिंगां';
  }

  @override
  String priceForTwo(int amount) {
    return 'दोगांक ₹$amount';
  }

  @override
  String get freeDelivery => 'फुकट डिलिव्हरी';

  @override
  String percentOff(int percent) {
    return '$percent% सूट';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'तुमच्या ऑर्डराचेर $percent% सूट';
  }

  @override
  String get vegOnly => 'फकत शाकाहारी';

  @override
  String get bestseller => 'चड विकपी';

  @override
  String get addLabel => 'जोडात';

  @override
  String get noVegDishesTitle => 'हांगा शाकाहारी जेवण ना';

  @override
  String get noVegDishesSubtitle => 'आख्खो मेनू पळोवंक शाकाहारी फिल्टर बंद करात.';

  @override
  String get replaceCartTitle => 'नवी कार्ट सुरू करूंया?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'तुमच्या कार्टांत $restaurant च्यो वस्तू आसात. हें जोडल्यार त्यो काडटल्यो.';
  }

  @override
  String get replaceCartConfirm => 'काडून जोडात';

  @override
  String get cartTitle => 'तुमची कार्ट';

  @override
  String get cartEmptyTitle => 'तुमची कार्ट रिकामी आसा';

  @override
  String get cartEmptySubtitle => 'सुरू करुंक खंयच्याय रेस्टॉरंटांतल्यान जेवण जोडात.';

  @override
  String get browseRestaurants => 'रेस्टॉरंटां पळयात';

  @override
  String itemsInCart(int count) {
    return '$count वस्तू';
  }

  @override
  String get viewCart => 'कार्ट पळयात';

  @override
  String get itemTotal => 'वस्तूंची बेरीज';

  @override
  String get deliveryFeeLabel => 'डिलिव्हरी शुल्क';

  @override
  String get taxesAndCharges => 'कर आनी शुल्कां';

  @override
  String get freeLabel => 'फुकट';

  @override
  String get toPay => 'दिवपाचें';

  @override
  String placeOrderFor(String amount) {
    return 'ऑर्डर करात · $amount';
  }

  @override
  String get ordersTitle => 'तुमच्यो ऑर्डरी';

  @override
  String get ordersEmptyTitle => 'अजून ऑर्डर ना';

  @override
  String get ordersEmptySubtitle => 'तुमच्यो पयल्यो ऑर्डरी हांगा दिसतल्यो.';

  @override
  String get reorder => 'परत ऑर्डर';

  @override
  String orderTitle(String id) {
    return 'ऑर्डर $id';
  }

  @override
  String get orderPlacedTitle => 'ऑर्डर जाली';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'सुमार $minutes मिनटांनी पावतली.';
  }

  @override
  String get orderDeliveredTitle => 'डिलिव्हर जाली';

  @override
  String get orderDeliveredSubtitle => 'जेवणाचो आनंद घेयात.';

  @override
  String get statusOrderPlaced => 'ऑर्डर जाली';

  @override
  String get statusPreparing => 'जेवण तयार जातां';

  @override
  String get statusOnTheWay => 'वाटेर आसा';

  @override
  String get statusDelivered => 'डिलिव्हर जाली';

  @override
  String get keepBrowsing => 'पळयत रावात';

  @override
  String get backToHome => 'होमाचेर परत';

  @override
  String get prototypeNotice => 'नमुनो स्टोरफ्रंट — खरीं दुकानां कॅटलॉग API वांगडा येतलीं.';

  @override
  String get prototypeCheckoutNotice => 'हो एक प्रोटोटायप. खंयचेंच पैशे घेनात आनी खरी ऑर्डरय जायना.';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटायपा खातीर ट्रॅकिंग कृत्रिम आसा.';

  @override
  String get locationTitle => 'डिलिव्हरी खंय करची?';

  @override
  String get locationSubtitle => 'Nexmile फकत 1 किमी भितरल्या दुकानांतल्यान डिलिव्हरी करता, देखून तुमचें नेमकें सुवात जाय.';

  @override
  String get locationReasonRadiusTitle => '1 किमी भितरलीं दुकानां';

  @override
  String get locationReasonRadiusBody => 'खंयच्यान जेवण गरम पावतलें, तीच रांदपाघरां आमी दाखयतांव.';

  @override
  String get locationReasonAccuracyTitle => 'बरोबर दारा मेरेन';

  @override
  String get locationReasonAccuracyBody => 'अचूक पिन आसल्यार डिलिव्हरी पार्टनर फोन करिनासतना तुमकां सोदता.';

  @override
  String get locationReasonPrivacyTitle => 'फकत ॲप वापरतना';

  @override
  String get locationReasonPrivacyBody => 'आमी फाटभुंयेर तुमचो माग काडिनांव, आनी नामो तुमी स्वता लेगीत बरोवंक शकतात.';

  @override
  String get allowLocation => 'सुवातेची परवानगी दियात';

  @override
  String get enterAddressManually => 'हांव नामो स्वता बरयतलों';

  @override
  String get locationDenied => 'सुवातेची परवानगी मेळूंक ना. तुमी पिन स्वता दवरूंक शकतात.';

  @override
  String get locationDeniedForever => 'Nexmile खातीर सुवात बंद आसा. सेटिंग्जांत सुरू करात वा पिन स्वता दवरात.';

  @override
  String get locationServiceOff => 'ह्या उपकरणाचेर सुवात बंद आसा.';

  @override
  String get locationUnavailable => 'सुवात मेळूंक ना. उपकार करून पिन स्वता दवरात.';

  @override
  String get openSettings => 'सेटिंग्ज';

  @override
  String get pinLocationTitle => 'तुमचो डिलिव्हरी पिन दवरात';

  @override
  String get deliveryRadiusHint => 'वर्तूळ Nexmile डिलिव्हरी करता ती 1 किमी दाखयता.';

  @override
  String get useMyLocation => 'म्हजी सुवात वापरात';

  @override
  String get deliveringHere => 'हांगा डिलिव्हरी';

  @override
  String get dragToAdjust => 'पिन बदलुंक नकासो ओडात';

  @override
  String get confirmLocation => 'सुवात निश्चीत करात';

  @override
  String get addressDetailsTitle => 'नाम्याचो तपशील';

  @override
  String get addressDetailsSubtitle => 'बरोबर दारा मेरेन पावपाक घर क्रमांक आनी खूण जोडात.';

  @override
  String get pinnedLocation => 'वेंचिल्ली सुवात';

  @override
  String get changePin => 'बदलात';

  @override
  String get saveAddressAs => 'हो नामो अशें जतनाय करात';

  @override
  String get labelHome => 'घर';

  @override
  String get labelWork => 'कार्यालय';

  @override
  String get labelOther => 'हेर';

  @override
  String get addressLine1Label => 'घर, फ्लॅट वा इमारत';

  @override
  String get addressLine1Hint => '12A, ग्रीन रेसिडेन्सी';

  @override
  String get addressLine2Label => 'रस्तो वा वाठार';

  @override
  String get addressLine2Hint => 'दुसरी ॲव्हेन्यू, अन्ना नगर';

  @override
  String get landmarkLabel => 'खूण';

  @override
  String get landmarkHint => 'बस स्टॉपा मुखार';

  @override
  String get cityLabel => 'शार';

  @override
  String get stateLabel => 'राज्य';

  @override
  String get pincodeLabel => 'पिन कोड';

  @override
  String get invalidPincode => 'योग्य 6 आंकड्यांचो पिन कोड घालात';

  @override
  String get contactNameLabel => 'संपर्क नांव';

  @override
  String get contactPhoneLabel => 'संपर्क क्रमांक';

  @override
  String get invalidMobileNumber => 'योग्य 10 आंकड्यांचो मोबायल क्रमांक घालात';

  @override
  String get makeDefaultAddress => 'डिफॉल्ट रुपान हांगाच डिलिव्हरी';

  @override
  String get saveAddress => 'नामो जतनाय करात';

  @override
  String get addressSaved => 'नामो जतनाय केलो';

  @override
  String get addressBookTitle => 'डिलिव्हरी नामे';

  @override
  String get manageAddresses => 'जतनाय केल्ले नामे सांबाळात';

  @override
  String get noAddressesTitle => 'अजून नामो ना';

  @override
  String get noAddressesSubtitle => 'तुमकां डिलिव्हरी करपी दुकानां दाखोवपाक एक नामो जोडात.';

  @override
  String get addAddress => 'नामो जोडात';

  @override
  String get setAsDefault => 'डिफॉल्ट करात';

  @override
  String get editLabel => 'संपादन करात';

  @override
  String get addressUpdated => 'नामो अद्यतन जालो';

  @override
  String get deleteLabel => 'काडात';

  @override
  String get deleteAddressTitle => 'हो नामो काडचो?';

  @override
  String get deleteAddressMessage => 'तुमी ताका उपरांत परत जोडूंक शकतात.';

  @override
  String get rescueDealsTitle => 'फूड रेस्क्यू';

  @override
  String get notTakingOrders => 'ऑर्डर घेवपाक ना';

  @override
  String get closedRightNow => 'आतां बंद आसा';

  @override
  String minimumOrder(String amount) {
    return 'कमीत कमी $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count उरल्यात';
  }

  @override
  String get soldOut => 'सोंपले';

  @override
  String get menuEmptyTitle => 'अजून कसलेच पदार्थ ना';

  @override
  String get menuEmptySubtitle => 'ह्या रेस्टॉरंटान आपलो मेनू जोडूंक ना.';

  @override
  String get moreDishesTitle => 'आनीक पदार्थ';

  @override
  String get customisable => 'आवडी प्रमाणें';

  @override
  String get requiredLabel => 'गरजेचें';

  @override
  String get optionalLabel => 'ऐच्छीक';

  @override
  String get chooseOne => 'एक निवडात';

  @override
  String chooseUpTo(int count) {
    return 'चड आनी चड $count निवडात';
  }

  @override
  String chooseAtLeast(int count) {
    return 'कमीत कमी $count निवडात';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ते $max निवडात';
  }

  @override
  String get specialInstructions => 'खाशेल्यो सुचोवण्यो';

  @override
  String get specialInstructionsHint => 'उणें तिखट, कांदो नाका…';

  @override
  String addForAmount(String amount) {
    return 'जोडात · $amount';
  }

  @override
  String get deliveryLabel => 'डिलिव्हरी';

  @override
  String get pickupLabel => 'स्वता व्हरप';

  @override
  String get packagingLabel => 'पॅकिंग';

  @override
  String get discountLabel => 'सूट';

  @override
  String get billDetailsTitle => 'बिलाची म्हायती';

  @override
  String get clearCart => 'कार्ट रिकामी करात';

  @override
  String get clearCartTitle => 'ही कार्ट रिकामी करूं?';

  @override
  String get clearCartMessage => 'हातूंतलें सगळें काडून उडयतले.';

  @override
  String unavailableItemsNotice(String items) {
    return 'आतां मेळना: $items';
  }

  @override
  String get removeUnavailable => 'तीं काडात';

  @override
  String minimumNotMet(String amount) {
    return 'कमीत कमी ऑर्डर $amount आसा';
  }

  @override
  String get checkoutTitle => 'चेकआउट';

  @override
  String get deliveryAddressLabel => 'डिलिव्हरीचो नामो';

  @override
  String get noAddressSelected => 'खंयचोच नामो निवडूंक ना';

  @override
  String get paymentMethodLabel => 'पावती';

  @override
  String get payOnDelivery => 'डिलिव्हरीचेर रोकड';

  @override
  String get noteToRestaurant => 'रेस्टॉरंटाखातीर नोंद';

  @override
  String get noteToRestaurantHint => 'घांट दोन फावटीं वाजयात…';

  @override
  String get activeOrdersTitle => 'चालू आशिल्ल्यो ऑर्डरी';

  @override
  String get pastOrdersTitle => 'पयल्यो ऑर्डरी';

  @override
  String get orderItemsTitle => 'पदार्थ';

  @override
  String get orderProgressTitle => 'प्रगती';

  @override
  String get arrivingIn => 'पावपाक';

  @override
  String get pickupCodeLabel => 'पिकअप कोड';

  @override
  String get cancellationReasonLabel => 'रद्द जावपाचें कारण';

  @override
  String get riderLabel => 'डिलिव्हरी पार्टनर';

  @override
  String get callRider => 'कॉल करात';

  @override
  String get viewInvoice => 'कर पावती';

  @override
  String get cancelOrder => 'ऑर्डर रद्द करात';

  @override
  String get cancelOrderTitle => 'ही ऑर्डर रद्द करूं?';

  @override
  String get cancelOrderMessage => 'रेस्टॉरंटान मान्य करचे आदींच रद्द करूं येता.';

  @override
  String get cancelReasonLabel => 'कारण';

  @override
  String get cancelReasonFallback => 'गिरायकान रद्द केली';

  @override
  String get orderCancelled => 'ऑर्डर रद्द जाली';

  @override
  String get currentLocationLabel => 'सद्याची सुवात';
}
