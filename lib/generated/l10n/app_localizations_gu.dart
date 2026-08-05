// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'ઝડપી ડિલિવરી. તાજા સ્મિત.';

  @override
  String get chooseLanguageTitle => 'તમારી ભાષા પસંદ કરો';

  @override
  String get chooseLanguageSubtitle => 'તમને અનુકૂળ હોય તે ભાષા પસંદ કરો. તમે તેને કોઈપણ સમયે સેટિંગ્સમાં બદલી શકો છો.';

  @override
  String get searchLanguageHint => 'ભાષા શોધો';

  @override
  String get noLanguageFound => 'કોઈ ભાષા મળી નથી';

  @override
  String languagesAvailable(int count) {
    return '$count ભાષાઓ ઉપલબ્ધ છે';
  }

  @override
  String get continueLabel => 'આગળ વધો';

  @override
  String get selectedLabel => 'પસંદ કરેલ';

  @override
  String get defaultLabel => 'ડિફૉલ્ટ';

  @override
  String get homeTitle => 'Nexmile માં આપનું સ્વાગત છે';

  @override
  String get homeSubtitle => 'તાજું કરિયાણું, ગરમ ખોરાક અને રોજિંદી જરૂરિયાતો તમારી નજીકની દુકાનોમાંથી.';

  @override
  String get changeLanguage => 'ભાષા બદલો';

  @override
  String get languageUpdated => 'ભાષા બદલાઈ ગઈ';

  @override
  String get appLanguageLabel => 'એપની ભાષા';

  @override
  String greetingNamed(String name) {
    return 'નમસ્તે, $name';
  }

  @override
  String get loginTitle => 'Nexmile માં સાઇન ઇન કરો';

  @override
  String get loginSubtitle => 'તમારો ઇમેઇલ અથવા મોબાઇલ નંબર દાખલ કરો, અમે ચકાસણી કોડ મોકલીશું.';

  @override
  String get emailOrPhoneLabel => 'ઇમેઇલ અથવા મોબાઇલ નંબર';

  @override
  String get emailOrPhoneHint => 'name@example.com અથવા 9876543210';

  @override
  String get invalidEmailOrPhone => 'માન્ય ઇમેઇલ સરનામું અથવા 10 અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get sendCode => 'કોડ મોકલો';

  @override
  String get agreeToTermsOnContinue => 'આગળ વધીને તમે અમારી સેવાની શરતો અને ગોપનીયતા નીતિ સાથે સંમત થાઓ છો.';

  @override
  String get otpTitle => 'ખાતરી કરો કે આ તમે જ છો';

  @override
  String otpSubtitle(String target) {
    return '$target પર મોકલેલ 6 અંકનો કોડ દાખલ કરો';
  }

  @override
  String get verifyCode => 'ચકાસો';

  @override
  String get resendCode => 'કોડ ફરી મોકલો';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds સેકંડમાં ફરી મોકલો';
  }

  @override
  String get codeResent => 'નવો કોડ મોકલી દીધો છે';

  @override
  String get incorrectCode => 'આ કોડ ખોટો છે અથવા સમાપ્ત થઈ ગયો છે. નવો કોડ મંગાવો.';

  @override
  String get enterFullCode => 'પૂરા 6 અંક દાખલ કરો';

  @override
  String get accountSuspended => 'આ ખાતું સ્થગિત કરવામાં આવ્યું છે. કૃપા કરી સપોર્ટનો સંપર્ક કરો.';

  @override
  String get tooManyAttempts => 'ઘણા બધા પ્રયાસો થયા. કૃપા કરી થોડી વાર પછી ફરી પ્રયાસ કરો.';

  @override
  String get sessionExpired => 'તમારું સત્ર સમાપ્ત થઈ ગયું છે. કૃપા કરી ફરી સાઇન ઇન કરો.';

  @override
  String get networkError => 'ઇન્ટરનેટ કનેક્શન નથી. તમારું કનેક્શન તપાસો અને ફરી પ્રયાસ કરો.';

  @override
  String get developmentCode => 'ડેવલપમેન્ટ કોડ';

  @override
  String get signOut => 'સાઇન આઉટ';

  @override
  String get signedOut => 'તમે સાઇન આઉટ થઈ ગયા છો';

  @override
  String get somethingWentWrong => 'કંઈક ખોટું થયું. ફરી પ્રયાસ કરો.';

  @override
  String get profileTitle => 'પ્રોફાઇલ';

  @override
  String get viewProfile => 'પ્રોફાઇલ જુઓ';

  @override
  String get nameLabel => 'નામ';

  @override
  String get emailLabel => 'ઇમેઇલ';

  @override
  String get mobileLabel => 'મોબાઇલ નંબર';

  @override
  String get accountStatusLabel => 'ખાતાની સ્થિતિ';

  @override
  String get statusActive => 'સક્રિય';

  @override
  String get statusPending => 'બાકી';

  @override
  String get statusSuspended => 'સ્થગિત';

  @override
  String get verifiedLabel => 'ચકાસાયેલ';

  @override
  String get notProvided => 'ઉમેર્યું નથી';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';

  @override
  String get navHome => 'હોમ';

  @override
  String get navSearch => 'શોધો';

  @override
  String get navOrders => 'ઓર્ડર';

  @override
  String get cancelLabel => 'રદ કરો';

  @override
  String get deliverTo => 'ડિલિવરી સરનામું';

  @override
  String get searchDishesHint => 'વાનગી કે રેસ્ટોરન્ટ શોધો';

  @override
  String get searchTitle => 'શોધો';

  @override
  String get searchNoResultsTitle => 'કંઈ મળ્યું નહીં';

  @override
  String get searchNoResultsSubtitle => 'બીજી વાનગી, વ્યંજનશૈલી કે રેસ્ટોરન્ટનું નામ અજમાવો.';

  @override
  String get cravingTitle => 'આજે શું ખાવાનું મન છે?';

  @override
  String get offersTitle => 'તમારા માટે ઓફર';

  @override
  String get restaurantsNearby => 'તમારી નજીકની રેસ્ટોરન્ટ';

  @override
  String restaurantsCount(int count) {
    return '$count રેસ્ટોરન્ટ';
  }

  @override
  String get noRestaurantsTitle => 'અહીં હજી કંઈ નથી';

  @override
  String get noRestaurantsSubtitle => 'બીજી શ્રેણી જુઓ અથવા ફિલ્ટર હટાવો.';

  @override
  String minutesAway(int minutes) {
    return '$minutes મિનિટ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance કિમી';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ રેટિંગ';
  }

  @override
  String priceForTwo(int amount) {
    return 'બે માટે ₹$amount';
  }

  @override
  String get freeDelivery => 'મફત ડિલિવરી';

  @override
  String percentOff(int percent) {
    return '$percent% છૂટ';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'તમારા ઓર્ડર પર $percent% છૂટ';
  }

  @override
  String get vegOnly => 'માત્ર શાકાહારી';

  @override
  String get bestseller => 'સૌથી વધુ વેચાતું';

  @override
  String get addLabel => 'ઉમેરો';

  @override
  String get noVegDishesTitle => 'અહીં શાકાહારી વાનગી નથી';

  @override
  String get noVegDishesSubtitle => 'આખું મેનૂ જોવા શાકાહારી ફિલ્ટર બંધ કરો.';

  @override
  String get replaceCartTitle => 'નવી કાર્ટ શરૂ કરવી?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'તમારી કાર્ટમાં $restaurant ની વસ્તુઓ છે. આ ઉમેરવાથી તે દૂર થશે.';
  }

  @override
  String get replaceCartConfirm => 'દૂર કરી ઉમેરો';

  @override
  String get cartTitle => 'તમારી કાર્ટ';

  @override
  String get cartEmptyTitle => 'તમારી કાર્ટ ખાલી છે';

  @override
  String get cartEmptySubtitle => 'શરૂ કરવા કોઈ રેસ્ટોરન્ટમાંથી વાનગી ઉમેરો.';

  @override
  String get browseRestaurants => 'રેસ્ટોરન્ટ જુઓ';

  @override
  String itemsInCart(int count) {
    return '$count વસ્તુઓ';
  }

  @override
  String get viewCart => 'કાર્ટ જુઓ';

  @override
  String get itemTotal => 'વસ્તુઓનો કુલ';

  @override
  String get deliveryFeeLabel => 'ડિલિવરી ફી';

  @override
  String get taxesAndCharges => 'કર અને ચાર્જ';

  @override
  String get freeLabel => 'મફત';

  @override
  String get toPay => 'ચૂકવવાનું';

  @override
  String placeOrderFor(int amount) {
    return 'ઓર્ડર કરો · ₹$amount';
  }

  @override
  String get ordersTitle => 'તમારા ઓર્ડર';

  @override
  String get ordersEmptyTitle => 'હજી કોઈ ઓર્ડર નથી';

  @override
  String get ordersEmptySubtitle => 'તમારા અગાઉના ઓર્ડર અહીં દેખાશે.';

  @override
  String get reorder => 'ફરી ઓર્ડર';

  @override
  String orderTitle(String id) {
    return 'ઓર્ડર $id';
  }

  @override
  String get orderPlacedTitle => 'ઓર્ડર થઈ ગયો';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'લગભગ $minutes મિનિટમાં પહોંચશે.';
  }

  @override
  String get orderDeliveredTitle => 'ડિલિવર થયો';

  @override
  String get orderDeliveredSubtitle => 'ભોજનનો આનંદ માણો.';

  @override
  String get statusOrderPlaced => 'ઓર્ડર થયો';

  @override
  String get statusPreparing => 'ભોજન તૈયાર થઈ રહ્યું છે';

  @override
  String get statusOnTheWay => 'રસ્તામાં છે';

  @override
  String get statusDelivered => 'ડિલિવર થયો';

  @override
  String get keepBrowsing => 'જોતા રહો';

  @override
  String get backToHome => 'હોમ પર પાછા';

  @override
  String get prototypeNotice => 'નમૂનારૂપ સ્ટોરફ્રન્ટ — અસલી દુકાનો કેટલોગ API સાથે આવશે.';

  @override
  String get prototypeCheckoutNotice => 'આ એક પ્રોટોટાઇપ છે. કોઈ ચુકવણી લેવાતી નથી અને ખરો ઓર્ડર પણ થતો નથી.';

  @override
  String get prototypeTrackingNotice => 'પ્રોટોટાઇપ માટે ટ્રેકિંગ કૃત્રિમ છે.';
}
