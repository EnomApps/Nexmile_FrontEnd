// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Konkani (`kok`).
class AppLocalizationsKok extends AppLocalizations {
  AppLocalizationsKok([String locale = 'kok']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'वेगान डिलिव्हरी. ताजें हास्य.';

  @override
  String get chooseLanguageTitle => 'तुमची भास वेंचात';

  @override
  String get chooseLanguageSubtitle => 'तुमकां सोंपी दिसता ती भास वेंचात. तुमी ती केन्नाय सेटिंग्जांत बदलूं येता.';

  @override
  String get searchLanguageHint => 'भास सोदात';

  @override
  String get noLanguageFound => 'खंयचीच भास मेळूंक ना';

  @override
  String languagesAvailable(int count) {
    return '$count भासो उपलब्ध आसात';
  }

  @override
  String get continueLabel => 'फुडें वचात';

  @override
  String get selectedLabel => 'वेंचिल्ली';

  @override
  String get defaultLabel => 'डिफॉल्ट';

  @override
  String get homeTitle => 'Nexmile हांगा येवकार';

  @override
  String get homeSubtitle => 'ताजो किराणो, गरम जेवण आनी दिसपट्ट्यो गरजेच्यो वस्तू तुमच्या लागसारच्या दुकानांतल्यान.';

  @override
  String get changeLanguage => 'भास बदलात';

  @override
  String get languageUpdated => 'भास बदल्ली';

  @override
  String get appLanguageLabel => 'ॲपाची भास';

  @override
  String greetingNamed(String name) {
    return 'नमस्कार, $name';
  }

  @override
  String get loginTitle => 'Nexmile हांगा साइन इन करात';

  @override
  String get loginSubtitle => 'तुमचो ईमेल वा मोबायल क्रमांक घालात, आमी सत्यापन कोड धाडटले.';

  @override
  String get emailOrPhoneLabel => 'ईमेल वा मोबायल क्रमांक';

  @override
  String get emailOrPhoneHint => 'name@example.com वा 9876543210';

  @override
  String get invalidEmailOrPhone => 'योग्य ईमेल नामो वा 10 आंकड्यांचो मोबायल क्रमांक घालात';

  @override
  String get sendCode => 'कोड धाडात';

  @override
  String get agreeToTermsOnContinue => 'फुडें वचून तुमी आमच्यो सेवा अटी आनी गुपीतपण धोरण मान्य करतात.';

  @override
  String get otpTitle => 'हो तुमीच अशें सत्यापित करात';

  @override
  String otpSubtitle(String target) {
    return '$target हाका धाडिल्लो 6 आंकड्यांचो कोड घालात';
  }

  @override
  String get verifyCode => 'सत्यापित करात';

  @override
  String get resendCode => 'कोड परत धाडात';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds सेकंदांनी परत धाडात';
  }

  @override
  String get codeResent => 'नवो कोड धाडला';

  @override
  String get incorrectCode => 'हो कोड चुकीचो आसा वा ताची मुजत सोंपली. नवो कोड मागात.';

  @override
  String get enterFullCode => 'पुराय 6 आंकडे घालात';

  @override
  String get accountSuspended => 'हें खातें निलंबित केलां. उपकार करून आदाराक संपर्क करात.';

  @override
  String get tooManyAttempts => 'खूब फावटीं यत्न जाले. उपकार करून थोड्या वेळान परत यत्न करात.';

  @override
  String get sessionExpired => 'तुमचें सत्र सोंपलां. उपकार करून परत साइन इन करात.';

  @override
  String get networkError => 'इंटरनॅट जोडणी ना. जोडणी तपासात आनी परत यत्न करात.';

  @override
  String get developmentCode => 'डेव्हलपमेंट कोड';

  @override
  String get signOut => 'साइन आवट';

  @override
  String get signedOut => 'तुमी साइन आवट जाल्यात';

  @override
  String get somethingWentWrong => 'कितें तरी चुकलें. उपकार करून परत यत्न करात.';

  @override
  String get profileTitle => 'प्रोफायल';

  @override
  String get viewProfile => 'प्रोफायल पळयात';

  @override
  String get nameLabel => 'नांव';

  @override
  String get emailLabel => 'ईमेल';

  @override
  String get mobileLabel => 'मोबायल क्रमांक';

  @override
  String get accountStatusLabel => 'खात्याची स्थिती';

  @override
  String get statusActive => 'सक्रिय';

  @override
  String get statusPending => 'प्रलंबीत';

  @override
  String get statusSuspended => 'निलंबीत';

  @override
  String get verifiedLabel => 'सत्यापीत';

  @override
  String get notProvided => 'जोडूंक ना';

  @override
  String get retry => 'परत यत्न करात';
}
