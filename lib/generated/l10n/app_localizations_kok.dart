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
  String placeOrderFor(int amount) {
    return 'ऑर्डर करात · ₹$amount';
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
}
