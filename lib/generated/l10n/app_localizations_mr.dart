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
  String get tagline => 'जलद डिलिव्हरी. ताजे स्मित.';

  @override
  String get chooseLanguageTitle => 'तुमची भाषा निवडा';

  @override
  String get chooseLanguageSubtitle => 'तुम्हाला सोयीची वाटेल ती भाषा निवडा. तुम्ही ती कधीही सेटिंग्जमध्ये बदलू शकता.';

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
  String get homeSubtitle => 'ताजा किराणा, गरम जेवण आणि दैनंदिन गरजा तुमच्या जवळच्या दुकानांमधून.';

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
  String get loginSubtitle => 'तुमचा ईमेल किंवा मोबाइल क्रमांक टाका, आम्ही पडताळणी कोड पाठवू.';

  @override
  String get emailOrPhoneLabel => 'ईमेल किंवा मोबाइल क्रमांक';

  @override
  String get emailOrPhoneHint => 'name@example.com किंवा 9876543210';

  @override
  String get invalidEmailOrPhone => 'वैध ईमेल पत्ता किंवा 10 अंकी मोबाइल क्रमांक टाका';

  @override
  String get sendCode => 'कोड पाठवा';

  @override
  String get agreeToTermsOnContinue => 'पुढे जाऊन तुम्ही आमच्या सेवा अटी आणि गोपनीयता धोरणाशी सहमत होता.';

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
  String get incorrectCode => 'हा कोड चुकीचा आहे किंवा त्याची मुदत संपली आहे. नवीन कोड मागवा.';

  @override
  String get enterFullCode => 'पूर्ण 6 अंक टाका';

  @override
  String get accountSuspended => 'हे खाते निलंबित करण्यात आले आहे. कृपया सहाय्यताशी संपर्क साधा.';

  @override
  String get tooManyAttempts => 'खूप वेळा प्रयत्न झाले. कृपया थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get sessionExpired => 'तुमचे सत्र संपले आहे. कृपया पुन्हा साइन इन करा.';

  @override
  String get networkError => 'इंटरनेट कनेक्शन नाही. तुमचे कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

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
  String get searchNoResultsSubtitle => 'दुसरा पदार्थ, पाककृती किंवा रेस्टॉरंटचे नाव वापरून पहा.';

  @override
  String get cravingTitle => 'आज काय खावंसं वाटतंय?';

  @override
  String get offersTitle => 'तुमच्यासाठी ऑफर';

  @override
  String get restaurantsNearby => 'तुमच्या जवळची रेस्टॉरंट';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टॉरंट';
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
    return '$count+ रेटिंग';
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
  String get noVegDishesSubtitle => 'पूर्ण मेन्यू पाहण्यासाठी शाकाहारी फिल्टर बंद करा.';

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
  String get cartEmptySubtitle => 'सुरू करण्यासाठी एखाद्या रेस्टॉरंटमधून पदार्थ जोडा.';

  @override
  String get browseRestaurants => 'रेस्टॉरंट पहा';

  @override
  String itemsInCart(int count) {
    return '$count वस्तू';
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
  String placeOrderFor(int amount) {
    return 'ऑर्डर करा · ₹$amount';
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
  String get prototypeNotice => 'नमुना स्टोअरफ्रंट — खरी दुकाने कॅटलॉग API सोबत येतील.';

  @override
  String get prototypeCheckoutNotice => 'हा एक प्रोटोटाइप आहे. कोणतेही पैसे घेतले जात नाहीत आणि खरी ऑर्डरही होत नाही.';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइपसाठी ट्रॅकिंग कृत्रिम आहे.';
}
