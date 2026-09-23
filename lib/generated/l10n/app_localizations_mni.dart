// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Manipuri (`mni`).
class AppLocalizationsMni extends AppLocalizations {
  AppLocalizationsMni([String locale = 'mni']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'মসি হাপচিনবা তংাইফদে';

  @override
  String get tagline => 'থুনা ডেলিভরি। অনৌবা নোকপা।';

  @override
  String get chooseLanguageTitle => 'নহাক্কী লোল খল্লু';

  @override
  String get chooseLanguageSubtitle =>
      'নহাক্না লাইনা খংবা লোল অদু খল্লু। মসিবু মতম খুদিংদা সেটিংস্তা হোংদোকপা য়াই।';

  @override
  String get searchLanguageHint => 'লোল থিয়ু';

  @override
  String get noLanguageFound => 'লোল অমত্তা ফংদে';

  @override
  String languagesAvailable(int count) {
    return 'লোল $count ফংই';
  }

  @override
  String get continueLabel => 'মখা চত্থৌ';

  @override
  String get selectedLabel => 'খল্লবা';

  @override
  String get defaultLabel => 'ডিফোল্ট';

  @override
  String get homeTitle => 'Nexmile-দা তরাম্না ওকচরি';

  @override
  String get homeSubtitle =>
      'অনৌবা কিরানা, অসাবা চাক অমসুং নুমিৎ খুদিংগী দরকার ওইবা পোৎলমশিং নহাক্কী নকপা দোকানশিংদগী।';

  @override
  String get changeLanguage => 'লোল হোংদোকউ';

  @override
  String get languageUpdated => 'লোল হোংদোক্লে';

  @override
  String get appLanguageLabel => 'এপকী লোল';

  @override
  String greetingNamed(String name) {
    return 'খুরুমজরি, $name';
  }

  @override
  String get loginTitle => 'Nexmile-দা সাইন ইন তৌবিয়ু';

  @override
  String get loginSubtitle =>
      'নহাক্কী ইমেল নত্ত্রগা মোবাইল নম্বর হাপচিল্লু, ঐখোয়না ভেরিফিকেসন কোদ থারগনি।';

  @override
  String get emailOrPhoneLabel => 'ইমেল নত্ত্রগা মোবাইল নম্বর';

  @override
  String get emailOrPhoneHint => 'name@example.com নত্ত্রগা 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'অচুম্বা ইমেল এদ্রেস নত্ত্রগা মশিং ১০ গী মোবাইল নম্বর হাপচিল্লু';

  @override
  String get sendCode => 'কোদ থাবিয়ু';

  @override
  String get agreeToTermsOnContinue =>
      'মখা চত্থবা অসিনা নহাক্না ঐখোয়গী সর্ভিসকী ৱায়েল য়াথং অমসুং প্রাইভেসি পোলিসিদা য়াজরি।';

  @override
  String get otpTitle => 'মসি নহাক্নি হায়বদু শোয়দনা য়েংউ';

  @override
  String otpSubtitle(String target) {
    return '$target-দা থাখিবা মশিং ৬ গী কোদ হাপচিল্লু';
  }

  @override
  String get verifyCode => 'শোয়দনা য়েংউ';

  @override
  String get resendCode => 'কোদ অমুক থাবিয়ু';

  @override
  String resendCodeIn(int seconds) {
    return 'সেকেন্দ $seconds-দা অমুক থাবিয়ু';
  }

  @override
  String get codeResent => 'অনৌবা কোদ থারে';

  @override
  String get incorrectCode =>
      'কোদ অসি চুমদে নত্ত্রগা মতম লোইরে। অনৌবা কোদ নিজবিয়ু।';

  @override
  String get enterFullCode => 'মশিং ৬ মক্তা হাপচিল্লু';

  @override
  String get accountSuspended => 'একাউন্ট অসি থিংলে। সপোর্ততা পাউ পীবিয়ু।';

  @override
  String get tooManyAttempts =>
      'য়াম্না হোৎনখ্রে। মতম খরা লৈরগা অমুক হন্না হোৎনবিয়ু।';

  @override
  String get sessionExpired =>
      'নহাক্কী সেসনগী মতম লোইরে। অমুক হন্না সাইন ইন তৌবিয়ু।';

  @override
  String get networkError =>
      'ইন্টরনেৎ কনেক্সন লৈতে। কনেক্সন য়েংলগা অমুক হন্না হোৎনবিয়ু।';

  @override
  String get developmentCode => 'দিভেলপমেন্ত কোদ';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get signedOut => 'নহাক সাইন আউট তৌরে';

  @override
  String get somethingWentWrong =>
      'করিগুম্বা অরানবা থোকখ্রে। অমুক হন্না হোৎনবিয়ু।';

  @override
  String get profileTitle => 'প্রোফাইল';

  @override
  String get viewProfile => 'প্রোফাইল য়েংউ';

  @override
  String get nameLabel => 'মিং';

  @override
  String get emailLabel => 'ইমেল';

  @override
  String get mobileLabel => 'মোবাইল নম্বর';

  @override
  String get accountStatusLabel => 'একাউন্টকী ফিভম';

  @override
  String get statusActive => 'থবক তৌরি';

  @override
  String get statusPending => 'ঙাইরি';

  @override
  String get statusSuspended => 'থিংলে';

  @override
  String get verifiedLabel => 'শোয়দনা য়েংলে';

  @override
  String get notProvided => 'হাপচিন্দ্রি';

  @override
  String get retry => 'অমুক হন্না হোৎনবিয়ু';

  @override
  String get navHome => 'হোম';

  @override
  String get navSearch => 'থিয়ু';

  @override
  String get navOrders => 'ওর্দর';

  @override
  String get cancelLabel => 'কেন্সেল তৌ';

  @override
  String get deliverTo => 'দেলিভরি এদ্রেস';

  @override
  String get searchDishesHint => 'চিঞ্জাক নত্ত্রগা রেস্তোরান্ত থিয়ু';

  @override
  String get searchTitle => 'থিয়ু';

  @override
  String get searchNoResultsTitle => 'করিসু ফংদে';

  @override
  String get searchNoResultsSubtitle =>
      'অতোপ্পা চিঞ্জাক, থোংবগী মওং নত্ত্রগা রেস্তোরান্তকী মিং হোৎনবিয়ু।';

  @override
  String get cravingTitle => 'ঙসি করি চাবা পাম্বগে?';

  @override
  String get offersTitle => 'নহাক্কীদমক ওফর';

  @override
  String get restaurantsNearby => 'নহাক্কী নকপা রেস্তোরান্তশিং';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ',
      one: '1 ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'মফম অসিদা হৌজিক করিসু লৈতে';

  @override
  String get noRestaurantsSubtitle =>
      'অতোপ্পা কেতেগোরি য়েংউ নত্ত্রগা ফিল্তর লৌথোকউ।';

  @override
  String minutesAway(int minutes) {
    return 'মিনিট $minutes';
  }

  @override
  String kilometresAway(String distance) {
    return 'কিমি $distance';
  }

  @override
  String ratingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count রেটিং',
      one: '1 রেটিং',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'অনিগীদমক ₹$amount';
  }

  @override
  String get freeDelivery => 'ফ্রি দেলিভরি';

  @override
  String percentOff(int percent) {
    return '$percent% হন্থবা';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'নহাক্কী ওর্দরদা $percent% হন্থবা';
  }

  @override
  String get vegOnly => 'ভেজ খক্তা';

  @override
  String get bestseller => 'খ্বাইদগী য়াম্না য়োনবা';

  @override
  String get addLabel => 'হাপচিল্লু';

  @override
  String get noVegDishesTitle => 'মফম অসিদা ভেজ চিঞ্জাক লৈতে';

  @override
  String get noVegDishesSubtitle => 'মেনু অপুম্বা য়েংনবা ভেজ ফিল্তর থিংথোকউ।';

  @override
  String get replaceCartTitle => 'অনৌবা কার্ত হৌগদ্রা?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'নহাক্কী কার্ততা $restaurant-দগী পোৎলম লৈ। মসি হাপচিল্লবদি মখোয় লৌথোক্কনি।';
  }

  @override
  String get replaceCartConfirm => 'লৌথোক্তুনা হাপচিল্লু';

  @override
  String get cartTitle => 'নহাক্কী কার্ত';

  @override
  String get cartEmptyTitle => 'নহাক্কী কার্ত অহাংবনি';

  @override
  String get cartEmptySubtitle => 'হৌনবা রেস্তোরান্ত অমদগী চিঞ্জাক হাপচিল্লু।';

  @override
  String get browseRestaurants => 'রেস্তোরান্ত য়েংউ';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ꯄꯣꯠ',
      one: '1 ꯄꯣꯠ',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'কার্ত য়েংউ';

  @override
  String get itemTotal => 'পোৎলমগী অপুনবা';

  @override
  String get deliveryFeeLabel => 'দেলিভরি ফী';

  @override
  String get taxesAndCharges => 'খাজনা অমসুং চার্জ';

  @override
  String get freeLabel => 'ফ্রি';

  @override
  String get toPay => 'পীগদবা';

  @override
  String placeOrderFor(String amount) {
    return 'ওর্দর তৌ · $amount';
  }

  @override
  String get ordersTitle => 'নহাক্কী ওর্দরশিং';

  @override
  String get ordersEmptyTitle => 'হৌজিক ফাওবা ওর্দর লৈতে';

  @override
  String get ordersEmptySubtitle => 'নহাক্কী মমাংগী ওর্দরশিং মফম অসিদা উগনি।';

  @override
  String get reorder => 'অমুক ওর্দর';

  @override
  String orderTitle(String id) {
    return 'ওর্দর $id';
  }

  @override
  String get orderPlacedTitle => 'ওর্দর তৌরে';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'মিনিট $minutes রোমদা য়ৌরক্কনি।';
  }

  @override
  String get orderDeliveredTitle => 'দেলিভর তৌরে';

  @override
  String get orderDeliveredSubtitle => 'চিঞ্জাক নুংঙাইনা চাবিয়ু।';

  @override
  String get statusOrderPlaced => 'ওর্দর তৌরে';

  @override
  String get statusPreparing => 'চিঞ্জাক থোংলি';

  @override
  String get statusOnTheWay => 'লম্বীদা লাক্লি';

  @override
  String get statusDelivered => 'দেলিভর তৌরে';

  @override
  String get keepBrowsing => 'য়েংদুনা লৈয়ু';

  @override
  String get backToHome => 'হোমদা হল্লকউ';

  @override
  String get prototypeNotice =>
      'খুদম ওইবা স্তোরফ্রন্ত — অচুম্বা দোকানশিং কেতালোগ API-গা লোয়ননা লাক্কনি।';

  @override
  String get prototypeCheckoutNotice =>
      'মসি প্রোতোতাইপনি। সেন্ফম অমত্তা লৌদে অমসুং অচুম্বা ওর্দরসু তৌদে।';

  @override
  String get prototypeTrackingNotice =>
      'প্রোতোতাইপকীদমক ত্রেকিং অসি খুদম ওইনা শেম্বনি।';

  @override
  String get locationTitle => 'কদাইদা দেলিভরি তৌগদগে?';

  @override
  String get locationSubtitle =>
      'Nexmile না কিমি ১ গী মনুংদা লৈবা দোকানশিংদগীখক্তা দেলিভরি তৌই, মরমদুনা নহাক্কী চুম্বা মফম চঙই।';

  @override
  String get locationReasonRadiusTitle => 'কিমি ১ গী মনুংগী দোকানশিং';

  @override
  String get locationReasonRadiusBody =>
      'চিঞ্জাক অসাবা ওইনা য়ৌরকপা ঙম্বা থোংফমশিংখক্তা উৎচরি।';

  @override
  String get locationReasonAccuracyTitle => 'চুম্বা থোংদা';

  @override
  String get locationReasonAccuracyBody =>
      'চুম্বা পিন লৈরবদি দেলিভরি পার্তনরনা ফোন তৌদনা নহাক্কী মনাক্তা য়ৌরক্কনি।';

  @override
  String get locationReasonPrivacyTitle => 'এপ শিজিন্নরিঙৈ খক্তা';

  @override
  String get locationReasonPrivacyBody =>
      'ঐখোয়না মতুংদা নহাক্কী মফম থিদে, অমসুং এদ্রেস নহাক্না নশাসু ইবা য়াই।';

  @override
  String get allowLocation => 'মফমগী অয়াবা পীয়ু';

  @override
  String get enterAddressManually => 'ঐনা এদ্রেস ইশাগী মখুৎনা ইগনি';

  @override
  String get locationDenied =>
      'মফমগী অয়াবা পীদে। নহাক্না পিন ইশানা থম্বা য়াই।';

  @override
  String get locationDeniedForever =>
      'Nexmile গীদমক মফম থিংলে। সেটিংস্তা হৌদোকউ নত্ত্রগা পিন ইশানা থম্মু।';

  @override
  String get locationServiceOff => 'দিভাইস অসিদা মফম থিংলি।';

  @override
  String get locationUnavailable => 'মফম ফংদে। চানবিদুনা পিন ইশানা থম্মু।';

  @override
  String get openSettings => 'সেটিংস';

  @override
  String get pinLocationTitle => 'নহাক্কী দেলিভরি পিন থম্মু';

  @override
  String get deliveryRadiusHint =>
      'কোইল অসিনা Nexmile না দেলিভরি তৌবা কিমি ১ অদু উৎলি।';

  @override
  String get useMyLocation => 'ঐগী মফম শিজিন্নৌ';

  @override
  String get deliveringHere => 'মফম অসিদা দেলিভরি';

  @override
  String get dragToAdjust => 'পিন শেমদোক্নবা মেপ চিংথৌ';

  @override
  String get confirmLocation => 'মফম শোয়দনা য়েংউ';

  @override
  String get addressDetailsTitle => 'এদ্রেসকী অকুপ্পা';

  @override
  String get addressDetailsSubtitle =>
      'চুম্বা থোংদা য়ৌনবা য়ুমগী মশিং অমসুং খুদম হাপচিল্লু।';

  @override
  String get pinnedLocation => 'খল্লবা মফম';

  @override
  String get changePin => 'হোংদোকউ';

  @override
  String get saveAddressAs => 'এদ্রেস অসি অসুম্না থম্মু';

  @override
  String get labelHome => 'য়ুম';

  @override
  String get labelWork => 'অফিস';

  @override
  String get labelOther => 'অতোপ্পা';

  @override
  String get addressLine1Label => 'য়ুম, ফ্লেট নত্ত্রগা বিল্দিং';

  @override
  String get addressLine1Hint => '12A, গ্রীন রেসিদেন্সি';

  @override
  String get addressLine2Label => 'লম্বী নত্ত্রগা মফম';

  @override
  String get addressLine2Hint => '২শুবা এভেন্যু, অন্না নগর';

  @override
  String get landmarkLabel => 'খুদম';

  @override
  String get landmarkHint => 'বস স্তোপকী মমাংদা';

  @override
  String get cityLabel => 'সহর';

  @override
  String get stateLabel => 'স্তেত';

  @override
  String get pincodeLabel => 'পিন কোদ';

  @override
  String get invalidPincode => 'অচুম্বা মশিং ৬ গী পিন কোদ হাপচিল্লু';

  @override
  String get contactNameLabel => 'কন্তেক্ত মিং';

  @override
  String get contactPhoneLabel => 'কন্তেক্ত নম্বর';

  @override
  String get invalidMobileNumber => 'অচুম্বা মশিং ১০ গী মোবাইল নম্বর হাপচিল্লু';

  @override
  String get makeDefaultAddress => 'ডিফোল্ট ওইনা মফম অসিদা দেলিভরি';

  @override
  String get saveAddress => 'এদ্রেস থম্মু';

  @override
  String get addressSaved => 'এদ্রেস থম্লে';

  @override
  String get addressBookTitle => 'দেলিভরি এদ্রেসশিং';

  @override
  String get manageAddresses => 'থম্লবা এদ্রেসশিং শেন্দোকউ';

  @override
  String get noAddressesTitle => 'হৌজিক ফাওবা এদ্রেস লৈতে';

  @override
  String get noAddressesSubtitle =>
      'নহাক্কী মনাক্তা দেলিভরি তৌবা দোকানশিং উৎনবা এদ্রেস অমা হাপচিল্লু।';

  @override
  String get addAddress => 'এদ্রেস হাপচিল্লু';

  @override
  String get setAsDefault => 'ডিফোল্ট ওইহল্লু';

  @override
  String get editLabel => 'সেমদোকউ';

  @override
  String get addressUpdated => 'এদ্রেস অনৌ শেমখ্রে';

  @override
  String get deleteLabel => 'মুত্থৎলু';

  @override
  String get deleteAddressTitle => 'এদ্রেস অসি মুত্থৎকদ্রা?';

  @override
  String get deleteAddressMessage => 'মতুংদা অমুক হন্না হাপচিনবা য়াই।';

  @override
  String get rescueDealsTitle => 'ꯐꯨꯗ ꯔꯦꯁꯀꯤꯌꯨ';

  @override
  String get notTakingOrders => 'ꯑꯣꯔꯗꯔ ꯂꯧꯗ꯭ꯔꯤ';

  @override
  String get closedRightNow => 'ꯍꯧꯖꯤꯛ ꯂꯣꯅꯈ꯭ꯔꯦ';

  @override
  String minimumOrder(String amount) {
    return 'ꯈ꯭ꯋꯥꯏꯗꯒꯤ ꯍꯟꯊꯕ $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ꯋꯥꯠꯂꯤ';
  }

  @override
  String get soldOut => 'ꯂꯣꯏꯔꯦ';

  @override
  String get menuEmptyTitle => 'ꯍꯧꯖꯤꯛ ꯐꯛ ꯂꯩꯇꯦ';

  @override
  String get menuEmptySubtitle => 'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ ꯑꯁꯤꯅ ꯃꯍꯥꯛꯀꯤ ꯃꯦꯅꯨ ꯍꯥꯞꯆꯤꯟꯗ꯭ꯔꯤ꯫';

  @override
  String get moreDishesTitle => 'ꯑꯍꯦꯟꯕ ꯆꯥꯅꯕ';

  @override
  String get customisable => 'ꯄꯥꯝꯕꯒꯨꯝꯅ';

  @override
  String get requiredLabel => 'ꯃꯊꯧ ꯇꯥꯏ';

  @override
  String get optionalLabel => 'ꯏꯆ꯭ꯆꯥ';

  @override
  String get chooseOne => 'ꯑꯃ ꯈꯅꯕꯤꯌꯨ';

  @override
  String chooseUpTo(int count) {
    return 'ꯈ꯭ꯋꯥꯏꯗꯒꯤ ꯌꯥꯝꯅ $count ꯈꯅꯕꯤꯌꯨ';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ꯈ꯭ꯋꯥꯏꯗꯒꯤ ꯍꯟꯊꯅ $count ꯈꯅꯕꯤꯌꯨ';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ꯗꯒꯤ $max ꯐꯥꯑꯣꯕ ꯈꯅꯕꯤꯌꯨ';
  }

  @override
  String get specialInstructions => 'ꯑꯈꯟꯅꯕ ꯋꯥꯐꯝ';

  @override
  String get specialInstructionsHint => 'ꯑꯀꯅꯕ ꯍꯟꯊꯅ, ꯇꯤꯜꯍꯧ ꯌꯥꯗꯦ…';

  @override
  String addForAmount(String amount) {
    return 'ꯍꯥꯞꯆꯤꯜꯂꯨ · $amount';
  }

  @override
  String get deliveryLabel => 'ꯗꯦꯂꯤꯚꯔꯤ';

  @override
  String get pickupLabel => 'ꯃꯁꯥꯅ ꯂꯧꯕ';

  @override
  String get packagingLabel => 'ꯄꯦꯛꯀꯤꯡ';

  @override
  String get discountLabel => 'ꯗꯤꯁꯀꯥꯎꯟꯠ';

  @override
  String get billDetailsTitle => 'ꯕꯤꯜ ꯑꯀꯨꯞꯄ';

  @override
  String get clearCart => 'ꯀꯥꯔꯠ ꯍꯥꯡꯗꯣꯛꯎ';

  @override
  String get clearCartTitle => 'ꯀꯥꯔꯠ ꯑꯁꯤ ꯍꯥꯡꯗꯣꯛꯀꯗ꯭ꯔꯥ?';

  @override
  String get clearCartMessage => 'ꯃꯗꯨꯗ ꯂꯩꯔꯤꯕ ꯄꯨꯝꯅꯃꯛ ꯂꯧꯊꯣꯛꯀꯅꯤ꯫';

  @override
  String unavailableItemsNotice(String items) {
    return 'ꯍꯧꯖꯤꯛ ꯐꯪꯗ꯭ꯔꯦ: $items';
  }

  @override
  String get removeUnavailable => 'ꯃꯈꯣꯏ ꯂꯧꯊꯣꯛꯎ';

  @override
  String minimumNotMet(String amount) {
    return 'ꯈ꯭ꯋꯥꯏꯗꯒꯤ ꯍꯟꯊꯕ ꯑꯣꯔꯗꯔ $amount';
  }

  @override
  String get checkoutTitle => 'ꯆꯦꯀꯥꯎꯠ';

  @override
  String get deliveryAddressLabel => 'ꯗꯦꯂꯤꯚꯔꯤ ꯑꯗ꯭ꯔꯦꯁ';

  @override
  String get noAddressSelected => 'ꯑꯗ꯭ꯔꯦꯁ ꯈꯟꯗ꯭ꯔꯤ';

  @override
  String get paymentMethodLabel => 'ꯄꯦꯃꯦꯟꯠ';

  @override
  String get payOnDelivery => 'ꯗꯦꯂꯤꯚꯔꯤꯗ ꯀꯦꯁ';

  @override
  String get noteToRestaurant => 'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯇꯀꯤ ꯋꯥꯐꯝ';

  @override
  String get noteToRestaurantHint => 'ꯕꯦꯜ ꯑꯅꯤꯔꯛ ꯈꯣꯡꯕꯤꯌꯨ…';

  @override
  String get activeOrdersTitle => 'ꯆꯠꯂꯤꯕ ꯑꯣꯔꯗꯔ';

  @override
  String get pastOrdersTitle => 'ꯃꯃꯥꯡꯒꯤ ꯑꯣꯔꯗꯔ';

  @override
  String get orderItemsTitle => 'ꯆꯥꯅꯕ';

  @override
  String get orderProgressTitle => 'ꯄꯔꯤꯡ';

  @override
  String get arrivingIn => 'ꯌꯧꯔꯛꯀꯗꯕ';

  @override
  String get pickupCodeLabel => 'ꯄꯤꯀꯑꯞ ꯀꯣꯗ';

  @override
  String get cancellationReasonLabel => 'ꯀꯛꯊꯠꯄꯒꯤ ꯃꯔꯝ';

  @override
  String get riderLabel => 'ꯗꯦꯂꯤꯚꯔꯤ ꯄꯥꯔꯠꯅꯔ';

  @override
  String get callRider => 'ꯀꯣꯜ ꯇꯧ';

  @override
  String get viewInvoice => 'ꯇꯦꯛꯁ ꯏꯅꯚꯣꯏꯁ';

  @override
  String get cancelOrder => 'ꯑꯣꯔꯗꯔ ꯀꯛꯊꯠꯂꯨ';

  @override
  String get cancelOrderTitle => 'ꯑꯣꯔꯗꯔ ꯑꯁꯤ ꯀꯛꯊꯠꯀꯗ꯭ꯔꯥ?';

  @override
  String get cancelOrderMessage => 'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠꯅ ꯌꯥꯅꯗ꯭ꯔꯤꯉꯩꯗ ꯈꯛꯇ ꯀꯛꯊꯠꯄ ꯌꯥꯏ꯫';

  @override
  String get cancelReasonLabel => 'ꯃꯔꯝ';

  @override
  String get cancelReasonFallback => 'ꯀꯁ꯭ꯇꯃꯔꯅ ꯀꯛꯊꯠꯂꯦ';

  @override
  String get orderCancelled => 'ꯑꯣꯔꯗꯔ ꯀꯛꯊꯠꯂꯦ';

  @override
  String get currentLocationLabel => 'ꯍꯧꯖꯤꯛꯀꯤ ꯃꯐꯝ';

  @override
  String get editProfileTitle => 'ꯄ꯭ꯔꯣꯐꯥꯏꯜ ꯁꯦꯝꯗꯣꯛꯎ';

  @override
  String get editProfileSubtitle =>
      'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ ꯑꯃꯁꯨꯡ ꯗꯦꯂꯤꯚꯔꯤ ꯄꯥꯔꯠꯅꯔꯅ ꯑꯗꯣꯝꯒꯤ ꯃꯃꯤꯡ ꯑꯗꯨ ꯎꯏ꯫';

  @override
  String get saveChanges => 'ꯑꯍꯣꯡꯕ ꯊꯝꯃꯨ';

  @override
  String get profileUpdated => 'ꯄ꯭ꯔꯣꯐꯥꯏꯜ ꯑꯅꯧꯕ ꯑꯣꯏꯔꯦ';

  @override
  String get deleteAccount => 'ꯑꯦꯀꯥꯎꯟꯠ ꯃꯨꯠꯊꯠꯂꯨ';

  @override
  String get deleteAccountTitle => 'ꯑꯗꯣꯝꯒꯤ ꯑꯦꯀꯥꯎꯟꯠ ꯃꯨꯠꯊꯠꯀꯗ꯭ꯔꯥ?';

  @override
  String get deleteAccountMessage =>
      'ꯗꯤꯚꯥꯏꯁ ꯄꯨꯝꯅꯃꯛꯇꯒꯤ ꯁꯥꯏꯟ ꯑꯥꯎꯠ ꯑꯣꯏꯒꯅꯤ꯫ ꯃꯃꯥꯡꯒꯤ ꯑꯣꯔꯗꯔ ꯑꯃꯁꯨꯡ ꯕꯤꯜ ꯑꯗꯨ ꯇꯦꯛꯁ ꯔꯦꯀꯣꯔꯗꯀꯤꯗꯃꯛ ꯊꯝꯃꯤ꯫';

  @override
  String get accountDeleted => 'ꯑꯗꯣꯝꯒꯤ ꯑꯦꯀꯥꯎꯟꯠ ꯃꯨꯠꯊꯠꯂꯦ';

  @override
  String get devicesTitle => 'ꯁꯥꯏꯟ ꯏꯟ ꯗꯤꯚꯥꯏꯁ';

  @override
  String get devicesSubtitle => 'ꯑꯗꯣꯝ ꯀꯗꯥꯏꯗ ꯁꯥꯏꯟ ꯏꯟ ꯇꯧꯔꯤ';

  @override
  String get devicesEmptyTitle => 'ꯑꯇꯣꯞꯄ ꯗꯤꯚꯥꯏꯁ ꯂꯩꯇꯦ';

  @override
  String get devicesEmptySubtitle => 'ꯑꯗꯣꯝ ꯗꯤꯚꯥꯏꯁ ꯑꯁꯤꯗ ꯈꯛꯇ ꯁꯥꯏꯟ ꯏꯟ ꯇꯧꯔꯤ꯫';

  @override
  String get signOutDevice => 'ꯁꯥꯏꯟ ꯑꯥꯎꯠ';

  @override
  String get signOutDeviceTitle => 'ꯗꯤꯚꯥꯏꯁ ꯑꯁꯤ ꯁꯥꯏꯟ ꯑꯥꯎꯠ ꯇꯧꯒꯗ꯭ꯔꯥ?';

  @override
  String get signOutDeviceMessage =>
      'ꯑꯗꯣꯝꯅ ꯁꯤꯖꯤꯟꯅꯔꯤꯕ ꯗꯤꯚꯥꯏꯁ ꯑꯁꯤ ꯑꯣꯏꯔꯕꯗꯤ ꯑꯃꯨꯛ ꯁꯥꯏꯟ ꯏꯟ ꯇꯧꯒꯗꯕꯅꯤ꯫';

  @override
  String get deviceSignedOut => 'ꯗꯤꯚꯥꯏꯁ ꯁꯥꯏꯟ ꯑꯥꯎꯠ ꯇꯧꯔꯦ';

  @override
  String get signOutEverywhere => 'ꯃꯐꯝ ꯄꯨꯝꯅꯃꯛꯇꯒꯤ ꯁꯥꯏꯟ ꯑꯥꯎꯠ';

  @override
  String get signOutEverywhereTitle => 'ꯃꯐꯝ ꯄꯨꯝꯅꯃꯛꯇꯒꯤ ꯁꯥꯏꯟ ꯑꯥꯎꯠ ꯇꯧꯒꯗ꯭ꯔꯥ?';

  @override
  String get signOutEverywhereMessage =>
      'ꯗꯤꯚꯥꯏꯁ ꯑꯁꯤ ꯌꯥꯑꯣꯅ ꯗꯤꯚꯥꯏꯁ ꯈꯨꯗꯤꯡꯃꯛ ꯁꯥꯏꯟ ꯑꯥꯎꯠ ꯑꯣꯏꯒꯅꯤ꯫';

  @override
  String get unknownDevice => 'ꯃꯁꯛ ꯈꯉꯗꯕ ꯗꯤꯚꯥꯏꯁ';

  @override
  String get activeNow => 'ꯍꯧꯖꯤꯛ ꯁꯛꯇꯤꯅ ꯂꯩꯔꯤ';

  @override
  String minutesAgo(int count) {
    return '$count ꯃꯤꯅꯤꯠ ꯃꯃꯥꯡꯗ';
  }

  @override
  String hoursAgo(int count) {
    return '$count ꯄꯨꯡ ꯃꯃꯥꯡꯗ';
  }

  @override
  String daysAgo(int count) {
    return '$count ꯅꯨꯃꯤꯠ ꯃꯃꯥꯡꯗ';
  }

  @override
  String get filtersAndSorting => 'ꯐꯤꯜꯇꯔ ꯑꯃꯁꯨꯡ ꯑꯣꯏꯅ ꯊꯝꯕ';

  @override
  String get clearAll => 'ꯄꯨꯝꯅꯃꯛ ꯂꯧꯊꯣꯛꯎ';

  @override
  String get showResults => 'ꯐꯜ ꯎꯠꯂꯨ';

  @override
  String get closeLabel => 'ꯂꯣꯅꯁꯤꯜꯂꯨ';

  @override
  String get sortByTitle => 'ꯑꯣꯏꯅ ꯊꯝꯕ';

  @override
  String get sortRelevance => 'ꯃꯔꯤ ꯂꯩꯅꯕ';

  @override
  String get sortRating => 'ꯔꯦꯇꯤꯡ';

  @override
  String get sortDeliveryTime => 'ꯗꯦꯂꯤꯚꯔꯤ ꯃꯇꯝ';

  @override
  String get sortCostLowHigh => 'ꯃꯃꯜ: ꯍꯟꯊꯕꯗꯒꯤ ꯌꯥꯝꯕ';

  @override
  String get sortCostHighLow => 'ꯃꯃꯜ: ꯌꯥꯝꯕꯗꯒꯤ ꯍꯟꯊꯕ';

  @override
  String get timeSection => 'ꯃꯇꯝ';

  @override
  String get nearAndFast => 'ꯅꯛꯅ ꯑꯃꯁꯨꯡ ꯌꯥꯡꯅ';

  @override
  String get openNow => 'ꯍꯧꯖꯤꯛ ꯍꯥꯡꯗꯣꯛꯂꯤ';

  @override
  String get ratingSection => 'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ ꯔꯦꯇꯤꯡ';

  @override
  String ratedAbove(String rating) {
    return '$rating+ ꯔꯦꯇꯤꯡ';
  }

  @override
  String get offersSection => 'ꯑꯣꯐꯔ';

  @override
  String get hasOffersLabel => 'ꯑꯣꯐꯔ ꯂꯩꯕ';

  @override
  String get dishPriceSection => 'ꯆꯥꯅꯕꯒꯤ ꯃꯃꯜ';

  @override
  String costUnder(String amount) {
    return '$amount ꯗꯒꯤ ꯍꯟꯊꯕ';
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
  String get moreSection => 'ꯑꯍꯦꯟꯕ';

  @override
  String get noPackagingCharges => 'ꯄꯦꯛꯀꯤꯡ ꯆꯥꯔꯖ ꯂꯩꯇꯦ';

  @override
  String get allRestaurantsTitle => 'ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ ꯄꯨꯝꯅꯃꯛ';

  @override
  String get whatsOnYourMind => 'ꯀꯔꯤ ꯆꯥꯅꯤꯡꯏ?';

  @override
  String get listeningNow => 'ꯇꯥꯔꯤ…';

  @override
  String get speakNowHint => 'ꯆꯥꯅꯕ ꯅꯠꯔꯒ ꯔꯦꯁ꯭ꯇꯨꯔꯦꯟꯠ ꯍꯥꯌꯕꯤꯌꯨ';

  @override
  String get voiceUnavailable => 'ꯈꯣꯟꯗ ꯊꯤꯕ ꯐꯪꯗꯦ';

  @override
  String get voiceUnavailableBody => 'ꯑꯗꯣꯝꯅ ꯇꯥꯏꯞ ꯇꯧꯗꯨꯅꯥ ꯊꯤꯕ ꯌꯥꯏ꯫';

  @override
  String get microphoneDenied => 'ꯃꯥꯏꯀ꯭ꯔꯣꯐꯣꯟ ꯑꯌꯥꯕ ꯂꯩꯇꯦ';

  @override
  String get voiceSearchLabel => 'ꯈꯣꯟꯗ ꯊꯤꯌꯨ';

  @override
  String get ratingsAndReviews => 'রেটিং অমসুং রিভিয়ু';

  @override
  String get reviewsWithTextOnly => 'রিভিয়ু লৈবা';

  @override
  String get noReviewsTitle => 'হৌজিক ফাওবা রেটিং লৈতে';

  @override
  String get noReviewsSubtitle =>
      'অর্দর তৌরবা মতুংদা অহানবা রেটিং অদু নহাক্না পীয়ু।';

  @override
  String get rateOrderTitle => 'নহাক্কী অর্দর অসি রেট তৌবিয়ু';

  @override
  String get rateDishesTitle => 'চাক্লোনশিং রেট তৌবিয়ু';

  @override
  String get reviewHint => 'অতোপ্পা করিগুম্বা হায়নিংবা লৈব্রা? (য়াদবা)';

  @override
  String get submitRating => 'রেটিং থাবিয়ু';

  @override
  String get reviewThanks => 'থাগৎচরি — নহাক্কী রেটিং ফংলে।';

  @override
  String get rateThisOrder => 'অর্দর অসি রেট তৌবিয়ু';
}
