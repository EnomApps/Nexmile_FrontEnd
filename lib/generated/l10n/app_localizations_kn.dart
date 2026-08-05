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
  String get tagline => 'ವೇಗದ ಡೆಲಿವರಿ. ತಾಜಾ ನಗು.';

  @override
  String get chooseLanguageTitle => 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get chooseLanguageSubtitle => 'ನಿಮಗೆ ಅನುಕೂಲವಾದ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ. ಇದನ್ನು ಯಾವಾಗ ಬೇಕಾದರೂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಬದಲಾಯಿಸಬಹುದು.';

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
  String get homeSubtitle => 'ತಾಜಾ ದಿನಸಿ, ಬಿಸಿ ಆಹಾರ ಮತ್ತು ದೈನಂದಿನ ಅಗತ್ಯ ವಸ್ತುಗಳು ನಿಮ್ಮ ಹತ್ತಿರದ ಅಂಗಡಿಗಳಿಂದ.';

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
  String get loginSubtitle => 'ನಿಮ್ಮ ಇಮೇಲ್ ಅಥವಾ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ, ನಾವು ಪರಿಶೀಲನಾ ಕೋಡ್ ಕಳುಹಿಸುತ್ತೇವೆ.';

  @override
  String get emailOrPhoneLabel => 'ಇಮೇಲ್ ಅಥವಾ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get emailOrPhoneHint => 'name@example.com ಅಥವಾ 9876543210';

  @override
  String get invalidEmailOrPhone => 'ಸರಿಯಾದ ಇಮೇಲ್ ವಿಳಾಸ ಅಥವಾ 10 ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get sendCode => 'ಕೋಡ್ ಕಳುಹಿಸಿ';

  @override
  String get agreeToTermsOnContinue => 'ಮುಂದುವರಿಯುವ ಮೂಲಕ ನೀವು ನಮ್ಮ ಸೇವಾ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಒಪ್ಪುತ್ತೀರಿ.';

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
  String get incorrectCode => 'ಈ ಕೋಡ್ ತಪ್ಪಾಗಿದೆ ಅಥವಾ ಅವಧಿ ಮುಗಿದಿದೆ. ಹೊಸದನ್ನು ಕೇಳಿ.';

  @override
  String get enterFullCode => 'ಪೂರ್ಣ 6 ಅಂಕಿಗಳನ್ನು ನಮೂದಿಸಿ';

  @override
  String get accountSuspended => 'ಈ ಖಾತೆಯನ್ನು ಅಮಾನತುಗೊಳಿಸಲಾಗಿದೆ. ದಯವಿಟ್ಟು ಬೆಂಬಲವನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get tooManyAttempts => 'ತುಂಬಾ ಪ್ರಯತ್ನಗಳಾಗಿವೆ. ದಯವಿಟ್ಟು ಸ್ವಲ್ಪ ಸಮಯದ ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get sessionExpired => 'ನಿಮ್ಮ ಸೆಷನ್ ಅವಧಿ ಮುಗಿದಿದೆ. ದಯವಿಟ್ಟು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಿ.';

  @override
  String get networkError => 'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವಿಲ್ಲ. ನಿಮ್ಮ ಸಂಪರ್ಕ ಪರಿಶೀಲಿಸಿ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

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
  String get searchNoResultsSubtitle => 'ಬೇರೆ ಖಾದ್ಯ, ಪಾಕಶೈಲಿ ಅಥವಾ ರೆಸ್ಟೋರೆಂಟ್ ಹೆಸರು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get cravingTitle => 'ಏನು ತಿನ್ನಬೇಕು ಅನಿಸುತ್ತಿದೆ?';

  @override
  String get offersTitle => 'ನಿಮಗಾಗಿ ಆಫರ್‌ಗಳು';

  @override
  String get restaurantsNearby => 'ನಿಮ್ಮ ಹತ್ತಿರದ ರೆಸ್ಟೋರೆಂಟ್‌ಗಳು';

  @override
  String restaurantsCount(int count) {
    return '$count ರೆಸ್ಟೋರೆಂಟ್‌ಗಳು';
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
    return '$count+ ರೇಟಿಂಗ್‌ಗಳು';
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
  String get noVegDishesSubtitle => 'ಪೂರ್ಣ ಮೆನು ನೋಡಲು ಸಸ್ಯಾಹಾರಿ ಫಿಲ್ಟರ್ ಆಫ್ ಮಾಡಿ.';

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
  String get cartEmptySubtitle => 'ಶುರುಮಾಡಲು ಯಾವುದಾದರೂ ರೆಸ್ಟೋರೆಂಟ್‌ನಿಂದ ಖಾದ್ಯ ಸೇರಿಸಿ.';

  @override
  String get browseRestaurants => 'ರೆಸ್ಟೋರೆಂಟ್‌ಗಳನ್ನು ನೋಡಿ';

  @override
  String itemsInCart(int count) {
    return '$count ವಸ್ತುಗಳು';
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
  String placeOrderFor(int amount) {
    return 'ಆರ್ಡರ್ ಮಾಡಿ · ₹$amount';
  }

  @override
  String get ordersTitle => 'ನಿಮ್ಮ ಆರ್ಡರ್‌ಗಳು';

  @override
  String get ordersEmptyTitle => 'ಇನ್ನೂ ಆರ್ಡರ್‌ಗಳಿಲ್ಲ';

  @override
  String get ordersEmptySubtitle => 'ನಿಮ್ಮ ಹಿಂದಿನ ಆರ್ಡರ್‌ಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

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
  String get prototypeNotice => 'ಮಾದರಿ ಸ್ಟೋರ್‌ಫ್ರಂಟ್ — ನಿಜವಾದ ಅಂಗಡಿಗಳು ಕ್ಯಾಟಲಾಗ್ API ಜೊತೆ ಬರುತ್ತವೆ.';

  @override
  String get prototypeCheckoutNotice => 'ಇದು ಪ್ರೊಟೊಟೈಪ್. ಯಾವುದೇ ಪಾವತಿ ಪಡೆಯುವುದಿಲ್ಲ ಮತ್ತು ನಿಜವಾದ ಆರ್ಡರ್ ಆಗುವುದಿಲ್ಲ.';

  @override
  String get prototypeTrackingNotice => 'ಪ್ರೊಟೊಟೈಪ್‌ಗಾಗಿ ಟ್ರ್ಯಾಕಿಂಗ್ ಕೃತಕವಾಗಿದೆ.';
}
