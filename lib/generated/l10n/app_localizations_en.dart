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
  String get fieldRequired => 'This field is required';

  @override
  String get tagline => 'Fast Delivery. Fresh Smiles.';

  @override
  String get chooseLanguageTitle => 'Choose your language';

  @override
  String get chooseLanguageSubtitle =>
      'Pick the language you are most comfortable with. You can change it anytime from Settings.';

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
  String get homeSubtitle =>
      'Fresh groceries, hot food and daily essentials delivered from shops near you.';

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
  String get loginSubtitle =>
      'Enter your email or mobile number and we will send you a verification code.';

  @override
  String get emailOrPhoneLabel => 'Email or mobile number';

  @override
  String get emailOrPhoneHint => 'name@example.com or 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'Enter a valid email address or 10-digit mobile number';

  @override
  String get sendCode => 'Send code';

  @override
  String get agreeToTermsOnContinue =>
      'By continuing you agree to our Terms of Service and Privacy Policy.';

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
  String get incorrectCode =>
      'That code is not correct or has expired. Request a new one.';

  @override
  String get enterFullCode => 'Enter all 6 digits';

  @override
  String get accountSuspended =>
      'This account has been suspended. Please contact support.';

  @override
  String get tooManyAttempts =>
      'Too many attempts. Please wait a while and try again.';

  @override
  String get sessionExpired =>
      'Your session has expired. Please sign in again.';

  @override
  String get networkError =>
      'No internet connection. Check your connection and try again.';

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
  String get searchNoResultsSubtitle =>
      'Try a different dish, cuisine or restaurant name.';

  @override
  String get cravingTitle => 'What are you craving?';

  @override
  String get offersTitle => 'Offers for you';

  @override
  String get restaurantsNearby => 'Restaurants near you';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count restaurants',
      one: '1 restaurant',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'Nothing here yet';

  @override
  String get noRestaurantsSubtitle =>
      'Try another category, or clear the filter.';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ratings',
      one: '1 rating',
    );
    return '$_temp0';
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
  String get noVegDishesSubtitle =>
      'Turn off the veg filter to see the full menu.';

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
  String get cartEmptySubtitle =>
      'Add dishes from a restaurant to get started.';

  @override
  String get browseRestaurants => 'Browse restaurants';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
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
  String placeOrderFor(String amount) {
    return 'Place order · $amount';
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
  String get prototypeNotice =>
      'Sample storefront — real shops arrive with the catalogue API.';

  @override
  String get prototypeCheckoutNotice =>
      'This is a prototype. No payment is taken and no order is really placed.';

  @override
  String get prototypeTrackingNotice =>
      'Tracking is simulated for the prototype.';

  @override
  String get locationTitle => 'Where should we deliver?';

  @override
  String get locationSubtitle =>
      'Nexmile delivers from shops within 1 km, so we need your exact spot to show what can reach you.';

  @override
  String get locationReasonRadiusTitle => 'Shops within 1 km';

  @override
  String get locationReasonRadiusBody =>
      'We only list kitchens close enough to arrive hot.';

  @override
  String get locationReasonAccuracyTitle => 'No missed doorsteps';

  @override
  String get locationReasonAccuracyBody =>
      'An exact pin means your rider finds you without calling.';

  @override
  String get locationReasonPrivacyTitle => 'Only while you use the app';

  @override
  String get locationReasonPrivacyBody =>
      'We never track you in the background, and you can type the address instead.';

  @override
  String get allowLocation => 'Allow location';

  @override
  String get enterAddressManually => 'I\'ll enter my address instead';

  @override
  String get locationDenied =>
      'Location permission was declined. You can still drop the pin yourself.';

  @override
  String get locationDeniedForever =>
      'Location is blocked for Nexmile. Turn it on in Settings, or place the pin by hand.';

  @override
  String get locationServiceOff => 'Location is switched off on this device.';

  @override
  String get locationUnavailable =>
      'We could not get a location fix. Please place the pin yourself.';

  @override
  String get openSettings => 'Settings';

  @override
  String get pinLocationTitle => 'Set your delivery pin';

  @override
  String get deliveryRadiusHint =>
      'The circle shows the 1 km Nexmile delivers within.';

  @override
  String get useMyLocation => 'Use my location';

  @override
  String get deliveringHere => 'DELIVERING HERE';

  @override
  String get dragToAdjust => 'Drag the map to adjust the pin';

  @override
  String get confirmLocation => 'Confirm location';

  @override
  String get addressDetailsTitle => 'Address details';

  @override
  String get addressDetailsSubtitle =>
      'Add the flat and landmark so your rider reaches the right door.';

  @override
  String get pinnedLocation => 'Pinned location';

  @override
  String get changePin => 'Change';

  @override
  String get saveAddressAs => 'Save this address as';

  @override
  String get labelHome => 'Home';

  @override
  String get labelWork => 'Work';

  @override
  String get labelOther => 'Other';

  @override
  String get addressLine1Label => 'Flat, house or building';

  @override
  String get addressLine1Hint => '12A, Green Residency';

  @override
  String get addressLine2Label => 'Street or area';

  @override
  String get addressLine2Hint => '2nd Avenue, Anna Nagar';

  @override
  String get landmarkLabel => 'Landmark';

  @override
  String get landmarkHint => 'Opposite the bus stop';

  @override
  String get cityLabel => 'City';

  @override
  String get stateLabel => 'State';

  @override
  String get pincodeLabel => 'PIN code';

  @override
  String get invalidPincode => 'Enter a valid 6-digit PIN code';

  @override
  String get contactNameLabel => 'Contact name';

  @override
  String get contactPhoneLabel => 'Contact number';

  @override
  String get invalidMobileNumber => 'Enter a valid 10-digit mobile number';

  @override
  String get makeDefaultAddress => 'Deliver here by default';

  @override
  String get saveAddress => 'Save address';

  @override
  String get addressSaved => 'Address saved';

  @override
  String get addressBookTitle => 'Delivery addresses';

  @override
  String get manageAddresses => 'Manage saved addresses';

  @override
  String get noAddressesTitle => 'No addresses yet';

  @override
  String get noAddressesSubtitle =>
      'Add one so we can show the shops that deliver to you.';

  @override
  String get addAddress => 'Add address';

  @override
  String get setAsDefault => 'Set as default';

  @override
  String get editLabel => 'Edit';

  @override
  String get addressUpdated => 'Address updated';

  @override
  String get deleteLabel => 'Delete';

  @override
  String get deleteAddressTitle => 'Delete this address?';

  @override
  String get deleteAddressMessage => 'You can always add it again later.';

  @override
  String get rescueDealsTitle => 'Food Rescue';

  @override
  String get notTakingOrders => 'Not taking orders';

  @override
  String get closedRightNow => 'Closed right now';

  @override
  String minimumOrder(String amount) {
    return 'Min $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count left';
  }

  @override
  String get soldOut => 'Sold out';

  @override
  String get menuEmptyTitle => 'No dishes yet';

  @override
  String get menuEmptySubtitle => 'This restaurant has not added its menu.';

  @override
  String get moreDishesTitle => 'More dishes';

  @override
  String get customisable => 'Customisable';

  @override
  String get requiredLabel => 'Required';

  @override
  String get optionalLabel => 'Optional';

  @override
  String get chooseOne => 'Choose one';

  @override
  String chooseUpTo(int count) {
    return 'Choose up to $count';
  }

  @override
  String chooseAtLeast(int count) {
    return 'Choose at least $count';
  }

  @override
  String chooseBetween(int min, int max) {
    return 'Choose $min to $max';
  }

  @override
  String get specialInstructions => 'Special instructions';

  @override
  String get specialInstructionsHint => 'Less spicy, no onion…';

  @override
  String addForAmount(String amount) {
    return 'Add · $amount';
  }

  @override
  String get deliveryLabel => 'Delivery';

  @override
  String get pickupLabel => 'Pickup';

  @override
  String get packagingLabel => 'Packaging';

  @override
  String get discountLabel => 'Discount';

  @override
  String get billDetailsTitle => 'Bill details';

  @override
  String get clearCart => 'Clear cart';

  @override
  String get clearCartTitle => 'Clear this cart?';

  @override
  String get clearCartMessage => 'Everything in it will be removed.';

  @override
  String unavailableItemsNotice(String items) {
    return 'No longer available: $items';
  }

  @override
  String get removeUnavailable => 'Remove them';

  @override
  String minimumNotMet(String amount) {
    return 'Minimum order is $amount';
  }

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get deliveryAddressLabel => 'Delivery address';

  @override
  String get noAddressSelected => 'No address chosen';

  @override
  String get paymentMethodLabel => 'Payment';

  @override
  String get payOnDelivery => 'Cash on delivery';

  @override
  String get noteToRestaurant => 'Note for the restaurant';

  @override
  String get noteToRestaurantHint => 'Ring the bell twice…';

  @override
  String get activeOrdersTitle => 'In progress';

  @override
  String get pastOrdersTitle => 'Earlier';

  @override
  String get orderItemsTitle => 'Items';

  @override
  String get orderProgressTitle => 'Progress';

  @override
  String get arrivingIn => 'Arriving in';

  @override
  String get pickupCodeLabel => 'Pickup code';

  @override
  String get cancellationReasonLabel => 'Why it was cancelled';

  @override
  String get riderLabel => 'Delivery partner';

  @override
  String get callRider => 'Call';

  @override
  String get trackRider => 'Track rider';

  @override
  String get riderLocationSoon =>
      'Your rider\'s location will appear here once they pick up your order.';

  @override
  String get recentreOnRider => 'Recentre on rider';

  @override
  String get viewInvoice => 'Tax invoice';

  @override
  String get cancelOrder => 'Cancel order';

  @override
  String get cancelOrderTitle => 'Cancel this order?';

  @override
  String get cancelOrderMessage =>
      'You can only cancel before the restaurant accepts it.';

  @override
  String get cancelReasonLabel => 'Reason';

  @override
  String get cancelReasonFallback => 'Cancelled by the customer';

  @override
  String get orderCancelled => 'Order cancelled';

  @override
  String get currentLocationLabel => 'Current location';

  @override
  String get editProfileTitle => 'Edit profile';

  @override
  String get editProfileSubtitle =>
      'Your name is what the restaurant and the delivery partner see.';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get profileUpdated => 'Profile updated';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountTitle => 'Delete your account?';

  @override
  String get deleteAccountMessage =>
      'You will be signed out everywhere. Past orders and invoices are kept for tax records.';

  @override
  String get accountDeleted => 'Your account has been deleted';

  @override
  String get devicesTitle => 'Signed-in devices';

  @override
  String get devicesSubtitle => 'Where you are signed in';

  @override
  String get devicesEmptyTitle => 'No other devices';

  @override
  String get devicesEmptySubtitle => 'You are signed in on this device only.';

  @override
  String get signOutDevice => 'Sign out';

  @override
  String get signOutDeviceTitle => 'Sign out this device?';

  @override
  String get signOutDeviceMessage =>
      'If this is the device you are using, you will have to sign in again.';

  @override
  String get deviceSignedOut => 'Device signed out';

  @override
  String get signOutEverywhere => 'Sign out everywhere';

  @override
  String get signOutEverywhereTitle => 'Sign out everywhere?';

  @override
  String get signOutEverywhereMessage =>
      'Every device, including this one, will be signed out.';

  @override
  String get unknownDevice => 'Unknown device';

  @override
  String get activeNow => 'Active now';

  @override
  String minutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String hoursAgo(int count) {
    return '$count h ago';
  }

  @override
  String daysAgo(int count) {
    return '$count d ago';
  }

  @override
  String get filtersAndSorting => 'Filters and sorting';

  @override
  String get clearAll => 'Clear all';

  @override
  String get showResults => 'Show results';

  @override
  String get closeLabel => 'Close';

  @override
  String get sortByTitle => 'Sort by';

  @override
  String get sortRelevance => 'Relevance';

  @override
  String get sortRating => 'Rating';

  @override
  String get sortDeliveryTime => 'Delivery time';

  @override
  String get sortCostLowHigh => 'Cost: low to high';

  @override
  String get sortCostHighLow => 'Cost: high to low';

  @override
  String get timeSection => 'Time';

  @override
  String get nearAndFast => 'Near & Fast';

  @override
  String get openNow => 'Open now';

  @override
  String get ratingSection => 'Restaurant rating';

  @override
  String ratedAbove(String rating) {
    return 'Rated $rating+';
  }

  @override
  String get offersSection => 'Offers';

  @override
  String get hasOffersLabel => 'Has offers';

  @override
  String get dishPriceSection => 'Dish price';

  @override
  String costUnder(String amount) {
    return 'Under $amount';
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
  String get moreSection => 'More';

  @override
  String get noPackagingCharges => 'No packaging charges';

  @override
  String get allRestaurantsTitle => 'All restaurants';

  @override
  String get whatsOnYourMind => 'What\'s on your mind?';

  @override
  String get listeningNow => 'Listening…';

  @override
  String get speakNowHint => 'Say a dish or a restaurant';

  @override
  String get voiceUnavailable => 'Voice search is unavailable';

  @override
  String get voiceUnavailableBody => 'You can still type your search.';

  @override
  String get microphoneDenied => 'Microphone access is off';

  @override
  String get voiceSearchLabel => 'Search by voice';

  @override
  String get ratingsAndReviews => 'Ratings & reviews';

  @override
  String get reviewsWithTextOnly => 'With reviews';

  @override
  String get noReviewsTitle => 'No ratings yet';

  @override
  String get noReviewsSubtitle =>
      'Be the first to rate this place after your order.';

  @override
  String get rateOrderTitle => 'Rate your order';

  @override
  String get rateDishesTitle => 'Rate the dishes';

  @override
  String get reviewHint => 'Anything you would like to add? (optional)';

  @override
  String get submitRating => 'Submit rating';

  @override
  String get reviewThanks => 'Thanks — your rating is in.';

  @override
  String get rateThisOrder => 'Rate this order';
}
