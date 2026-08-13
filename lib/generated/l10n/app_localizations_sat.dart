// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Santali (`sat`).
class AppLocalizationsSat extends AppLocalizations {
  AppLocalizationsSat([String locale = 'sat']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ᱱᱚᱶᱟ ᱠᱷᱟᱱᱟ ᱫᱟᱨᱠᱟᱨᱟ';

  @override
  String get tagline => 'ᱞᱚᱜᱚᱱ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ᱾ ᱱᱟᱶᱟ ᱞᱟᱸᱰᱟ᱾';

  @override
  String get chooseLanguageTitle => 'ᱟᱢᱟᱜ ᱯᱟᱹᱨᱥᱤ ᱵᱟᱪᱷᱟᱣ ᱢᱮ';

  @override
  String get chooseLanguageSubtitle => 'ᱟᱢ ᱡᱟᱦᱟᱸ ᱯᱟᱹᱨᱥᱤ ᱨᱮ ᱥᱩᱦᱩᱞ ᱟᱢ ᱚᱱᱟ ᱵᱟᱪᱷᱟᱣ ᱢᱮ᱾ ᱟᱢ ᱱᱚᱶᱟ ᱡᱟᱦᱟᱸ ᱚᱠᱛᱚ ᱥᱮᱴᱤᱝᱥ ᱨᱮ ᱵᱚᱫᱚᱞ ᱫᱟᱲᱮᱭᱟᱜ-ᱟᱢ᱾';

  @override
  String get searchLanguageHint => 'ᱯᱟᱹᱨᱥᱤ ᱯᱟᱱᱛᱮ ᱢᱮ';

  @override
  String get noLanguageFound => 'ᱡᱟᱦᱟᱸ ᱯᱟᱹᱨᱥᱤ ᱵᱟᱝ ᱧᱟᱢ ᱞᱮᱱᱟ';

  @override
  String languagesAvailable(int count) {
    return '$count ᱯᱟᱹᱨᱥᱤ ᱢᱮᱱᱟᱜ-ᱟ';
  }

  @override
  String get continueLabel => 'ᱞᱟᱦᱟ ᱪᱟᱞᱟᱣ ᱢᱮ';

  @override
  String get selectedLabel => 'ᱵᱟᱪᱷᱟᱣᱟᱠᱟᱱ';

  @override
  String get defaultLabel => 'ᱰᱤᱯᱷᱚᱞᱴ';

  @override
  String get homeTitle => 'Nexmile ᱨᱮ ᱡᱚᱦᱟᱨ';

  @override
  String get homeSubtitle => 'ᱱᱟᱶᱟ ᱠᱤᱨᱟᱱᱟ, ᱨᱟᱹᱲᱟᱹ ᱡᱚᱢᱟᱜ ᱟᱨ ᱫᱤᱱ ᱫᱤᱱᱟᱜ ᱡᱤᱱᱤᱥ ᱟᱢᱟᱜ ᱡᱟᱹᱛᱤᱭᱟᱹᱨ ᱫᱳᱠᱟᱱ ᱠᱷᱚᱱ᱾';

  @override
  String get changeLanguage => 'ᱯᱟᱹᱨᱥᱤ ᱵᱚᱫᱚᱞ ᱢᱮ';

  @override
  String get languageUpdated => 'ᱯᱟᱹᱨᱥᱤ ᱵᱚᱫᱚᱞ ᱮᱱᱟ';

  @override
  String get appLanguageLabel => 'ᱮᱯ ᱯᱟᱹᱨᱥᱤ';

  @override
  String greetingNamed(String name) {
    return 'ᱡᱚᱦᱟᱨ, $name';
  }

  @override
  String get loginTitle => 'Nexmile ᱨᱮ ᱥᱟᱭᱤᱱ ᱤᱱ ᱢᱮ';

  @override
  String get loginSubtitle => 'ᱟᱢᱟᱜ ᱤᱢᱮᱞ ᱵᱟᱝᱠᱷᱟᱱ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ ᱚᱞ ᱢᱮ, ᱟᱞᱮ ᱡᱟᱸᱪ ᱠᱳᱰ ᱠᱩᱞ ᱟᱞᱮᱭᱟ᱾';

  @override
  String get emailOrPhoneLabel => 'ᱤᱢᱮᱞ ᱵᱟᱝᱠᱷᱟᱱ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ';

  @override
  String get emailOrPhoneHint => 'name@example.com ᱵᱟᱝᱠᱷᱟᱱ 9876543210';

  @override
  String get invalidEmailOrPhone => 'ᱴᱷᱤᱠ ᱤᱢᱮᱞ ᱴᱷᱤᱠᱱᱟ ᱵᱟᱝᱠᱷᱟᱱ 10 ᱮᱞ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ ᱚᱞ ᱢᱮ';

  @override
  String get sendCode => 'ᱠᱳᱰ ᱠᱩᱞ ᱢᱮ';

  @override
  String get agreeToTermsOnContinue => 'ᱞᱟᱦᱟ ᱪᱟᱞᱟᱣ ᱠᱟᱛᱮ ᱟᱢ ᱟᱞᱮᱭᱟᱜ ᱥᱮᱵᱟ ᱱᱮᱢ ᱟᱨ ᱩᱠᱩ ᱱᱤᱛᱤ ᱨᱮ ᱨᱟᱡᱤ ᱠᱟᱱᱟᱢ᱾';

  @override
  String get otpTitle => 'ᱱᱚᱶᱟ ᱟᱢᱜᱮ ᱠᱟᱱᱟ ᱡᱟᱸᱪ ᱢᱮ';

  @override
  String otpSubtitle(String target) {
    return '$target ᱛᱮ ᱠᱩᱞ ᱟᱠᱟᱱ 6 ᱮᱞ ᱠᱳᱰ ᱚᱞ ᱢᱮ';
  }

  @override
  String get verifyCode => 'ᱡᱟᱸᱪ ᱢᱮ';

  @override
  String get resendCode => 'ᱠᱳᱰ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱞ ᱢᱮ';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ᱥᱮᱠᱮᱱᱰ ᱨᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱞ ᱢᱮ';
  }

  @override
  String get codeResent => 'ᱱᱟᱶᱟ ᱠᱳᱰ ᱠᱩᱞ ᱮᱱᱟ';

  @override
  String get incorrectCode => 'ᱱᱚᱶᱟ ᱠᱳᱰ ᱵᱟᱝ ᱴᱷᱤᱠᱟ ᱵᱟᱝᱠᱷᱟᱱ ᱚᱠᱛᱚ ᱪᱟᱵᱟ ᱮᱱᱟ᱾ ᱱᱟᱶᱟ ᱠᱳᱰ ᱢᱟᱹᱜ ᱢᱮ᱾';

  @override
  String get enterFullCode => 'ᱯᱩᱨᱟᱹ 6 ᱮᱞ ᱚᱞ ᱢᱮ';

  @override
  String get accountSuspended => 'ᱱᱚᱶᱟ ᱠᱷᱟᱛᱟ ᱵᱚᱸᱫ ᱠᱟᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱜᱚᱲᱚ ᱥᱟᱶ ᱡᱚᱲᱟᱣ ᱢᱮ᱾';

  @override
  String get tooManyAttempts => 'ᱟᱫᱚᱢ ᱛᱟᱞᱟᱛᱮ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱛᱤᱸᱜᱩ ᱚᱠᱛᱚ ᱛᱟᱭᱚᱢ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get sessionExpired => 'ᱟᱢᱟᱜ ᱥᱮᱥᱚᱱ ᱪᱟᱵᱟ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱥᱟᱭᱤᱱ ᱤᱱ ᱢᱮ᱾';

  @override
  String get networkError => 'ᱤᱱᱴᱟᱨᱱᱮᱴ ᱡᱚᱲᱟᱣ ᱵᱟᱹᱱᱩᱜ-ᱟ᱾ ᱡᱚᱲᱟᱣ ᱧᱮᱞ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get developmentCode => 'ᱰᱮᱵᱷᱞᱚᱯᱢᱮᱱᱴ ᱠᱳᱰ';

  @override
  String get signOut => 'ᱥᱟᱭᱤᱱ ᱟᱣᱴ';

  @override
  String get signedOut => 'ᱟᱢ ᱥᱟᱭᱤᱱ ᱟᱣᱴ ᱮᱱᱟᱢ';

  @override
  String get somethingWentWrong => 'ᱚᱠᱟ ᱦᱚᱸ ᱵᱷᱩᱞ ᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get profileTitle => 'ᱯᱨᱚᱯᱷᱟᱭᱤᱞ';

  @override
  String get viewProfile => 'ᱯᱨᱚᱯᱷᱟᱭᱤᱞ ᱧᱮᱞ ᱢᱮ';

  @override
  String get nameLabel => 'ᱧᱩᱛᱩᱢ';

  @override
  String get emailLabel => 'ᱤᱢᱮᱞ';

  @override
  String get mobileLabel => 'ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ';

  @override
  String get accountStatusLabel => 'ᱠᱷᱟᱛᱟ ᱫᱚᱥᱟ';

  @override
  String get statusActive => 'ᱪᱟᱹᱞᱩ';

  @override
  String get statusPending => 'ᱛᱟᱸᱜᱤ ᱟᱠᱟᱱ';

  @override
  String get statusSuspended => 'ᱵᱚᱸᱫ ᱟᱠᱟᱱ';

  @override
  String get verifiedLabel => 'ᱡᱟᱸᱪ ᱟᱠᱟᱱ';

  @override
  String get notProvided => 'ᱵᱟᱝ ᱥᱮᱞᱮᱫ ᱟᱠᱟᱱᱟ';

  @override
  String get retry => 'ᱫᱩᱦᱲᱟᱹ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ';

  @override
  String get navHome => 'ᱚᱲᱟᱜ';

  @override
  String get navSearch => 'ᱯᱟᱱᱛᱮ';

  @override
  String get navOrders => 'ᱚᱰᱟᱨ';

  @override
  String get cancelLabel => 'ᱵᱟᱰᱟᱺᱭ ᱢᱮ';

  @override
  String get deliverTo => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱴᱷᱤᱠᱱᱟ';

  @override
  String get searchDishesHint => 'ᱡᱚᱢᱟᱜ ᱵᱟᱝᱠᱷᱟᱱ ᱦᱚᱴᱮᱞ ᱯᱟᱱᱛᱮ ᱢᱮ';

  @override
  String get searchTitle => 'ᱯᱟᱱᱛᱮ';

  @override
  String get searchNoResultsTitle => 'ᱡᱟᱦᱟᱸ ᱵᱟᱝ ᱧᱟᱢ ᱞᱮᱱᱟ';

  @override
  String get searchNoResultsSubtitle => 'ᱮᱴᱟᱜ ᱡᱚᱢᱟᱜ, ᱡᱚᱢᱟᱜ ᱛᱮᱭᱟᱨ ᱨᱮᱭᱟᱜ ᱞᱮᱠᱟᱱ ᱵᱟᱝᱠᱷᱟᱱ ᱦᱚᱴᱮᱞ ᱧᱩᱛᱩᱢ ᱠᱩᱨᱩᱢᱩᱴᱩ ᱢᱮ᱾';

  @override
  String get cravingTitle => 'ᱛᱮᱦᱮᱧ ᱪᱮᱫ ᱡᱚᱢ ᱥᱟᱱᱟᱢ?';

  @override
  String get offersTitle => 'ᱟᱢᱟᱜ ᱞᱟᱹᱜᱤᱫ ᱚᱯᱷᱟᱨ';

  @override
  String get restaurantsNearby => 'ᱟᱢᱟᱜ ᱡᱟᱹᱛᱤᱭᱟᱹᱨ ᱦᱚᱴᱮᱞ';

  @override
  String restaurantsCount(int count) {
    return '$count ᱦᱚᱴᱮᱞ';
  }

  @override
  String get noRestaurantsTitle => 'ᱱᱚᱰᱮ ᱦᱟᱲᱮ ᱡᱟᱦᱟᱸ ᱵᱟᱝᱟ';

  @override
  String get noRestaurantsSubtitle => 'ᱮᱴᱟᱜ ᱦᱟᱹᱴᱤᱧ ᱧᱮᱞ ᱢᱮ ᱵᱟᱝᱠᱷᱟᱱ ᱯᱷᱤᱞᱴᱟᱨ ᱚᱪᱚᱜ ᱢᱮ᱾';

  @override
  String minutesAway(int minutes) {
    return '$minutes ᱢᱤᱱᱤᱴ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance ᱠᱤᱢᱤ';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ᱨᱮᱴᱤᱝ';
  }

  @override
  String priceForTwo(int amount) {
    return 'ᱵᱟᱨᱭᱟ ᱦᱚᱲ ᱞᱟᱹᱜᱤᱫ ₹$amount';
  }

  @override
  String get freeDelivery => 'ᱯᱷᱨᱤ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ';

  @override
  String percentOff(int percent) {
    return '$percent% ᱠᱚᱢ';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'ᱟᱢᱟᱜ ᱚᱰᱟᱨ ᱨᱮ $percent% ᱠᱚᱢ';
  }

  @override
  String get vegOnly => 'ᱥᱟᱠᱟᱢ ᱡᱚᱢᱟᱜ ᱮᱰᱮ';

  @override
  String get bestseller => 'ᱡᱟᱹᱥᱛᱤ ᱟᱠᱷᱨᱤᱧ';

  @override
  String get addLabel => 'ᱥᱮᱞᱮᱫ';

  @override
  String get noVegDishesTitle => 'ᱱᱚᱰᱮ ᱥᱟᱠᱟᱢ ᱡᱚᱢᱟᱜ ᱵᱟᱝᱟ';

  @override
  String get noVegDishesSubtitle => 'ᱯᱩᱨᱟᱹ ᱢᱮᱱᱩ ᱧᱮᱞ ᱞᱟᱹᱜᱤᱫ ᱥᱟᱠᱟᱢ ᱯᱷᱤᱞᱴᱟᱨ ᱵᱚᱸᱫ ᱢᱮ᱾';

  @override
  String get replaceCartTitle => 'ᱱᱟᱶᱟ ᱠᱟᱨᱴ ᱮᱦᱚᱵ?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'ᱟᱢᱟᱜ ᱠᱟᱨᱴ ᱨᱮ $restaurant ᱠᱷᱚᱱ ᱡᱤᱱᱤᱥ ᱢᱮᱱᱟᱜ-ᱟ᱾ ᱱᱚᱶᱟ ᱥᱮᱞᱮᱫ ᱠᱷᱟᱱ ᱚᱱᱟ ᱠᱚ ᱚᱪᱚᱜᱚᱜ-ᱟ᱾';
  }

  @override
  String get replaceCartConfirm => 'ᱚᱪᱚᱜ ᱠᱟᱛᱮ ᱥᱮᱞᱮᱫ';

  @override
  String get cartTitle => 'ᱟᱢᱟᱜ ᱠᱟᱨᱴ';

  @override
  String get cartEmptyTitle => 'ᱟᱢᱟᱜ ᱠᱟᱨᱴ ᱠᱷᱟᱹᱞᱤ ᱢᱮᱱᱟᱜ-ᱟ';

  @override
  String get cartEmptySubtitle => 'ᱮᱦᱚᱵ ᱞᱟᱹᱜᱤᱫ ᱡᱟᱦᱟᱸ ᱦᱚᱴᱮᱞ ᱠᱷᱚᱱ ᱡᱚᱢᱟᱜ ᱥᱮᱞᱮᱫ ᱢᱮ᱾';

  @override
  String get browseRestaurants => 'ᱦᱚᱴᱮᱞ ᱧᱮᱞ ᱢᱮ';

  @override
  String itemsInCart(int count) {
    return '$count ᱡᱤᱱᱤᱥ';
  }

  @override
  String get viewCart => 'ᱠᱟᱨᱴ ᱧᱮᱞ ᱢᱮ';

  @override
  String get itemTotal => 'ᱡᱤᱱᱤᱥ ᱨᱮᱭᱟᱜ ᱡᱚᱛᱚ';

  @override
  String get deliveryFeeLabel => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱠᱷᱚᱨᱚᱡ';

  @override
  String get taxesAndCharges => 'ᱠᱷᱟᱡᱱᱟ ᱟᱨ ᱠᱷᱚᱨᱚᱡ';

  @override
  String get freeLabel => 'ᱯᱷᱨᱤ';

  @override
  String get toPay => 'ᱮᱢ ᱞᱟᱹᱠᱛᱤ';

  @override
  String placeOrderFor(String amount) {
    return 'ᱚᱰᱟᱨ ᱢᱮ · $amount';
  }

  @override
  String get ordersTitle => 'ᱟᱢᱟᱜ ᱚᱰᱟᱨ';

  @override
  String get ordersEmptyTitle => 'ᱦᱟᱲᱮ ᱡᱟᱦᱟᱸ ᱚᱰᱟᱨ ᱵᱟᱝᱟ';

  @override
  String get ordersEmptySubtitle => 'ᱟᱢᱟᱜ ᱢᱟᱲᱟᱝ ᱚᱰᱟᱨ ᱠᱚ ᱱᱚᱰᱮ ᱩᱫᱩᱜᱚᱜ-ᱟ᱾';

  @override
  String get reorder => 'ᱫᱩᱦᱲᱟᱹ ᱚᱰᱟᱨ';

  @override
  String orderTitle(String id) {
    return 'ᱚᱰᱟᱨ $id';
  }

  @override
  String get orderPlacedTitle => 'ᱚᱰᱟᱨ ᱮᱱᱟ';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'ᱮᱴᱠᱮᱴᱚᱬᱮ $minutes ᱢᱤᱱᱤᱴ ᱨᱮ ᱥᱮᱴᱮᱨᱚᱜ-ᱟ᱾';
  }

  @override
  String get orderDeliveredTitle => 'ᱰᱮᱞᱤᱵᱷᱟᱨ ᱮᱱᱟ';

  @override
  String get orderDeliveredSubtitle => 'ᱡᱚᱢᱟᱜ ᱨᱩᱦᱮᱫ ᱢᱮ᱾';

  @override
  String get statusOrderPlaced => 'ᱚᱰᱟᱨ ᱮᱱᱟ';

  @override
  String get statusPreparing => 'ᱡᱚᱢᱟᱜ ᱛᱮᱭᱟᱨ ᱦᱩᱭᱩᱜ ᱠᱟᱱᱟ';

  @override
  String get statusOnTheWay => 'ᱦᱚᱨ ᱨᱮ ᱢᱮᱱᱟᱜ-ᱟ';

  @override
  String get statusDelivered => 'ᱰᱮᱞᱤᱵᱷᱟᱨ ᱮᱱᱟ';

  @override
  String get keepBrowsing => 'ᱧᱮᱞ ᱛᱟᱦᱮᱸᱱ ᱢᱮ';

  @override
  String get backToHome => 'ᱚᱲᱟᱜ ᱛᱮ ᱨᱩᱣᱟᱲ';

  @override
  String get prototypeNotice => 'ᱱᱟᱡᱩᱱᱟ ᱦᱚᱴᱮᱞ ᱞᱤᱥᱴᱤ — ᱴᱷᱤᱠ ᱫᱳᱠᱟᱱ ᱠᱚ ᱠᱮᱴᱟᱞᱚᱜ API ᱥᱟᱶ ᱦᱮᱡᱚᱜ-ᱟ᱾';

  @override
  String get prototypeCheckoutNotice => 'ᱱᱚᱶᱟ ᱢᱤᱫ ᱯᱨᱚᱴᱚᱴᱟᱭᱤᱯ ᱠᱟᱱᱟ᱾ ᱡᱟᱦᱟᱸ ᱴᱟᱠᱟ ᱵᱟᱝ ᱦᱟᱛᱟᱣᱚᱜ-ᱟ ᱟᱨ ᱴᱷᱤᱠ ᱚᱰᱟᱨ ᱦᱚᱸ ᱵᱟᱝ ᱦᱩᱭᱩᱜ-ᱟ᱾';

  @override
  String get prototypeTrackingNotice => 'ᱯᱨᱚᱴᱚᱴᱟᱭᱤᱯ ᱞᱟᱹᱜᱤᱫ ᱴᱨᱮᱠᱤᱝ ᱵᱟᱱᱟᱣ ᱟᱠᱟᱱᱟ᱾';

  @override
  String get locationTitle => 'ᱚᱠᱟᱨᱮ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱦᱩᱭᱩᱜ-ᱟ?';

  @override
  String get locationSubtitle => 'Nexmile ᱫᱚ 1 ᱠᱤᱢᱤ ᱵᱷᱤᱛᱨᱤ ᱨᱮᱭᱟᱜ ᱫᱳᱠᱟᱱ ᱠᱷᱚᱱ ᱮᱰᱮ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱮᱢᱚᱜ-ᱟ, ᱚᱱᱟᱛᱮ ᱟᱢᱟᱜ ᱴᱷᱤᱠ ᱡᱟᱭᱜᱟ ᱞᱟᱹᱠᱛᱤᱭᱟ᱾';

  @override
  String get locationReasonRadiusTitle => '1 ᱠᱤᱢᱤ ᱵᱷᱤᱛᱨᱤ ᱫᱳᱠᱟᱱ';

  @override
  String get locationReasonRadiusBody => 'ᱚᱠᱟ ᱠᱷᱚᱱ ᱡᱚᱢᱟᱜ ᱨᱟᱹᱲᱟᱹ ᱛᱮ ᱥᱮᱴᱮᱨᱚᱜ-ᱟ, ᱚᱱᱟ ᱨᱚᱥᱚᱭᱜᱷᱚᱨ ᱮᱰᱮ ᱩᱫᱩᱜᱟᱜ-ᱟ᱾';

  @override
  String get locationReasonAccuracyTitle => 'ᱴᱷᱤᱠ ᱫᱩᱣᱟᱹᱨ ᱦᱟᱹᱵᱤᱡ';

  @override
  String get locationReasonAccuracyBody => 'ᱴᱷᱤᱠ ᱯᱤᱱ ᱛᱟᱦᱮᱸᱱ ᱠᱷᱟᱱ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱦᱚᱲ ᱯᱷᱳᱱ ᱵᱟᱝ ᱠᱟᱛᱮ ᱦᱚᱸ ᱟᱢ ᱛᱟᱞᱟ ᱥᱮᱴᱮᱨᱚᱜ-ᱟᱭ᱾';

  @override
  String get locationReasonPrivacyTitle => 'ᱮᱯ ᱵᱮᱵᱷᱟᱨ ᱡᱚᱠᱷᱚᱱ ᱮᱰᱮ';

  @override
  String get locationReasonPrivacyBody => 'ᱟᱞᱮ ᱫᱚ ᱛᱟᱭᱚᱢ ᱛᱮ ᱟᱢᱟᱜ ᱴᱨᱮᱠ ᱵᱟᱝ ᱮᱫᱟᱞᱮᱭᱟ, ᱟᱨ ᱴᱷᱤᱠᱱᱟ ᱟᱢ ᱟᱡ ᱛᱮ ᱦᱚᱸ ᱚᱞ ᱫᱟᱲᱮᱭᱟᱜ-ᱟᱢ᱾';

  @override
  String get allowLocation => 'ᱡᱟᱭᱜᱟ ᱨᱮᱭᱟᱜ ᱦᱩᱠᱩᱢ ᱮᱢ ᱢᱮ';

  @override
  String get enterAddressManually => 'ᱤᱧ ᱴᱷᱤᱠᱱᱟ ᱟᱡ ᱛᱮ ᱚᱞᱟᱹ';

  @override
  String get locationDenied => 'ᱡᱟᱭᱜᱟ ᱨᱮᱭᱟᱜ ᱦᱩᱠᱩᱢ ᱵᱟᱝ ᱮᱢ ᱞᱮᱱᱟ᱾ ᱟᱢ ᱯᱤᱱ ᱟᱡ ᱛᱮ ᱫᱚᱦᱚ ᱫᱟᱲᱮᱭᱟᱜ-ᱟᱢ᱾';

  @override
  String get locationDeniedForever => 'Nexmile ᱞᱟᱹᱜᱤᱫ ᱡᱟᱭᱜᱟ ᱵᱚᱸᱫ ᱟᱠᱟᱱᱟ᱾ ᱥᱮᱴᱤᱝᱥ ᱨᱮ ᱡᱟᱹᱨᱩᱭ ᱢᱮ ᱵᱟᱝᱠᱷᱟᱱ ᱯᱤᱱ ᱟᱡ ᱛᱮ ᱫᱚᱦᱚ ᱢᱮ᱾';

  @override
  String get locationServiceOff => 'ᱱᱚᱶᱟ ᱰᱤᱵᱷᱟᱭᱤᱥ ᱨᱮ ᱡᱟᱭᱜᱟ ᱵᱚᱸᱫ ᱢᱮᱱᱟᱜ-ᱟ᱾';

  @override
  String get locationUnavailable => 'ᱡᱟᱭᱜᱟ ᱵᱟᱝ ᱧᱟᱢ ᱞᱮᱱᱟ᱾ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱯᱤᱱ ᱟᱡ ᱛᱮ ᱫᱚᱦᱚ ᱢᱮ᱾';

  @override
  String get openSettings => 'ᱥᱮᱴᱤᱝᱥ';

  @override
  String get pinLocationTitle => 'ᱟᱢᱟᱜ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱯᱤᱱ ᱫᱚᱦᱚ ᱢᱮ';

  @override
  String get deliveryRadiusHint => 'ᱜᱟᱸᱴ ᱫᱚ Nexmile ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱮᱢᱚᱜ 1 ᱠᱤᱢᱤ ᱩᱫᱩᱜ ᱠᱟᱱᱟ᱾';

  @override
  String get useMyLocation => 'ᱤᱧᱟᱜ ᱡᱟᱭᱜᱟ ᱵᱮᱵᱷᱟᱨ ᱢᱮ';

  @override
  String get deliveringHere => 'ᱱᱚᱰᱮ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ';

  @override
  String get dragToAdjust => 'ᱯᱤᱱ ᱵᱚᱫᱚᱞ ᱞᱟᱹᱜᱤᱫ ᱢᱮᱯ ᱚᱲ ᱢᱮ';

  @override
  String get confirmLocation => 'ᱡᱟᱭᱜᱟ ᱡᱟᱸᱪ ᱢᱮ';

  @override
  String get addressDetailsTitle => 'ᱴᱷᱤᱠᱱᱟ ᱨᱮᱭᱟᱜ ᱠᱷᱚᱵᱚᱨ';

  @override
  String get addressDetailsSubtitle => 'ᱴᱷᱤᱠ ᱫᱩᱣᱟᱹᱨ ᱦᱟᱹᱵᱤᱡ ᱥᱮᱴᱮᱨ ᱞᱟᱹᱜᱤᱫ ᱚᱲᱟᱜ ᱱᱟᱢᱵᱟᱨ ᱟᱨ ᱪᱤᱱᱦᱟᱹ ᱥᱮᱞᱮᱫ ᱢᱮ᱾';

  @override
  String get pinnedLocation => 'ᱵᱟᱪᱷᱟᱣ ᱟᱠᱟᱱ ᱡᱟᱭᱜᱟ';

  @override
  String get changePin => 'ᱵᱚᱫᱚᱞ ᱢᱮ';

  @override
  String get saveAddressAs => 'ᱱᱚᱶᱟ ᱴᱷᱤᱠᱱᱟ ᱱᱚᱸᱠᱟ ᱥᱟᱺᱪᱟᱣ ᱢᱮ';

  @override
  String get labelHome => 'ᱚᱲᱟᱜ';

  @override
  String get labelWork => 'ᱫᱚᱯᱛᱚᱨ';

  @override
  String get labelOther => 'ᱮᱴᱟᱜ';

  @override
  String get addressLine1Label => 'ᱚᱲᱟᱜ, ᱯᱷᱞᱮᱴ ᱵᱟᱝᱠᱷᱟᱱ ᱤᱢᱟᱨᱚᱛ';

  @override
  String get addressLine1Hint => '12A, ᱜᱨᱤᱱ ᱨᱮᱡᱤᱰᱮᱱᱥᱤ';

  @override
  String get addressLine2Label => 'ᱦᱚᱨ ᱵᱟᱝᱠᱷᱟᱱ ᱡᱟᱭᱜᱟ';

  @override
  String get addressLine2Hint => '2 ᱮᱵᱷᱮᱱᱭᱩ, ᱟᱱᱱᱟ ᱱᱚᱜᱚᱨ';

  @override
  String get landmarkLabel => 'ᱪᱤᱱᱦᱟᱹ';

  @override
  String get landmarkHint => 'ᱵᱟᱥ ᱥᱴᱟᱯ ᱥᱟᱢᱟᱝ ᱨᱮ';

  @override
  String get cityLabel => 'ᱥᱚᱦᱚᱨ';

  @override
  String get stateLabel => 'ᱨᱟᱡᱽ';

  @override
  String get pincodeLabel => 'ᱯᱤᱱ ᱠᱳᱰ';

  @override
  String get invalidPincode => 'ᱴᱷᱤᱠ 6 ᱮᱞ ᱯᱤᱱ ᱠᱳᱰ ᱚᱞ ᱢᱮ';

  @override
  String get contactNameLabel => 'ᱡᱚᱲᱟᱣ ᱧᱩᱛᱩᱢ';

  @override
  String get contactPhoneLabel => 'ᱡᱚᱲᱟᱣ ᱱᱟᱢᱵᱟᱨ';

  @override
  String get invalidMobileNumber => 'ᱴᱷᱤᱠ 10 ᱮᱞ ᱢᱚᱵᱟᱭᱤᱞ ᱱᱟᱢᱵᱟᱨ ᱚᱞ ᱢᱮ';

  @override
  String get makeDefaultAddress => 'ᱰᱤᱯᱷᱚᱞᱴ ᱞᱮᱠᱟᱛᱮ ᱱᱚᱰᱮᱜᱮ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ';

  @override
  String get saveAddress => 'ᱴᱷᱤᱠᱱᱟ ᱥᱟᱺᱪᱟᱣ ᱢᱮ';

  @override
  String get addressSaved => 'ᱴᱷᱤᱠᱱᱟ ᱥᱟᱺᱪᱟᱣ ᱮᱱᱟ';

  @override
  String get addressBookTitle => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱴᱷᱤᱠᱱᱟ';

  @override
  String get manageAddresses => 'ᱥᱟᱺᱪᱟᱣ ᱟᱠᱟᱱ ᱴᱷᱤᱠᱱᱟ ᱠᱚ ᱥᱟᱢᱵᱷᱟᱞ ᱢᱮ';

  @override
  String get noAddressesTitle => 'ᱦᱟᱲᱮ ᱡᱟᱦᱟᱸ ᱴᱷᱤᱠᱱᱟ ᱵᱟᱝᱟ';

  @override
  String get noAddressesSubtitle => 'ᱟᱢ ᱛᱟᱞᱟ ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱮᱢᱚᱜ ᱫᱳᱠᱟᱱ ᱩᱫᱩᱜ ᱞᱟᱹᱜᱤᱫ ᱢᱤᱫ ᱴᱷᱤᱠᱱᱟ ᱥᱮᱞᱮᱫ ᱢᱮ᱾';

  @override
  String get addAddress => 'ᱴᱷᱤᱠᱱᱟ ᱥᱮᱞᱮᱫ ᱢᱮ';

  @override
  String get setAsDefault => 'ᱰᱤᱯᱷᱚᱞᱴ ᱵᱮᱱᱟᱣ ᱢᱮ';

  @override
  String get editLabel => 'ᱥᱚᱯᱷᱟ ᱢᱮ';

  @override
  String get addressUpdated => 'ᱴᱷᱤᱠᱱᱟ ᱟᱯᱰᱮᱴ ᱮᱱᱟ';

  @override
  String get deleteLabel => 'ᱢᱮᱴᱟᱣ ᱢᱮ';

  @override
  String get deleteAddressTitle => 'ᱱᱚᱶᱟ ᱴᱷᱤᱠᱱᱟ ᱢᱮᱴᱟᱣᱟ?';

  @override
  String get deleteAddressMessage => 'ᱟᱢ ᱱᱚᱶᱟ ᱛᱟᱭᱚᱢ ᱛᱮ ᱫᱩᱦᱲᱟᱹ ᱥᱮᱞᱮᱫ ᱫᱟᱲᱮᱭᱟᱜ-ᱟᱢ᱾';

  @override
  String get rescueDealsTitle => 'ᱡᱚᱢ ᱨᱮᱥᱠᱭᱩ';

  @override
  String get notTakingOrders => 'ᱚᱰᱟᱨ ᱵᱟᱝ ᱦᱟᱛᱟᱣ ᱠᱟᱱᱟ';

  @override
  String get closedRightNow => 'ᱱᱤᱛᱚᱜ ᱵᱚᱸᱫᱚ ᱢᱮᱱᱟᱜᱼᱟ';

  @override
  String minimumOrder(String amount) {
    return 'ᱠᱚᱢ ᱛᱮ ᱠᱚᱢ $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ᱵᱟᱝᱠᱤ';
  }

  @override
  String get soldOut => 'ᱪᱟᱵᱟ ᱮᱱᱟ';

  @override
  String get menuEmptyTitle => 'ᱛᱮᱦᱮᱧ ᱫᱷᱟᱹᱵᱤᱡ ᱡᱚᱢᱟᱜ ᱵᱟᱹᱱᱩᱜᱼᱟ';

  @override
  String get menuEmptySubtitle => 'ᱱᱚᱶᱟ ᱨᱮᱥᱴᱚᱨᱮᱱᱴ ᱟᱡ ᱨᱮᱭᱟᱜ ᱢᱮᱱᱩ ᱵᱟᱝ ᱥᱮᱞᱮᱫ ᱟᱠᱟᱫᱟ ᱾';

  @override
  String get moreDishesTitle => 'ᱟᱨᱦᱚᱸ ᱡᱚᱢᱟᱜ';

  @override
  String get customisable => 'ᱠᱩᱥᱤ ᱞᱮᱠᱟᱛᱮ';

  @override
  String get requiredLabel => 'ᱞᱟᱹᱠᱛᱤ';

  @override
  String get optionalLabel => 'ᱤᱪ᱄ᱪᱷᱟ ᱞᱮᱠᱟᱛᱮ';

  @override
  String get chooseOne => 'ᱢᱤᱫᱴᱟᱝ ᱵᱟᱪᱷᱟᱣ ᱢᱮ';

  @override
  String chooseUpTo(int count) {
    return 'ᱵᱟᱲᱛᱤ ᱛᱮ ᱵᱟᱲᱛᱤ $count ᱵᱟᱪᱷᱟᱣ ᱢᱮ';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ᱠᱚᱢ ᱛᱮ ᱠᱚᱢ $count ᱵᱟᱪᱷᱟᱣ ᱢᱮ';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ᱠᱷᱚᱱ $max ᱫᱷᱟᱹᱵᱤᱡ ᱵᱟᱪᱷᱟᱣ ᱢᱮ';
  }

  @override
  String get specialInstructions => 'ᱵᱤᱥᱮᱥ ᱠᱟᱛᱷᱟ';

  @override
  String get specialInstructionsHint => 'ᱠᱚᱢ ᱢᱟᱨᱚᱪ, ᱯᱮᱭᱟᱡ ᱵᱟᱝ…';

  @override
  String addForAmount(String amount) {
    return 'ᱥᱮᱞᱮᱫ ᱢᱮ · $amount';
  }

  @override
  String get deliveryLabel => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ';

  @override
  String get pickupLabel => 'ᱟᱡ ᱛᱮ ᱤᱫᱤ';

  @override
  String get packagingLabel => 'ᱯᱮᱠᱤᱝ';

  @override
  String get discountLabel => 'ᱪᱷᱩᱴ';

  @override
  String get billDetailsTitle => 'ᱵᱤᱞ ᱨᱮᱭᱟᱜ ᱵᱤᱵᱨᱚᱬ';

  @override
  String get clearCart => 'ᱠᱟᱨᱴ ᱠᱷᱟᱹᱞᱤ ᱢᱮ';

  @override
  String get clearCartTitle => 'ᱱᱚᱶᱟ ᱠᱟᱨᱴ ᱠᱷᱟᱹᱞᱤᱭᱟ?';

  @override
  String get clearCartMessage => 'ᱱᱚᱶᱟ ᱨᱮ ᱢᱮᱱᱟᱜ ᱡᱚᱛᱚ ᱠᱟᱛᱷᱟ ᱚᱪᱚᱜ ᱦᱩᱭᱩᱜᱼᱟ ᱾';

  @override
  String unavailableItemsNotice(String items) {
    return 'ᱱᱤᱛᱚᱜ ᱵᱟᱝ ᱧᱟᱢᱚᱜᱼᱟ: $items';
  }

  @override
  String get removeUnavailable => 'ᱚᱱᱟ ᱠᱚ ᱚᱪᱚᱜ ᱢᱮ';

  @override
  String minimumNotMet(String amount) {
    return 'ᱠᱚᱢ ᱛᱮ ᱠᱚᱢ ᱚᱰᱟᱨ $amount';
  }

  @override
  String get checkoutTitle => 'ᱪᱮᱠᱟᱣᱴ';

  @override
  String get deliveryAddressLabel => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱴᱷᱤᱠᱟᱬᱟ';

  @override
  String get noAddressSelected => 'ᱡᱟᱦᱟᱸ ᱴᱷᱤᱠᱟᱬᱟ ᱵᱟᱝ ᱵᱟᱪᱷᱟᱣ ᱟᱠᱟᱱᱟ';

  @override
  String get paymentMethodLabel => 'ᱠᱚᱲᱟ';

  @override
  String get payOnDelivery => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱨᱮ ᱴᱟᱠᱟ';

  @override
  String get noteToRestaurant => 'ᱨᱮᱥᱴᱚᱨᱮᱱᱴ ᱞᱟᱹᱜᱤᱫ ᱠᱟᱛᱷᱟ';

  @override
  String get noteToRestaurantHint => 'ᱜᱷᱟᱱᱴᱤ ᱵᱟᱨ ᱫᱷᱟᱣ ᱨᱩᱭ ᱢᱮ…';

  @override
  String get activeOrdersTitle => 'ᱪᱟᱹᱞᱩ ᱚᱰᱟᱨ';

  @override
  String get pastOrdersTitle => 'ᱢᱟᱲᱟᱝ ᱚᱰᱟᱨ';

  @override
  String get orderItemsTitle => 'ᱡᱚᱢᱟᱜ';

  @override
  String get orderProgressTitle => 'ᱛᱟᱞᱟ ᱫᱟᱲᱮ';

  @override
  String get arrivingIn => 'ᱥᱮᱴᱮᱨ ᱞᱟᱹᱜᱤᱫ';

  @override
  String get pickupCodeLabel => 'ᱯᱤᱠᱟᱯ ᱠᱳᱰ';

  @override
  String get cancellationReasonLabel => 'ᱵᱟᱹᱰᱨᱟᱹ ᱨᱮᱭᱟᱜ ᱠᱟᱨᱚᱱ';

  @override
  String get riderLabel => 'ᱰᱮᱞᱤᱵᱷᱟᱨᱤ ᱥᱟᱣᱛᱟ';

  @override
  String get callRider => 'ᱠᱚᱞ ᱢᱮ';

  @override
  String get viewInvoice => 'ᱴᱮᱠᱥ ᱤᱱᱵᱷᱚᱭᱥ';

  @override
  String get cancelOrder => 'ᱚᱰᱟᱨ ᱵᱟᱹᱰᱨᱟᱹ ᱢᱮ';

  @override
  String get cancelOrderTitle => 'ᱱᱚᱶᱟ ᱚᱰᱟᱨ ᱵᱟᱹᱰᱨᱟᱹᱭᱟ?';

  @override
  String get cancelOrderMessage => 'ᱨᱮᱥᱴᱚᱨᱮᱱᱴ ᱦᱟᱛᱟᱣ ᱞᱟᱦᱟ ᱜᱮ ᱵᱟᱹᱰᱨᱟᱹ ᱫᱟᱲᱮᱭᱟᱜᱼᱟ ᱾';

  @override
  String get cancelReasonLabel => 'ᱠᱟᱨᱚᱱ';

  @override
  String get cancelReasonFallback => 'ᱜᱟᱦᱟᱠ ᱵᱟᱹᱰᱨᱟᱹ ᱠᱮᱫᱟ';

  @override
  String get orderCancelled => 'ᱚᱰᱟᱨ ᱵᱟᱹᱰᱨᱟᱹ ᱮᱱᱟ';

  @override
  String get currentLocationLabel => 'ᱱᱤᱛᱚᱜᱟᱜ ᱡᱟᱭᱜᱟ';
}
