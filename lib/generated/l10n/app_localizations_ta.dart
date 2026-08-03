// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'விரைவான டெலிவரி. புத்துணர்ச்சியான புன்னகை.';

  @override
  String get chooseLanguageTitle => 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get chooseLanguageSubtitle => 'உங்களுக்கு வசதியான மொழியைத் தேர்ந்தெடுக்கவும். அமைப்புகளில் எப்போது வேண்டுமானாலும் இதை மாற்றலாம்.';

  @override
  String get searchLanguageHint => 'மொழியைத் தேடுங்கள்';

  @override
  String get noLanguageFound => 'மொழி எதுவும் கிடைக்கவில்லை';

  @override
  String languagesAvailable(int count) {
    return '$count மொழிகள் உள்ளன';
  }

  @override
  String get continueLabel => 'தொடரவும்';

  @override
  String get selectedLabel => 'தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get defaultLabel => 'இயல்பு';

  @override
  String get homeTitle => 'Nexmile-க்கு வரவேற்கிறோம்';

  @override
  String get homeSubtitle => 'புதிய மளிகைப் பொருட்கள், சூடான உணவு மற்றும் அன்றாடத் தேவைகள் உங்கள் அருகிலுள்ள கடைகளிலிருந்து.';

  @override
  String get changeLanguage => 'மொழியை மாற்று';

  @override
  String get languageUpdated => 'மொழி மாற்றப்பட்டது';

  @override
  String get appLanguageLabel => 'செயலி மொழி';

  @override
  String greetingNamed(String name) {
    return 'வணக்கம், $name';
  }

  @override
  String get loginTitle => 'Nexmile-இல் உள்நுழையவும்';

  @override
  String get loginSubtitle => 'உங்கள் மின்னஞ்சல் அல்லது கைபேசி எண்ணை உள்ளிடுங்கள், சரிபார்ப்புக் குறியீட்டை அனுப்புகிறோம்.';

  @override
  String get emailOrPhoneLabel => 'மின்னஞ்சல் அல்லது கைபேசி எண்';

  @override
  String get emailOrPhoneHint => 'name@example.com அல்லது 9876543210';

  @override
  String get invalidEmailOrPhone => 'சரியான மின்னஞ்சல் முகவரி அல்லது 10 இலக்க கைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get sendCode => 'குறியீட்டை அனுப்பு';

  @override
  String get agreeToTermsOnContinue => 'தொடர்வதன் மூலம், எங்கள் சேவை விதிமுறைகள் மற்றும் தனியுரிமைக் கொள்கையை ஏற்கிறீர்கள்.';

  @override
  String get otpTitle => 'நீங்கள்தான் என உறுதிப்படுத்துங்கள்';

  @override
  String otpSubtitle(String target) {
    return '$target க்கு அனுப்பிய 6 இலக்கக் குறியீட்டை உள்ளிடவும்';
  }

  @override
  String get verifyCode => 'சரிபார்க்கவும்';

  @override
  String get resendCode => 'குறியீட்டை மீண்டும் அனுப்பு';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds வினாடிகளில் மீண்டும் அனுப்பலாம்';
  }

  @override
  String get codeResent => 'புதிய குறியீடு அனுப்பப்பட்டது';

  @override
  String get incorrectCode => 'இந்தக் குறியீடு தவறானது அல்லது காலாவதியாகிவிட்டது. புதியதைக் கோரவும்.';

  @override
  String get enterFullCode => '6 இலக்கங்களையும் உள்ளிடவும்';

  @override
  String get accountSuspended => 'இந்தக் கணக்கு இடைநிறுத்தப்பட்டுள்ளது. ஆதரவைத் தொடர்பு கொள்ளவும்.';

  @override
  String get tooManyAttempts => 'பல முறை முயற்சித்துவிட்டீர்கள். சிறிது நேரம் கழித்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get sessionExpired => 'உங்கள் அமர்வு காலாவதியாகிவிட்டது. மீண்டும் உள்நுழையவும்.';

  @override
  String get networkError => 'இணைய இணைப்பு இல்லை. உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get developmentCode => 'டெவலப்மென்ட் குறியீடு';

  @override
  String get signOut => 'வெளியேறு';

  @override
  String get signedOut => 'நீங்கள் வெளியேறிவிட்டீர்கள்';

  @override
  String get somethingWentWrong => 'ஏதோ தவறு நடந்தது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get profileTitle => 'சுயவிவரம்';

  @override
  String get viewProfile => 'சுயவிவரத்தைப் பார்';

  @override
  String get nameLabel => 'பெயர்';

  @override
  String get emailLabel => 'மின்னஞ்சல்';

  @override
  String get mobileLabel => 'கைபேசி எண்';

  @override
  String get accountStatusLabel => 'கணக்கு நிலை';

  @override
  String get statusActive => 'செயலில்';

  @override
  String get statusPending => 'நிலுவையில்';

  @override
  String get statusSuspended => 'இடைநிறுத்தப்பட்டது';

  @override
  String get verifiedLabel => 'சரிபார்க்கப்பட்டது';

  @override
  String get notProvided => 'சேர்க்கப்படவில்லை';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';
}
