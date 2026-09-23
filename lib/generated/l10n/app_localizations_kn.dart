// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ಈ ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ';

  @override
  String get tagline => 'ವೇಗದ ಡೆಲಿವರಿ. ತಾಜಾ ನಗು.';

  @override
  String get chooseLanguageTitle => 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get chooseLanguageSubtitle =>
      'ನಿಮಗೆ ಅನುಕೂಲವಾದ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ. ಇದನ್ನು ಯಾವಾಗ ಬೇಕಾದರೂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಬದಲಾಯಿಸಬಹುದು.';

  @override
  String get searchLanguageHint => 'ಭಾಷೆಯನ್ನು ಹುಡುಕಿ';

  @override
  String get noLanguageFound => 'ಯಾವುದೇ ಭಾಷೆ ಸಿಗಲಿಲ್ಲ';

  @override
  String languagesAvailable(int count) {
    return '$count ಭಾಷೆಗಳು ಲಭ್ಯವಿದೆ';
  }

  @override
  String get continueLabel => 'ಮುಂದುವರಿಸಿ';

  @override
  String get selectedLabel => 'ಆಯ್ಕೆಯಾಗಿದೆ';

  @override
  String get defaultLabel => 'ಡೀಫಾಲ್ಟ್';

  @override
  String get homeTitle => 'Nexmile ಗೆ ಸ್ವಾಗತ';

  @override
  String get homeSubtitle =>
      'ತಾಜಾ ದಿನಸಿ, ಬಿಸಿ ಆಹಾರ ಮತ್ತು ದೈನಂದಿನ ಅಗತ್ಯ ವಸ್ತುಗಳು ನಿಮ್ಮ ಹತ್ತಿರದ ಅಂಗಡಿಗಳಿಂದ.';

  @override
  String get changeLanguage => 'ಭಾಷೆ ಬದಲಾಯಿಸಿ';

  @override
  String get languageUpdated => 'ಭಾಷೆ ಬದಲಾಗಿದೆ';

  @override
  String get appLanguageLabel => 'ಆ್ಯಪ್ ಭಾಷೆ';

  @override
  String greetingNamed(String name) {
    return 'ನಮಸ್ಕಾರ, $name';
  }

  @override
  String get loginTitle => 'Nexmile ಗೆ ಸೈನ್ ಇನ್ ಮಾಡಿ';

  @override
  String get loginSubtitle =>
      'ನಿಮ್ಮ ಇಮೇಲ್ ಅಥವಾ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ, ನಾವು ಪರಿಶೀಲನಾ ಕೋಡ್ ಕಳುಹಿಸುತ್ತೇವೆ.';

  @override
  String get emailOrPhoneLabel => 'ಇಮೇಲ್ ಅಥವಾ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get emailOrPhoneHint => 'name@example.com ಅಥವಾ 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'ಸರಿಯಾದ ಇಮೇಲ್ ವಿಳಾಸ ಅಥವಾ 10 ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get sendCode => 'ಕೋಡ್ ಕಳುಹಿಸಿ';

  @override
  String get agreeToTermsOnContinue =>
      'ಮುಂದುವರಿಯುವ ಮೂಲಕ ನೀವು ನಮ್ಮ ಸೇವಾ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಒಪ್ಪುತ್ತೀರಿ.';

  @override
  String get otpTitle => 'ಇದು ನೀವೇ ಎಂದು ಖಚಿತಪಡಿಸಿ';

  @override
  String otpSubtitle(String target) {
    return '$target ಗೆ ಕಳುಹಿಸಿದ 6 ಅಂಕಿಯ ಕೋಡ್ ನಮೂದಿಸಿ';
  }

  @override
  String get verifyCode => 'ಪರಿಶೀಲಿಸಿ';

  @override
  String get resendCode => 'ಕೋಡ್ ಮತ್ತೆ ಕಳುಹಿಸಿ';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಮತ್ತೆ ಕಳುಹಿಸಿ';
  }

  @override
  String get codeResent => 'ಹೊಸ ಕೋಡ್ ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get incorrectCode =>
      'ಈ ಕೋಡ್ ತಪ್ಪಾಗಿದೆ ಅಥವಾ ಅವಧಿ ಮುಗಿದಿದೆ. ಹೊಸದನ್ನು ಕೇಳಿ.';

  @override
  String get enterFullCode => 'ಪೂರ್ಣ 6 ಅಂಕಿಗಳನ್ನು ನಮೂದಿಸಿ';

  @override
  String get accountSuspended =>
      'ಈ ಖಾತೆಯನ್ನು ಅಮಾನತುಗೊಳಿಸಲಾಗಿದೆ. ದಯವಿಟ್ಟು ಬೆಂಬಲವನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get tooManyAttempts =>
      'ತುಂಬಾ ಪ್ರಯತ್ನಗಳಾಗಿವೆ. ದಯವಿಟ್ಟು ಸ್ವಲ್ಪ ಸಮಯದ ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get sessionExpired =>
      'ನಿಮ್ಮ ಸೆಷನ್ ಅವಧಿ ಮುಗಿದಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಿ.';

  @override
  String get networkError =>
      'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವಿಲ್ಲ. ನಿಮ್ಮ ಸಂಪರ್ಕ ಪರಿಶೀಲಿಸಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get developmentCode => 'ಡೆವಲಪ್‌ಮೆಂಟ್ ಕೋಡ್';

  @override
  String get signOut => 'ಸೈನ್ ಔಟ್';

  @override
  String get signedOut => 'ನೀವು ಸೈನ್ ಔಟ್ ಆಗಿದ್ದೀರಿ';

  @override
  String get somethingWentWrong => 'ಏನೋ ತಪ್ಪಾಗಿದೆ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get profileTitle => 'ಪ್ರೊಫೈಲ್';

  @override
  String get viewProfile => 'ಪ್ರೊಫೈಲ್ ನೋಡಿ';

  @override
  String get nameLabel => 'ಹೆಸರು';

  @override
  String get emailLabel => 'ಇಮೇಲ್';

  @override
  String get mobileLabel => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get accountStatusLabel => 'ಖಾತೆಯ ಸ್ಥಿತಿ';

  @override
  String get statusActive => 'ಸಕ್ರಿಯ';

  @override
  String get statusPending => 'ಬಾಕಿ ಇದೆ';

  @override
  String get statusSuspended => 'ಅಮಾನತು';

  @override
  String get verifiedLabel => 'ಪರಿಶೀಲಿಸಲಾಗಿದೆ';

  @override
  String get notProvided => 'ಸೇರಿಸಿಲ್ಲ';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get navHome => 'ಹೋಮ್';

  @override
  String get navSearch => 'ಹುಡುಕಿ';

  @override
  String get navOrders => 'ಆರ್ಡರ್‌ಗಳು';

  @override
  String get cancelLabel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get deliverTo => 'ಡೆಲಿವರಿ ವಿಳಾಸ';

  @override
  String get searchDishesHint => 'ಖಾದ್ಯ ಅಥವಾ ರೆಸ್ಟೋರೆಂಟ್ ಹುಡುಕಿ';

  @override
  String get searchTitle => 'ಹುಡುಕಿ';

  @override
  String get searchNoResultsTitle => 'ಏನೂ ಸಿಗಲಿಲ್ಲ';

  @override
  String get searchNoResultsSubtitle =>
      'ಬೇರೆ ಖಾದ್ಯ, ಪಾಕಶೈಲಿ ಅಥವಾ ರೆಸ್ಟೋರೆಂಟ್ ಹೆಸರು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get cravingTitle => 'ಏನು ತಿನ್ನಬೇಕು ಅನಿಸುತ್ತಿದೆ?';

  @override
  String get offersTitle => 'ನಿಮಗಾಗಿ ಆಫರ್‌ಗಳು';

  @override
  String get restaurantsNearby => 'ನಿಮ್ಮ ಹತ್ತಿರದ ರೆಸ್ಟೋರೆಂಟ್‌ಗಳು';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ರೆಸ್ಟೋರೆಂಟ್‌ಗಳು',
      one: '1 ರೆಸ್ಟೋರೆಂಟ್',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'ಇಲ್ಲಿ ಇನ್ನೂ ಏನೂ ಇಲ್ಲ';

  @override
  String get noRestaurantsSubtitle => 'ಬೇರೆ ವಿಭಾಗ ನೋಡಿ ಅಥವಾ ಫಿಲ್ಟರ್ ತೆಗೆಯಿರಿ.';

  @override
  String minutesAway(int minutes) {
    return '$minutes ನಿಮಿ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance ಕಿಮೀ';
  }

  @override
  String ratingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ರೇಟಿಂಗ್‌ಗಳು',
      one: '1 ರೇಟಿಂಗ್',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'ಇಬ್ಬರಿಗೆ ₹$amount';
  }

  @override
  String get freeDelivery => 'ಉಚಿತ ಡೆಲಿವರಿ';

  @override
  String percentOff(int percent) {
    return '$percent% ರಿಯಾಯಿತಿ';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'ನಿಮ್ಮ ಆರ್ಡರ್ ಮೇಲೆ $percent% ರಿಯಾಯಿತಿ';
  }

  @override
  String get vegOnly => 'ಸಸ್ಯಾಹಾರ ಮಾತ್ರ';

  @override
  String get bestseller => 'ಅತಿ ಹೆಚ್ಚು ಮಾರಾಟ';

  @override
  String get addLabel => 'ಸೇರಿಸಿ';

  @override
  String get noVegDishesTitle => 'ಇಲ್ಲಿ ಸಸ್ಯಾಹಾರಿ ಖಾದ್ಯಗಳಿಲ್ಲ';

  @override
  String get noVegDishesSubtitle =>
      'ಪೂರ್ಣ ಮೆನು ನೋಡಲು ಸಸ್ಯಾಹಾರಿ ಫಿಲ್ಟರ್ ಆಫ್ ಮಾಡಿ.';

  @override
  String get replaceCartTitle => 'ಹೊಸ ಕಾರ್ಟ್ ಶುರುಮಾಡಬೇಕೇ?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'ನಿಮ್ಮ ಕಾರ್ಟ್‌ನಲ್ಲಿ $restaurant ನಿಂದ ವಸ್ತುಗಳಿವೆ. ಇದನ್ನು ಸೇರಿಸಿದರೆ ಅವು ತೆಗೆದುಹೋಗುತ್ತವೆ.';
  }

  @override
  String get replaceCartConfirm => 'ತೆಗೆದು ಸೇರಿಸಿ';

  @override
  String get cartTitle => 'ನಿಮ್ಮ ಕಾರ್ಟ್';

  @override
  String get cartEmptyTitle => 'ನಿಮ್ಮ ಕಾರ್ಟ್ ಖಾಲಿಯಿದೆ';

  @override
  String get cartEmptySubtitle =>
      'ಶುರುಮಾಡಲು ಯಾವುದಾದರೂ ರೆಸ್ಟೋರೆಂಟ್‌ನಿಂದ ಖಾದ್ಯ ಸೇರಿಸಿ.';

  @override
  String get browseRestaurants => 'ರೆಸ್ಟೋರೆಂಟ್‌ಗಳನ್ನು ನೋಡಿ';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ವಸ್ತುಗಳು',
      one: '1 ವಸ್ತು',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'ಕಾರ್ಟ್ ನೋಡಿ';

  @override
  String get itemTotal => 'ವಸ್ತುಗಳ ಒಟ್ಟು';

  @override
  String get deliveryFeeLabel => 'ಡೆಲಿವರಿ ಶುಲ್ಕ';

  @override
  String get taxesAndCharges => 'ತೆರಿಗೆ ಮತ್ತು ಶುಲ್ಕಗಳು';

  @override
  String get freeLabel => 'ಉಚಿತ';

  @override
  String get toPay => 'ಪಾವತಿಸಬೇಕಾದದ್ದು';

  @override
  String placeOrderFor(String amount) {
    return 'ಆರ್ಡರ್ ಮಾಡಿ · $amount';
  }

  @override
  String get ordersTitle => 'ನಿಮ್ಮ ಆರ್ಡರ್‌ಗಳು';

  @override
  String get ordersEmptyTitle => 'ಇನ್ನೂ ಆರ್ಡರ್‌ಗಳಿಲ್ಲ';

  @override
  String get ordersEmptySubtitle =>
      'ನಿಮ್ಮ ಹಿಂದಿನ ಆರ್ಡರ್‌ಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String get reorder => 'ಮತ್ತೆ ಆರ್ಡರ್';

  @override
  String orderTitle(String id) {
    return 'ಆರ್ಡರ್ $id';
  }

  @override
  String get orderPlacedTitle => 'ಆರ್ಡರ್ ಆಗಿದೆ';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'ಸುಮಾರು $minutes ನಿಮಿಷಗಳಲ್ಲಿ ಬರುತ್ತದೆ.';
  }

  @override
  String get orderDeliveredTitle => 'ಡೆಲಿವರಿ ಆಗಿದೆ';

  @override
  String get orderDeliveredSubtitle => 'ಊಟವನ್ನು ಆನಂದಿಸಿ.';

  @override
  String get statusOrderPlaced => 'ಆರ್ಡರ್ ಆಗಿದೆ';

  @override
  String get statusPreparing => 'ಆಹಾರ ತಯಾರಾಗುತ್ತಿದೆ';

  @override
  String get statusOnTheWay => 'ದಾರಿಯಲ್ಲಿದೆ';

  @override
  String get statusDelivered => 'ಡೆಲಿವರಿ ಆಗಿದೆ';

  @override
  String get keepBrowsing => 'ನೋಡುತ್ತಿರಿ';

  @override
  String get backToHome => 'ಹೋಮ್‌ಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get prototypeNotice =>
      'ಮಾದರಿ ಸ್ಟೋರ್‌ಫ್ರಂಟ್ — ನಿಜವಾದ ಅಂಗಡಿಗಳು ಕ್ಯಾಟಲಾಗ್ API ಜೊತೆ ಬರುತ್ತವೆ.';

  @override
  String get prototypeCheckoutNotice =>
      'ಇದು ಪ್ರೊಟೊಟೈಪ್. ಯಾವುದೇ ಪಾವತಿ ಪಡೆಯುವುದಿಲ್ಲ ಮತ್ತು ನಿಜವಾದ ಆರ್ಡರ್ ಆಗುವುದಿಲ್ಲ.';

  @override
  String get prototypeTrackingNotice =>
      'ಪ್ರೊಟೊಟೈಪ್‌ಗಾಗಿ ಟ್ರ್ಯಾಕಿಂಗ್ ಕೃತಕವಾಗಿದೆ.';

  @override
  String get locationTitle => 'ಎಲ್ಲಿಗೆ ಡೆಲಿವರಿ ಮಾಡಬೇಕು?';

  @override
  String get locationSubtitle =>
      'Nexmile 1 ಕಿಮೀ ಒಳಗಿನ ಅಂಗಡಿಗಳಿಂದ ಮಾತ್ರ ಡೆಲಿವರಿ ಮಾಡುತ್ತದೆ, ಹಾಗಾಗಿ ನಿಮ್ಮ ನಿಖರ ಸ್ಥಳ ಬೇಕು.';

  @override
  String get locationReasonRadiusTitle => '1 ಕಿಮೀ ಒಳಗಿನ ಅಂಗಡಿಗಳು';

  @override
  String get locationReasonRadiusBody =>
      'ಬಿಸಿಯಾಗಿ ತಲುಪಬಲ್ಲ ಅಡುಗೆಮನೆಗಳನ್ನು ಮಾತ್ರ ತೋರಿಸುತ್ತೇವೆ.';

  @override
  String get locationReasonAccuracyTitle => 'ಸರಿಯಾದ ಬಾಗಿಲಿಗೆ';

  @override
  String get locationReasonAccuracyBody =>
      'ನಿಖರ ಪಿನ್ ಇದ್ದರೆ ಡೆಲಿವರಿ ಪಾಲುದಾರರು ಕರೆ ಮಾಡದೆ ನಿಮ್ಮನ್ನು ತಲುಪುತ್ತಾರೆ.';

  @override
  String get locationReasonPrivacyTitle => 'ಆ್ಯಪ್ ಬಳಸುವಾಗ ಮಾತ್ರ';

  @override
  String get locationReasonPrivacyBody =>
      'ಹಿನ್ನೆಲೆಯಲ್ಲಿ ನಿಮ್ಮನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡುವುದಿಲ್ಲ, ವಿಳಾಸವನ್ನು ನೀವೇ ಟೈಪ್ ಮಾಡಬಹುದು.';

  @override
  String get allowLocation => 'ಸ್ಥಳಕ್ಕೆ ಅನುಮತಿ ನೀಡಿ';

  @override
  String get enterAddressManually => 'ನಾನೇ ವಿಳಾಸ ಬರೆಯುತ್ತೇನೆ';

  @override
  String get locationDenied =>
      'ಸ್ಥಳದ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ. ನೀವೇ ಪಿನ್ ಇಡಬಹುದು.';

  @override
  String get locationDeniedForever =>
      'Nexmile ಗೆ ಸ್ಥಳ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ. ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಆನ್ ಮಾಡಿ ಅಥವಾ ಪಿನ್ ನೀವೇ ಇಡಿ.';

  @override
  String get locationServiceOff => 'ಈ ಸಾಧನದಲ್ಲಿ ಸ್ಥಳ ಆಫ್ ಆಗಿದೆ.';

  @override
  String get locationUnavailable => 'ಸ್ಥಳ ಸಿಗಲಿಲ್ಲ. ದಯವಿಟ್ಟು ಪಿನ್ ನೀವೇ ಇಡಿ.';

  @override
  String get openSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get pinLocationTitle => 'ನಿಮ್ಮ ಡೆಲಿವರಿ ಪಿನ್ ಇಡಿ';

  @override
  String get deliveryRadiusHint =>
      'Nexmile ಡೆಲಿವರಿ ಮಾಡುವ 1 ಕಿಮೀ ವ್ಯಾಪ್ತಿಯನ್ನು ವೃತ್ತ ತೋರಿಸುತ್ತದೆ.';

  @override
  String get useMyLocation => 'ನನ್ನ ಸ್ಥಳ ಬಳಸಿ';

  @override
  String get deliveringHere => 'ಇಲ್ಲಿಗೆ ಡೆಲಿವರಿ';

  @override
  String get dragToAdjust => 'ಪಿನ್ ಸರಿಪಡಿಸಲು ನಕ್ಷೆಯನ್ನು ಎಳೆಯಿರಿ';

  @override
  String get confirmLocation => 'ಸ್ಥಳ ಖಚಿತಪಡಿಸಿ';

  @override
  String get addressDetailsTitle => 'ವಿಳಾಸದ ವಿವರಗಳು';

  @override
  String get addressDetailsSubtitle =>
      'ಸರಿಯಾದ ಬಾಗಿಲು ತಲುಪಲು ಮನೆ ಸಂಖ್ಯೆ ಮತ್ತು ಗುರುತು ಸೇರಿಸಿ.';

  @override
  String get pinnedLocation => 'ಗುರುತಿಸಿದ ಸ್ಥಳ';

  @override
  String get changePin => 'ಬದಲಾಯಿಸಿ';

  @override
  String get saveAddressAs => 'ಈ ವಿಳಾಸವನ್ನು ಹೀಗೆ ಉಳಿಸಿ';

  @override
  String get labelHome => 'ಮನೆ';

  @override
  String get labelWork => 'ಕಚೇರಿ';

  @override
  String get labelOther => 'ಇತರೆ';

  @override
  String get addressLine1Label => 'ಮನೆ, ಫ್ಲ್ಯಾಟ್ ಅಥವಾ ಕಟ್ಟಡ';

  @override
  String get addressLine1Hint => '12A, ಗ್ರೀನ್ ರೆಸಿಡೆನ್ಸಿ';

  @override
  String get addressLine2Label => 'ರಸ್ತೆ ಅಥವಾ ಪ್ರದೇಶ';

  @override
  String get addressLine2Hint => '2ನೇ ಅವೆನ್ಯೂ, ಅಣ್ಣಾ ನಗರ';

  @override
  String get landmarkLabel => 'ಗುರುತು';

  @override
  String get landmarkHint => 'ಬಸ್ ನಿಲ್ದಾಣದ ಎದುರು';

  @override
  String get cityLabel => 'ನಗರ';

  @override
  String get stateLabel => 'ರಾಜ್ಯ';

  @override
  String get pincodeLabel => 'ಪಿನ್ ಕೋಡ್';

  @override
  String get invalidPincode => 'ಸರಿಯಾದ 6 ಅಂಕಿಯ ಪಿನ್ ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get contactNameLabel => 'ಸಂಪರ್ಕ ಹೆಸರು';

  @override
  String get contactPhoneLabel => 'ಸಂಪರ್ಕ ಸಂಖ್ಯೆ';

  @override
  String get invalidMobileNumber => 'ಸರಿಯಾದ 10 ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get makeDefaultAddress => 'ಡೀಫಾಲ್ಟ್ ಆಗಿ ಇಲ್ಲಿಗೇ ಡೆಲಿವರಿ';

  @override
  String get saveAddress => 'ವಿಳಾಸ ಉಳಿಸಿ';

  @override
  String get addressSaved => 'ವಿಳಾಸ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get addressBookTitle => 'ಡೆಲಿವರಿ ವಿಳಾಸಗಳು';

  @override
  String get manageAddresses => 'ಉಳಿಸಿದ ವಿಳಾಸಗಳನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get noAddressesTitle => 'ಇನ್ನೂ ವಿಳಾಸಗಳಿಲ್ಲ';

  @override
  String get noAddressesSubtitle =>
      'ನಿಮಗೆ ಡೆಲಿವರಿ ಮಾಡುವ ಅಂಗಡಿಗಳನ್ನು ತೋರಿಸಲು ಒಂದು ವಿಳಾಸ ಸೇರಿಸಿ.';

  @override
  String get addAddress => 'ವಿಳಾಸ ಸೇರಿಸಿ';

  @override
  String get setAsDefault => 'ಡೀಫಾಲ್ಟ್ ಮಾಡಿ';

  @override
  String get editLabel => 'ಸಂಪಾದಿಸಿ';

  @override
  String get addressUpdated => 'ವಿಳಾಸ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get deleteLabel => 'ಅಳಿಸಿ';

  @override
  String get deleteAddressTitle => 'ಈ ವಿಳಾಸ ಅಳಿಸಬೇಕೇ?';

  @override
  String get deleteAddressMessage => 'ನೀವು ನಂತರ ಮತ್ತೆ ಸೇರಿಸಬಹುದು.';

  @override
  String get rescueDealsTitle => 'ಫುಡ್ ರೆಸ್ಕ್ಯೂ';

  @override
  String get notTakingOrders => 'ಆರ್ಡರ್ ಸ್ವೀಕರಿಸುತ್ತಿಲ್ಲ';

  @override
  String get closedRightNow => 'ಈಗ ಮುಚ್ಚಿದೆ';

  @override
  String minimumOrder(String amount) {
    return 'ಕನಿಷ್ಠ $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ಉಳಿದಿವೆ';
  }

  @override
  String get soldOut => 'ಮುಗಿದಿದೆ';

  @override
  String get menuEmptyTitle => 'ಇನ್ನೂ ಖಾದ್ಯಗಳಿಲ್ಲ';

  @override
  String get menuEmptySubtitle => 'ಈ ರೆಸ್ಟೋರೆಂಟ್ ತನ್ನ ಮೆನು ಸೇರಿಸಿಲ್ಲ.';

  @override
  String get moreDishesTitle => 'ಇನ್ನಷ್ಟು ಖಾದ್ಯಗಳು';

  @override
  String get customisable => 'ಇಷ್ಟದಂತೆ';

  @override
  String get requiredLabel => 'ಕಡ್ಡಾಯ';

  @override
  String get optionalLabel => 'ಐಚ್ಛಿಕ';

  @override
  String get chooseOne => 'ಒಂದನ್ನು ಆಯ್ಕೆ ಮಾಡಿ';

  @override
  String chooseUpTo(int count) {
    return 'ಗರಿಷ್ಠ $count ಆಯ್ಕೆ ಮಾಡಿ';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ಕನಿಷ್ಠ $count ಆಯ್ಕೆ ಮಾಡಿ';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ರಿಂದ $max ಆಯ್ಕೆ ಮಾಡಿ';
  }

  @override
  String get specialInstructions => 'ವಿಶೇಷ ಸೂಚನೆಗಳು';

  @override
  String get specialInstructionsHint => 'ಕಡಿಮೆ ಖಾರ, ಈರುಳ್ಳಿ ಬೇಡ…';

  @override
  String addForAmount(String amount) {
    return 'ಸೇರಿಸಿ · $amount';
  }

  @override
  String get deliveryLabel => 'ಡೆಲಿವರಿ';

  @override
  String get pickupLabel => 'ಸ್ವತಃ ತೆಗೆದುಕೊಳ್ಳುವುದು';

  @override
  String get packagingLabel => 'ಪ್ಯಾಕಿಂಗ್';

  @override
  String get discountLabel => 'ರಿಯಾಯಿತಿ';

  @override
  String get billDetailsTitle => 'ಬಿಲ್ ವಿವರ';

  @override
  String get clearCart => 'ಕಾರ್ಟ್ ಖಾಲಿ ಮಾಡಿ';

  @override
  String get clearCartTitle => 'ಈ ಕಾರ್ಟ್ ಖಾಲಿ ಮಾಡಬೇಕೆ?';

  @override
  String get clearCartMessage => 'ಅದರಲ್ಲಿರುವ ಎಲ್ಲವನ್ನೂ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';

  @override
  String unavailableItemsNotice(String items) {
    return 'ಈಗ ಲಭ್ಯವಿಲ್ಲ: $items';
  }

  @override
  String get removeUnavailable => 'ಅವುಗಳನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String minimumNotMet(String amount) {
    return 'ಕನಿಷ್ಠ ಆರ್ಡರ್ $amount';
  }

  @override
  String get checkoutTitle => 'ಚೆಕ್‌ಔಟ್';

  @override
  String get deliveryAddressLabel => 'ಡೆಲಿವರಿ ವಿಳಾಸ';

  @override
  String get noAddressSelected => 'ವಿಳಾಸ ಆಯ್ಕೆಯಾಗಿಲ್ಲ';

  @override
  String get paymentMethodLabel => 'ಪಾವತಿ';

  @override
  String get payOnDelivery => 'ಡೆಲಿವರಿ ಸಮಯದಲ್ಲಿ ನಗದು';

  @override
  String get noteToRestaurant => 'ರೆಸ್ಟೋರೆಂಟ್‌ಗೆ ಟಿಪ್ಪಣಿ';

  @override
  String get noteToRestaurantHint => 'ಬೆಲ್ ಎರಡು ಬಾರಿ ಬಾರಿಸಿ…';

  @override
  String get activeOrdersTitle => 'ನಡೆಯುತ್ತಿರುವ ಆರ್ಡರ್';

  @override
  String get pastOrdersTitle => 'ಹಿಂದಿನ ಆರ್ಡರ್';

  @override
  String get orderItemsTitle => 'ಖಾದ್ಯಗಳು';

  @override
  String get orderProgressTitle => 'ಪ್ರಗತಿ';

  @override
  String get arrivingIn => 'ತಲುಪಲು';

  @override
  String get pickupCodeLabel => 'ಪಿಕಪ್ ಕೋಡ್';

  @override
  String get cancellationReasonLabel => 'ರದ್ದಾದ ಕಾರಣ';

  @override
  String get riderLabel => 'ಡೆಲಿವರಿ ಪಾರ್ಟನರ್';

  @override
  String get callRider => 'ಕರೆ ಮಾಡಿ';

  @override
  String get trackRider => 'ರೈಡರ್ ಟ್ರ್ಯಾಕ್ ಮಾಡಿ';

  @override
  String get riderLocationSoon =>
      'ನಿಮ್ಮ ಆರ್ಡರ್ ಪಡೆದ ನಂತರ ರೈಡರ್ ಸ್ಥಳ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ.';

  @override
  String get recentreOnRider => 'ರೈಡರ್ ಮೇಲೆ ಕೇಂದ್ರೀಕರಿಸಿ';

  @override
  String get viewInvoice => 'ತೆರಿಗೆ ಇನ್‌ವಾಯ್ಸ್';

  @override
  String get cancelOrder => 'ಆರ್ಡರ್ ರದ್ದುಗೊಳಿಸಿ';

  @override
  String get cancelOrderTitle => 'ಈ ಆರ್ಡರ್ ರದ್ದುಗೊಳಿಸಬೇಕೆ?';

  @override
  String get cancelOrderMessage =>
      'ರೆಸ್ಟೋರೆಂಟ್ ಸ್ವೀಕರಿಸುವ ಮೊದಲು ಮಾತ್ರ ರದ್ದುಗೊಳಿಸಬಹುದು.';

  @override
  String get cancelReasonLabel => 'ಕಾರಣ';

  @override
  String get cancelReasonFallback => 'ಗ್ರಾಹಕರು ರದ್ದುಗೊಳಿಸಿದ್ದಾರೆ';

  @override
  String get orderCancelled => 'ಆರ್ಡರ್ ರದ್ದಾಗಿದೆ';

  @override
  String get currentLocationLabel => 'ಪ್ರಸ್ತುತ ಸ್ಥಳ';

  @override
  String get editProfileTitle => 'ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ';

  @override
  String get editProfileSubtitle =>
      'ರೆಸ್ಟೋರೆಂಟ್ ಮತ್ತು ಡೆಲಿವರಿ ಪಾರ್ಟನರ್‌ಗೆ ನಿಮ್ಮ ಹೆಸರೇ ಕಾಣಿಸುತ್ತದೆ.';

  @override
  String get saveChanges => 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get profileUpdated => 'ಪ್ರೊಫೈಲ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get deleteAccount => 'ಖಾತೆ ಅಳಿಸಿ';

  @override
  String get deleteAccountTitle => 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಅಳಿಸಬೇಕೆ?';

  @override
  String get deleteAccountMessage =>
      'ಎಲ್ಲಾ ಸಾಧನಗಳಿಂದ ಸೈನ್ ಔಟ್ ಆಗುತ್ತೀರಿ. ಹಳೆಯ ಆರ್ಡರ್ ಮತ್ತು ಬಿಲ್‌ಗಳನ್ನು ತೆರಿಗೆ ದಾಖಲೆಗಾಗಿ ಇಡಲಾಗುತ್ತದೆ.';

  @override
  String get accountDeleted => 'ನಿಮ್ಮ ಖಾತೆಯನ್ನು ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get devicesTitle => 'ಸೈನ್-ಇನ್ ಸಾಧನಗಳು';

  @override
  String get devicesSubtitle => 'ನೀವು ಎಲ್ಲಿ ಸೈನ್ ಇನ್ ಆಗಿದ್ದೀರಿ';

  @override
  String get devicesEmptyTitle => 'ಬೇರೆ ಸಾಧನಗಳಿಲ್ಲ';

  @override
  String get devicesEmptySubtitle =>
      'ನೀವು ಈ ಸಾಧನದಲ್ಲಿ ಮಾತ್ರ ಸೈನ್ ಇನ್ ಆಗಿದ್ದೀರಿ.';

  @override
  String get signOutDevice => 'ಸೈನ್ ಔಟ್';

  @override
  String get signOutDeviceTitle => 'ಈ ಸಾಧನವನ್ನು ಸೈನ್ ಔಟ್ ಮಾಡಬೇಕೆ?';

  @override
  String get signOutDeviceMessage =>
      'ನೀವು ಬಳಸುತ್ತಿರುವುದು ಇದೇ ಆದರೆ ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get deviceSignedOut => 'ಸಾಧನ ಸೈನ್ ಔಟ್ ಆಗಿದೆ';

  @override
  String get signOutEverywhere => 'ಎಲ್ಲೆಡೆ ಸೈನ್ ಔಟ್';

  @override
  String get signOutEverywhereTitle => 'ಎಲ್ಲೆಡೆ ಸೈನ್ ಔಟ್ ಮಾಡಬೇಕೆ?';

  @override
  String get signOutEverywhereMessage =>
      'ಈ ಸಾಧನ ಸೇರಿದಂತೆ ಎಲ್ಲಾ ಸಾಧನಗಳು ಸೈನ್ ಔಟ್ ಆಗುತ್ತವೆ.';

  @override
  String get unknownDevice => 'ಅಜ್ಞಾತ ಸಾಧನ';

  @override
  String get activeNow => 'ಈಗ ಸಕ್ರಿಯ';

  @override
  String minutesAgo(int count) {
    return '$count ನಿಮಿಷಗಳ ಹಿಂದೆ';
  }

  @override
  String hoursAgo(int count) {
    return '$count ಗಂಟೆಗಳ ಹಿಂದೆ';
  }

  @override
  String daysAgo(int count) {
    return '$count ದಿನಗಳ ಹಿಂದೆ';
  }

  @override
  String get filtersAndSorting => 'ಫಿಲ್ಟರ್ ಮತ್ತು ಕ್ರಮ';

  @override
  String get clearAll => 'ಎಲ್ಲವನ್ನೂ ತೆಗೆ';

  @override
  String get showResults => 'ಫಲಿತಾಂಶ ತೋರಿಸು';

  @override
  String get closeLabel => 'ಮುಚ್ಚು';

  @override
  String get sortByTitle => 'ಕ್ರಮ';

  @override
  String get sortRelevance => 'ಪ್ರಸ್ತುತತೆ';

  @override
  String get sortRating => 'ರೇಟಿಂಗ್';

  @override
  String get sortDeliveryTime => 'ಡೆಲಿವರಿ ಸಮಯ';

  @override
  String get sortCostLowHigh => 'ಬೆಲೆ: ಕಡಿಮೆಯಿಂದ ಹೆಚ್ಚು';

  @override
  String get sortCostHighLow => 'ಬೆಲೆ: ಹೆಚ್ಚಿನಿಂದ ಕಡಿಮೆ';

  @override
  String get timeSection => 'ಸಮಯ';

  @override
  String get nearAndFast => 'ಹತ್ತಿರ ಮತ್ತು ವೇಗ';

  @override
  String get openNow => 'ಈಗ ತೆರೆದಿದೆ';

  @override
  String get ratingSection => 'ರೆಸ್ಟೋರೆಂಟ್ ರೇಟಿಂಗ್';

  @override
  String ratedAbove(String rating) {
    return '$rating+ ರೇಟಿಂಗ್';
  }

  @override
  String get offersSection => 'ಆಫರ್';

  @override
  String get hasOffersLabel => 'ಆಫರ್ ಇರುವವು';

  @override
  String get dishPriceSection => 'ಖಾದ್ಯದ ಬೆಲೆ';

  @override
  String costUnder(String amount) {
    return '$amount ಕ್ಕಿಂತ ಕಡಿಮೆ';
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
  String get moreSection => 'ಇನ್ನಷ್ಟು';

  @override
  String get noPackagingCharges => 'ಪ್ಯಾಕಿಂಗ್ ಶುಲ್ಕವಿಲ್ಲ';

  @override
  String get allRestaurantsTitle => 'ಎಲ್ಲಾ ರೆಸ್ಟೋರೆಂಟ್‌ಗಳು';

  @override
  String get whatsOnYourMind => 'ಏನು ತಿನ್ನಬೇಕು?';

  @override
  String get listeningNow => 'ಕೇಳುತ್ತಿದ್ದೇವೆ…';

  @override
  String get speakNowHint => 'ಖಾದ್ಯ ಅಥವಾ ರೆಸ್ಟೋರೆಂಟ್ ಹೇಳಿ';

  @override
  String get voiceUnavailable => 'ಧ್ವನಿ ಹುಡುಕಾಟ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get voiceUnavailableBody => 'ನೀವು ಟೈಪ್ ಮಾಡಿಯೂ ಹುಡುಕಬಹುದು.';

  @override
  String get microphoneDenied => 'ಮೈಕ್ರೋಫೋನ್ ಅನುಮತಿ ಇಲ್ಲ';

  @override
  String get voiceSearchLabel => 'ಧ್ವನಿಯಿಂದ ಹುಡುಕಿ';

  @override
  String get ratingsAndReviews => 'ರೇಟಿಂಗ್‌ಗಳು ಮತ್ತು ವಿಮರ್ಶೆಗಳು';

  @override
  String get reviewsWithTextOnly => 'ವಿಮರ್ಶೆ ಇರುವವು';

  @override
  String get noReviewsTitle => 'ಇನ್ನೂ ರೇಟಿಂಗ್ ಇಲ್ಲ';

  @override
  String get noReviewsSubtitle => 'ಆರ್ಡರ್ ನಂತರ ಮೊದಲ ರೇಟಿಂಗ್ ನೀವೇ ನೀಡಿ.';

  @override
  String get rateOrderTitle => 'ನಿಮ್ಮ ಆರ್ಡರ್‌ಗೆ ರೇಟಿಂಗ್ ನೀಡಿ';

  @override
  String get rateDishesTitle => 'ಖಾದ್ಯಗಳಿಗೆ ರೇಟಿಂಗ್ ನೀಡಿ';

  @override
  String get reviewHint => 'ಇನ್ನೇನಾದರೂ ಹೇಳಬೇಕೆ? (ಐಚ್ಛಿಕ)';

  @override
  String get submitRating => 'ರೇಟಿಂಗ್ ಕಳುಹಿಸಿ';

  @override
  String get reviewThanks => 'ಧನ್ಯವಾದ — ನಿಮ್ಮ ರೇಟಿಂಗ್ ಸೇರಿದೆ.';

  @override
  String get rateThisOrder => 'ಈ ಆರ್ಡರ್‌ಗೆ ರೇಟಿಂಗ್ ನೀಡಿ';
}
