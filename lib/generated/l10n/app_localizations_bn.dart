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

  @override
  String get navHome => 'হোম';

  @override
  String get navSearch => 'খুঁজুন';

  @override
  String get navOrders => 'অর্ডার';

  @override
  String get cancelLabel => 'বাতিল';

  @override
  String get deliverTo => 'ডেলিভারির ঠিকানা';

  @override
  String get searchDishesHint => 'খাবার বা রেস্তোরাঁ খুঁজুন';

  @override
  String get searchTitle => 'খুঁজুন';

  @override
  String get searchNoResultsTitle => 'কিছু মেলেনি';

  @override
  String get searchNoResultsSubtitle => 'অন্য কোনো খাবার, রান্নার ধরন বা রেস্তোরাঁর নাম চেষ্টা করুন।';

  @override
  String get cravingTitle => 'আজ কী খেতে ইচ্ছে করছে?';

  @override
  String get offersTitle => 'আপনার জন্য অফার';

  @override
  String get restaurantsNearby => 'আপনার কাছের রেস্তোরাঁ';

  @override
  String restaurantsCount(int count) {
    return '$countটি রেস্তোরাঁ';
  }

  @override
  String get noRestaurantsTitle => 'এখানে এখনো কিছু নেই';

  @override
  String get noRestaurantsSubtitle => 'অন্য বিভাগ দেখুন বা ফিল্টার সরান।';

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
    return '$count+ রেটিং';
  }

  @override
  String priceForTwo(int amount) {
    return 'দুজনের জন্য ₹$amount';
  }

  @override
  String get freeDelivery => 'ফ্রি ডেলিভারি';

  @override
  String percentOff(int percent) {
    return '$percent% ছাড়';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'আপনার অর্ডারে $percent% ছাড়';
  }

  @override
  String get vegOnly => 'শুধু নিরামিষ';

  @override
  String get bestseller => 'সবচেয়ে জনপ্রিয়';

  @override
  String get addLabel => 'যোগ';

  @override
  String get noVegDishesTitle => 'এখানে নিরামিষ খাবার নেই';

  @override
  String get noVegDishesSubtitle => 'পুরো মেনু দেখতে নিরামিষ ফিল্টার বন্ধ করুন।';

  @override
  String get replaceCartTitle => 'নতুন কার্ট শুরু করবেন?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'আপনার কার্টে $restaurant-এর জিনিস আছে। এটি যোগ করলে সেগুলি মুছে যাবে।';
  }

  @override
  String get replaceCartConfirm => 'মুছে যোগ করুন';

  @override
  String get cartTitle => 'আপনার কার্ট';

  @override
  String get cartEmptyTitle => 'আপনার কার্ট খালি';

  @override
  String get cartEmptySubtitle => 'শুরু করতে কোনো রেস্তোরাঁ থেকে খাবার যোগ করুন।';

  @override
  String get browseRestaurants => 'রেস্তোরাঁ দেখুন';

  @override
  String itemsInCart(int count) {
    return '$countটি জিনিস';
  }

  @override
  String get viewCart => 'কার্ট দেখুন';

  @override
  String get itemTotal => 'জিনিসের মোট';

  @override
  String get deliveryFeeLabel => 'ডেলিভারি ফি';

  @override
  String get taxesAndCharges => 'কর ও চার্জ';

  @override
  String get freeLabel => 'ফ্রি';

  @override
  String get toPay => 'দিতে হবে';

  @override
  String placeOrderFor(int amount) {
    return 'অর্ডার করুন · ₹$amount';
  }

  @override
  String get ordersTitle => 'আপনার অর্ডার';

  @override
  String get ordersEmptyTitle => 'এখনো কোনো অর্ডার নেই';

  @override
  String get ordersEmptySubtitle => 'আপনার আগের অর্ডার এখানে দেখা যাবে।';

  @override
  String get reorder => 'আবার অর্ডার';

  @override
  String orderTitle(String id) {
    return 'অর্ডার $id';
  }

  @override
  String get orderPlacedTitle => 'অর্ডার হয়ে গেছে';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'প্রায় $minutes মিনিটে পৌঁছাবে।';
  }

  @override
  String get orderDeliveredTitle => 'ডেলিভার হয়েছে';

  @override
  String get orderDeliveredSubtitle => 'খাবার উপভোগ করুন।';

  @override
  String get statusOrderPlaced => 'অর্ডার হয়েছে';

  @override
  String get statusPreparing => 'খাবার তৈরি হচ্ছে';

  @override
  String get statusOnTheWay => 'পথে আছে';

  @override
  String get statusDelivered => 'ডেলিভার হয়েছে';

  @override
  String get keepBrowsing => 'দেখতে থাকুন';

  @override
  String get backToHome => 'হোমে ফিরুন';

  @override
  String get prototypeNotice => 'নমুনা স্টোরফ্রন্ট — আসল দোকান ক্যাটালগ API-এর সঙ্গে আসবে।';

  @override
  String get prototypeCheckoutNotice => 'এটি একটি প্রোটোটাইপ। কোনো টাকা নেওয়া হয় না এবং সত্যিকারের অর্ডারও হয় না।';

  @override
  String get prototypeTrackingNotice => 'প্রোটোটাইপের জন্য ট্র্যাকিং কৃত্রিম।';
}
