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
