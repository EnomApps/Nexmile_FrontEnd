// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'Fast Delivery. Fresh Smiles.';

  @override
  String get chooseLanguageTitle => 'Choose your language';

  @override
  String get chooseLanguageSubtitle => 'Pick the language you are most comfortable with. You can change it anytime from Settings.';

  @override
  String get searchLanguageHint => 'Search language';

  @override
  String get noLanguageFound => 'No language found';

  @override
  String languagesAvailable(int count) {
    return '$count languages available';
  }

  @override
  String get continueLabel => 'Continue';

  @override
  String get selectedLabel => 'Selected';

  @override
  String get defaultLabel => 'Default';

  @override
  String get homeTitle => 'Welcome to Nexmile';

  @override
  String get homeSubtitle => 'Fresh groceries, hot food and daily essentials delivered from shops near you.';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get languageUpdated => 'Language updated';

  @override
  String get appLanguageLabel => 'App language';

  @override
  String greetingNamed(String name) {
    return 'Hello, $name';
  }

  @override
  String get loginTitle => 'Sign in to Nexmile';

  @override
  String get loginSubtitle => 'Enter your email or mobile number and we will send you a verification code.';

  @override
  String get emailOrPhoneLabel => 'Email or mobile number';

  @override
  String get emailOrPhoneHint => 'name@example.com or 9876543210';

  @override
  String get invalidEmailOrPhone => 'Enter a valid email address or 10-digit mobile number';

  @override
  String get sendCode => 'Send code';

  @override
  String get agreeToTermsOnContinue => 'By continuing you agree to our Terms of Service and Privacy Policy.';

  @override
  String get otpTitle => 'Verify it is you';

  @override
  String otpSubtitle(String target) {
    return 'Enter the 6-digit code we sent to $target';
  }

  @override
  String get verifyCode => 'Verify';

  @override
  String get resendCode => 'Resend code';

  @override
  String resendCodeIn(int seconds) {
    return 'Resend code in ${seconds}s';
  }

  @override
  String get codeResent => 'A new code has been sent';

  @override
  String get incorrectCode => 'That code is not correct or has expired. Request a new one.';

  @override
  String get enterFullCode => 'Enter all 6 digits';

  @override
  String get accountSuspended => 'This account has been suspended. Please contact support.';

  @override
  String get tooManyAttempts => 'Too many attempts. Please wait a while and try again.';

  @override
  String get sessionExpired => 'Your session has expired. Please sign in again.';

  @override
  String get networkError => 'No internet connection. Check your connection and try again.';

  @override
  String get developmentCode => 'Development code';

  @override
  String get signOut => 'Sign out';

  @override
  String get signedOut => 'You have been signed out';

  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';

  @override
  String get profileTitle => 'Profile';

  @override
  String get viewProfile => 'View profile';

  @override
  String get nameLabel => 'Name';

  @override
  String get emailLabel => 'Email';

  @override
  String get mobileLabel => 'Mobile number';

  @override
  String get accountStatusLabel => 'Account status';

  @override
  String get statusActive => 'Active';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusSuspended => 'Suspended';

  @override
  String get verifiedLabel => 'Verified';

  @override
  String get notProvided => 'Not added';

  @override
  String get retry => 'Try again';

  @override
  String get navHome => 'Home';

  @override
  String get navSearch => 'Search';

  @override
  String get navOrders => 'Orders';

  @override
  String get cancelLabel => 'Cancel';

  @override
  String get deliverTo => 'DELIVER TO';

  @override
  String get searchDishesHint => 'Search for dishes or restaurants';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchNoResultsTitle => 'Nothing matched';

  @override
  String get searchNoResultsSubtitle => 'Try a different dish, cuisine or restaurant name.';

  @override
  String get cravingTitle => 'What are you craving?';

  @override
  String get offersTitle => 'Offers for you';

  @override
  String get restaurantsNearby => 'Restaurants near you';

  @override
  String restaurantsCount(int count) {
    return '$count restaurants';
  }

  @override
  String get noRestaurantsTitle => 'Nothing here yet';

  @override
  String get noRestaurantsSubtitle => 'Try another category, or clear the filter.';

  @override
  String minutesAway(int minutes) {
    return '$minutes min';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance km';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ratings';
  }

  @override
  String priceForTwo(int amount) {
    return '₹$amount for two';
  }

  @override
  String get freeDelivery => 'Free delivery';

  @override
  String percentOff(int percent) {
    return '$percent% OFF';
  }

  @override
  String percentOffOnOrder(int percent) {
    return '$percent% off on your order';
  }

  @override
  String get vegOnly => 'Veg only';

  @override
  String get bestseller => 'BESTSELLER';

  @override
  String get addLabel => 'ADD';

  @override
  String get noVegDishesTitle => 'No veg dishes here';

  @override
  String get noVegDishesSubtitle => 'Turn off the veg filter to see the full menu.';

  @override
  String get replaceCartTitle => 'Start a new cart?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'Your cart has items from $restaurant. Adding this will clear it.';
  }

  @override
  String get replaceCartConfirm => 'Clear and add';

  @override
  String get cartTitle => 'Your cart';

  @override
  String get cartEmptyTitle => 'Your cart is empty';

  @override
  String get cartEmptySubtitle => 'Add dishes from a restaurant to get started.';

  @override
  String get browseRestaurants => 'Browse restaurants';

  @override
  String itemsInCart(int count) {
    return '$count items';
  }

  @override
  String get viewCart => 'View cart';

  @override
  String get itemTotal => 'Item total';

  @override
  String get deliveryFeeLabel => 'Delivery fee';

  @override
  String get taxesAndCharges => 'Taxes and charges';

  @override
  String get freeLabel => 'FREE';

  @override
  String get toPay => 'To pay';

  @override
  String placeOrderFor(int amount) {
    return 'Place order · ₹$amount';
  }

  @override
  String get ordersTitle => 'Your orders';

  @override
  String get ordersEmptyTitle => 'No orders yet';

  @override
  String get ordersEmptySubtitle => 'Your past orders will show up here.';

  @override
  String get reorder => 'Reorder';

  @override
  String orderTitle(String id) {
    return 'Order $id';
  }

  @override
  String get orderPlacedTitle => 'Order placed';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'Arriving in about $minutes minutes.';
  }

  @override
  String get orderDeliveredTitle => 'Delivered';

  @override
  String get orderDeliveredSubtitle => 'Enjoy your food.';

  @override
  String get statusOrderPlaced => 'Order placed';

  @override
  String get statusPreparing => 'Preparing your food';

  @override
  String get statusOnTheWay => 'On the way';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get keepBrowsing => 'Keep browsing';

  @override
  String get backToHome => 'Back to home';

  @override
  String get prototypeNotice => 'Sample storefront — real shops arrive with the catalogue API.';

  @override
  String get prototypeCheckoutNotice => 'This is a prototype. No payment is taken and no order is really placed.';

  @override
  String get prototypeTrackingNotice => 'Tracking is simulated for the prototype.';
}
