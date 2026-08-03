// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'వేగవంతమైన డెలివరీ. తాజా చిరునవ్వులు.';

  @override
  String get chooseLanguageTitle => 'మీ భాషను ఎంచుకోండి';

  @override
  String get chooseLanguageSubtitle => 'మీకు సౌకర్యంగా ఉండే భాషను ఎంచుకోండి. దీన్ని ఎప్పుడైనా సెట్టింగ్‌లలో మార్చుకోవచ్చు.';

  @override
  String get searchLanguageHint => 'భాషను వెతకండి';

  @override
  String get noLanguageFound => 'ఏ భాష కనబడలేదు';

  @override
  String languagesAvailable(int count) {
    return '$count భాషలు అందుబాటులో ఉన్నాయి';
  }

  @override
  String get continueLabel => 'కొనసాగించు';

  @override
  String get selectedLabel => 'ఎంపిక చేయబడింది';

  @override
  String get defaultLabel => 'డిఫాల్ట్';

  @override
  String get homeTitle => 'Nexmile కు స్వాగతం';

  @override
  String get homeSubtitle => 'తాజా కిరాణా సరుకులు, వేడి ఆహారం మరియు నిత్యావసరాలు మీ దగ్గరి దుకాణాల నుండి.';

  @override
  String get changeLanguage => 'భాషను మార్చండి';

  @override
  String get languageUpdated => 'భాష మార్చబడింది';

  @override
  String get appLanguageLabel => 'యాప్ భాష';

  @override
  String greetingNamed(String name) {
    return 'నమస్కారం, $name';
  }

  @override
  String get loginTitle => 'Nexmile లో సైన్ ఇన్ చేయండి';

  @override
  String get loginSubtitle => 'మీ ఇమెయిల్ లేదా మొబైల్ నంబర్‌ను నమోదు చేయండి, మేము ధృవీకరణ కోడ్ పంపుతాము.';

  @override
  String get emailOrPhoneLabel => 'ఇమెయిల్ లేదా మొబైల్ నంబర్';

  @override
  String get emailOrPhoneHint => 'name@example.com లేదా 9876543210';

  @override
  String get invalidEmailOrPhone => 'సరైన ఇమెయిల్ చిరునామా లేదా 10 అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get sendCode => 'కోడ్ పంపు';

  @override
  String get agreeToTermsOnContinue => 'కొనసాగించడం ద్వారా మీరు మా సేవా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తున్నారు.';

  @override
  String get otpTitle => 'ఇది మీరేనని ధృవీకరించండి';

  @override
  String otpSubtitle(String target) {
    return '$target కు పంపిన 6 అంకెల కోడ్‌ను నమోదు చేయండి';
  }

  @override
  String get verifyCode => 'ధృవీకరించు';

  @override
  String get resendCode => 'కోడ్‌ను మళ్ళీ పంపు';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds సెకన్లలో మళ్ళీ పంపు';
  }

  @override
  String get codeResent => 'కొత్త కోడ్ పంపబడింది';

  @override
  String get incorrectCode => 'ఈ కోడ్ తప్పు లేదా గడువు ముగిసింది. కొత్తది కోరండి.';

  @override
  String get enterFullCode => 'మొత్తం 6 అంకెలు నమోదు చేయండి';

  @override
  String get accountSuspended => 'ఈ ఖాతా నిలిపివేయబడింది. దయచేసి సపోర్ట్‌ను సంప్రదించండి.';

  @override
  String get tooManyAttempts => 'చాలా సార్లు ప్రయత్నించారు. కొంతసేపటి తర్వాత మళ్ళీ ప్రయత్నించండి.';

  @override
  String get sessionExpired => 'మీ సెషన్ గడువు ముగిసింది. దయచేసి మళ్ళీ సైన్ ఇన్ చేయండి.';

  @override
  String get networkError => 'ఇంటర్నెట్ కనెక్షన్ లేదు. మీ కనెక్షన్‌ను తనిఖీ చేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get developmentCode => 'డెవలప్‌మెంట్ కోడ్';

  @override
  String get signOut => 'సైన్ అవుట్';

  @override
  String get signedOut => 'మీరు సైన్ అవుట్ అయ్యారు';

  @override
  String get somethingWentWrong => 'ఏదో తప్పు జరిగింది. మళ్ళీ ప్రయత్నించండి.';

  @override
  String get profileTitle => 'ప్రొఫైల్';

  @override
  String get viewProfile => 'ప్రొఫైల్ చూడండి';

  @override
  String get nameLabel => 'పేరు';

  @override
  String get emailLabel => 'ఇమెయిల్';

  @override
  String get mobileLabel => 'మొబైల్ నంబర్';

  @override
  String get accountStatusLabel => 'ఖాతా స్థితి';

  @override
  String get statusActive => 'క్రియాశీలం';

  @override
  String get statusPending => 'పెండింగ్';

  @override
  String get statusSuspended => 'నిలిపివేయబడింది';

  @override
  String get verifiedLabel => 'ధృవీకరించబడింది';

  @override
  String get notProvided => 'జోడించలేదు';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించండి';
}
