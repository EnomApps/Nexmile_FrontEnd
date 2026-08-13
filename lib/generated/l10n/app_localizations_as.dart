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
  String get fieldRequired => 'এই ঘৰটো পূৰণ কৰা আৱশ্যক';

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
  String placeOrderFor(String amount) {
    return 'অৰ্ডাৰ কৰক · $amount';
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

  @override
  String get locationTitle => 'ক\'ত ডেলিভাৰী কৰিব লাগে?';

  @override
  String get locationSubtitle => 'Nexmile কেৱল 1 কিমিৰ ভিতৰৰ দোকানৰ পৰা ডেলিভাৰী কৰে, সেয়েহে আপোনাৰ সঠিক ঠাই লাগে।';

  @override
  String get locationReasonRadiusTitle => '1 কিমিৰ ভিতৰৰ দোকান';

  @override
  String get locationReasonRadiusBody => 'য\'ৰ পৰা খাদ্য গৰম হৈ পাব, কেৱল সেই ৰন্ধনশালাবোৰেই দেখুৱাওঁ।';

  @override
  String get locationReasonAccuracyTitle => 'শুদ্ধ দুৱাৰলৈ';

  @override
  String get locationReasonAccuracyBody => 'সঠিক পিন থাকিলে ডেলিভাৰী পাৰ্টনাৰে ফোন নকৰাকৈয়ে আপোনাক বিচাৰি পায়।';

  @override
  String get locationReasonPrivacyTitle => 'কেৱল এপ ব্যৱহাৰৰ সময়ত';

  @override
  String get locationReasonPrivacyBody => 'আমি পটভূমিত আপোনাক ট্ৰেক নকৰোঁ, আৰু ঠিকনা আপুনি নিজেও লিখিব পাৰে।';

  @override
  String get allowLocation => 'অৱস্থানৰ অনুমতি দিয়ক';

  @override
  String get enterAddressManually => 'মই নিজেই ঠিকনা লিখিম';

  @override
  String get locationDenied => 'অৱস্থানৰ অনুমতি পোৱা নগ\'ল। আপুনি নিজেই পিন বহুৱাব পাৰে।';

  @override
  String get locationDeniedForever => 'Nexmile ৰ বাবে অৱস্থান বন্ধ আছে। ছেটিংছত চালু কৰক বা পিন নিজে বহুৱাওক।';

  @override
  String get locationServiceOff => 'এই ডিভাইচত অৱস্থান বন্ধ আছে।';

  @override
  String get locationUnavailable => 'অৱস্থান পোৱা নগ\'ল। অনুগ্ৰহ কৰি পিন নিজে বহুৱাওক।';

  @override
  String get openSettings => 'ছেটিংছ';

  @override
  String get pinLocationTitle => 'আপোনাৰ ডেলিভাৰী পিন বহুৱাওক';

  @override
  String get deliveryRadiusHint => 'বৃত্তটোৱে Nexmile এ ডেলিভাৰী কৰা 1 কিমি দেখুৱাইছে।';

  @override
  String get useMyLocation => 'মোৰ অৱস্থান ব্যৱহাৰ কৰক';

  @override
  String get deliveringHere => 'ইয়াত ডেলিভাৰী';

  @override
  String get dragToAdjust => 'পিন সলনি কৰিবলৈ মানচিত্ৰ টানক';

  @override
  String get confirmLocation => 'অৱস্থান নিশ্চিত কৰক';

  @override
  String get addressDetailsTitle => 'ঠিকনাৰ বিৱৰণ';

  @override
  String get addressDetailsSubtitle => 'শুদ্ধ দুৱাৰত উপনীত হ\'বলৈ ঘৰৰ নম্বৰ আৰু চিন যোগ কৰক।';

  @override
  String get pinnedLocation => 'চিহ্নিত অৱস্থান';

  @override
  String get changePin => 'সলনি কৰক';

  @override
  String get saveAddressAs => 'এই ঠিকনা এনেদৰে সাঁচি থওক';

  @override
  String get labelHome => 'ঘৰ';

  @override
  String get labelWork => 'কাৰ্যালয়';

  @override
  String get labelOther => 'অন্যান্য';

  @override
  String get addressLine1Label => 'ঘৰ, ফ্লেট বা অট্টালিকা';

  @override
  String get addressLine1Hint => '12A, গ্ৰীন ৰেছিডেন্সি';

  @override
  String get addressLine2Label => 'পথ বা অঞ্চল';

  @override
  String get addressLine2Hint => '২য় এভিনিউ, আন্না নগৰ';

  @override
  String get landmarkLabel => 'চিন';

  @override
  String get landmarkHint => 'বাছ ষ্টপৰ বিপৰীতে';

  @override
  String get cityLabel => 'চহৰ';

  @override
  String get stateLabel => 'ৰাজ্য';

  @override
  String get pincodeLabel => 'পিন ক\'ড';

  @override
  String get invalidPincode => 'শুদ্ধ 6 সংখ্যাৰ পিন ক\'ড দিয়ক';

  @override
  String get contactNameLabel => 'যোগাযোগৰ নাম';

  @override
  String get contactPhoneLabel => 'যোগাযোগৰ নম্বৰ';

  @override
  String get invalidMobileNumber => 'শুদ্ধ 10 সংখ্যাৰ মোবাইল নম্বৰ দিয়ক';

  @override
  String get makeDefaultAddress => 'ডিফল্টভাৱে ইয়াতেই ডেলিভাৰী';

  @override
  String get saveAddress => 'ঠিকনা সাঁচি থওক';

  @override
  String get addressSaved => 'ঠিকনা সাঁচি থোৱা হ\'ল';

  @override
  String get addressBookTitle => 'ডেলিভাৰীৰ ঠিকনা';

  @override
  String get manageAddresses => 'সাঁচি থোৱা ঠিকনা পৰিচালনা কৰক';

  @override
  String get noAddressesTitle => 'এতিয়াও কোনো ঠিকনা নাই';

  @override
  String get noAddressesSubtitle => 'আপোনালৈ ডেলিভাৰী কৰা দোকান দেখুৱাবলৈ এটা ঠিকনা যোগ কৰক।';

  @override
  String get addAddress => 'ঠিকনা যোগ কৰক';

  @override
  String get setAsDefault => 'ডিফল্ট কৰক';

  @override
  String get editLabel => 'সম্পাদনা কৰক';

  @override
  String get addressUpdated => 'ঠিকনা আপডেট হ\'ল';

  @override
  String get deleteLabel => 'মচক';

  @override
  String get deleteAddressTitle => 'এই ঠিকনা মচিব?';

  @override
  String get deleteAddressMessage => 'আপুনি পিছত পুনৰ যোগ কৰিব পাৰিব।';

  @override
  String get rescueDealsTitle => 'ফুড ৰেছকিউ';

  @override
  String get notTakingOrders => 'অৰ্ডাৰ লোৱা হোৱা নাই';

  @override
  String get closedRightNow => 'এতিয়া বন্ধ';

  @override
  String minimumOrder(String amount) {
    return 'নূন্যতম $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count বাকী';
  }

  @override
  String get soldOut => 'শেষ হৈ গ’ল';

  @override
  String get menuEmptyTitle => 'এতিয়াও কোনো ব্যঞ্জন নাই';

  @override
  String get menuEmptySubtitle => 'এই ৰেষ্টুৰেণ্টে নিজৰ মেনু যোগ কৰা নাই।';

  @override
  String get moreDishesTitle => 'আৰু ব্যঞ্জন';

  @override
  String get customisable => 'নিজৰ পছন্দমতে';

  @override
  String get requiredLabel => 'আৱশ্যক';

  @override
  String get optionalLabel => 'ঐচ্ছিক';

  @override
  String get chooseOne => 'এটা বাছনি কৰক';

  @override
  String chooseUpTo(int count) {
    return 'সৰ্বাধিক $count বাছনি কৰক';
  }

  @override
  String chooseAtLeast(int count) {
    return 'কমেও $count বাছনি কৰক';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ৰ পৰা $max বাছনি কৰক';
  }

  @override
  String get specialInstructions => 'বিশেষ নিৰ্দেশনা';

  @override
  String get specialInstructionsHint => 'কম জলকীয়া, পিয়াজ নালাগে…';

  @override
  String addForAmount(String amount) {
    return 'যোগ কৰক · $amount';
  }

  @override
  String get deliveryLabel => 'ডেলিভাৰী';

  @override
  String get pickupLabel => 'নিজে লোৱা';

  @override
  String get packagingLabel => 'পেকিং';

  @override
  String get discountLabel => 'ৰেহাই';

  @override
  String get billDetailsTitle => 'বিলৰ বিৱৰণ';

  @override
  String get clearCart => 'কাৰ্ট খালী কৰক';

  @override
  String get clearCartTitle => 'এই কাৰ্ট খালী কৰিব নেকি?';

  @override
  String get clearCartMessage => 'ইয়াত থকা সকলো আঁতৰোৱা হ’ব।';

  @override
  String unavailableItemsNotice(String items) {
    return 'আৰু পোৱা নাযায়: $items';
  }

  @override
  String get removeUnavailable => 'সেইবোৰ আঁতৰাওক';

  @override
  String minimumNotMet(String amount) {
    return 'নূন্যতম অৰ্ডাৰ $amount';
  }

  @override
  String get checkoutTitle => 'চেকআউট';

  @override
  String get deliveryAddressLabel => 'ডেলিভাৰীৰ ঠিকনা';

  @override
  String get noAddressSelected => 'কোনো ঠিকনা বছা হোৱা নাই';

  @override
  String get paymentMethodLabel => 'পৰিশোধ';

  @override
  String get payOnDelivery => 'ডেলিভাৰীৰ সময়ত নগদ';

  @override
  String get noteToRestaurant => 'ৰেষ্টুৰেণ্টৰ বাবে টোকা';

  @override
  String get noteToRestaurantHint => 'ঘণ্টা দুবাৰ বজাব…';

  @override
  String get activeOrdersTitle => 'চলি থকা অৰ্ডাৰ';

  @override
  String get pastOrdersTitle => 'পুৰণি অৰ্ডাৰ';

  @override
  String get orderItemsTitle => 'ব্যঞ্জন';

  @override
  String get orderProgressTitle => 'অগ্ৰগতি';

  @override
  String get arrivingIn => 'পাবলৈ';

  @override
  String get pickupCodeLabel => 'পিকআপ ক’ড';

  @override
  String get cancellationReasonLabel => 'বাতিল হোৱাৰ কাৰণ';

  @override
  String get riderLabel => 'ডেলিভাৰী পাৰ্টনাৰ';

  @override
  String get callRider => 'কল কৰক';

  @override
  String get viewInvoice => 'কৰ ইনভইচ';

  @override
  String get cancelOrder => 'অৰ্ডাৰ বাতিল কৰক';

  @override
  String get cancelOrderTitle => 'এই অৰ্ডাৰ বাতিল কৰিব নেকি?';

  @override
  String get cancelOrderMessage => 'ৰেষ্টুৰেণ্টে গ্ৰহণ কৰাৰ আগতেহে বাতিল কৰিব পাৰি।';

  @override
  String get cancelReasonLabel => 'কাৰণ';

  @override
  String get cancelReasonFallback => 'গ্ৰাহকে বাতিল কৰিছে';

  @override
  String get orderCancelled => 'অৰ্ডাৰ বাতিল হ’ল';

  @override
  String get currentLocationLabel => 'বৰ্তমান স্থান';
}
