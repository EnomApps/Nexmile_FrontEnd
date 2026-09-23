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
  String get fieldRequired => 'આ ક્ષેત્ર જરૂરી છે';

  @override
  String get tagline => 'ઝડપી ડિલિવરી. તાજા સ્મિત.';

  @override
  String get chooseLanguageTitle => 'તમારી ભાષા પસંદ કરો';

  @override
  String get chooseLanguageSubtitle =>
      'તમને અનુકૂળ હોય તે ભાષા પસંદ કરો. તમે તેને કોઈપણ સમયે સેટિંગ્સમાં બદલી શકો છો.';

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
  String get homeSubtitle =>
      'તાજું કરિયાણું, ગરમ ખોરાક અને રોજિંદી જરૂરિયાતો તમારી નજીકની દુકાનોમાંથી.';

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
  String get loginSubtitle =>
      'તમારો ઇમેઇલ અથવા મોબાઇલ નંબર દાખલ કરો, અમે ચકાસણી કોડ મોકલીશું.';

  @override
  String get emailOrPhoneLabel => 'ઇમેઇલ અથવા મોબાઇલ નંબર';

  @override
  String get emailOrPhoneHint => 'name@example.com અથવા 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'માન્ય ઇમેઇલ સરનામું અથવા 10 અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get sendCode => 'કોડ મોકલો';

  @override
  String get agreeToTermsOnContinue =>
      'આગળ વધીને તમે અમારી સેવાની શરતો અને ગોપનીયતા નીતિ સાથે સંમત થાઓ છો.';

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
  String get incorrectCode =>
      'આ કોડ ખોટો છે અથવા સમાપ્ત થઈ ગયો છે. નવો કોડ મંગાવો.';

  @override
  String get enterFullCode => 'પૂરા 6 અંક દાખલ કરો';

  @override
  String get accountSuspended =>
      'આ ખાતું સ્થગિત કરવામાં આવ્યું છે. કૃપા કરી સપોર્ટનો સંપર્ક કરો.';

  @override
  String get tooManyAttempts =>
      'ઘણા બધા પ્રયાસો થયા. કૃપા કરી થોડી વાર પછી ફરી પ્રયાસ કરો.';

  @override
  String get sessionExpired =>
      'તમારું સત્ર સમાપ્ત થઈ ગયું છે. કૃપા કરી ફરી સાઇન ઇન કરો.';

  @override
  String get networkError =>
      'ઇન્ટરનેટ કનેક્શન નથી. તમારું કનેક્શન તપાસો અને ફરી પ્રયાસ કરો.';

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
  String get searchNoResultsSubtitle =>
      'બીજી વાનગી, વ્યંજનશૈલી કે રેસ્ટોરન્ટનું નામ અજમાવો.';

  @override
  String get cravingTitle => 'આજે શું ખાવાનું મન છે?';

  @override
  String get offersTitle => 'તમારા માટે ઓફર';

  @override
  String get restaurantsNearby => 'તમારી નજીકની રેસ્ટોરન્ટ';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count રેસ્ટોરાં',
      one: '1 રેસ્ટોરાં',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count રેટિંગ',
      one: '1 રેટિંગ',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count વસ્તુઓ',
      one: '1 વસ્તુ',
    );
    return '$_temp0';
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
  String placeOrderFor(String amount) {
    return 'ઓર્ડર કરો · $amount';
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
  String get prototypeNotice =>
      'નમૂનારૂપ સ્ટોરફ્રન્ટ — અસલી દુકાનો કેટલોગ API સાથે આવશે.';

  @override
  String get prototypeCheckoutNotice =>
      'આ એક પ્રોટોટાઇપ છે. કોઈ ચુકવણી લેવાતી નથી અને ખરો ઓર્ડર પણ થતો નથી.';

  @override
  String get prototypeTrackingNotice => 'પ્રોટોટાઇપ માટે ટ્રેકિંગ કૃત્રિમ છે.';

  @override
  String get locationTitle => 'ડિલિવરી ક્યાં કરવી?';

  @override
  String get locationSubtitle =>
      'Nexmile માત્ર 1 કિમીની અંદરની દુકાનોમાંથી ડિલિવરી કરે છે, તેથી અમને તમારું ચોક્કસ સ્થાન જોઈએ.';

  @override
  String get locationReasonRadiusTitle => '1 કિમીની અંદરની દુકાનો';

  @override
  String get locationReasonRadiusBody =>
      'જ્યાંથી ખોરાક ગરમ પહોંચે તે જ રસોડાં અમે બતાવીએ છીએ.';

  @override
  String get locationReasonAccuracyTitle => 'સાચા દરવાજા સુધી';

  @override
  String get locationReasonAccuracyBody =>
      'ચોક્કસ પિન હોય તો ડિલિવરી પાર્ટનર ફોન કર્યા વગર તમને શોધી લે છે.';

  @override
  String get locationReasonPrivacyTitle => 'ફક્ત એપ વાપરતી વખતે';

  @override
  String get locationReasonPrivacyBody =>
      'અમે પૃષ્ઠભૂમિમાં તમને ટ્રેક કરતા નથી, અને સરનામું તમે જાતે પણ લખી શકો છો.';

  @override
  String get allowLocation => 'લોકેશનની મંજૂરી આપો';

  @override
  String get enterAddressManually => 'હું સરનામું જાતે લખીશ';

  @override
  String get locationDenied =>
      'લોકેશનની મંજૂરી નકારાઈ. તમે પિન જાતે મૂકી શકો છો.';

  @override
  String get locationDeniedForever =>
      'Nexmile માટે લોકેશન બ્લોક છે. સેટિંગ્સમાં ચાલુ કરો અથવા પિન જાતે મૂકો.';

  @override
  String get locationServiceOff => 'આ ડિવાઇસ પર લોકેશન બંધ છે.';

  @override
  String get locationUnavailable =>
      'લોકેશન મળ્યું નહીં. કૃપા કરી પિન જાતે મૂકો.';

  @override
  String get openSettings => 'સેટિંગ્સ';

  @override
  String get pinLocationTitle => 'તમારો ડિલિવરી પિન મૂકો';

  @override
  String get deliveryRadiusHint =>
      'વર્તુળ Nexmile જે 1 કિમીમાં ડિલિવરી કરે છે તે બતાવે છે.';

  @override
  String get useMyLocation => 'મારું લોકેશન વાપરો';

  @override
  String get deliveringHere => 'અહીં ડિલિવરી';

  @override
  String get dragToAdjust => 'પિન બદલવા નકશો ખસેડો';

  @override
  String get confirmLocation => 'લોકેશન નક્કી કરો';

  @override
  String get addressDetailsTitle => 'સરનામાની વિગતો';

  @override
  String get addressDetailsSubtitle =>
      'સાચા દરવાજે પહોંચવા મકાન નંબર અને લેન્ડમાર્ક ઉમેરો.';

  @override
  String get pinnedLocation => 'પસંદ કરેલ સ્થાન';

  @override
  String get changePin => 'બદલો';

  @override
  String get saveAddressAs => 'આ સરનામું આ રીતે સાચવો';

  @override
  String get labelHome => 'ઘર';

  @override
  String get labelWork => 'ઓફિસ';

  @override
  String get labelOther => 'અન્ય';

  @override
  String get addressLine1Label => 'મકાન, ફ્લેટ કે બિલ્ડિંગ';

  @override
  String get addressLine1Hint => '12A, ગ્રીન રેસિડેન્સી';

  @override
  String get addressLine2Label => 'શેરી કે વિસ્તાર';

  @override
  String get addressLine2Hint => '2જી એવન્યુ, અન્ના નગર';

  @override
  String get landmarkLabel => 'લેન્ડમાર્ક';

  @override
  String get landmarkHint => 'બસ સ્ટોપની સામે';

  @override
  String get cityLabel => 'શહેર';

  @override
  String get stateLabel => 'રાજ્ય';

  @override
  String get pincodeLabel => 'પિન કોડ';

  @override
  String get invalidPincode => 'માન્ય 6 અંકનો પિન કોડ દાખલ કરો';

  @override
  String get contactNameLabel => 'સંપર્ક નામ';

  @override
  String get contactPhoneLabel => 'સંપર્ક નંબર';

  @override
  String get invalidMobileNumber => 'માન્ય 10 અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get makeDefaultAddress => 'ડિફૉલ્ટ રૂપે અહીં જ ડિલિવરી';

  @override
  String get saveAddress => 'સરનામું સાચવો';

  @override
  String get addressSaved => 'સરનામું સાચવાયું';

  @override
  String get addressBookTitle => 'ડિલિવરી સરનામાં';

  @override
  String get manageAddresses => 'સાચવેલા સરનામાં સંભાળો';

  @override
  String get noAddressesTitle => 'હજી કોઈ સરનામું નથી';

  @override
  String get noAddressesSubtitle =>
      'તમારા સુધી ડિલિવરી કરતી દુકાનો બતાવવા એક સરનામું ઉમેરો.';

  @override
  String get addAddress => 'સરનામું ઉમેરો';

  @override
  String get setAsDefault => 'ડિફૉલ્ટ બનાવો';

  @override
  String get editLabel => 'સંપાદિત કરો';

  @override
  String get addressUpdated => 'સરનામું અપડેટ થયું';

  @override
  String get deleteLabel => 'કાઢી નાખો';

  @override
  String get deleteAddressTitle => 'આ સરનામું કાઢી નાખવું?';

  @override
  String get deleteAddressMessage => 'તમે તેને પછી ફરી ઉમેરી શકો છો.';

  @override
  String get rescueDealsTitle => 'ફૂડ રેસ્ક્યૂ';

  @override
  String get notTakingOrders => 'ઓર્ડર લેવાતા નથી';

  @override
  String get closedRightNow => 'અત્યારે બંધ છે';

  @override
  String minimumOrder(String amount) {
    return 'ઓછામાં ઓછું $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count બાકી';
  }

  @override
  String get soldOut => 'ખલાસ થઈ ગયું';

  @override
  String get menuEmptyTitle => 'હજી કોઈ વાનગી નથી';

  @override
  String get menuEmptySubtitle => 'આ રેસ્ટોરાંએ પોતાનું મેનુ ઉમેર્યું નથી.';

  @override
  String get moreDishesTitle => 'વધુ વાનગીઓ';

  @override
  String get customisable => 'મનપસંદ રીતે';

  @override
  String get requiredLabel => 'જરૂરી';

  @override
  String get optionalLabel => 'વૈકલ્પિક';

  @override
  String get chooseOne => 'એક પસંદ કરો';

  @override
  String chooseUpTo(int count) {
    return 'વધુમાં વધુ $count પસંદ કરો';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ઓછામાં ઓછા $count પસંદ કરો';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min થી $max પસંદ કરો';
  }

  @override
  String get specialInstructions => 'ખાસ સૂચનાઓ';

  @override
  String get specialInstructionsHint => 'ઓછું તીખું, ડુંગળી નહીં…';

  @override
  String addForAmount(String amount) {
    return 'ઉમેરો · $amount';
  }

  @override
  String get deliveryLabel => 'ડિલિવરી';

  @override
  String get pickupLabel => 'જાતે લેવું';

  @override
  String get packagingLabel => 'પેકિંગ';

  @override
  String get discountLabel => 'છૂટ';

  @override
  String get billDetailsTitle => 'બિલની વિગત';

  @override
  String get clearCart => 'કાર્ટ ખાલી કરો';

  @override
  String get clearCartTitle => 'આ કાર્ટ ખાલી કરવી છે?';

  @override
  String get clearCartMessage => 'તેમાંનું બધું જ કાઢી નાખવામાં આવશે.';

  @override
  String unavailableItemsNotice(String items) {
    return 'હવે ઉપલબ્ધ નથી: $items';
  }

  @override
  String get removeUnavailable => 'તે કાઢી નાખો';

  @override
  String minimumNotMet(String amount) {
    return 'ઓછામાં ઓછો ઓર્ડર $amount છે';
  }

  @override
  String get checkoutTitle => 'ચેકઆઉટ';

  @override
  String get deliveryAddressLabel => 'ડિલિવરીનું સરનામું';

  @override
  String get noAddressSelected => 'કોઈ સરનામું પસંદ કર્યું નથી';

  @override
  String get paymentMethodLabel => 'ચુકવણી';

  @override
  String get payOnDelivery => 'ડિલિવરી વખતે રોકડ';

  @override
  String get noteToRestaurant => 'રેસ્ટોરાં માટે નોંધ';

  @override
  String get noteToRestaurantHint => 'ઘંટડી બે વાર વગાડો…';

  @override
  String get activeOrdersTitle => 'ચાલુ ઓર્ડર';

  @override
  String get pastOrdersTitle => 'જૂના ઓર્ડર';

  @override
  String get orderItemsTitle => 'વાનગીઓ';

  @override
  String get orderProgressTitle => 'પ્રગતિ';

  @override
  String get arrivingIn => 'પહોંચવામાં';

  @override
  String get pickupCodeLabel => 'પિકઅપ કોડ';

  @override
  String get cancellationReasonLabel => 'રદ થવાનું કારણ';

  @override
  String get riderLabel => 'ડિલિવરી પાર્ટનર';

  @override
  String get callRider => 'કૉલ કરો';

  @override
  String get trackRider => 'રાઇડર ટ્રૅક કરો';

  @override
  String get riderLocationSoon => 'ઓર્ડર લીધા પછી રાઇડરનું સ્થાન અહીં દેખાશે.';

  @override
  String get recentreOnRider => 'રાઇડર પર કેન્દ્રિત કરો';

  @override
  String get viewInvoice => 'ટેક્સ ઇન્વોઇસ';

  @override
  String get cancelOrder => 'ઓર્ડર રદ કરો';

  @override
  String get cancelOrderTitle => 'આ ઓર્ડર રદ કરવો છે?';

  @override
  String get cancelOrderMessage =>
      'રેસ્ટોરાં સ્વીકારે તે પહેલાં જ રદ કરી શકાય છે.';

  @override
  String get cancelReasonLabel => 'કારણ';

  @override
  String get cancelReasonFallback => 'ગ્રાહકે રદ કર્યો';

  @override
  String get orderCancelled => 'ઓર્ડર રદ થયો';

  @override
  String get currentLocationLabel => 'વર્તમાન સ્થાન';

  @override
  String get editProfileTitle => 'પ્રોફાઇલ સંપાદિત કરો';

  @override
  String get editProfileSubtitle =>
      'રેસ્ટોરાં અને ડિલિવરી પાર્ટનરને તમારું નામ જ દેખાય છે.';

  @override
  String get saveChanges => 'ફેરફારો સાચવો';

  @override
  String get profileUpdated => 'પ્રોફાઇલ અપડેટ થઈ';

  @override
  String get deleteAccount => 'ખાતું કાઢી નાખો';

  @override
  String get deleteAccountTitle => 'તમારું ખાતું કાઢી નાખવું છે?';

  @override
  String get deleteAccountMessage =>
      'બધા ઉપકરણોમાંથી સાઇન આઉટ થઈ જશો. જૂના ઓર્ડર અને બિલ કર રેકોર્ડ માટે રાખવામાં આવે છે.';

  @override
  String get accountDeleted => 'તમારું ખાતું કાઢી નાખવામાં આવ્યું';

  @override
  String get devicesTitle => 'સાઇન-ઇન ઉપકરણો';

  @override
  String get devicesSubtitle => 'તમે ક્યાં સાઇન ઇન છો';

  @override
  String get devicesEmptyTitle => 'બીજું કોઈ ઉપકરણ નથી';

  @override
  String get devicesEmptySubtitle => 'તમે ફક્ત આ જ ઉપકરણ પર સાઇન ઇન છો.';

  @override
  String get signOutDevice => 'સાઇન આઉટ';

  @override
  String get signOutDeviceTitle => 'આ ઉપકરણ સાઇન આઉટ કરવું છે?';

  @override
  String get signOutDeviceMessage =>
      'જો તમે આ જ ઉપકરણ વાપરતા હો તો ફરી સાઇન ઇન કરવું પડશે.';

  @override
  String get deviceSignedOut => 'ઉપકરણ સાઇન આઉટ થયું';

  @override
  String get signOutEverywhere => 'બધે સાઇન આઉટ';

  @override
  String get signOutEverywhereTitle => 'બધે સાઇન આઉટ કરવું છે?';

  @override
  String get signOutEverywhereMessage =>
      'આ ઉપકરણ સહિત દરેક ઉપકરણ સાઇન આઉટ થઈ જશે.';

  @override
  String get unknownDevice => 'અજાણ્યું ઉપકરણ';

  @override
  String get activeNow => 'હમણાં સક્રિય';

  @override
  String minutesAgo(int count) {
    return '$count મિનિટ પહેલાં';
  }

  @override
  String hoursAgo(int count) {
    return '$count કલાક પહેલાં';
  }

  @override
  String daysAgo(int count) {
    return '$count દિવસ પહેલાં';
  }

  @override
  String get filtersAndSorting => 'ફિલ્ટર અને ક્રમ';

  @override
  String get clearAll => 'બધું દૂર કરો';

  @override
  String get showResults => 'પરિણામો બતાવો';

  @override
  String get closeLabel => 'બંધ કરો';

  @override
  String get sortByTitle => 'ક્રમમાં ગોઠવો';

  @override
  String get sortRelevance => 'સુસંગતતા';

  @override
  String get sortRating => 'રેટિંગ';

  @override
  String get sortDeliveryTime => 'ડિલિવરી સમય';

  @override
  String get sortCostLowHigh => 'કિંમત: ઓછીથી વધુ';

  @override
  String get sortCostHighLow => 'કિંમત: વધુથી ઓછી';

  @override
  String get timeSection => 'સમય';

  @override
  String get nearAndFast => 'નજીક અને ઝડપી';

  @override
  String get openNow => 'હમણાં ખુલ્લું';

  @override
  String get ratingSection => 'રેસ્ટોરાં રેટિંગ';

  @override
  String ratedAbove(String rating) {
    return '$rating+ રેટિંગ';
  }

  @override
  String get offersSection => 'ઓફર';

  @override
  String get hasOffersLabel => 'ઓફર વાળા';

  @override
  String get dishPriceSection => 'વાનગીની કિંમત';

  @override
  String costUnder(String amount) {
    return '$amount થી ઓછું';
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
  String get moreSection => 'વધુ';

  @override
  String get noPackagingCharges => 'પેકિંગ ચાર્જ નથી';

  @override
  String get allRestaurantsTitle => 'બધા રેસ્ટોરાં';

  @override
  String get whatsOnYourMind => 'શું ખાવાનું મન છે?';

  @override
  String get listeningNow => 'સાંભળી રહ્યા છીએ…';

  @override
  String get speakNowHint => 'વાનગી કે રેસ્ટોરાં બોલો';

  @override
  String get voiceUnavailable => 'વોઇસ સર્ચ ઉપલબ્ધ નથી';

  @override
  String get voiceUnavailableBody => 'તમે ટાઇપ કરીને પણ શોધી શકો છો.';

  @override
  String get microphoneDenied => 'માઇક્રોફોન પરવાનગી બંધ';

  @override
  String get voiceSearchLabel => 'અવાજથી શોધો';

  @override
  String get ratingsAndReviews => 'રેટિંગ અને સમીક્ષાઓ';

  @override
  String get reviewsWithTextOnly => 'સમીક્ષાવાળા';

  @override
  String get noReviewsTitle => 'હજી કોઈ રેટિંગ નથી';

  @override
  String get noReviewsSubtitle => 'ઓર્ડર પછી પહેલું રેટિંગ તમે આપો.';

  @override
  String get rateOrderTitle => 'તમારા ઓર્ડરને રેટ કરો';

  @override
  String get rateDishesTitle => 'વાનગીઓને રેટ કરો';

  @override
  String get reviewHint => 'બીજું કંઈ કહેવું છે? (વૈકલ્પિક)';

  @override
  String get submitRating => 'રેટિંગ મોકલો';

  @override
  String get reviewThanks => 'આભાર — તમારું રેટિંગ મળી ગયું.';

  @override
  String get rateThisOrder => 'આ ઓર્ડરને રેટ કરો';
}
