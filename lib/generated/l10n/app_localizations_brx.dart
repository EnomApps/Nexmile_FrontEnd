// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bodo (`brx`).
class AppLocalizationsBrx extends AppLocalizations {
  AppLocalizationsBrx([String locale = 'brx']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'गोख्रों डेलिभारि। गोदान मिनिस्लु।';

  @override
  String get chooseLanguageTitle => 'नोंथांनि राव सायख';

  @override
  String get chooseLanguageSubtitle => 'नोंथांनो गोसो जायो एरै रावखौ सायख। नोंथाङो बेखौ जेब्लाबाबो सेटिंसआव सोलायनो हागोन।';

  @override
  String get searchLanguageHint => 'राव नागिर';

  @override
  String get noLanguageFound => 'जेबो राव मोनाखै';

  @override
  String languagesAvailable(int count) {
    return '$count राव मोननो हायो';
  }

  @override
  String get continueLabel => 'लाबोबाय था';

  @override
  String get selectedLabel => 'सायखनाय';

  @override
  String get defaultLabel => 'डिफल्ट';

  @override
  String get homeTitle => 'Nexmile आव आजादा';

  @override
  String get homeSubtitle => 'गोदान किराना, गोदै आहार आरो सानफ्रोमबो नांगौ बेसादफोर नोंथांनि खात्रिनि दुखानिफ्राय।';

  @override
  String get changeLanguage => 'राव सोलाय';

  @override
  String get languageUpdated => 'राव सोलायबाय';

  @override
  String get appLanguageLabel => 'एपनि राव';

  @override
  String greetingNamed(String name) {
    return 'आजादा, $name';
  }

  @override
  String get loginTitle => 'Nexmile आव साइन इन खालाम';

  @override
  String get loginSubtitle => 'नोंथांनि इमेइल एबा मबाइल नामबार दा, जों थि खालामनाय कड दैथाय होगोन।';

  @override
  String get emailOrPhoneLabel => 'इमेइल एबा मबाइल नामबार';

  @override
  String get emailOrPhoneHint => 'name@example.com एबा 9876543210';

  @override
  String get invalidEmailOrPhone => 'थार इमेइल थं एबा 10 अंकनि मबाइल नामबार दा';

  @override
  String get sendCode => 'कड दैथाय हो';

  @override
  String get agreeToTermsOnContinue => 'लाबोबाय थानाय जों नोंथाङो जोंनि सिबिथाइनि नेमखान्थि आरो गुबैथि नीति जों रोंगौ।';

  @override
  String get otpTitle => 'बेयो नोंथाङ नामा थि खालाम';

  @override
  String otpSubtitle(String target) {
    return '$target आव दैथाय होनाय 6 अंकनि कड दा';
  }

  @override
  String get verifyCode => 'थि खालाम';

  @override
  String get resendCode => 'कड फिन दैथाय हो';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकेन्डआव फिन दैथाय हो';
  }

  @override
  String get codeResent => 'गोदान कड दैथाय होबाय';

  @override
  String get incorrectCode => 'बे कडआ गोरोन्थि एबा समआ जोबबाय। गोदान कड बे।';

  @override
  String get enterFullCode => 'आबुं 6 अंक दा';

  @override
  String get accountSuspended => 'बे एकाउन्टखौ थाबाय होनाय जाबाय। अन्नानै मददनि जों सोंख्रीमा खालाम।';

  @override
  String get tooManyAttempts => 'गोबां बार नाजानाय जाबाय। अन्नानै मोनसे सम उनाव फिन नाजा।';

  @override
  String get sessionExpired => 'नोंथांनि सेसननि समआ जोबबाय। अन्नानै फिन साइन इन खालाम।';

  @override
  String get networkError => 'इन्टारनेट जोनाय गैया। जोनायखौ नाय आरो फिन नाजा।';

  @override
  String get developmentCode => 'डेभेलपमेन्ट कड';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signedOut => 'नोंथाङ साइन आउट जाबाय';

  @override
  String get somethingWentWrong => 'मा मानो गोरोन्थि जाबाय। अन्नानै फिन नाजा।';

  @override
  String get profileTitle => 'प्रफाइल';

  @override
  String get viewProfile => 'प्रफाइल नाय';

  @override
  String get nameLabel => 'मुं';

  @override
  String get emailLabel => 'इमेइल';

  @override
  String get mobileLabel => 'मबाइल नामबार';

  @override
  String get accountStatusLabel => 'एकाउन्टनि थाखो';

  @override
  String get statusActive => 'मावथि';

  @override
  String get statusPending => 'नेथाबाय';

  @override
  String get statusSuspended => 'थाबाय होनाय';

  @override
  String get verifiedLabel => 'थि खालामनाय';

  @override
  String get notProvided => 'दाजाबदेराखै';

  @override
  String get retry => 'फिन नाजा';

  @override
  String get navHome => 'हों';

  @override
  String get navSearch => 'नागिर';

  @override
  String get navOrders => 'अर्डार';

  @override
  String get cancelLabel => 'बातिल खालाम';

  @override
  String get deliverTo => 'डेलिभारि थं';

  @override
  String get searchDishesHint => 'आहार एबा रेस्टुरेन्ट नागिर';

  @override
  String get searchTitle => 'नागिर';

  @override
  String get searchNoResultsTitle => 'जेबो मोनाखै';

  @override
  String get searchNoResultsSubtitle => 'गुबुन आहार, आहार बानायनाय एबा रेस्टुरेन्टनि मुं नाजा।';

  @override
  String get cravingTitle => 'दिनै मा जानो गोसो?';

  @override
  String get offersTitle => 'नोंथांनि थाखाय अफार';

  @override
  String get restaurantsNearby => 'नोंथांनि खात्रिनि रेस्टुरेन्टफोर';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टुरेन्ट';
  }

  @override
  String get noRestaurantsTitle => 'बेयाव दासिम जेबो गैया';

  @override
  String get noRestaurantsSubtitle => 'गुबुन हानजा नाय एबा फिल्टार बोखार।';

  @override
  String minutesAway(int minutes) {
    return '$minutes मिनिट';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance किमि';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ रेटिं';
  }

  @override
  String priceForTwo(int amount) {
    return 'मोननैनि थाखाय ₹$amount';
  }

  @override
  String get freeDelivery => 'मुफ्ट डेलिभारि';

  @override
  String percentOff(int percent) {
    return '$percent% खमी';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'नोंथांनि अर्डाराव $percent% खमी';
  }

  @override
  String get vegOnly => 'बेदा आहार खालि';

  @override
  String get bestseller => 'बांसिन फानजानाय';

  @override
  String get addLabel => 'दाजाबदेर';

  @override
  String get noVegDishesTitle => 'बेयाव बेदा आहार गैया';

  @override
  String get noVegDishesSubtitle => 'गासैबो मेनु नायनो बेदा फिल्टार बन्द खालाम।';

  @override
  String get replaceCartTitle => 'गोदान कार्ट जागाय?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'नोंथांनि कार्टआव $restaurant निफ्राय बेसाद दङ। बेखौ दाजाबदेरब्ला बेफोर बोखारजागोन।';
  }

  @override
  String get replaceCartConfirm => 'बोखारनानै दाजाबदेर';

  @override
  String get cartTitle => 'नोंथांनि कार्ट';

  @override
  String get cartEmptyTitle => 'नोंथांनि कार्टआ लांदां';

  @override
  String get cartEmptySubtitle => 'जागायनो जायखिजाया रेस्टुरेन्टनिफ्राय आहार दाजाबदेर।';

  @override
  String get browseRestaurants => 'रेस्टुरेन्ट नाय';

  @override
  String itemsInCart(int count) {
    return '$count बेसाद';
  }

  @override
  String get viewCart => 'कार्ट नाय';

  @override
  String get itemTotal => 'बेसादनि गासै';

  @override
  String get deliveryFeeLabel => 'डेलिभारि बिजाब';

  @override
  String get taxesAndCharges => 'खाजाना आरो बिजाब';

  @override
  String get freeLabel => 'मुफ्ट';

  @override
  String get toPay => 'होनांगौ';

  @override
  String placeOrderFor(int amount) {
    return 'अर्डार खालाम · ₹$amount';
  }

  @override
  String get ordersTitle => 'नोंथांनि अर्डारफोर';

  @override
  String get ordersEmptyTitle => 'दासिम जेबो अर्डार गैया';

  @override
  String get ordersEmptySubtitle => 'नोंथांनि सिगांनि अर्डारफोर बेयाव नुजागोन।';

  @override
  String get reorder => 'फिन अर्डार';

  @override
  String orderTitle(String id) {
    return 'अर्डार $id';
  }

  @override
  String get orderPlacedTitle => 'अर्डार जाबाय';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'मोनसे $minutes मिनिटआव सोसन्नो हागोन।';
  }

  @override
  String get orderDeliveredTitle => 'डेलिभार जाबाय';

  @override
  String get orderDeliveredSubtitle => 'आहारखौ मोजां मोन।';

  @override
  String get statusOrderPlaced => 'अर्डार जाबाय';

  @override
  String get statusPreparing => 'आहार बानायगासिनो दङ';

  @override
  String get statusOnTheWay => 'लामायाव दङ';

  @override
  String get statusDelivered => 'डेलिभार जाबाय';

  @override
  String get keepBrowsing => 'नायबाय था';

  @override
  String get backToHome => 'हों आव फैफिन';

  @override
  String get prototypeNotice => 'नमुना स्टरफ्रन्ट — थार दुखानिफोरा केटालग API जों फैगोन।';

  @override
  String get prototypeCheckoutNotice => 'बेयो मोनसे प्रटटाइप। जेबो रांखान्थि लानाय जाया आरो थार अर्डारबो जाया।';

  @override
  String get prototypeTrackingNotice => 'प्रटटाइपनि थाखाय ट्रेकिं आ थार नङा।';
}
