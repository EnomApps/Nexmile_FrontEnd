import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_as.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_brx.dart';
import 'app_localizations_doi.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_kok.dart';
import 'app_localizations_ks.dart';
import 'app_localizations_mai.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mni.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_sa.dart';
import 'app_localizations_sat.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('as'),
    Locale('bn'),
    Locale('brx'),
    Locale('doi'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('kok'),
    Locale('ks'),
    Locale('mai'),
    Locale('ml'),
    Locale('mni'),
    Locale('mr'),
    Locale('ne'),
    Locale('or'),
    Locale('pa'),
    Locale('sa'),
    Locale('sat'),
    Locale('sd'),
    Locale('ta'),
    Locale('te'),
    Locale('ur')
  ];

  /// The application name. Kept as-is (Latin script) in every locale.
  ///
  /// In en, this message translates to:
  /// **'Nexmile'**
  String get appName;

  /// Validation error shown under an empty required field.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// Brand tagline shown under the logo on the splash screen.
  ///
  /// In en, this message translates to:
  /// **'Fast Delivery. Fresh Smiles.'**
  String get tagline;

  /// Headline of the language selection screen.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguageTitle;

  /// Supporting copy under the language screen headline.
  ///
  /// In en, this message translates to:
  /// **'Pick the language you are most comfortable with. You can change it anytime from Settings.'**
  String get chooseLanguageSubtitle;

  /// Placeholder text inside the language search field.
  ///
  /// In en, this message translates to:
  /// **'Search language'**
  String get searchLanguageHint;

  /// Empty state shown when the search query matches no language.
  ///
  /// In en, this message translates to:
  /// **'No language found'**
  String get noLanguageFound;

  /// Count of languages offered by the app.
  ///
  /// In en, this message translates to:
  /// **'{count} languages available'**
  String languagesAvailable(int count);

  /// Generic confirm action.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// Accessibility label on the currently selected language tile.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selectedLabel;

  /// Badge shown on English, the default language.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// Greeting headline on the dashboard.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Nexmile'**
  String get homeTitle;

  /// Supporting copy on the dashboard.
  ///
  /// In en, this message translates to:
  /// **'Fresh groceries, hot food and daily essentials delivered from shops near you.'**
  String get homeSubtitle;

  /// Action that reopens the language selection screen.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// Snackbar confirmation shown after the language changes.
  ///
  /// In en, this message translates to:
  /// **'Language updated'**
  String get languageUpdated;

  /// Label preceding the name of the currently active language.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguageLabel;

  /// Personalised greeting on the dashboard.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String greetingNamed(String name);

  /// Headline of the sign-in screen. Serves new and returning customers alike: the API creates the account on first successful verification.
  ///
  /// In en, this message translates to:
  /// **'Sign in to Nexmile'**
  String get loginTitle;

  /// Supporting copy on the sign-in screen.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or mobile number and we will send you a verification code.'**
  String get loginSubtitle;

  /// Label of the single sign-in field, which accepts either.
  ///
  /// In en, this message translates to:
  /// **'Email or mobile number'**
  String get emailOrPhoneLabel;

  /// Placeholder showing both accepted formats. Keep the example values as-is; translate only the word 'or'.
  ///
  /// In en, this message translates to:
  /// **'name@example.com or 9876543210'**
  String get emailOrPhoneHint;

  /// Validation error when the sign-in field is neither a valid email nor a valid Indian mobile number.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address or 10-digit mobile number'**
  String get invalidEmailOrPhone;

  /// Primary button on the sign-in screen.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// Implicit-consent note under the sign-in button. There is no registration form, so this is the only place terms can be surfaced.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Terms of Service and Privacy Policy.'**
  String get agreeToTermsOnContinue;

  /// Headline of the code verification screen.
  ///
  /// In en, this message translates to:
  /// **'Verify it is you'**
  String get otpTitle;

  /// Supporting copy naming the email or mobile number the code went to.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code we sent to {target}'**
  String otpSubtitle(String target);

  /// Primary button on the code verification screen.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyCode;

  /// Action that requests a fresh code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// Cooldown label. The wait comes from the server's resend_after value.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {seconds}s'**
  String resendCodeIn(int seconds);

  /// Snackbar confirming a fresh code.
  ///
  /// In en, this message translates to:
  /// **'A new code has been sent'**
  String get codeResent;

  /// Error for a wrong or expired code. Five wrong attempts burn the code, so the copy points at requesting another.
  ///
  /// In en, this message translates to:
  /// **'That code is not correct or has expired. Request a new one.'**
  String get incorrectCode;

  /// Error shown when Verify is pressed with an incomplete code.
  ///
  /// In en, this message translates to:
  /// **'Enter all 6 digits'**
  String get enterFullCode;

  /// Shown on HTTP 403 from the API.
  ///
  /// In en, this message translates to:
  /// **'This account has been suspended. Please contact support.'**
  String get accountSuspended;

  /// Shown on HTTP 429. Codes are limited to 5 per hour per identifier, 60 seconds apart.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please wait a while and try again.'**
  String get tooManyAttempts;

  /// Shown when the refresh token is rejected and the session cannot be restored.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get sessionExpired;

  /// Shown when the request never reached the server.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your connection and try again.'**
  String get networkError;

  /// Label on the card showing the API's debug_code. Only present outside production, while there is no SMS gateway.
  ///
  /// In en, this message translates to:
  /// **'Development code'**
  String get developmentCode;

  /// Action that ends the session on this device.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// Snackbar after signing out.
  ///
  /// In en, this message translates to:
  /// **'You have been signed out'**
  String get signedOut;

  /// Generic fallback error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// Title of the profile screen, and the label of the dashboard row that opens it.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Dashboard action that opens the profile screen.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get viewProfile;

  /// Profile field label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Profile field label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Profile field label.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileLabel;

  /// Profile field label.
  ///
  /// In en, this message translates to:
  /// **'Account status'**
  String get accountStatusLabel;

  /// Account status. Customers are active immediately after verifying a code.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// Account status. Not expected for customers — riders await approval, customers do not.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// Account status.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get statusSuspended;

  /// Badge next to a mobile number the customer has verified by code.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verifiedLabel;

  /// Placeholder for a profile field the customer has not filled in. Signing in with a phone leaves the email empty, and vice versa.
  ///
  /// In en, this message translates to:
  /// **'Not added'**
  String get notProvided;

  /// Action on the profile screen when the refresh failed.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// Bottom navigation tab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navigation tab.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// Bottom navigation tab.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get navOrders;

  /// Dismisses a dialog without acting.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelLabel;

  /// Caption above the delivery address in the home header. Shown in capitals in English; use whatever reads as a small caption in other scripts.
  ///
  /// In en, this message translates to:
  /// **'DELIVER TO'**
  String get deliverTo;

  /// Placeholder in the storefront search field.
  ///
  /// In en, this message translates to:
  /// **'Search for dishes or restaurants'**
  String get searchDishesHint;

  /// Title of the search tab.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitle;

  /// Empty state when a search returns nothing.
  ///
  /// In en, this message translates to:
  /// **'Nothing matched'**
  String get searchNoResultsTitle;

  /// Supporting copy for the empty search state.
  ///
  /// In en, this message translates to:
  /// **'Try a different dish, cuisine or restaurant name.'**
  String get searchNoResultsSubtitle;

  /// Heading above the food category shortcuts.
  ///
  /// In en, this message translates to:
  /// **'What are you craving?'**
  String get cravingTitle;

  /// Heading above the promotional carousel.
  ///
  /// In en, this message translates to:
  /// **'Offers for you'**
  String get offersTitle;

  /// Heading above the unfiltered restaurant list.
  ///
  /// In en, this message translates to:
  /// **'Restaurants near you'**
  String get restaurantsNearby;

  /// Heading above the restaurant list once a category filter is applied.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 restaurant} other{{count} restaurants}}'**
  String restaurantsCount(int count);

  /// Empty state when a category has no restaurants.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get noRestaurantsTitle;

  /// Supporting copy for the empty restaurant list.
  ///
  /// In en, this message translates to:
  /// **'Try another category, or clear the filter.'**
  String get noRestaurantsSubtitle;

  /// Delivery time estimate. Keep it short — it sits in a tight row.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String minutesAway(int minutes);

  /// Distance to the restaurant.
  ///
  /// In en, this message translates to:
  /// **'{distance} km'**
  String kilometresAway(String distance);

  /// Number of customer ratings a restaurant has.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 rating} other{{count} ratings}}'**
  String ratingsCount(int count);

  /// Typical spend for two people. Keep the ₹ symbol.
  ///
  /// In en, this message translates to:
  /// **'₹{amount} for two'**
  String priceForTwo(int amount);

  /// Badge on restaurants that do not charge for delivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get freeDelivery;

  /// Short discount badge on a restaurant card. Space is very tight.
  ///
  /// In en, this message translates to:
  /// **'{percent}% OFF'**
  String percentOff(int percent);

  /// Offer strip on the restaurant screen.
  ///
  /// In en, this message translates to:
  /// **'{percent}% off on your order'**
  String percentOffOnOrder(int percent);

  /// Toggle that hides non-vegetarian dishes.
  ///
  /// In en, this message translates to:
  /// **'Veg only'**
  String get vegOnly;

  /// Badge on a popular dish.
  ///
  /// In en, this message translates to:
  /// **'BESTSELLER'**
  String get bestseller;

  /// Button that puts one unit of a dish in the cart. Must stay very short.
  ///
  /// In en, this message translates to:
  /// **'ADD'**
  String get addLabel;

  /// Empty state when the veg filter hides everything.
  ///
  /// In en, this message translates to:
  /// **'No veg dishes here'**
  String get noVegDishesTitle;

  /// Supporting copy for the empty veg-filtered menu.
  ///
  /// In en, this message translates to:
  /// **'Turn off the veg filter to see the full menu.'**
  String get noVegDishesSubtitle;

  /// Dialog shown when adding a dish from a different restaurant.
  ///
  /// In en, this message translates to:
  /// **'Start a new cart?'**
  String get replaceCartTitle;

  /// Explains that an order cannot span two restaurants.
  ///
  /// In en, this message translates to:
  /// **'Your cart has items from {restaurant}. Adding this will clear it.'**
  String replaceCartMessage(String restaurant);

  /// Confirms discarding the previous restaurant's cart.
  ///
  /// In en, this message translates to:
  /// **'Clear and add'**
  String get replaceCartConfirm;

  /// Title of the cart screen.
  ///
  /// In en, this message translates to:
  /// **'Your cart'**
  String get cartTitle;

  /// Empty state on the cart screen.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cartEmptyTitle;

  /// Supporting copy for the empty cart.
  ///
  /// In en, this message translates to:
  /// **'Add dishes from a restaurant to get started.'**
  String get cartEmptySubtitle;

  /// Action from an empty cart or empty order list.
  ///
  /// In en, this message translates to:
  /// **'Browse restaurants'**
  String get browseRestaurants;

  /// Item count on the floating cart bar and on an order card.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String itemsInCart(int count);

  /// Action on the floating cart bar.
  ///
  /// In en, this message translates to:
  /// **'View cart'**
  String get viewCart;

  /// Bill line: the dishes before fees.
  ///
  /// In en, this message translates to:
  /// **'Item total'**
  String get itemTotal;

  /// Bill line.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get deliveryFeeLabel;

  /// Bill line.
  ///
  /// In en, this message translates to:
  /// **'Taxes and charges'**
  String get taxesAndCharges;

  /// Replaces the amount on a waived delivery fee.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get freeLabel;

  /// Bill total.
  ///
  /// In en, this message translates to:
  /// **'To pay'**
  String get toPay;

  /// Checkout button carrying the total. The amount arrives already formatted, ₹ symbol included.
  ///
  /// In en, this message translates to:
  /// **'Place order · {amount}'**
  String placeOrderFor(String amount);

  /// Title of the orders tab.
  ///
  /// In en, this message translates to:
  /// **'Your orders'**
  String get ordersTitle;

  /// Empty state on the orders tab.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get ordersEmptyTitle;

  /// Supporting copy for the empty order list.
  ///
  /// In en, this message translates to:
  /// **'Your past orders will show up here.'**
  String get ordersEmptySubtitle;

  /// Refills the cart from a past order.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// Title of the order tracking screen.
  ///
  /// In en, this message translates to:
  /// **'Order {id}'**
  String orderTitle(String id);

  /// Headline on the tracking screen before delivery.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get orderPlacedTitle;

  /// Estimated arrival on the tracking screen.
  ///
  /// In en, this message translates to:
  /// **'Arriving in about {minutes} minutes.'**
  String orderPlacedSubtitle(int minutes);

  /// Headline once the order arrives.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderDeliveredTitle;

  /// Supporting copy once delivered.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your food.'**
  String get orderDeliveredSubtitle;

  /// Tracking step 1.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get statusOrderPlaced;

  /// Tracking step 2.
  ///
  /// In en, this message translates to:
  /// **'Preparing your food'**
  String get statusPreparing;

  /// Tracking step 3.
  ///
  /// In en, this message translates to:
  /// **'On the way'**
  String get statusOnTheWay;

  /// Tracking step 4.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// Leaves the tracking screen while the order is in progress.
  ///
  /// In en, this message translates to:
  /// **'Keep browsing'**
  String get keepBrowsing;

  /// Leaves the tracking screen once delivered.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// Banner making clear the restaurant list is placeholder data.
  ///
  /// In en, this message translates to:
  /// **'Sample storefront — real shops arrive with the catalogue API.'**
  String get prototypeNotice;

  /// Notice above the checkout button.
  ///
  /// In en, this message translates to:
  /// **'This is a prototype. No payment is taken and no order is really placed.'**
  String get prototypeCheckoutNotice;

  /// Notice on the order tracking screen.
  ///
  /// In en, this message translates to:
  /// **'Tracking is simulated for the prototype.'**
  String get prototypeTrackingNotice;

  /// Headline of the screen that explains the location permission before the OS dialog appears.
  ///
  /// In en, this message translates to:
  /// **'Where should we deliver?'**
  String get locationTitle;

  /// Supporting copy on the location explainer.
  ///
  /// In en, this message translates to:
  /// **'Nexmile delivers from shops within 1 km, so we need your exact spot to show what can reach you.'**
  String get locationSubtitle;

  /// First reason for the location permission.
  ///
  /// In en, this message translates to:
  /// **'Shops within 1 km'**
  String get locationReasonRadiusTitle;

  /// Body of the first reason.
  ///
  /// In en, this message translates to:
  /// **'We only list kitchens close enough to arrive hot.'**
  String get locationReasonRadiusBody;

  /// Second reason for the location permission.
  ///
  /// In en, this message translates to:
  /// **'No missed doorsteps'**
  String get locationReasonAccuracyTitle;

  /// Body of the second reason.
  ///
  /// In en, this message translates to:
  /// **'An exact pin means your rider finds you without calling.'**
  String get locationReasonAccuracyBody;

  /// Third reason — the privacy reassurance.
  ///
  /// In en, this message translates to:
  /// **'Only while you use the app'**
  String get locationReasonPrivacyTitle;

  /// Body of the third reason.
  ///
  /// In en, this message translates to:
  /// **'We never track you in the background, and you can type the address instead.'**
  String get locationReasonPrivacyBody;

  /// Primary button that triggers the OS permission dialog.
  ///
  /// In en, this message translates to:
  /// **'Allow location'**
  String get allowLocation;

  /// Declines location and goes straight to the map.
  ///
  /// In en, this message translates to:
  /// **'I\'ll enter my address instead'**
  String get enterAddressManually;

  /// Shown after a recoverable refusal.
  ///
  /// In en, this message translates to:
  /// **'Location permission was declined. You can still drop the pin yourself.'**
  String get locationDenied;

  /// Shown after a permanent refusal, which cannot be re-prompted from inside the app.
  ///
  /// In en, this message translates to:
  /// **'Location is blocked for Nexmile. Turn it on in Settings, or place the pin by hand.'**
  String get locationDeniedForever;

  /// Shown when device location services are disabled.
  ///
  /// In en, this message translates to:
  /// **'Location is switched off on this device.'**
  String get locationServiceOff;

  /// Shown when the fix timed out or failed.
  ///
  /// In en, this message translates to:
  /// **'We could not get a location fix. Please place the pin yourself.'**
  String get locationUnavailable;

  /// Opens the OS settings page so the customer can grant location.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get openSettings;

  /// Title of the map screen.
  ///
  /// In en, this message translates to:
  /// **'Set your delivery pin'**
  String get pinLocationTitle;

  /// Explains the radius drawn on the map.
  ///
  /// In en, this message translates to:
  /// **'The circle shows the 1 km Nexmile delivers within.'**
  String get deliveryRadiusHint;

  /// Re-centres the map on the current GPS fix.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get useMyLocation;

  /// Caption above the resolved address on the map screen.
  ///
  /// In en, this message translates to:
  /// **'DELIVERING HERE'**
  String get deliveringHere;

  /// Placeholder shown while no address has been resolved for the pin yet.
  ///
  /// In en, this message translates to:
  /// **'Drag the map to adjust the pin'**
  String get dragToAdjust;

  /// Accepts the pin and moves on to the address form.
  ///
  /// In en, this message translates to:
  /// **'Confirm location'**
  String get confirmLocation;

  /// Title of the address form.
  ///
  /// In en, this message translates to:
  /// **'Address details'**
  String get addressDetailsTitle;

  /// Supporting copy on the address form.
  ///
  /// In en, this message translates to:
  /// **'Add the flat and landmark so your rider reaches the right door.'**
  String get addressDetailsSubtitle;

  /// Label on the read-only coordinates in the form.
  ///
  /// In en, this message translates to:
  /// **'Pinned location'**
  String get pinnedLocation;

  /// Returns to the map to move the pin.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changePin;

  /// Label above the home/work/other picker.
  ///
  /// In en, this message translates to:
  /// **'Save this address as'**
  String get saveAddressAs;

  /// Address label.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get labelHome;

  /// Address label.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get labelWork;

  /// Address label.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get labelOther;

  /// Required address field.
  ///
  /// In en, this message translates to:
  /// **'Flat, house or building'**
  String get addressLine1Label;

  /// Example for the first address line.
  ///
  /// In en, this message translates to:
  /// **'12A, Green Residency'**
  String get addressLine1Hint;

  /// Optional address field.
  ///
  /// In en, this message translates to:
  /// **'Street or area'**
  String get addressLine2Label;

  /// Example for the second address line.
  ///
  /// In en, this message translates to:
  /// **'2nd Avenue, Anna Nagar'**
  String get addressLine2Hint;

  /// Optional address field — often what actually helps a rider in India.
  ///
  /// In en, this message translates to:
  /// **'Landmark'**
  String get landmarkLabel;

  /// Example landmark.
  ///
  /// In en, this message translates to:
  /// **'Opposite the bus stop'**
  String get landmarkHint;

  /// Required address field.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get cityLabel;

  /// Required address field.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get stateLabel;

  /// Required 6-digit Indian postal code.
  ///
  /// In en, this message translates to:
  /// **'PIN code'**
  String get pincodeLabel;

  /// Validation error for a malformed PIN code.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 6-digit PIN code'**
  String get invalidPincode;

  /// Optional — who the rider should ask for.
  ///
  /// In en, this message translates to:
  /// **'Contact name'**
  String get contactNameLabel;

  /// Optional — an alternate number for this address.
  ///
  /// In en, this message translates to:
  /// **'Contact number'**
  String get contactPhoneLabel;

  /// Validation error for the contact number.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit mobile number'**
  String get invalidMobileNumber;

  /// Toggle that marks the address as the default.
  ///
  /// In en, this message translates to:
  /// **'Deliver here by default'**
  String get makeDefaultAddress;

  /// Primary button on the address form.
  ///
  /// In en, this message translates to:
  /// **'Save address'**
  String get saveAddress;

  /// Snackbar after a successful save.
  ///
  /// In en, this message translates to:
  /// **'Address saved'**
  String get addressSaved;

  /// Title of the address book, and its row on the profile.
  ///
  /// In en, this message translates to:
  /// **'Delivery addresses'**
  String get addressBookTitle;

  /// Value on the profile row that opens the address book.
  ///
  /// In en, this message translates to:
  /// **'Manage saved addresses'**
  String get manageAddresses;

  /// Empty state in the address book.
  ///
  /// In en, this message translates to:
  /// **'No addresses yet'**
  String get noAddressesTitle;

  /// Supporting copy for the empty address book.
  ///
  /// In en, this message translates to:
  /// **'Add one so we can show the shops that deliver to you.'**
  String get noAddressesSubtitle;

  /// Starts the location flow for a new address.
  ///
  /// In en, this message translates to:
  /// **'Add address'**
  String get addAddress;

  /// Makes a saved address the default.
  ///
  /// In en, this message translates to:
  /// **'Set as default'**
  String get setAsDefault;

  /// Opens a saved address for correction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editLabel;

  /// Snackbar after a successful PATCH of an address.
  ///
  /// In en, this message translates to:
  /// **'Address updated'**
  String get addressUpdated;

  /// Deletes a saved address.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteLabel;

  /// Confirmation dialog title.
  ///
  /// In en, this message translates to:
  /// **'Delete this address?'**
  String get deleteAddressTitle;

  /// Confirmation dialog body.
  ///
  /// In en, this message translates to:
  /// **'You can always add it again later.'**
  String get deleteAddressMessage;

  /// Heading over the Food Rescue carousel — surplus food, discounted.
  ///
  /// In en, this message translates to:
  /// **'Food Rescue'**
  String get rescueDealsTitle;

  /// Shown when a restaurant is inside its hours but has paused orders.
  ///
  /// In en, this message translates to:
  /// **'Not taking orders'**
  String get notTakingOrders;

  /// Shown when a restaurant is outside its opening hours.
  ///
  /// In en, this message translates to:
  /// **'Closed right now'**
  String get closedRightNow;

  /// Smallest order a restaurant accepts. The amount arrives already formatted with the ₹ symbol.
  ///
  /// In en, this message translates to:
  /// **'Min {amount}'**
  String minimumOrder(String amount);

  /// How many portions of a Food Rescue deal remain. A rescue deal is a race, so this is prominent.
  ///
  /// In en, this message translates to:
  /// **'{count} left'**
  String portionsLeft(int count);

  /// Badge on a dish the kitchen has run out of.
  ///
  /// In en, this message translates to:
  /// **'Sold out'**
  String get soldOut;

  /// Title when a restaurant has published no dishes.
  ///
  /// In en, this message translates to:
  /// **'No dishes yet'**
  String get menuEmptyTitle;

  /// Supporting copy for the empty menu.
  ///
  /// In en, this message translates to:
  /// **'This restaurant has not added its menu.'**
  String get menuEmptySubtitle;

  /// Section heading for dishes the restaurant filed under no category.
  ///
  /// In en, this message translates to:
  /// **'More dishes'**
  String get moreDishesTitle;

  /// Tiny label under ADD on a dish with add-on choices. Space is very tight.
  ///
  /// In en, this message translates to:
  /// **'Customisable'**
  String get customisable;

  /// Badge on an add-on group that must be answered.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredLabel;

  /// Rule under an add-on group with no floor and no ceiling.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optionalLabel;

  /// Rule under an add-on group that takes exactly one choice.
  ///
  /// In en, this message translates to:
  /// **'Choose one'**
  String get chooseOne;

  /// Rule under an optional add-on group with a ceiling.
  ///
  /// In en, this message translates to:
  /// **'Choose up to {count}'**
  String chooseUpTo(int count);

  /// Rule under a required add-on group.
  ///
  /// In en, this message translates to:
  /// **'Choose at least {count}'**
  String chooseAtLeast(int count);

  /// Rule under an add-on group with both a floor and a ceiling.
  ///
  /// In en, this message translates to:
  /// **'Choose {min} to {max}'**
  String chooseBetween(int min, int max);

  /// Heading over the per-dish note field.
  ///
  /// In en, this message translates to:
  /// **'Special instructions'**
  String get specialInstructions;

  /// Placeholder in the per-dish note field.
  ///
  /// In en, this message translates to:
  /// **'Less spicy, no onion…'**
  String get specialInstructionsHint;

  /// Confirm button in the customisation sheet. The amount arrives already formatted with the ₹ symbol.
  ///
  /// In en, this message translates to:
  /// **'Add · {amount}'**
  String addForAmount(String amount);

  /// Fulfilment type: brought to the customer.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get deliveryLabel;

  /// Fulfilment type: collected at the counter.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickupLabel;

  /// Bill line: the packaging charge.
  ///
  /// In en, this message translates to:
  /// **'Packaging'**
  String get packagingLabel;

  /// Bill line: money off.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discountLabel;

  /// Heading over the bill breakdown.
  ///
  /// In en, this message translates to:
  /// **'Bill details'**
  String get billDetailsTitle;

  /// Button that empties the basket.
  ///
  /// In en, this message translates to:
  /// **'Clear cart'**
  String get clearCart;

  /// Title of the confirm-before-emptying dialog.
  ///
  /// In en, this message translates to:
  /// **'Clear this cart?'**
  String get clearCartTitle;

  /// Body of the confirm-before-emptying dialog.
  ///
  /// In en, this message translates to:
  /// **'Everything in it will be removed.'**
  String get clearCartMessage;

  /// Warning naming the dishes that sold out while the cart sat there.
  ///
  /// In en, this message translates to:
  /// **'No longer available: {items}'**
  String unavailableItemsNotice(String items);

  /// Button that drops every sold-out line from the cart.
  ///
  /// In en, this message translates to:
  /// **'Remove them'**
  String get removeUnavailable;

  /// Warning when the cart is under the restaurant minimum. The amount arrives already formatted with the ₹ symbol.
  ///
  /// In en, this message translates to:
  /// **'Minimum order is {amount}'**
  String minimumNotMet(String amount);

  /// Title of the checkout sheet.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// Label over the chosen delivery address.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get deliveryAddressLabel;

  /// Shown in place of an address when none is chosen yet.
  ///
  /// In en, this message translates to:
  /// **'No address chosen'**
  String get noAddressSelected;

  /// Label over the payment method.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentMethodLabel;

  /// The only payment method today: cash handed over on delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get payOnDelivery;

  /// Heading over the per-order note field.
  ///
  /// In en, this message translates to:
  /// **'Note for the restaurant'**
  String get noteToRestaurant;

  /// Placeholder in the per-order note field.
  ///
  /// In en, this message translates to:
  /// **'Ring the bell twice…'**
  String get noteToRestaurantHint;

  /// Heading over orders still in flight.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get activeOrdersTitle;

  /// Heading over finished orders.
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get pastOrdersTitle;

  /// Heading over what was ordered.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get orderItemsTitle;

  /// Heading over the order timeline.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get orderProgressTitle;

  /// Label over the delivery estimate.
  ///
  /// In en, this message translates to:
  /// **'Arriving in'**
  String get arrivingIn;

  /// Label over the code the customer reads out at the counter.
  ///
  /// In en, this message translates to:
  /// **'Pickup code'**
  String get pickupCodeLabel;

  /// Label over the merchant’s reason for cancelling.
  ///
  /// In en, this message translates to:
  /// **'Why it was cancelled'**
  String get cancellationReasonLabel;

  /// Label over the delivery partner’s name.
  ///
  /// In en, this message translates to:
  /// **'Delivery partner'**
  String get riderLabel;

  /// Tooltip on the button that dials the delivery partner.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callRider;

  /// Opens the printable tax invoice in a browser.
  ///
  /// In en, this message translates to:
  /// **'Tax invoice'**
  String get viewInvoice;

  /// Button that cancels an order the restaurant has not accepted yet.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get cancelOrder;

  /// Title of the confirm-before-cancelling dialog.
  ///
  /// In en, this message translates to:
  /// **'Cancel this order?'**
  String get cancelOrderTitle;

  /// Body of the confirm-before-cancelling dialog.
  ///
  /// In en, this message translates to:
  /// **'You can only cancel before the restaurant accepts it.'**
  String get cancelOrderMessage;

  /// Field where the customer says why they are cancelling.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get cancelReasonLabel;

  /// Sent as the reason when the customer types nothing. The merchant reads this.
  ///
  /// In en, this message translates to:
  /// **'Cancelled by the customer'**
  String get cancelReasonFallback;

  /// Confirmation after a successful cancellation.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled'**
  String get orderCancelled;

  /// Small caps label above the home header when the customer has no saved address and the list is anchored on the phone GPS instead.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocationLabel;

  /// Title of the sheet that edits name, email and mobile number.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfileTitle;

  /// Supporting copy explaining why the name matters.
  ///
  /// In en, this message translates to:
  /// **'Your name is what the restaurant and the delivery partner see.'**
  String get editProfileSubtitle;

  /// Confirm button on the edit-profile sheet.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// Confirmation after a successful profile update.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// Button that deletes the account. Destructive.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// Title of the confirm-before-deleting dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get deleteAccountTitle;

  /// Body of the confirm-before-deleting dialog. The server keeps a soft-deleted record so past orders and invoices survive.
  ///
  /// In en, this message translates to:
  /// **'You will be signed out everywhere. Past orders and invoices are kept for tax records.'**
  String get deleteAccountMessage;

  /// Confirmation after the account is deleted.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted'**
  String get accountDeleted;

  /// Title of the screen listing every signed-in device.
  ///
  /// In en, this message translates to:
  /// **'Signed-in devices'**
  String get devicesTitle;

  /// One-line description of the devices screen, also used as the profile row value.
  ///
  /// In en, this message translates to:
  /// **'Where you are signed in'**
  String get devicesSubtitle;

  /// Title when no other device holds a session.
  ///
  /// In en, this message translates to:
  /// **'No other devices'**
  String get devicesEmptyTitle;

  /// Supporting copy for the empty devices list.
  ///
  /// In en, this message translates to:
  /// **'You are signed in on this device only.'**
  String get devicesEmptySubtitle;

  /// Signs one listed device out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutDevice;

  /// Title of the confirm-before-revoking dialog.
  ///
  /// In en, this message translates to:
  /// **'Sign out this device?'**
  String get signOutDeviceTitle;

  /// Body of the confirm dialog. The API gives no way to tell which row is this phone, so the copy has to warn it might be.
  ///
  /// In en, this message translates to:
  /// **'If this is the device you are using, you will have to sign in again.'**
  String get signOutDeviceMessage;

  /// Confirmation after one device is signed out.
  ///
  /// In en, this message translates to:
  /// **'Device signed out'**
  String get deviceSignedOut;

  /// Ends every session on every device, this one included.
  ///
  /// In en, this message translates to:
  /// **'Sign out everywhere'**
  String get signOutEverywhere;

  /// Title of the confirm-before-signing-out-everywhere dialog.
  ///
  /// In en, this message translates to:
  /// **'Sign out everywhere?'**
  String get signOutEverywhereTitle;

  /// Body of that dialog.
  ///
  /// In en, this message translates to:
  /// **'Every device, including this one, will be signed out.'**
  String get signOutEverywhereMessage;

  /// Shown in place of a device name when the API returns none.
  ///
  /// In en, this message translates to:
  /// **'Unknown device'**
  String get unknownDevice;

  /// Shown when a device used its session in the last couple of minutes.
  ///
  /// In en, this message translates to:
  /// **'Active now'**
  String get activeNow;

  /// How long ago a device last used its session. Keep it short — it sits under a device name.
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String minutesAgo(int count);

  /// How long ago a device last used its session.
  ///
  /// In en, this message translates to:
  /// **'{count} h ago'**
  String hoursAgo(int count);

  /// How long ago a device last used its session.
  ///
  /// In en, this message translates to:
  /// **'{count} d ago'**
  String daysAgo(int count);

  /// Title of the filter sheet.
  ///
  /// In en, this message translates to:
  /// **'Filters and sorting'**
  String get filtersAndSorting;

  /// Resets every filter in the sheet.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// Confirms the filter sheet and re-queries the list.
  ///
  /// In en, this message translates to:
  /// **'Show results'**
  String get showResults;

  /// Dismisses the filter sheet without applying anything.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeLabel;

  /// Section heading over the sort options.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortByTitle;

  /// Default sort — the server decides the order.
  ///
  /// In en, this message translates to:
  /// **'Relevance'**
  String get sortRelevance;

  /// Sort by customer rating, highest first.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get sortRating;

  /// Sort by fastest delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery time'**
  String get sortDeliveryTime;

  /// Sort by price, cheapest first.
  ///
  /// In en, this message translates to:
  /// **'Cost: low to high'**
  String get sortCostLowHigh;

  /// Sort by price, dearest first.
  ///
  /// In en, this message translates to:
  /// **'Cost: high to low'**
  String get sortCostHighLow;

  /// Filter section heading.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeSection;

  /// Filter chip for close, quick restaurants. What qualifies is decided by the server.
  ///
  /// In en, this message translates to:
  /// **'Near & Fast'**
  String get nearAndFast;

  /// Filter chip hiding shut restaurants.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get openNow;

  /// Filter section heading over the rating thresholds.
  ///
  /// In en, this message translates to:
  /// **'Restaurant rating'**
  String get ratingSection;

  /// Rating threshold chip in the filter sheet.
  ///
  /// In en, this message translates to:
  /// **'Rated {rating}+'**
  String ratedAbove(String rating);

  /// Filter section heading.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offersSection;

  /// Filter chip for restaurants running a promotion.
  ///
  /// In en, this message translates to:
  /// **'Has offers'**
  String get hasOffersLabel;

  /// Filter section heading over the price brackets.
  ///
  /// In en, this message translates to:
  /// **'Dish price'**
  String get dishPriceSection;

  /// Price bracket. The amount arrives already formatted with the rupee symbol.
  ///
  /// In en, this message translates to:
  /// **'Under {amount}'**
  String costUnder(String amount);

  /// Price bracket between two already-formatted amounts.
  ///
  /// In en, this message translates to:
  /// **'{min} – {max}'**
  String costBetween(String min, String max);

  /// Open-ended top price bracket.
  ///
  /// In en, this message translates to:
  /// **'{amount}+'**
  String costOver(String amount);

  /// Filter section heading over the remaining toggles.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreSection;

  /// Filter for restaurants that add no packaging fee.
  ///
  /// In en, this message translates to:
  /// **'No packaging charges'**
  String get noPackagingCharges;

  /// Heading over the full nearby list, below the curated home sections.
  ///
  /// In en, this message translates to:
  /// **'All restaurants'**
  String get allRestaurantsTitle;

  /// Heading over the cuisine grid on the search screen, before anything is typed.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get whatsOnYourMind;

  /// Title of the voice-search sheet while the microphone is open.
  ///
  /// In en, this message translates to:
  /// **'Listening…'**
  String get listeningNow;

  /// Placeholder under the microphone before any words are recognised.
  ///
  /// In en, this message translates to:
  /// **'Say a dish or a restaurant'**
  String get speakNowHint;

  /// Shown when the device has no speech recogniser at all.
  ///
  /// In en, this message translates to:
  /// **'Voice search is unavailable'**
  String get voiceUnavailable;

  /// Supporting copy for the unavailable and denied states — typing always works.
  ///
  /// In en, this message translates to:
  /// **'You can still type your search.'**
  String get voiceUnavailableBody;

  /// Shown when microphone permission was refused.
  ///
  /// In en, this message translates to:
  /// **'Microphone access is off'**
  String get microphoneDenied;

  /// Tooltip on the microphone button in the search field.
  ///
  /// In en, this message translates to:
  /// **'Search by voice'**
  String get voiceSearchLabel;

  /// Title of the ratings and reviews screen.
  ///
  /// In en, this message translates to:
  /// **'Ratings & reviews'**
  String get ratingsAndReviews;

  /// Filter chip that hides ratings with no written review.
  ///
  /// In en, this message translates to:
  /// **'With reviews'**
  String get reviewsWithTextOnly;

  /// Empty state when a restaurant has no ratings at all.
  ///
  /// In en, this message translates to:
  /// **'No ratings yet'**
  String get noReviewsTitle;

  /// Supporting copy for the empty reviews list.
  ///
  /// In en, this message translates to:
  /// **'Be the first to rate this place after your order.'**
  String get noReviewsSubtitle;

  /// Title of the screen where a customer rates a finished order.
  ///
  /// In en, this message translates to:
  /// **'Rate your order'**
  String get rateOrderTitle;

  /// Heading above the per-dish star rows.
  ///
  /// In en, this message translates to:
  /// **'Rate the dishes'**
  String get rateDishesTitle;

  /// Placeholder in the optional free-text comment field.
  ///
  /// In en, this message translates to:
  /// **'Anything you would like to add? (optional)'**
  String get reviewHint;

  /// Button that posts the rating.
  ///
  /// In en, this message translates to:
  /// **'Submit rating'**
  String get submitRating;

  /// Confirmation shown after a rating is accepted.
  ///
  /// In en, this message translates to:
  /// **'Thanks — your rating is in.'**
  String get reviewThanks;

  /// Call to action on a delivered order.
  ///
  /// In en, this message translates to:
  /// **'Rate this order'**
  String get rateThisOrder;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['as', 'bn', 'brx', 'doi', 'en', 'gu', 'hi', 'kn', 'kok', 'ks', 'mai', 'ml', 'mni', 'mr', 'ne', 'or', 'pa', 'sa', 'sat', 'sd', 'ta', 'te', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'as': return AppLocalizationsAs();
    case 'bn': return AppLocalizationsBn();
    case 'brx': return AppLocalizationsBrx();
    case 'doi': return AppLocalizationsDoi();
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
    case 'kn': return AppLocalizationsKn();
    case 'kok': return AppLocalizationsKok();
    case 'ks': return AppLocalizationsKs();
    case 'mai': return AppLocalizationsMai();
    case 'ml': return AppLocalizationsMl();
    case 'mni': return AppLocalizationsMni();
    case 'mr': return AppLocalizationsMr();
    case 'ne': return AppLocalizationsNe();
    case 'or': return AppLocalizationsOr();
    case 'pa': return AppLocalizationsPa();
    case 'sa': return AppLocalizationsSa();
    case 'sat': return AppLocalizationsSat();
    case 'sd': return AppLocalizationsSd();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
