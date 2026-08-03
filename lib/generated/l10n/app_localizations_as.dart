// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'দ্ৰুত ডেলিভাৰী। সতেজ হাঁহি।';

  @override
  String get chooseLanguageTitle => 'আপোনাৰ ভাষা বাছনি কৰক';

  @override
  String get chooseLanguageSubtitle => 'আপুনি সহজ অনুভৱ কৰা ভাষা বাছনি কৰক। আপুনি ইয়াক যিকোনো সময়তে ছেটিংছত সলনি কৰিব পাৰে।';

  @override
  String get searchLanguageHint => 'ভাষা বিচাৰক';

  @override
  String get noLanguageFound => 'কোনো ভাষা পোৱা নগ\'ল';

  @override
  String languagesAvailable(int count) {
    return '$countটা ভাষা উপলব্ধ';
  }

  @override
  String get continueLabel => 'আগবাঢ়ক';

  @override
  String get selectedLabel => 'বাছনি কৰা হৈছে';

  @override
  String get defaultLabel => 'ডিফল্ট';

  @override
  String get homeTitle => 'Nexmile লৈ স্বাগতম';

  @override
  String get homeSubtitle => 'সতেজ মুদিসামগ্ৰী, গৰম খাদ্য আৰু দৈনন্দিন প্ৰয়োজনীয় সামগ্ৰী আপোনাৰ ওচৰৰ দোকানৰ পৰা।';

  @override
  String get changeLanguage => 'ভাষা সলনি কৰক';

  @override
  String get languageUpdated => 'ভাষা সলনি কৰা হ\'ল';

  @override
  String get appLanguageLabel => 'এপৰ ভাষা';

  @override
  String greetingNamed(String name) {
    return 'নমস্কাৰ, $name';
  }

  @override
  String get loginTitle => 'Nexmile ত ছাইন ইন কৰক';

  @override
  String get loginSubtitle => 'আপোনাৰ ইমেইল বা মোবাইল নম্বৰ দিয়ক, আমি সত্যাপন ক\'ড পঠিয়াম।';

  @override
  String get emailOrPhoneLabel => 'ইমেইল বা মোবাইল নম্বৰ';

  @override
  String get emailOrPhoneHint => 'name@example.com বা 9876543210';

  @override
  String get invalidEmailOrPhone => 'শুদ্ধ ইমেইল ঠিকনা বা 10 সংখ্যাৰ মোবাইল নম্বৰ দিয়ক';

  @override
  String get sendCode => 'ক\'ড পঠিয়াওক';

  @override
  String get agreeToTermsOnContinue => 'আগবাঢ়িলে আপুনি আমাৰ সেৱাৰ চৰ্তাৱলী আৰু গোপনীয়তা নীতিত সন্মত হয়।';

  @override
  String get otpTitle => 'এইজন আপুনিয়েই বুলি সত্যাপন কৰক';

  @override
  String otpSubtitle(String target) {
    return '$target লৈ পঠোৱা 6 সংখ্যাৰ ক\'ড দিয়ক';
  }

  @override
  String get verifyCode => 'সত্যাপন কৰক';

  @override
  String get resendCode => 'ক\'ড পুনৰ পঠিয়াওক';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ছেকেণ্ডত পুনৰ পঠিয়াওক';
  }

  @override
  String get codeResent => 'নতুন ক\'ড পঠোৱা হৈছে';

  @override
  String get incorrectCode => 'এই ক\'ডটো ভুল বা ইয়াৰ ম্যাদ উকলিছে। নতুন ক\'ড বিচাৰক।';

  @override
  String get enterFullCode => 'সম্পূৰ্ণ 6টা সংখ্যা দিয়ক';

  @override
  String get accountSuspended => 'এই একাউণ্টটো নিলম্বিত কৰা হৈছে। অনুগ্ৰহ কৰি সহায়ৰ সৈতে যোগাযোগ কৰক।';

  @override
  String get tooManyAttempts => 'বহুতবাৰ চেষ্টা কৰা হ\'ল। অনুগ্ৰহ কৰি কিছু সময়ৰ পিছত পুনৰ চেষ্টা কৰক।';

  @override
  String get sessionExpired => 'আপোনাৰ ছেছনৰ ম্যাদ উকলিছে। অনুগ্ৰহ কৰি পুনৰ ছাইন ইন কৰক।';

  @override
  String get networkError => 'ইণ্টাৰনেট সংযোগ নাই। সংযোগ পৰীক্ষা কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get developmentCode => 'ডেভেলপমেণ্ট ক\'ড';

  @override
  String get signOut => 'ছাইন আউট';

  @override
  String get signedOut => 'আপুনি ছাইন আউট হৈছে';

  @override
  String get somethingWentWrong => 'কিবা ভুল হ\'ল। অনুগ্ৰহ কৰি পুনৰ চেষ্টা কৰক।';

  @override
  String get profileTitle => 'প্ৰফাইল';

  @override
  String get viewProfile => 'প্ৰফাইল চাওক';

  @override
  String get nameLabel => 'নাম';

  @override
  String get emailLabel => 'ইমেইল';

  @override
  String get mobileLabel => 'মোবাইল নম্বৰ';

  @override
  String get accountStatusLabel => 'একাউণ্টৰ অৱস্থা';

  @override
  String get statusActive => 'সক্ৰিয়';

  @override
  String get statusPending => 'বিচাৰাধীন';

  @override
  String get statusSuspended => 'নিলম্বিত';

  @override
  String get verifiedLabel => 'সত্যাপিত';

  @override
  String get notProvided => 'যোগ কৰা হোৱা নাই';

  @override
  String get retry => 'পুনৰ চেষ্টা কৰক';
}
