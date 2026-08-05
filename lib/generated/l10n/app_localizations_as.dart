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

  @override
  String get navHome => 'হ\'ম';

  @override
  String get navSearch => 'বিচাৰক';

  @override
  String get navOrders => 'অৰ্ডাৰ';

  @override
  String get cancelLabel => 'বাতিল কৰক';

  @override
  String get deliverTo => 'ডেলিভাৰীৰ ঠিকনা';

  @override
  String get searchDishesHint => 'খাদ্য বা ৰেষ্টুৰেণ্ট বিচাৰক';

  @override
  String get searchTitle => 'বিচাৰক';

  @override
  String get searchNoResultsTitle => 'একো পোৱা নগ\'ল';

  @override
  String get searchNoResultsSubtitle => 'আন কোনো খাদ্য, ৰন্ধন শৈলী বা ৰেষ্টুৰেণ্টৰ নাম চেষ্টা কৰক।';

  @override
  String get cravingTitle => 'আজি কি খাবলৈ মন গৈছে?';

  @override
  String get offersTitle => 'আপোনাৰ বাবে অফাৰ';

  @override
  String get restaurantsNearby => 'আপোনাৰ ওচৰৰ ৰেষ্টুৰেণ্ট';

  @override
  String restaurantsCount(int count) {
    return '$countটা ৰেষ্টুৰেণ্ট';
  }

  @override
  String get noRestaurantsTitle => 'ইয়াত এতিয়াও একো নাই';

  @override
  String get noRestaurantsSubtitle => 'আন এটা শ্ৰেণী চাওক বা ফিল্টাৰ আঁতৰাওক।';

  @override
  String minutesAway(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance কিমি';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ৰেটিং';
  }

  @override
  String priceForTwo(int amount) {
    return 'দুজনৰ বাবে ₹$amount';
  }

  @override
  String get freeDelivery => 'বিনামূলীয়া ডেলিভাৰী';

  @override
  String percentOff(int percent) {
    return '$percent% ৰেহাই';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'আপোনাৰ অৰ্ডাৰত $percent% ৰেহাই';
  }

  @override
  String get vegOnly => 'কেৱল নিৰামিষ';

  @override
  String get bestseller => 'সৰ্বাধিক বিক্ৰীত';

  @override
  String get addLabel => 'যোগ';

  @override
  String get noVegDishesTitle => 'ইয়াত নিৰামিষ খাদ্য নাই';

  @override
  String get noVegDishesSubtitle => 'সম্পূৰ্ণ মেনু চাবলৈ নিৰামিষ ফিল্টাৰ বন্ধ কৰক।';

  @override
  String get replaceCartTitle => 'নতুন কাৰ্ট আৰম্ভ কৰিবনে?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'আপোনাৰ কাৰ্টত $restaurantৰ সামগ্ৰী আছে। ইয়াক যোগ কৰিলে সেয়া আঁতৰি যাব।';
  }

  @override
  String get replaceCartConfirm => 'আঁতৰাই যোগ কৰক';

  @override
  String get cartTitle => 'আপোনাৰ কাৰ্ট';

  @override
  String get cartEmptyTitle => 'আপোনাৰ কাৰ্ট খালী';

  @override
  String get cartEmptySubtitle => 'আৰম্ভ কৰিবলৈ কোনো ৰেষ্টুৰেণ্টৰ পৰা খাদ্য যোগ কৰক।';

  @override
  String get browseRestaurants => 'ৰেষ্টুৰেণ্ট চাওক';

  @override
  String itemsInCart(int count) {
    return '$countটা সামগ্ৰী';
  }

  @override
  String get viewCart => 'কাৰ্ট চাওক';

  @override
  String get itemTotal => 'সামগ্ৰীৰ মুঠ';

  @override
  String get deliveryFeeLabel => 'ডেলিভাৰী মাচুল';

  @override
  String get taxesAndCharges => 'কৰ আৰু মাচুল';

  @override
  String get freeLabel => 'বিনামূলীয়া';

  @override
  String get toPay => 'দিব লগীয়া';

  @override
  String placeOrderFor(int amount) {
    return 'অৰ্ডাৰ কৰক · ₹$amount';
  }

  @override
  String get ordersTitle => 'আপোনাৰ অৰ্ডাৰ';

  @override
  String get ordersEmptyTitle => 'এতিয়াও কোনো অৰ্ডাৰ নাই';

  @override
  String get ordersEmptySubtitle => 'আপোনাৰ আগৰ অৰ্ডাৰবোৰ ইয়াত দেখা যাব।';

  @override
  String get reorder => 'পুনৰ অৰ্ডাৰ';

  @override
  String orderTitle(String id) {
    return 'অৰ্ডাৰ $id';
  }

  @override
  String get orderPlacedTitle => 'অৰ্ডাৰ হ\'ল';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'প্ৰায় $minutes মিনিটত পাব।';
  }

  @override
  String get orderDeliveredTitle => 'ডেলিভাৰ হ\'ল';

  @override
  String get orderDeliveredSubtitle => 'খাদ্য উপভোগ কৰক।';

  @override
  String get statusOrderPlaced => 'অৰ্ডাৰ হ\'ল';

  @override
  String get statusPreparing => 'খাদ্য প্ৰস্তুত হৈ আছে';

  @override
  String get statusOnTheWay => 'বাটত আছে';

  @override
  String get statusDelivered => 'ডেলিভাৰ হ\'ল';

  @override
  String get keepBrowsing => 'চাই থাকক';

  @override
  String get backToHome => 'হ\'মলৈ উভতি যাওক';

  @override
  String get prototypeNotice => 'নমুনা ষ্ট\'ৰফ্ৰণ্ট — প্ৰকৃত দোকান কেটেলগ APIৰ সৈতে আহিব।';

  @override
  String get prototypeCheckoutNotice => 'এইটো এটা প্ৰট\'টাইপ। কোনো ধন লোৱা নহয় আৰু প্ৰকৃত অৰ্ডাৰো নহয়।';

  @override
  String get prototypeTrackingNotice => 'প্ৰট\'টাইপৰ বাবে ট্ৰেকিং কৃত্ৰিম।';
}
