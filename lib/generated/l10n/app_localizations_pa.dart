// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ਇਹ ਖਾਨਾ ਜ਼ਰੂਰੀ ਹੈ';

  @override
  String get tagline => 'ਤੇਜ਼ ਡਿਲੀਵਰੀ। ਤਾਜ਼ੀ ਮੁਸਕਾਨ।';

  @override
  String get chooseLanguageTitle => 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get chooseLanguageSubtitle => 'ਉਹ ਭਾਸ਼ਾ ਚੁਣੋ ਜਿਸ ਵਿੱਚ ਤੁਸੀਂ ਸਹਿਜ ਹੋ। ਤੁਸੀਂ ਇਸਨੂੰ ਕਿਸੇ ਵੀ ਸਮੇਂ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹੋ।';

  @override
  String get searchLanguageHint => 'ਭਾਸ਼ਾ ਖੋਜੋ';

  @override
  String get noLanguageFound => 'ਕੋਈ ਭਾਸ਼ਾ ਨਹੀਂ ਮਿਲੀ';

  @override
  String languagesAvailable(int count) {
    return '$count ਭਾਸ਼ਾਵਾਂ ਉਪਲਬਧ ਹਨ';
  }

  @override
  String get continueLabel => 'ਅੱਗੇ ਵਧੋ';

  @override
  String get selectedLabel => 'ਚੁਣੀ ਗਈ';

  @override
  String get defaultLabel => 'ਡਿਫਾਲਟ';

  @override
  String get homeTitle => 'Nexmile ਵਿੱਚ ਤੁਹਾਡਾ ਸੁਆਗਤ ਹੈ';

  @override
  String get homeSubtitle => 'ਤਾਜ਼ਾ ਕਰਿਆਨਾ, ਗਰਮ ਖਾਣਾ ਅਤੇ ਰੋਜ਼ਾਨਾ ਲੋੜਾਂ ਤੁਹਾਡੇ ਨੇੜਲੀਆਂ ਦੁਕਾਨਾਂ ਤੋਂ।';

  @override
  String get changeLanguage => 'ਭਾਸ਼ਾ ਬਦਲੋ';

  @override
  String get languageUpdated => 'ਭਾਸ਼ਾ ਬਦਲ ਦਿੱਤੀ ਗਈ';

  @override
  String get appLanguageLabel => 'ਐਪ ਦੀ ਭਾਸ਼ਾ';

  @override
  String greetingNamed(String name) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ, $name';
  }

  @override
  String get loginTitle => 'Nexmile ਵਿੱਚ ਸਾਈਨ ਇਨ ਕਰੋ';

  @override
  String get loginSubtitle => 'ਆਪਣਾ ਈਮੇਲ ਜਾਂ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ, ਅਸੀਂ ਤਸਦੀਕ ਕੋਡ ਭੇਜਾਂਗੇ।';

  @override
  String get emailOrPhoneLabel => 'ਈਮੇਲ ਜਾਂ ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get emailOrPhoneHint => 'name@example.com ਜਾਂ 9876543210';

  @override
  String get invalidEmailOrPhone => 'ਸਹੀ ਈਮੇਲ ਪਤਾ ਜਾਂ 10 ਅੰਕਾਂ ਦਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get sendCode => 'ਕੋਡ ਭੇਜੋ';

  @override
  String get agreeToTermsOnContinue => 'ਅੱਗੇ ਵਧ ਕੇ ਤੁਸੀਂ ਸਾਡੀਆਂ ਸੇਵਾ ਸ਼ਰਤਾਂ ਅਤੇ ਪਰਦੇਦਾਰੀ ਨੀਤੀ ਨਾਲ ਸਹਿਮਤ ਹੁੰਦੇ ਹੋ।';

  @override
  String get otpTitle => 'ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਤੁਸੀਂ ਹੋ';

  @override
  String otpSubtitle(String target) {
    return '$target \'ਤੇ ਭੇਜਿਆ 6 ਅੰਕਾਂ ਦਾ ਕੋਡ ਦਰਜ ਕਰੋ';
  }

  @override
  String get verifyCode => 'ਤਸਦੀਕ ਕਰੋ';

  @override
  String get resendCode => 'ਕੋਡ ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ਸਕਿੰਟਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਭੇਜੋ';
  }

  @override
  String get codeResent => 'ਨਵਾਂ ਕੋਡ ਭੇਜ ਦਿੱਤਾ ਗਿਆ ਹੈ';

  @override
  String get incorrectCode => 'ਇਹ ਕੋਡ ਗਲਤ ਹੈ ਜਾਂ ਮਿਆਦ ਪੁੱਗ ਗਈ ਹੈ। ਨਵਾਂ ਕੋਡ ਮੰਗਵਾਓ।';

  @override
  String get enterFullCode => 'ਪੂਰੇ 6 ਅੰਕ ਦਰਜ ਕਰੋ';

  @override
  String get accountSuspended => 'ਇਹ ਖਾਤਾ ਮੁਅੱਤਲ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰੋ।';

  @override
  String get tooManyAttempts => 'ਬਹੁਤ ਵਾਰ ਕੋਸ਼ਿਸ਼ ਹੋ ਗਈ। ਕਿਰਪਾ ਕਰਕੇ ਥੋੜ੍ਹੀ ਦੇਰ ਬਾਅਦ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get sessionExpired => 'ਤੁਹਾਡਾ ਸੈਸ਼ਨ ਖਤਮ ਹੋ ਗਿਆ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਸਾਈਨ ਇਨ ਕਰੋ।';

  @override
  String get networkError => 'ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ ਹੈ। ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get developmentCode => 'ਡਿਵੈਲਪਮੈਂਟ ਕੋਡ';

  @override
  String get signOut => 'ਸਾਈਨ ਆਊਟ';

  @override
  String get signedOut => 'ਤੁਸੀਂ ਸਾਈਨ ਆਊਟ ਹੋ ਗਏ ਹੋ';

  @override
  String get somethingWentWrong => 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get profileTitle => 'ਪ੍ਰੋਫਾਈਲ';

  @override
  String get viewProfile => 'ਪ੍ਰੋਫਾਈਲ ਦੇਖੋ';

  @override
  String get nameLabel => 'ਨਾਮ';

  @override
  String get emailLabel => 'ਈਮੇਲ';

  @override
  String get mobileLabel => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get accountStatusLabel => 'ਖਾਤੇ ਦੀ ਸਥਿਤੀ';

  @override
  String get statusActive => 'ਸਰਗਰਮ';

  @override
  String get statusPending => 'ਬਕਾਇਆ';

  @override
  String get statusSuspended => 'ਮੁਅੱਤਲ';

  @override
  String get verifiedLabel => 'ਤਸਦੀਕਸ਼ੁਦਾ';

  @override
  String get notProvided => 'ਸ਼ਾਮਲ ਨਹੀਂ ਕੀਤਾ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get navHome => 'ਹੋਮ';

  @override
  String get navSearch => 'ਖੋਜੋ';

  @override
  String get navOrders => 'ਆਰਡਰ';

  @override
  String get cancelLabel => 'ਰੱਦ ਕਰੋ';

  @override
  String get deliverTo => 'ਡਿਲੀਵਰੀ ਪਤਾ';

  @override
  String get searchDishesHint => 'ਪਕਵਾਨ ਜਾਂ ਰੈਸਟੋਰੈਂਟ ਖੋਜੋ';

  @override
  String get searchTitle => 'ਖੋਜੋ';

  @override
  String get searchNoResultsTitle => 'ਕੁਝ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get searchNoResultsSubtitle => 'ਕੋਈ ਹੋਰ ਪਕਵਾਨ, ਪਕਵਾਨ-ਸ਼ੈਲੀ ਜਾਂ ਰੈਸਟੋਰੈਂਟ ਦਾ ਨਾਮ ਅਜ਼ਮਾਓ।';

  @override
  String get cravingTitle => 'ਅੱਜ ਕੀ ਖਾਣ ਦਾ ਮਨ ਹੈ?';

  @override
  String get offersTitle => 'ਤੁਹਾਡੇ ਲਈ ਆਫ਼ਰ';

  @override
  String get restaurantsNearby => 'ਤੁਹਾਡੇ ਨੇੜੇ ਦੇ ਰੈਸਟੋਰੈਂਟ';

  @override
  String restaurantsCount(int count) {
    return '$count ਰੈਸਟੋਰੈਂਟ';
  }

  @override
  String get noRestaurantsTitle => 'ਇੱਥੇ ਅਜੇ ਕੁਝ ਨਹੀਂ ਹੈ';

  @override
  String get noRestaurantsSubtitle => 'ਕੋਈ ਹੋਰ ਸ਼੍ਰੇਣੀ ਦੇਖੋ ਜਾਂ ਫਿਲਟਰ ਹਟਾਓ।';

  @override
  String minutesAway(int minutes) {
    return '$minutes ਮਿੰਟ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance ਕਿਮੀ';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ਰੇਟਿੰਗ';
  }

  @override
  String priceForTwo(int amount) {
    return 'ਦੋ ਲਈ ₹$amount';
  }

  @override
  String get freeDelivery => 'ਮੁਫ਼ਤ ਡਿਲੀਵਰੀ';

  @override
  String percentOff(int percent) {
    return '$percent% ਛੋਟ';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'ਤੁਹਾਡੇ ਆਰਡਰ \'ਤੇ $percent% ਛੋਟ';
  }

  @override
  String get vegOnly => 'ਸਿਰਫ਼ ਸ਼ਾਕਾਹਾਰੀ';

  @override
  String get bestseller => 'ਸਭ ਤੋਂ ਵੱਧ ਵਿਕਣ ਵਾਲਾ';

  @override
  String get addLabel => 'ਸ਼ਾਮਲ';

  @override
  String get noVegDishesTitle => 'ਇੱਥੇ ਸ਼ਾਕਾਹਾਰੀ ਪਕਵਾਨ ਨਹੀਂ ਹਨ';

  @override
  String get noVegDishesSubtitle => 'ਪੂਰਾ ਮੀਨੂ ਦੇਖਣ ਲਈ ਸ਼ਾਕਾਹਾਰੀ ਫਿਲਟਰ ਬੰਦ ਕਰੋ।';

  @override
  String get replaceCartTitle => 'ਨਵੀਂ ਕਾਰਟ ਸ਼ੁਰੂ ਕਰੀਏ?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'ਤੁਹਾਡੀ ਕਾਰਟ ਵਿੱਚ $restaurant ਤੋਂ ਚੀਜ਼ਾਂ ਹਨ। ਇਹ ਸ਼ਾਮਲ ਕਰਨ \'ਤੇ ਉਹ ਹਟ ਜਾਣਗੀਆਂ।';
  }

  @override
  String get replaceCartConfirm => 'ਹਟਾ ਕੇ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get cartTitle => 'ਤੁਹਾਡੀ ਕਾਰਟ';

  @override
  String get cartEmptyTitle => 'ਤੁਹਾਡੀ ਕਾਰਟ ਖਾਲੀ ਹੈ';

  @override
  String get cartEmptySubtitle => 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਕਿਸੇ ਰੈਸਟੋਰੈਂਟ ਤੋਂ ਪਕਵਾਨ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get browseRestaurants => 'ਰੈਸਟੋਰੈਂਟ ਦੇਖੋ';

  @override
  String itemsInCart(int count) {
    return '$count ਚੀਜ਼ਾਂ';
  }

  @override
  String get viewCart => 'ਕਾਰਟ ਦੇਖੋ';

  @override
  String get itemTotal => 'ਚੀਜ਼ਾਂ ਦਾ ਕੁੱਲ';

  @override
  String get deliveryFeeLabel => 'ਡਿਲੀਵਰੀ ਫ਼ੀਸ';

  @override
  String get taxesAndCharges => 'ਟੈਕਸ ਅਤੇ ਖਰਚੇ';

  @override
  String get freeLabel => 'ਮੁਫ਼ਤ';

  @override
  String get toPay => 'ਦੇਣ ਯੋਗ';

  @override
  String placeOrderFor(String amount) {
    return 'ਆਰਡਰ ਕਰੋ · $amount';
  }

  @override
  String get ordersTitle => 'ਤੁਹਾਡੇ ਆਰਡਰ';

  @override
  String get ordersEmptyTitle => 'ਅਜੇ ਕੋਈ ਆਰਡਰ ਨਹੀਂ';

  @override
  String get ordersEmptySubtitle => 'ਤੁਹਾਡੇ ਪਿਛਲੇ ਆਰਡਰ ਇੱਥੇ ਦਿਖਣਗੇ।';

  @override
  String get reorder => 'ਦੁਬਾਰਾ ਆਰਡਰ';

  @override
  String orderTitle(String id) {
    return 'ਆਰਡਰ $id';
  }

  @override
  String get orderPlacedTitle => 'ਆਰਡਰ ਹੋ ਗਿਆ';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'ਲਗਭਗ $minutes ਮਿੰਟਾਂ ਵਿੱਚ ਪਹੁੰਚੇਗਾ।';
  }

  @override
  String get orderDeliveredTitle => 'ਡਿਲੀਵਰ ਹੋ ਗਿਆ';

  @override
  String get orderDeliveredSubtitle => 'ਖਾਣੇ ਦਾ ਆਨੰਦ ਲਓ।';

  @override
  String get statusOrderPlaced => 'ਆਰਡਰ ਹੋ ਗਿਆ';

  @override
  String get statusPreparing => 'ਖਾਣਾ ਤਿਆਰ ਹੋ ਰਿਹਾ ਹੈ';

  @override
  String get statusOnTheWay => 'ਰਸਤੇ ਵਿੱਚ ਹੈ';

  @override
  String get statusDelivered => 'ਡਿਲੀਵਰ ਹੋ ਗਿਆ';

  @override
  String get keepBrowsing => 'ਦੇਖਦੇ ਰਹੋ';

  @override
  String get backToHome => 'ਹੋਮ \'ਤੇ ਵਾਪਸ';

  @override
  String get prototypeNotice => 'ਨਮੂਨਾ ਸਟੋਰਫ੍ਰੰਟ — ਅਸਲੀ ਦੁਕਾਨਾਂ ਕੈਟਾਲਾਗ API ਨਾਲ ਆਉਣਗੀਆਂ।';

  @override
  String get prototypeCheckoutNotice => 'ਇਹ ਇੱਕ ਪ੍ਰੋਟੋਟਾਈਪ ਹੈ। ਕੋਈ ਭੁਗਤਾਨ ਨਹੀਂ ਲਿਆ ਜਾਂਦਾ ਅਤੇ ਕੋਈ ਅਸਲੀ ਆਰਡਰ ਨਹੀਂ ਹੁੰਦਾ।';

  @override
  String get prototypeTrackingNotice => 'ਪ੍ਰੋਟੋਟਾਈਪ ਲਈ ਟ੍ਰੈਕਿੰਗ ਨਕਲੀ ਹੈ।';

  @override
  String get locationTitle => 'ਡਿਲੀਵਰੀ ਕਿੱਥੇ ਕਰਨੀ ਹੈ?';

  @override
  String get locationSubtitle => 'Nexmile ਸਿਰਫ਼ 1 ਕਿਮੀ ਦੇ ਅੰਦਰਲੀਆਂ ਦੁਕਾਨਾਂ ਤੋਂ ਡਿਲੀਵਰੀ ਕਰਦਾ ਹੈ, ਇਸ ਲਈ ਸਾਨੂੰ ਤੁਹਾਡੀ ਸਹੀ ਥਾਂ ਚਾਹੀਦੀ ਹੈ।';

  @override
  String get locationReasonRadiusTitle => '1 ਕਿਮੀ ਦੇ ਅੰਦਰ ਦੀਆਂ ਦੁਕਾਨਾਂ';

  @override
  String get locationReasonRadiusBody => 'ਅਸੀਂ ਸਿਰਫ਼ ਉਹੀ ਰਸੋਈਆਂ ਦਿਖਾਉਂਦੇ ਹਾਂ ਜਿੱਥੋਂ ਖਾਣਾ ਗਰਮ ਪਹੁੰਚੇ।';

  @override
  String get locationReasonAccuracyTitle => 'ਸਹੀ ਦਰਵਾਜ਼ੇ ਤੱਕ';

  @override
  String get locationReasonAccuracyBody => 'ਸਹੀ ਪਿੰਨ ਹੋਵੇ ਤਾਂ ਡਿਲੀਵਰੀ ਪਾਰਟਨਰ ਫ਼ੋਨ ਕੀਤੇ ਬਿਨਾਂ ਤੁਹਾਡੇ ਤੱਕ ਪਹੁੰਚ ਜਾਂਦਾ ਹੈ।';

  @override
  String get locationReasonPrivacyTitle => 'ਸਿਰਫ਼ ਐਪ ਵਰਤਦੇ ਸਮੇਂ';

  @override
  String get locationReasonPrivacyBody => 'ਅਸੀਂ ਪਿਛੋਕੜ ਵਿੱਚ ਤੁਹਾਨੂੰ ਟ੍ਰੈਕ ਨਹੀਂ ਕਰਦੇ, ਅਤੇ ਪਤਾ ਤੁਸੀਂ ਆਪ ਵੀ ਲਿਖ ਸਕਦੇ ਹੋ।';

  @override
  String get allowLocation => 'ਟਿਕਾਣੇ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get enterAddressManually => 'ਮੈਂ ਪਤਾ ਆਪ ਲਿਖਾਂਗਾ';

  @override
  String get locationDenied => 'ਟਿਕਾਣੇ ਦੀ ਇਜਾਜ਼ਤ ਨਹੀਂ ਮਿਲੀ। ਤੁਸੀਂ ਪਿੰਨ ਆਪ ਲਗਾ ਸਕਦੇ ਹੋ।';

  @override
  String get locationDeniedForever => 'Nexmile ਲਈ ਟਿਕਾਣਾ ਬੰਦ ਹੈ। ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰੋ ਜਾਂ ਪਿੰਨ ਆਪ ਲਗਾਓ।';

  @override
  String get locationServiceOff => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਟਿਕਾਣਾ ਬੰਦ ਹੈ।';

  @override
  String get locationUnavailable => 'ਟਿਕਾਣਾ ਨਹੀਂ ਮਿਲ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਪਿੰਨ ਆਪ ਲਗਾਓ।';

  @override
  String get openSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get pinLocationTitle => 'ਆਪਣਾ ਡਿਲੀਵਰੀ ਪਿੰਨ ਲਗਾਓ';

  @override
  String get deliveryRadiusHint => 'ਘੇਰਾ ਉਹ 1 ਕਿਮੀ ਦਿਖਾਉਂਦਾ ਹੈ ਜਿਸ ਵਿੱਚ Nexmile ਡਿਲੀਵਰੀ ਕਰਦਾ ਹੈ।';

  @override
  String get useMyLocation => 'ਮੇਰਾ ਟਿਕਾਣਾ ਵਰਤੋ';

  @override
  String get deliveringHere => 'ਇੱਥੇ ਡਿਲੀਵਰੀ';

  @override
  String get dragToAdjust => 'ਪਿੰਨ ਬਦਲਣ ਲਈ ਨਕਸ਼ਾ ਖਿੱਚੋ';

  @override
  String get confirmLocation => 'ਟਿਕਾਣਾ ਪੱਕਾ ਕਰੋ';

  @override
  String get addressDetailsTitle => 'ਪਤੇ ਦੇ ਵੇਰਵੇ';

  @override
  String get addressDetailsSubtitle => 'ਸਹੀ ਦਰਵਾਜ਼ੇ ਤੱਕ ਪਹੁੰਚਣ ਲਈ ਘਰ ਨੰਬਰ ਅਤੇ ਨਿਸ਼ਾਨੀ ਜੋੜੋ।';

  @override
  String get pinnedLocation => 'ਚੁਣਿਆ ਟਿਕਾਣਾ';

  @override
  String get changePin => 'ਬਦਲੋ';

  @override
  String get saveAddressAs => 'ਇਹ ਪਤਾ ਇੰਝ ਸੰਭਾਲੋ';

  @override
  String get labelHome => 'ਘਰ';

  @override
  String get labelWork => 'ਦਫ਼ਤਰ';

  @override
  String get labelOther => 'ਹੋਰ';

  @override
  String get addressLine1Label => 'ਘਰ, ਫਲੈਟ ਜਾਂ ਇਮਾਰਤ';

  @override
  String get addressLine1Hint => '12A, ਗ੍ਰੀਨ ਰੈਜ਼ੀਡੈਂਸੀ';

  @override
  String get addressLine2Label => 'ਗਲੀ ਜਾਂ ਇਲਾਕਾ';

  @override
  String get addressLine2Hint => 'ਦੂਜੀ ਐਵੇਨਿਊ, ਅੰਨਾ ਨਗਰ';

  @override
  String get landmarkLabel => 'ਨਿਸ਼ਾਨੀ';

  @override
  String get landmarkHint => 'ਬੱਸ ਸਟਾਪ ਦੇ ਸਾਹਮਣੇ';

  @override
  String get cityLabel => 'ਸ਼ਹਿਰ';

  @override
  String get stateLabel => 'ਰਾਜ';

  @override
  String get pincodeLabel => 'ਪਿੰਨ ਕੋਡ';

  @override
  String get invalidPincode => 'ਸਹੀ 6 ਅੰਕਾਂ ਦਾ ਪਿੰਨ ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get contactNameLabel => 'ਸੰਪਰਕ ਨਾਮ';

  @override
  String get contactPhoneLabel => 'ਸੰਪਰਕ ਨੰਬਰ';

  @override
  String get invalidMobileNumber => 'ਸਹੀ 10 ਅੰਕਾਂ ਦਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get makeDefaultAddress => 'ਡਿਫਾਲਟ ਤੌਰ \'ਤੇ ਇੱਥੇ ਹੀ ਡਿਲੀਵਰੀ';

  @override
  String get saveAddress => 'ਪਤਾ ਸੰਭਾਲੋ';

  @override
  String get addressSaved => 'ਪਤਾ ਸੰਭਾਲ ਲਿਆ';

  @override
  String get addressBookTitle => 'ਡਿਲੀਵਰੀ ਪਤੇ';

  @override
  String get manageAddresses => 'ਸੰਭਾਲੇ ਪਤੇ ਸੰਭਾਲੋ';

  @override
  String get noAddressesTitle => 'ਅਜੇ ਕੋਈ ਪਤਾ ਨਹੀਂ';

  @override
  String get noAddressesSubtitle => 'ਇੱਕ ਪਤਾ ਜੋੜੋ ਤਾਂ ਜੋ ਅਸੀਂ ਤੁਹਾਡੇ ਤੱਕ ਡਿਲੀਵਰੀ ਕਰਨ ਵਾਲੀਆਂ ਦੁਕਾਨਾਂ ਦਿਖਾ ਸਕੀਏ।';

  @override
  String get addAddress => 'ਪਤਾ ਜੋੜੋ';

  @override
  String get setAsDefault => 'ਡਿਫਾਲਟ ਬਣਾਓ';

  @override
  String get editLabel => 'ਸੋਧੋ';

  @override
  String get addressUpdated => 'ਪਤਾ ਅੱਪਡੇਟ ਹੋ ਗਿਆ';

  @override
  String get deleteLabel => 'ਮਿਟਾਓ';

  @override
  String get deleteAddressTitle => 'ਇਹ ਪਤਾ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get deleteAddressMessage => 'ਤੁਸੀਂ ਇਸਨੂੰ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ ਜੋੜ ਸਕਦੇ ਹੋ।';

  @override
  String get rescueDealsTitle => 'ਫੂਡ ਰੈਸਕਿਊ';

  @override
  String get notTakingOrders => 'ਆਰਡਰ ਨਹੀਂ ਲੈ ਰਹੇ';

  @override
  String get closedRightNow => 'ਹੁਣ ਬੰਦ ਹੈ';

  @override
  String minimumOrder(String amount) {
    return 'ਘੱਟੋ-ਘੱਟ $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ਬਾਕੀ';
  }

  @override
  String get soldOut => 'ਮੁੱਕ ਗਿਆ';

  @override
  String get menuEmptyTitle => 'ਹਾਲੇ ਕੋਈ ਪਕਵਾਨ ਨਹੀਂ';

  @override
  String get menuEmptySubtitle => 'ਇਸ ਰੈਸਟੋਰੈਂਟ ਨੇ ਆਪਣਾ ਮੀਨੂ ਨਹੀਂ ਜੋੜਿਆ।';

  @override
  String get moreDishesTitle => 'ਹੋਰ ਪਕਵਾਨ';

  @override
  String get customisable => 'ਪਸੰਦ ਮੁਤਾਬਕ';

  @override
  String get requiredLabel => 'ਲਾਜ਼ਮੀ';

  @override
  String get optionalLabel => 'ਚੋਣਵਾਂ';

  @override
  String get chooseOne => 'ਇੱਕ ਚੁਣੋ';

  @override
  String chooseUpTo(int count) {
    return 'ਵੱਧ ਤੋਂ ਵੱਧ $count ਚੁਣੋ';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ਘੱਟੋ-ਘੱਟ $count ਚੁਣੋ';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ਤੋਂ $max ਚੁਣੋ';
  }

  @override
  String get specialInstructions => 'ਖਾਸ ਹਦਾਇਤਾਂ';

  @override
  String get specialInstructionsHint => 'ਘੱਟ ਤਿੱਖਾ, ਪਿਆਜ਼ ਨਹੀਂ…';

  @override
  String addForAmount(String amount) {
    return 'ਜੋੜੋ · $amount';
  }

  @override
  String get deliveryLabel => 'ਡਿਲੀਵਰੀ';

  @override
  String get pickupLabel => 'ਆਪ ਲੈਣਾ';

  @override
  String get packagingLabel => 'ਪੈਕਿੰਗ';

  @override
  String get discountLabel => 'ਛੋਟ';

  @override
  String get billDetailsTitle => 'ਬਿੱਲ ਵੇਰਵਾ';

  @override
  String get clearCart => 'ਕਾਰਟ ਖਾਲੀ ਕਰੋ';

  @override
  String get clearCartTitle => 'ਇਹ ਕਾਰਟ ਖਾਲੀ ਕਰਨੀ ਹੈ?';

  @override
  String get clearCartMessage => 'ਇਸ ਵਿਚਲਾ ਸਭ ਕੁਝ ਹਟਾ ਦਿੱਤਾ ਜਾਵੇਗਾ।';

  @override
  String unavailableItemsNotice(String items) {
    return 'ਹੁਣ ਉਪਲਬਧ ਨਹੀਂ: $items';
  }

  @override
  String get removeUnavailable => 'ਇਹ ਹਟਾਓ';

  @override
  String minimumNotMet(String amount) {
    return 'ਘੱਟੋ-ਘੱਟ ਆਰਡਰ $amount ਹੈ';
  }

  @override
  String get checkoutTitle => 'ਚੈੱਕਆਊਟ';

  @override
  String get deliveryAddressLabel => 'ਡਿਲੀਵਰੀ ਪਤਾ';

  @override
  String get noAddressSelected => 'ਕੋਈ ਪਤਾ ਨਹੀਂ ਚੁਣਿਆ';

  @override
  String get paymentMethodLabel => 'ਭੁਗਤਾਨ';

  @override
  String get payOnDelivery => 'ਡਿਲੀਵਰੀ ਵੇਲੇ ਨਕਦ';

  @override
  String get noteToRestaurant => 'ਰੈਸਟੋਰੈਂਟ ਲਈ ਨੋਟ';

  @override
  String get noteToRestaurantHint => 'ਘੰਟੀ ਦੋ ਵਾਰ ਵਜਾਓ…';

  @override
  String get activeOrdersTitle => 'ਚੱਲ ਰਹੇ ਆਰਡਰ';

  @override
  String get pastOrdersTitle => 'ਪੁਰਾਣੇ ਆਰਡਰ';

  @override
  String get orderItemsTitle => 'ਪਕਵਾਨ';

  @override
  String get orderProgressTitle => 'ਪ੍ਰਗਤੀ';

  @override
  String get arrivingIn => 'ਪਹੁੰਚਣ ਵਿੱਚ';

  @override
  String get pickupCodeLabel => 'ਪਿਕਅੱਪ ਕੋਡ';

  @override
  String get cancellationReasonLabel => 'ਰੱਦ ਹੋਣ ਦਾ ਕਾਰਨ';

  @override
  String get riderLabel => 'ਡਿਲੀਵਰੀ ਪਾਰਟਨਰ';

  @override
  String get callRider => 'ਕਾਲ ਕਰੋ';

  @override
  String get viewInvoice => 'ਟੈਕਸ ਇਨਵੌਇਸ';

  @override
  String get cancelOrder => 'ਆਰਡਰ ਰੱਦ ਕਰੋ';

  @override
  String get cancelOrderTitle => 'ਇਹ ਆਰਡਰ ਰੱਦ ਕਰਨਾ ਹੈ?';

  @override
  String get cancelOrderMessage => 'ਰੈਸਟੋਰੈਂਟ ਵੱਲੋਂ ਸਵੀਕਾਰ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਹੀ ਰੱਦ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।';

  @override
  String get cancelReasonLabel => 'ਕਾਰਨ';

  @override
  String get cancelReasonFallback => 'ਗਾਹਕ ਨੇ ਰੱਦ ਕੀਤਾ';

  @override
  String get orderCancelled => 'ਆਰਡਰ ਰੱਦ ਹੋ ਗਿਆ';

  @override
  String get currentLocationLabel => 'ਮੌਜੂਦਾ ਟਿਕਾਣਾ';
}
