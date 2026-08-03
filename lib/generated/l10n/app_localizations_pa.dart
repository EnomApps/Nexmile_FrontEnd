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
}
