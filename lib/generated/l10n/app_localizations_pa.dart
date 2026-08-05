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
  String placeOrderFor(int amount) {
    return 'ਆਰਡਰ ਕਰੋ · ₹$amount';
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
}
