// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kashmiri (`ks`).
class AppLocalizationsKs extends AppLocalizations {
  AppLocalizationsKs([String locale = 'ks']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'تیز ڈیلیوری۔ تازٕ مُسکراہٹ۔';

  @override
  String get chooseLanguageTitle => 'پنُن زبان ژارٕو';

  @override
  String get chooseLanguageSubtitle => 'یِم زبان چھِوٕ آسان محسوس کران سُہ ژارٕو۔ توہہِ ہیٚکِو یہ کُنہِ وقتہٕ سیٹِنگز منٛز بدلاوِتھ۔';

  @override
  String get searchLanguageHint => 'زبان ژھانڈٕو';

  @override
  String get noLanguageFound => 'کانہہ زبان نہ لبنہٕ آیہ';

  @override
  String languagesAvailable(int count) {
    return '$count زباناہ چھِ دستیاب';
  }

  @override
  String get continueLabel => 'برونہہ گژھِو';

  @override
  String get selectedLabel => 'ژارنہٕ آمُت';

  @override
  String get defaultLabel => 'ڈیفالٹ';

  @override
  String get homeTitle => 'Nexmile منٛز خوش آمدید';

  @override
  String get homeSubtitle => 'تازٕ گروسری، گرٕم کھَنہٕ تہٕ روزمرٕ ضرورتہٕ توہنٛدِن نزدیٚکی دُکانن پؠٹھٕ۔';

  @override
  String get changeLanguage => 'زبان بدلاوٕو';

  @override
  String get languageUpdated => 'زبان آیہ بدلاونہٕ';

  @override
  String get appLanguageLabel => 'ایپ زبان';

  @override
  String greetingNamed(String name) {
    return 'آداب، $name';
  }

  @override
  String get loginTitle => 'Nexmile منٛز سائن اِن کرِو';

  @override
  String get loginSubtitle => 'پنُن ای میل یا موبائل نمبر لیٚکھِو، اسہٕ سوزو توہہِ تصدیقی کوڈ۔';

  @override
  String get emailOrPhoneLabel => 'ای میل یا موبائل نمبر';

  @override
  String get emailOrPhoneHint => 'name@example.com یا 9876543210';

  @override
  String get invalidEmailOrPhone => 'صحیح ای میل پتہٕ یا 10 ہندسن ہُند موبائل نمبر لیٚکھِو';

  @override
  String get sendCode => 'کوڈ سوزِو';

  @override
  String get agreeToTermsOnContinue => 'برونہہ گژھِتھ چھِوٕ توہہِ ساني سروس شرطن تہٕ پرائیویسی پالیسی سٕتؠ رٲضی گژھان۔';

  @override
  String get otpTitle => 'تصدیق کرِو زِ یہ چھِوٕ توہہِ';

  @override
  String otpSubtitle(String target) {
    return '$target پؠٹھٕ سوزنہٕ آمُت 6 ہندسن ہُند کوڈ لیٚکھِو';
  }

  @override
  String get verifyCode => 'تصدیق کرِو';

  @override
  String get resendCode => 'کوڈ دوبارٕ سوزِو';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds سیکنڈن منٛز دوبارٕ سوزِو';
  }

  @override
  String get codeResent => 'نوٚو کوڈ آو سوزنہٕ';

  @override
  String get incorrectCode => 'یہ کوڈ چھُ غلط یا اَمِ ہُند وقت چھُ گۆمُت۔ نوٚو کوڈ ژھۆنڈِو۔';

  @override
  String get enterFullCode => 'پورٕ 6 ہندسہٕ لیٚکھِو';

  @override
  String get accountSuspended => 'یہ کھاتہٕ چھُ معطل کرنہٕ آمُت۔ مہربٲنی کٔرِتھ سپورٹ سٕتؠ رٲبطہٕ کرِو۔';

  @override
  String get tooManyAttempts => 'زیادٕ کوششہٕ آیہ کرنہٕ۔ مہربٲنی کٔرِتھ کینٛہہ وقتہٕ پتہٕ دوبارٕ کوشش کرِو۔';

  @override
  String get sessionExpired => 'توہنٛد سیشن چھُ ختم گۆمُت۔ مہربٲنی کٔرِتھ دوبارٕ سائن اِن کرِو۔';

  @override
  String get networkError => 'انٹرنیٹ کنکشن چھُ نہ۔ پنُن کنکشن چیک کٔرِتھ دوبارٕ کوشش کرِو۔';

  @override
  String get developmentCode => 'ڈیویلپمنٹ کوڈ';

  @override
  String get signOut => 'سائن آوٹ';

  @override
  String get signedOut => 'توہہِ چھِوٕ سائن آوٹ گژھمٕتؠ';

  @override
  String get somethingWentWrong => 'کینٛہہ غلط گو۔ مہربٲنی کٔرِتھ دوبارٕ کوشش کرِو۔';

  @override
  String get profileTitle => 'پروفائل';

  @override
  String get viewProfile => 'پروفائل وُچھِو';

  @override
  String get nameLabel => 'ناو';

  @override
  String get emailLabel => 'ای میل';

  @override
  String get mobileLabel => 'موبائل نمبر';

  @override
  String get accountStatusLabel => 'کھاتہٕ حالت';

  @override
  String get statusActive => 'فعال';

  @override
  String get statusPending => 'زیرِ التوا';

  @override
  String get statusSuspended => 'معطل';

  @override
  String get verifiedLabel => 'تصدیق شُدٕ';

  @override
  String get notProvided => 'شٲمِل کرنہٕ نہ آمُت';

  @override
  String get retry => 'دوبارٕ کوشش کرِو';
}
