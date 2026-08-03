// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'দ্রুত ডেলিভারি। সতেজ হাসি।';

  @override
  String get chooseLanguageTitle => 'আপনার ভাষা বেছে নিন';

  @override
  String get chooseLanguageSubtitle => 'যে ভাষায় আপনি স্বচ্ছন্দ সেটি বেছে নিন। আপনি যেকোনো সময় সেটিংস থেকে এটি পরিবর্তন করতে পারেন।';

  @override
  String get searchLanguageHint => 'ভাষা খুঁজুন';

  @override
  String get noLanguageFound => 'কোনো ভাষা পাওয়া যায়নি';

  @override
  String languagesAvailable(int count) {
    return '$countটি ভাষা রয়েছে';
  }

  @override
  String get continueLabel => 'চালিয়ে যান';

  @override
  String get selectedLabel => 'নির্বাচিত';

  @override
  String get defaultLabel => 'ডিফল্ট';

  @override
  String get homeTitle => 'Nexmile-এ স্বাগতম';

  @override
  String get homeSubtitle => 'তাজা মুদিখানার জিনিস, গরম খাবার এবং প্রতিদিনের প্রয়োজনীয় সামগ্রী আপনার কাছের দোকান থেকে।';

  @override
  String get changeLanguage => 'ভাষা পরিবর্তন করুন';

  @override
  String get languageUpdated => 'ভাষা পরিবর্তন করা হয়েছে';

  @override
  String get appLanguageLabel => 'অ্যাপের ভাষা';

  @override
  String greetingNamed(String name) {
    return 'নমস্কার, $name';
  }

  @override
  String get loginTitle => 'Nexmile-এ সাইন ইন করুন';

  @override
  String get loginSubtitle => 'আপনার ইমেল বা মোবাইল নম্বর দিন, আমরা যাচাই কোড পাঠাব।';

  @override
  String get emailOrPhoneLabel => 'ইমেল বা মোবাইল নম্বর';

  @override
  String get emailOrPhoneHint => 'name@example.com অথবা 9876543210';

  @override
  String get invalidEmailOrPhone => 'সঠিক ইমেল ঠিকানা বা ১০ সংখ্যার মোবাইল নম্বর লিখুন';

  @override
  String get sendCode => 'কোড পাঠান';

  @override
  String get agreeToTermsOnContinue => 'চালিয়ে গেলে আপনি আমাদের পরিষেবার শর্তাবলী ও গোপনীয়তা নীতিতে সম্মত হচ্ছেন।';

  @override
  String get otpTitle => 'যাচাই করুন এটি আপনিই';

  @override
  String otpSubtitle(String target) {
    return '$target-এ পাঠানো ৬ সংখ্যার কোড লিখুন';
  }

  @override
  String get verifyCode => 'যাচাই করুন';

  @override
  String get resendCode => 'কোড আবার পাঠান';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds সেকেন্ড পরে আবার পাঠান';
  }

  @override
  String get codeResent => 'নতুন কোড পাঠানো হয়েছে';

  @override
  String get incorrectCode => 'এই কোডটি ভুল বা মেয়াদ শেষ হয়ে গেছে। নতুন কোড চান।';

  @override
  String get enterFullCode => 'পুরো ৬টি সংখ্যা লিখুন';

  @override
  String get accountSuspended => 'এই অ্যাকাউন্টটি স্থগিত করা হয়েছে। সহায়তার সঙ্গে যোগাযোগ করুন।';

  @override
  String get tooManyAttempts => 'অনেকবার চেষ্টা করা হয়েছে। কিছুক্ষণ পরে আবার চেষ্টা করুন।';

  @override
  String get sessionExpired => 'আপনার সেশনের মেয়াদ শেষ হয়েছে। আবার সাইন ইন করুন।';

  @override
  String get networkError => 'ইন্টারনেট সংযোগ নেই। সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get developmentCode => 'ডেভেলপমেন্ট কোড';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get signedOut => 'আপনি সাইন আউট হয়েছেন';

  @override
  String get somethingWentWrong => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get profileTitle => 'প্রোফাইল';

  @override
  String get viewProfile => 'প্রোফাইল দেখুন';

  @override
  String get nameLabel => 'নাম';

  @override
  String get emailLabel => 'ইমেল';

  @override
  String get mobileLabel => 'মোবাইল নম্বর';

  @override
  String get accountStatusLabel => 'অ্যাকাউন্টের অবস্থা';

  @override
  String get statusActive => 'সক্রিয়';

  @override
  String get statusPending => 'অপেক্ষমাণ';

  @override
  String get statusSuspended => 'স্থগিত';

  @override
  String get verifiedLabel => 'যাচাই করা';

  @override
  String get notProvided => 'যোগ করা হয়নি';

  @override
  String get retry => 'আবার চেষ্টা করুন';
}
