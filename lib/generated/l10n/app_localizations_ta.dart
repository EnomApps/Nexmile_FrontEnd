// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'இந்தப் புலம் அவசியம்';

  @override
  String get tagline => 'விரைவான டெலிவரி. புத்துணர்ச்சியான புன்னகை.';

  @override
  String get chooseLanguageTitle => 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get chooseLanguageSubtitle =>
      'உங்களுக்கு வசதியான மொழியைத் தேர்ந்தெடுக்கவும். அமைப்புகளில் எப்போது வேண்டுமானாலும் இதை மாற்றலாம்.';

  @override
  String get searchLanguageHint => 'மொழியைத் தேடுங்கள்';

  @override
  String get noLanguageFound => 'மொழி எதுவும் கிடைக்கவில்லை';

  @override
  String languagesAvailable(int count) {
    return '$count மொழிகள் உள்ளன';
  }

  @override
  String get continueLabel => 'தொடரவும்';

  @override
  String get selectedLabel => 'தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get defaultLabel => 'இயல்பு';

  @override
  String get homeTitle => 'Nexmile-க்கு வரவேற்கிறோம்';

  @override
  String get homeSubtitle =>
      'புதிய மளிகைப் பொருட்கள், சூடான உணவு மற்றும் அன்றாடத் தேவைகள் உங்கள் அருகிலுள்ள கடைகளிலிருந்து.';

  @override
  String get changeLanguage => 'மொழியை மாற்று';

  @override
  String get languageUpdated => 'மொழி மாற்றப்பட்டது';

  @override
  String get appLanguageLabel => 'செயலி மொழி';

  @override
  String greetingNamed(String name) {
    return 'வணக்கம், $name';
  }

  @override
  String get loginTitle => 'Nexmile-இல் உள்நுழையவும்';

  @override
  String get loginSubtitle =>
      'உங்கள் மின்னஞ்சல் அல்லது கைபேசி எண்ணை உள்ளிடுங்கள், சரிபார்ப்புக் குறியீட்டை அனுப்புகிறோம்.';

  @override
  String get emailOrPhoneLabel => 'மின்னஞ்சல் அல்லது கைபேசி எண்';

  @override
  String get emailOrPhoneHint => 'name@example.com அல்லது 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'சரியான மின்னஞ்சல் முகவரி அல்லது 10 இலக்க கைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get sendCode => 'குறியீட்டை அனுப்பு';

  @override
  String get agreeToTermsOnContinue =>
      'தொடர்வதன் மூலம், எங்கள் சேவை விதிமுறைகள் மற்றும் தனியுரிமைக் கொள்கையை ஏற்கிறீர்கள்.';

  @override
  String get otpTitle => 'நீங்கள்தான் என உறுதிப்படுத்துங்கள்';

  @override
  String otpSubtitle(String target) {
    return '$target க்கு அனுப்பிய 6 இலக்கக் குறியீட்டை உள்ளிடவும்';
  }

  @override
  String get verifyCode => 'சரிபார்க்கவும்';

  @override
  String get resendCode => 'குறியீட்டை மீண்டும் அனுப்பு';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds வினாடிகளில் மீண்டும் அனுப்பலாம்';
  }

  @override
  String get codeResent => 'புதிய குறியீடு அனுப்பப்பட்டது';

  @override
  String get incorrectCode =>
      'இந்தக் குறியீடு தவறானது அல்லது காலாவதியாகிவிட்டது. புதியதைக் கோரவும்.';

  @override
  String get enterFullCode => '6 இலக்கங்களையும் உள்ளிடவும்';

  @override
  String get accountSuspended =>
      'இந்தக் கணக்கு இடைநிறுத்தப்பட்டுள்ளது. ஆதரவைத் தொடர்பு கொள்ளவும்.';

  @override
  String get tooManyAttempts =>
      'பல முறை முயற்சித்துவிட்டீர்கள். சிறிது நேரம் கழித்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get sessionExpired =>
      'உங்கள் அமர்வு காலாவதியாகிவிட்டது. மீண்டும் உள்நுழையவும்.';

  @override
  String get networkError =>
      'இணைய இணைப்பு இல்லை. உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get developmentCode => 'டெவலப்மென்ட் குறியீடு';

  @override
  String get signOut => 'வெளியேறு';

  @override
  String get signedOut => 'நீங்கள் வெளியேறிவிட்டீர்கள்';

  @override
  String get somethingWentWrong => 'ஏதோ தவறு நடந்தது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get profileTitle => 'சுயவிவரம்';

  @override
  String get viewProfile => 'சுயவிவரத்தைப் பார்';

  @override
  String get nameLabel => 'பெயர்';

  @override
  String get emailLabel => 'மின்னஞ்சல்';

  @override
  String get mobileLabel => 'கைபேசி எண்';

  @override
  String get accountStatusLabel => 'கணக்கு நிலை';

  @override
  String get statusActive => 'செயலில்';

  @override
  String get statusPending => 'நிலுவையில்';

  @override
  String get statusSuspended => 'இடைநிறுத்தப்பட்டது';

  @override
  String get verifiedLabel => 'சரிபார்க்கப்பட்டது';

  @override
  String get notProvided => 'சேர்க்கப்படவில்லை';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get navHome => 'முகப்பு';

  @override
  String get navSearch => 'தேடல்';

  @override
  String get navOrders => 'ஆர்டர்கள்';

  @override
  String get cancelLabel => 'ரத்து செய்';

  @override
  String get deliverTo => 'டெலிவரி முகவரி';

  @override
  String get searchDishesHint => 'உணவு அல்லது உணவகத்தைத் தேடுங்கள்';

  @override
  String get searchTitle => 'தேடல்';

  @override
  String get searchNoResultsTitle => 'எதுவும் கிடைக்கவில்லை';

  @override
  String get searchNoResultsSubtitle =>
      'வேறு உணவு, சமையல் வகை அல்லது உணவகப் பெயரை முயற்சிக்கவும்.';

  @override
  String get cravingTitle => 'என்ன சாப்பிட ஆசை?';

  @override
  String get offersTitle => 'உங்களுக்கான சலுகைகள்';

  @override
  String get restaurantsNearby => 'அருகிலுள்ள உணவகங்கள்';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count உணவகங்கள்',
      one: '1 உணவகம்',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'இங்கே இன்னும் எதுவும் இல்லை';

  @override
  String get noRestaurantsSubtitle =>
      'வேறு வகையை முயற்சிக்கவும் அல்லது வடிகட்டியை நீக்கவும்.';

  @override
  String minutesAway(int minutes) {
    return '$minutes நிமி';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance கி.மீ';
  }

  @override
  String ratingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count மதிப்பீடுகள்',
      one: '1 மதிப்பீடு',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'இருவருக்கு ₹$amount';
  }

  @override
  String get freeDelivery => 'இலவச டெலிவரி';

  @override
  String percentOff(int percent) {
    return '$percent% தள்ளுபடி';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'உங்கள் ஆர்டரில் $percent% தள்ளுபடி';
  }

  @override
  String get vegOnly => 'சைவம் மட்டும்';

  @override
  String get bestseller => 'அதிகம் விற்பனை';

  @override
  String get addLabel => 'சேர்';

  @override
  String get noVegDishesTitle => 'சைவ உணவுகள் இல்லை';

  @override
  String get noVegDishesSubtitle =>
      'முழு மெனுவைப் பார்க்க சைவ வடிகட்டியை அணைக்கவும்.';

  @override
  String get replaceCartTitle => 'புதிய கூடையைத் தொடங்கவா?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'உங்கள் கூடையில் $restaurant இலிருந்து பொருட்கள் உள்ளன. இதைச் சேர்த்தால் அவை நீக்கப்படும்.';
  }

  @override
  String get replaceCartConfirm => 'நீக்கிச் சேர்';

  @override
  String get cartTitle => 'உங்கள் கூடை';

  @override
  String get cartEmptyTitle => 'உங்கள் கூடை காலியாக உள்ளது';

  @override
  String get cartEmptySubtitle =>
      'தொடங்க ஒரு உணவகத்திலிருந்து உணவைச் சேர்க்கவும்.';

  @override
  String get browseRestaurants => 'உணவகங்களைப் பார்';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பொருட்கள்',
      one: '1 பொருள்',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'கூடையைப் பார்';

  @override
  String get itemTotal => 'பொருட்களின் மொத்தம்';

  @override
  String get deliveryFeeLabel => 'டெலிவரி கட்டணம்';

  @override
  String get taxesAndCharges => 'வரிகள் மற்றும் கட்டணங்கள்';

  @override
  String get freeLabel => 'இலவசம்';

  @override
  String get toPay => 'செலுத்த வேண்டியது';

  @override
  String placeOrderFor(String amount) {
    return 'ஆர்டர் செய் · $amount';
  }

  @override
  String get ordersTitle => 'உங்கள் ஆர்டர்கள்';

  @override
  String get ordersEmptyTitle => 'இதுவரை ஆர்டர்கள் இல்லை';

  @override
  String get ordersEmptySubtitle => 'உங்கள் முந்தைய ஆர்டர்கள் இங்கே தோன்றும்.';

  @override
  String get reorder => 'மீண்டும் ஆர்டர்';

  @override
  String orderTitle(String id) {
    return 'ஆர்டர் $id';
  }

  @override
  String get orderPlacedTitle => 'ஆர்டர் செய்யப்பட்டது';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'சுமார் $minutes நிமிடங்களில் வந்துவிடும்.';
  }

  @override
  String get orderDeliveredTitle => 'டெலிவரி செய்யப்பட்டது';

  @override
  String get orderDeliveredSubtitle => 'உணவை ரசியுங்கள்.';

  @override
  String get statusOrderPlaced => 'ஆர்டர் செய்யப்பட்டது';

  @override
  String get statusPreparing => 'உணவு தயாராகிறது';

  @override
  String get statusOnTheWay => 'வழியில் உள்ளது';

  @override
  String get statusDelivered => 'டெலிவரி செய்யப்பட்டது';

  @override
  String get keepBrowsing => 'தொடர்ந்து பார்';

  @override
  String get backToHome => 'முகப்புக்குத் திரும்பு';

  @override
  String get prototypeNotice =>
      'மாதிரி உணவகப் பட்டியல் — உண்மையான கடைகள் API வந்ததும் சேரும்.';

  @override
  String get prototypeCheckoutNotice =>
      'இது ஒரு மாதிரி வடிவமைப்பு. பணம் எதுவும் வசூலிக்கப்படவில்லை, உண்மையான ஆர்டரும் இல்லை.';

  @override
  String get prototypeTrackingNotice =>
      'இந்த மாதிரிக்காக டிராக்கிங் உருவகப்படுத்தப்பட்டுள்ளது.';

  @override
  String get locationTitle => 'எங்கு டெலிவரி செய்ய வேண்டும்?';

  @override
  String get locationSubtitle =>
      '1 கி.மீ சுற்றளவில் உள்ள கடைகளிலிருந்து மட்டுமே Nexmile டெலிவரி செய்கிறது, எனவே உங்கள் சரியான இடம் தேவை.';

  @override
  String get locationReasonRadiusTitle => '1 கி.மீ-க்குள் உள்ள கடைகள்';

  @override
  String get locationReasonRadiusBody =>
      'சூடாக வந்து சேரக்கூடிய கடைகளை மட்டுமே காட்டுகிறோம்.';

  @override
  String get locationReasonAccuracyTitle => 'சரியான வீட்டு வாசல்';

  @override
  String get locationReasonAccuracyBody =>
      'துல்லியமான இடம் இருந்தால், டெலிவரி நபர் அழைக்காமலேயே உங்களைக் கண்டுபிடிப்பார்.';

  @override
  String get locationReasonPrivacyTitle =>
      'செயலியைப் பயன்படுத்தும்போது மட்டும்';

  @override
  String get locationReasonPrivacyBody =>
      'பின்னணியில் நாங்கள் உங்களைக் கண்காணிப்பதில்லை; முகவரியை நீங்களே தட்டச்சு செய்யலாம்.';

  @override
  String get allowLocation => 'இருப்பிடத்தை அனுமதி';

  @override
  String get enterAddressManually => 'நானே முகவரியை உள்ளிடுகிறேன்';

  @override
  String get locationDenied =>
      'இருப்பிட அனுமதி மறுக்கப்பட்டது. நீங்களே பின்னை வைக்கலாம்.';

  @override
  String get locationDeniedForever =>
      'Nexmile-க்கு இருப்பிடம் தடுக்கப்பட்டுள்ளது. அமைப்புகளில் இயக்கவும் அல்லது பின்னை கையால் வைக்கவும்.';

  @override
  String get locationServiceOff =>
      'இந்தச் சாதனத்தில் இருப்பிடம் அணைக்கப்பட்டுள்ளது.';

  @override
  String get locationUnavailable =>
      'இருப்பிடத்தைப் பெற முடியவில்லை. பின்னை நீங்களே வைக்கவும்.';

  @override
  String get openSettings => 'அமைப்புகள்';

  @override
  String get pinLocationTitle => 'உங்கள் டெலிவரி பின்னை அமைக்கவும்';

  @override
  String get deliveryRadiusHint =>
      'Nexmile டெலிவரி செய்யும் 1 கி.மீ சுற்றளவை வட்டம் காட்டுகிறது.';

  @override
  String get useMyLocation => 'என் இருப்பிடத்தைப் பயன்படுத்து';

  @override
  String get deliveringHere => 'இங்கே டெலிவரி';

  @override
  String get dragToAdjust => 'பின்னை மாற்ற வரைபடத்தை நகர்த்தவும்';

  @override
  String get confirmLocation => 'இருப்பிடத்தை உறுதிசெய்';

  @override
  String get addressDetailsTitle => 'முகவரி விவரங்கள்';

  @override
  String get addressDetailsSubtitle =>
      'சரியான வாசலை அடைய வீட்டு எண் மற்றும் அடையாளத்தைச் சேர்க்கவும்.';

  @override
  String get pinnedLocation => 'குறிக்கப்பட்ட இடம்';

  @override
  String get changePin => 'மாற்று';

  @override
  String get saveAddressAs => 'இந்த முகவரியை இப்படிச் சேமி';

  @override
  String get labelHome => 'வீடு';

  @override
  String get labelWork => 'அலுவலகம்';

  @override
  String get labelOther => 'மற்றவை';

  @override
  String get addressLine1Label => 'வீடு / கட்டிட எண்';

  @override
  String get addressLine1Hint => '12A, கிரீன் ரெசிடென்சி';

  @override
  String get addressLine2Label => 'தெரு அல்லது பகுதி';

  @override
  String get addressLine2Hint => '2வது அவென்யூ, அண்ணா நகர்';

  @override
  String get landmarkLabel => 'அடையாளம்';

  @override
  String get landmarkHint => 'பேருந்து நிறுத்தத்திற்கு எதிரில்';

  @override
  String get cityLabel => 'நகரம்';

  @override
  String get stateLabel => 'மாநிலம்';

  @override
  String get pincodeLabel => 'பின் கோடு';

  @override
  String get invalidPincode => 'சரியான 6 இலக்க பின் கோடை உள்ளிடவும்';

  @override
  String get contactNameLabel => 'தொடர்பு பெயர்';

  @override
  String get contactPhoneLabel => 'தொடர்பு எண்';

  @override
  String get invalidMobileNumber => 'சரியான 10 இலக்க கைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get makeDefaultAddress => 'இயல்பாக இங்கே டெலிவரி';

  @override
  String get saveAddress => 'முகவரியைச் சேமி';

  @override
  String get addressSaved => 'முகவரி சேமிக்கப்பட்டது';

  @override
  String get addressBookTitle => 'டெலிவரி முகவரிகள்';

  @override
  String get manageAddresses => 'சேமித்த முகவரிகளை நிர்வகி';

  @override
  String get noAddressesTitle => 'இதுவரை முகவரிகள் இல்லை';

  @override
  String get noAddressesSubtitle =>
      'உங்களுக்கு டெலிவரி செய்யும் கடைகளைக் காட்ட ஒரு முகவரியைச் சேர்க்கவும்.';

  @override
  String get addAddress => 'முகவரியைச் சேர்';

  @override
  String get setAsDefault => 'இயல்பாக அமை';

  @override
  String get editLabel => 'திருத்து';

  @override
  String get addressUpdated => 'முகவரி புதுப்பிக்கப்பட்டது';

  @override
  String get deleteLabel => 'நீக்கு';

  @override
  String get deleteAddressTitle => 'இந்த முகவரியை நீக்கவா?';

  @override
  String get deleteAddressMessage =>
      'பிறகு எப்போது வேண்டுமானாலும் மீண்டும் சேர்க்கலாம்.';

  @override
  String get rescueDealsTitle => 'உணவு மீட்பு';

  @override
  String get notTakingOrders => 'ஆர்டர் ஏற்கவில்லை';

  @override
  String get closedRightNow => 'இப்போது மூடியுள்ளது';

  @override
  String minimumOrder(String amount) {
    return 'குறைந்தது $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count மீதம்';
  }

  @override
  String get soldOut => 'விற்றுத் தீர்ந்தது';

  @override
  String get menuEmptyTitle => 'இன்னும் உணவுகள் இல்லை';

  @override
  String get menuEmptySubtitle => 'இந்த உணவகம் மெனுவைச் சேர்க்கவில்லை.';

  @override
  String get moreDishesTitle => 'மேலும் உணவுகள்';

  @override
  String get customisable => 'விருப்பப்படி';

  @override
  String get requiredLabel => 'கட்டாயம்';

  @override
  String get optionalLabel => 'விருப்பம்';

  @override
  String get chooseOne => 'ஒன்றைத் தேர்வு செய்க';

  @override
  String chooseUpTo(int count) {
    return 'அதிகபட்சம் $count தேர்வு செய்க';
  }

  @override
  String chooseAtLeast(int count) {
    return 'குறைந்தது $count தேர்வு செய்க';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min முதல் $max வரை தேர்வு செய்க';
  }

  @override
  String get specialInstructions => 'சிறப்பு அறிவுறுத்தல்கள்';

  @override
  String get specialInstructionsHint => 'குறைவான காரம், வெங்காயம் வேண்டாம்…';

  @override
  String addForAmount(String amount) {
    return 'சேர் · $amount';
  }

  @override
  String get deliveryLabel => 'டெலிவரி';

  @override
  String get pickupLabel => 'நேரில் பெறுதல்';

  @override
  String get packagingLabel => 'பேக்கிங்';

  @override
  String get discountLabel => 'தள்ளுபடி';

  @override
  String get billDetailsTitle => 'கட்டண விவரம்';

  @override
  String get clearCart => 'கார்ட்டை காலி செய்';

  @override
  String get clearCartTitle => 'இந்த கார்ட்டை காலி செய்யவா?';

  @override
  String get clearCartMessage => 'இதில் உள்ள அனைத்தும் நீக்கப்படும்.';

  @override
  String unavailableItemsNotice(String items) {
    return 'இப்போது கிடைக்கவில்லை: $items';
  }

  @override
  String get removeUnavailable => 'அவற்றை நீக்கு';

  @override
  String minimumNotMet(String amount) {
    return 'குறைந்தபட்ச ஆர்டர் $amount';
  }

  @override
  String get checkoutTitle => 'செக்அவுட்';

  @override
  String get deliveryAddressLabel => 'டெலிவரி முகவரி';

  @override
  String get noAddressSelected => 'முகவரி தேர்வு செய்யவில்லை';

  @override
  String get paymentMethodLabel => 'கட்டணம்';

  @override
  String get payOnDelivery => 'டெலிவரியின் போது பணம்';

  @override
  String get noteToRestaurant => 'உணவகத்திற்கு குறிப்பு';

  @override
  String get noteToRestaurantHint => 'மணியை இருமுறை அடிக்கவும்…';

  @override
  String get activeOrdersTitle => 'நடப்பு ஆர்டர்கள்';

  @override
  String get pastOrdersTitle => 'முந்தைய ஆர்டர்கள்';

  @override
  String get orderItemsTitle => 'உணவுகள்';

  @override
  String get orderProgressTitle => 'நிலை';

  @override
  String get arrivingIn => 'வந்து சேரும் நேரம்';

  @override
  String get pickupCodeLabel => 'பிக்அப் குறியீடு';

  @override
  String get cancellationReasonLabel => 'ரத்து செய்யப்பட்ட காரணம்';

  @override
  String get riderLabel => 'டெலிவரி பார்ட்னர்';

  @override
  String get callRider => 'அழை';

  @override
  String get viewInvoice => 'வரி விலைப்பட்டியல்';

  @override
  String get cancelOrder => 'ஆர்டரை ரத்து செய்';

  @override
  String get cancelOrderTitle => 'இந்த ஆர்டரை ரத்து செய்யவா?';

  @override
  String get cancelOrderMessage =>
      'உணவகம் ஏற்றுக்கொள்வதற்கு முன்பே ரத்து செய்ய முடியும்.';

  @override
  String get cancelReasonLabel => 'காரணம்';

  @override
  String get cancelReasonFallback => 'வாடிக்கையாளர் ரத்து செய்தார்';

  @override
  String get orderCancelled => 'ஆர்டர் ரத்து செய்யப்பட்டது';

  @override
  String get currentLocationLabel => 'தற்போதைய இடம்';

  @override
  String get editProfileTitle => 'சுயவிவரத்தைத் திருத்து';

  @override
  String get editProfileSubtitle =>
      'உணவகமும் டெலிவரி பார்ட்னரும் உங்கள் பெயரைத்தான் பார்ப்பார்கள்.';

  @override
  String get saveChanges => 'மாற்றங்களைச் சேமி';

  @override
  String get profileUpdated => 'சுயவிவரம் புதுப்பிக்கப்பட்டது';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String get deleteAccountTitle => 'உங்கள் கணக்கை நீக்கவா?';

  @override
  String get deleteAccountMessage =>
      'எல்லா சாதனங்களிலிருந்தும் வெளியேற்றப்படுவீர்கள். பழைய ஆர்டர்களும் ரசீதுகளும் வரி பதிவுக்காக வைக்கப்படும்.';

  @override
  String get accountDeleted => 'உங்கள் கணக்கு நீக்கப்பட்டது';

  @override
  String get devicesTitle => 'உள்நுழைந்த சாதனங்கள்';

  @override
  String get devicesSubtitle => 'நீங்கள் எங்கு உள்நுழைந்துள்ளீர்கள்';

  @override
  String get devicesEmptyTitle => 'வேறு சாதனங்கள் இல்லை';

  @override
  String get devicesEmptySubtitle =>
      'இந்தச் சாதனத்தில் மட்டுமே உள்நுழைந்துள்ளீர்கள்.';

  @override
  String get signOutDevice => 'வெளியேறு';

  @override
  String get signOutDeviceTitle => 'இந்தச் சாதனத்திலிருந்து வெளியேறவா?';

  @override
  String get signOutDeviceMessage =>
      'நீங்கள் பயன்படுத்துவது இதுவே என்றால் மீண்டும் உள்நுழைய வேண்டும்.';

  @override
  String get deviceSignedOut => 'சாதனம் வெளியேற்றப்பட்டது';

  @override
  String get signOutEverywhere => 'எல்லா இடங்களிலிருந்தும் வெளியேறு';

  @override
  String get signOutEverywhereTitle => 'எல்லா இடங்களிலிருந்தும் வெளியேறவா?';

  @override
  String get signOutEverywhereMessage =>
      'இந்தச் சாதனம் உட்பட எல்லா சாதனங்களும் வெளியேற்றப்படும்.';

  @override
  String get unknownDevice => 'தெரியாத சாதனம்';

  @override
  String get activeNow => 'இப்போது செயலில்';

  @override
  String minutesAgo(int count) {
    return '$count நிமிடங்களுக்கு முன்';
  }

  @override
  String hoursAgo(int count) {
    return '$count மணி நேரத்திற்கு முன்';
  }

  @override
  String daysAgo(int count) {
    return '$count நாட்களுக்கு முன்';
  }

  @override
  String get filtersAndSorting => 'வடிகட்டி மற்றும் வரிசை';

  @override
  String get clearAll => 'அனைத்தையும் அழி';

  @override
  String get showResults => 'முடிவுகளைக் காட்டு';

  @override
  String get closeLabel => 'மூடு';

  @override
  String get sortByTitle => 'வரிசைப்படுத்து';

  @override
  String get sortRelevance => 'பொருத்தம்';

  @override
  String get sortRating => 'மதிப்பீடு';

  @override
  String get sortDeliveryTime => 'டெலிவரி நேரம்';

  @override
  String get sortCostLowHigh => 'விலை: குறைவு முதல் அதிகம்';

  @override
  String get sortCostHighLow => 'விலை: அதிகம் முதல் குறைவு';

  @override
  String get timeSection => 'நேரம்';

  @override
  String get nearAndFast => 'அருகில் & விரைவு';

  @override
  String get openNow => 'இப்போது திறந்துள்ளது';

  @override
  String get ratingSection => 'உணவக மதிப்பீடு';

  @override
  String ratedAbove(String rating) {
    return '$rating+ மதிப்பீடு';
  }

  @override
  String get offersSection => 'சலுகைகள்';

  @override
  String get hasOffersLabel => 'சலுகை உள்ளவை';

  @override
  String get dishPriceSection => 'உணவு விலை';

  @override
  String costUnder(String amount) {
    return '$amountக்கும் குறைவு';
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
  String get moreSection => 'மேலும்';

  @override
  String get noPackagingCharges => 'பேக்கிங் கட்டணம் இல்லை';

  @override
  String get allRestaurantsTitle => 'அனைத்து உணவகங்கள்';

  @override
  String get whatsOnYourMind => 'என்ன சாப்பிடலாம்?';

  @override
  String get listeningNow => 'கேட்கிறோம்…';

  @override
  String get speakNowHint => 'உணவு அல்லது உணவகத்தைச் சொல்லுங்கள்';

  @override
  String get voiceUnavailable => 'குரல் தேடல் கிடைக்கவில்லை';

  @override
  String get voiceUnavailableBody => 'நீங்கள் தட்டச்சு செய்தும் தேடலாம்.';

  @override
  String get microphoneDenied => 'மைக்ரோஃபோன் அனுமதி இல்லை';

  @override
  String get voiceSearchLabel => 'குரலால் தேடு';

  @override
  String get ratingsAndReviews => 'மதிப்பீடுகளும் விமர்சனங்களும்';

  @override
  String get reviewsWithTextOnly => 'விமர்சனம் உள்ளவை';

  @override
  String get noReviewsTitle => 'இதுவரை மதிப்பீடு இல்லை';

  @override
  String get noReviewsSubtitle =>
      'ஆர்டர் செய்த பிறகு முதல் மதிப்பீட்டை நீங்களே அளியுங்கள்.';

  @override
  String get rateOrderTitle => 'உங்கள் ஆர்டரை மதிப்பிடுங்கள்';

  @override
  String get rateDishesTitle => 'உணவுகளை மதிப்பிடுங்கள்';

  @override
  String get reviewHint =>
      'மேலும் ஏதேனும் சொல்ல விரும்புகிறீர்களா? (விருப்பம்)';

  @override
  String get submitRating => 'மதிப்பீட்டை அனுப்பு';

  @override
  String get reviewThanks => 'நன்றி — உங்கள் மதிப்பீடு பதிவானது.';

  @override
  String get rateThisOrder => 'இந்த ஆர்டரை மதிப்பிடுங்கள்';
}
