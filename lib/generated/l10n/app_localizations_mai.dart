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
  String get tagline => 'तेज डिलीवरी। ताजा मुस्कान।';

  @override
  String get chooseLanguageTitle => 'अपन भाषा चुनू';

  @override
  String get chooseLanguageSubtitle => 'जाहि भाषा मे अहाँ सहज छी, ओ चुनू। अहाँ एकरा कहियो सेटिंग्स मे बदलि सकैत छी।';

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
  String get homeSubtitle => 'ताजा किराना, गरम भोजन आ रोजक जरूरतक सामान अहाँक लगक दोकान सँ।';

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
  String get loginSubtitle => 'अपन ईमेल वा मोबाइल नंबर लिखू, हम सत्यापन कोड पठाएब।';

  @override
  String get emailOrPhoneLabel => 'ईमेल वा मोबाइल नंबर';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'सही ईमेल पता वा 10 अंकक मोबाइल नंबर लिखू';

  @override
  String get sendCode => 'कोड पठाबू';

  @override
  String get agreeToTermsOnContinue => 'आगू बढ़ला पर अहाँ हमर सेवाक शर्त आ गोपनीयता नीति सँ सहमत होइत छी।';

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
  String get incorrectCode => 'ई कोड गलत अछि वा एकर समय बीति गेल। नव कोड मंगाबू।';

  @override
  String get enterFullCode => 'पूरा 6 अंक लिखू';

  @override
  String get accountSuspended => 'ई खाता निलंबित कऽ देल गेल अछि। कृपया सहायता सँ संपर्क करू।';

  @override
  String get tooManyAttempts => 'बहुत बेर कोशिश भऽ गेल। कृपया किछु समय बाद फेर कोशिश करू।';

  @override
  String get sessionExpired => 'अहाँक सत्र समाप्त भऽ गेल। कृपया फेर साइन इन करू।';

  @override
  String get networkError => 'इंटरनेट कनेक्शन नहि अछि। कनेक्शन देखू आ फेर कोशिश करू।';

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
  String get searchNoResultsSubtitle => 'दोसर व्यंजन, पाक-शैली वा रेस्टोरेंटक नाम आजमाउ।';

  @override
  String get cravingTitle => 'आइ की खाय मोन अछि?';

  @override
  String get offersTitle => 'अहाँक लेल ऑफर';

  @override
  String get restaurantsNearby => 'अहाँक लगक रेस्टोरेंट';

  @override
  String restaurantsCount(int count) {
    return '$count रेस्टोरेंट';
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
    return '$count+ रेटिंग';
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
  String get noVegDishesSubtitle => 'पूरा मेनू देखबाक लेल शाकाहारी फिल्टर बंद करू।';

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
  String get cartEmptySubtitle => 'शुरू करबाक लेल कोनो रेस्टोरेंट सँ व्यंजन जोड़ू।';

  @override
  String get browseRestaurants => 'रेस्टोरेंट देखू';

  @override
  String itemsInCart(int count) {
    return '$count सामान';
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
  String placeOrderFor(int amount) {
    return 'ऑर्डर करू · ₹$amount';
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
  String get prototypeNotice => 'नमूना स्टोरफ्रंट — असली दोकान कैटलॉग API सँग आओत।';

  @override
  String get prototypeCheckoutNotice => 'ई एकटा प्रोटोटाइप अछि। कोनो भुगतान नहि लेल जाइत अछि आ असली ऑर्डर सेहो नहि होइत अछि।';

  @override
  String get prototypeTrackingNotice => 'प्रोटोटाइपक लेल ट्रैकिंग नकली अछि।';
}
