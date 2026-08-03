// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'ઝડપી ડિલિવરી. તાજા સ્મિત.';

  @override
  String get chooseLanguageTitle => 'તમારી ભાષા પસંદ કરો';

  @override
  String get chooseLanguageSubtitle => 'તમને અનુકૂળ હોય તે ભાષા પસંદ કરો. તમે તેને કોઈપણ સમયે સેટિંગ્સમાં બદલી શકો છો.';

  @override
  String get searchLanguageHint => 'ભાષા શોધો';

  @override
  String get noLanguageFound => 'કોઈ ભાષા મળી નથી';

  @override
  String languagesAvailable(int count) {
    return '$count ભાષાઓ ઉપલબ્ધ છે';
  }

  @override
  String get continueLabel => 'આગળ વધો';

  @override
  String get selectedLabel => 'પસંદ કરેલ';

  @override
  String get defaultLabel => 'ડિફૉલ્ટ';

  @override
  String get homeTitle => 'Nexmile માં આપનું સ્વાગત છે';

  @override
  String get homeSubtitle => 'તાજું કરિયાણું, ગરમ ખોરાક અને રોજિંદી જરૂરિયાતો તમારી નજીકની દુકાનોમાંથી.';

  @override
  String get changeLanguage => 'ભાષા બદલો';

  @override
  String get languageUpdated => 'ભાષા બદલાઈ ગઈ';

  @override
  String get appLanguageLabel => 'એપની ભાષા';

  @override
  String greetingNamed(String name) {
    return 'નમસ્તે, $name';
  }

  @override
  String get loginTitle => 'Nexmile માં સાઇન ઇન કરો';

  @override
  String get loginSubtitle => 'તમારો ઇમેઇલ અથવા મોબાઇલ નંબર દાખલ કરો, અમે ચકાસણી કોડ મોકલીશું.';

  @override
  String get emailOrPhoneLabel => 'ઇમેઇલ અથવા મોબાઇલ નંબર';

  @override
  String get emailOrPhoneHint => 'name@example.com અથવા 9876543210';

  @override
  String get invalidEmailOrPhone => 'માન્ય ઇમેઇલ સરનામું અથવા 10 અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get sendCode => 'કોડ મોકલો';

  @override
  String get agreeToTermsOnContinue => 'આગળ વધીને તમે અમારી સેવાની શરતો અને ગોપનીયતા નીતિ સાથે સંમત થાઓ છો.';

  @override
  String get otpTitle => 'ખાતરી કરો કે આ તમે જ છો';

  @override
  String otpSubtitle(String target) {
    return '$target પર મોકલેલ 6 અંકનો કોડ દાખલ કરો';
  }

  @override
  String get verifyCode => 'ચકાસો';

  @override
  String get resendCode => 'કોડ ફરી મોકલો';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds સેકંડમાં ફરી મોકલો';
  }

  @override
  String get codeResent => 'નવો કોડ મોકલી દીધો છે';

  @override
  String get incorrectCode => 'આ કોડ ખોટો છે અથવા સમાપ્ત થઈ ગયો છે. નવો કોડ મંગાવો.';

  @override
  String get enterFullCode => 'પૂરા 6 અંક દાખલ કરો';

  @override
  String get accountSuspended => 'આ ખાતું સ્થગિત કરવામાં આવ્યું છે. કૃપા કરી સપોર્ટનો સંપર્ક કરો.';

  @override
  String get tooManyAttempts => 'ઘણા બધા પ્રયાસો થયા. કૃપા કરી થોડી વાર પછી ફરી પ્રયાસ કરો.';

  @override
  String get sessionExpired => 'તમારું સત્ર સમાપ્ત થઈ ગયું છે. કૃપા કરી ફરી સાઇન ઇન કરો.';

  @override
  String get networkError => 'ઇન્ટરનેટ કનેક્શન નથી. તમારું કનેક્શન તપાસો અને ફરી પ્રયાસ કરો.';

  @override
  String get developmentCode => 'ડેવલપમેન્ટ કોડ';

  @override
  String get signOut => 'સાઇન આઉટ';

  @override
  String get signedOut => 'તમે સાઇન આઉટ થઈ ગયા છો';

  @override
  String get somethingWentWrong => 'કંઈક ખોટું થયું. ફરી પ્રયાસ કરો.';

  @override
  String get profileTitle => 'પ્રોફાઇલ';

  @override
  String get viewProfile => 'પ્રોફાઇલ જુઓ';

  @override
  String get nameLabel => 'નામ';

  @override
  String get emailLabel => 'ઇમેઇલ';

  @override
  String get mobileLabel => 'મોબાઇલ નંબર';

  @override
  String get accountStatusLabel => 'ખાતાની સ્થિતિ';

  @override
  String get statusActive => 'સક્રિય';

  @override
  String get statusPending => 'બાકી';

  @override
  String get statusSuspended => 'સ્થગિત';

  @override
  String get verifiedLabel => 'ચકાસાયેલ';

  @override
  String get notProvided => 'ઉમેર્યું નથી';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';
}
