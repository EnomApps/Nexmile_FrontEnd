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
  String get fieldRequired => 'এই ঘরটি পূরণ করা আবশ্যক';

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
  String placeOrderFor(String amount) {
    return 'অর্ডার করুন · $amount';
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

  @override
  String get locationTitle => 'কোথায় ডেলিভারি করব?';

  @override
  String get locationSubtitle => 'Nexmile কেবল ১ কিমির মধ্যেকার দোকান থেকে ডেলিভারি করে, তাই আপনার সঠিক অবস্থান দরকার।';

  @override
  String get locationReasonRadiusTitle => '১ কিমির মধ্যে দোকান';

  @override
  String get locationReasonRadiusBody => 'যেখান থেকে খাবার গরম পৌঁছাবে, কেবল সেই রান্নাঘরগুলিই দেখাই।';

  @override
  String get locationReasonAccuracyTitle => 'সঠিক দরজায়';

  @override
  String get locationReasonAccuracyBody => 'নিখুঁত পিন থাকলে ডেলিভারি পার্টনার ফোন না করেই আপনাকে খুঁজে পান।';

  @override
  String get locationReasonPrivacyTitle => 'শুধু অ্যাপ ব্যবহারের সময়';

  @override
  String get locationReasonPrivacyBody => 'আমরা পটভূমিতে আপনাকে ট্র্যাক করি না, আর ঠিকানা আপনি নিজেও লিখতে পারেন।';

  @override
  String get allowLocation => 'লোকেশন অনুমতি দিন';

  @override
  String get enterAddressManually => 'আমি নিজেই ঠিকানা লিখব';

  @override
  String get locationDenied => 'লোকেশন অনুমতি দেওয়া হয়নি। আপনি নিজেই পিন বসাতে পারেন।';

  @override
  String get locationDeniedForever => 'Nexmile-এর জন্য লোকেশন বন্ধ আছে। সেটিংসে চালু করুন বা পিন নিজে বসান।';

  @override
  String get locationServiceOff => 'এই ডিভাইসে লোকেশন বন্ধ আছে।';

  @override
  String get locationUnavailable => 'লোকেশন পাওয়া যায়নি। অনুগ্রহ করে পিন নিজে বসান।';

  @override
  String get openSettings => 'সেটিংস';

  @override
  String get pinLocationTitle => 'আপনার ডেলিভারি পিন বসান';

  @override
  String get deliveryRadiusHint => 'বৃত্তটি সেই ১ কিমি দেখাচ্ছে যার মধ্যে Nexmile ডেলিভারি করে।';

  @override
  String get useMyLocation => 'আমার লোকেশন ব্যবহার করুন';

  @override
  String get deliveringHere => 'এখানে ডেলিভারি';

  @override
  String get dragToAdjust => 'পিন সরাতে ম্যাপ টানুন';

  @override
  String get confirmLocation => 'লোকেশন নিশ্চিত করুন';

  @override
  String get addressDetailsTitle => 'ঠিকানার বিবরণ';

  @override
  String get addressDetailsSubtitle => 'সঠিক দরজায় পৌঁছাতে ফ্ল্যাট নম্বর ও ল্যান্ডমার্ক দিন।';

  @override
  String get pinnedLocation => 'চিহ্নিত অবস্থান';

  @override
  String get changePin => 'বদলান';

  @override
  String get saveAddressAs => 'এই ঠিকানা সংরক্ষণ করুন';

  @override
  String get labelHome => 'বাড়ি';

  @override
  String get labelWork => 'অফিস';

  @override
  String get labelOther => 'অন্যান্য';

  @override
  String get addressLine1Label => 'ফ্ল্যাট, বাড়ি বা ভবন';

  @override
  String get addressLine1Hint => '12A, গ্রিন রেসিডেন্সি';

  @override
  String get addressLine2Label => 'রাস্তা বা এলাকা';

  @override
  String get addressLine2Hint => '২য় অ্যাভিনিউ, আন্না নগর';

  @override
  String get landmarkLabel => 'ল্যান্ডমার্ক';

  @override
  String get landmarkHint => 'বাস স্টপের উল্টোদিকে';

  @override
  String get cityLabel => 'শহর';

  @override
  String get stateLabel => 'রাজ্য';

  @override
  String get pincodeLabel => 'পিন কোড';

  @override
  String get invalidPincode => 'সঠিক ৬ সংখ্যার পিন কোড লিখুন';

  @override
  String get contactNameLabel => 'যোগাযোগের নাম';

  @override
  String get contactPhoneLabel => 'যোগাযোগের নম্বর';

  @override
  String get invalidMobileNumber => 'সঠিক ১০ সংখ্যার মোবাইল নম্বর লিখুন';

  @override
  String get makeDefaultAddress => 'ডিফল্টভাবে এখানেই ডেলিভারি';

  @override
  String get saveAddress => 'ঠিকানা সংরক্ষণ করুন';

  @override
  String get addressSaved => 'ঠিকানা সংরক্ষিত হয়েছে';

  @override
  String get addressBookTitle => 'ডেলিভারির ঠিকানা';

  @override
  String get manageAddresses => 'সংরক্ষিত ঠিকানা পরিচালনা করুন';

  @override
  String get noAddressesTitle => 'এখনো কোনো ঠিকানা নেই';

  @override
  String get noAddressesSubtitle => 'একটি ঠিকানা যোগ করুন, যাতে আপনার কাছে ডেলিভারি করা দোকান দেখাতে পারি।';

  @override
  String get addAddress => 'ঠিকানা যোগ করুন';

  @override
  String get setAsDefault => 'ডিফল্ট করুন';

  @override
  String get editLabel => 'সম্পাদনা';

  @override
  String get addressUpdated => 'ঠিকানা আপডেট হয়েছে';

  @override
  String get deleteLabel => 'মুছুন';

  @override
  String get deleteAddressTitle => 'এই ঠিকানা মুছবেন?';

  @override
  String get deleteAddressMessage => 'আপনি পরে আবার যোগ করতে পারবেন।';

  @override
  String get rescueDealsTitle => 'ফুড রেসকিউ';

  @override
  String get notTakingOrders => 'অর্ডার নেওয়া হচ্ছে না';

  @override
  String get closedRightNow => 'এখন বন্ধ';

  @override
  String minimumOrder(String amount) {
    return 'সর্বনিম্ন $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count বাকি';
  }

  @override
  String get soldOut => 'শেষ হয়ে গেছে';

  @override
  String get menuEmptyTitle => 'এখনো কোনো পদ নেই';

  @override
  String get menuEmptySubtitle => 'এই রেস্তোরাঁ তার মেনু যোগ করেনি।';

  @override
  String get moreDishesTitle => 'আরও পদ';

  @override
  String get customisable => 'পছন্দমতো';

  @override
  String get requiredLabel => 'আবশ্যক';

  @override
  String get optionalLabel => 'ঐচ্ছিক';

  @override
  String get chooseOne => 'একটি বাছুন';

  @override
  String chooseUpTo(int count) {
    return 'সর্বোচ্চ $countটি বাছুন';
  }

  @override
  String chooseAtLeast(int count) {
    return 'অন্তত $countটি বাছুন';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min থেকে $maxটি বাছুন';
  }

  @override
  String get specialInstructions => 'বিশেষ নির্দেশ';

  @override
  String get specialInstructionsHint => 'কম ঝাল, পেঁয়াজ নয়…';

  @override
  String addForAmount(String amount) {
    return 'যোগ করুন · $amount';
  }

  @override
  String get deliveryLabel => 'ডেলিভারি';

  @override
  String get pickupLabel => 'নিজে নেওয়া';

  @override
  String get packagingLabel => 'প্যাকেজিং';

  @override
  String get discountLabel => 'ছাড়';

  @override
  String get billDetailsTitle => 'বিলের বিবরণ';

  @override
  String get clearCart => 'কার্ট খালি করুন';

  @override
  String get clearCartTitle => 'এই কার্ট খালি করবেন?';

  @override
  String get clearCartMessage => 'এর সবকিছু সরিয়ে ফেলা হবে।';

  @override
  String unavailableItemsNotice(String items) {
    return 'আর পাওয়া যাচ্ছে না: $items';
  }

  @override
  String get removeUnavailable => 'সরিয়ে ফেলুন';

  @override
  String minimumNotMet(String amount) {
    return 'সর্বনিম্ন অর্ডার $amount';
  }

  @override
  String get checkoutTitle => 'চেকআউট';

  @override
  String get deliveryAddressLabel => 'ডেলিভারির ঠিকানা';

  @override
  String get noAddressSelected => 'কোনো ঠিকানা বাছা হয়নি';

  @override
  String get paymentMethodLabel => 'পেমেন্ট';

  @override
  String get payOnDelivery => 'ডেলিভারিতে নগদ';

  @override
  String get noteToRestaurant => 'রেস্তোরাঁর জন্য নোট';

  @override
  String get noteToRestaurantHint => 'দুবার বেল বাজান…';

  @override
  String get activeOrdersTitle => 'চলমান অর্ডার';

  @override
  String get pastOrdersTitle => 'আগের অর্ডার';

  @override
  String get orderItemsTitle => 'পদ';

  @override
  String get orderProgressTitle => 'অগ্রগতি';

  @override
  String get arrivingIn => 'পৌঁছাবে';

  @override
  String get pickupCodeLabel => 'পিকআপ কোড';

  @override
  String get cancellationReasonLabel => 'বাতিলের কারণ';

  @override
  String get riderLabel => 'ডেলিভারি পার্টনার';

  @override
  String get callRider => 'কল করুন';

  @override
  String get viewInvoice => 'ট্যাক্স ইনভয়েস';

  @override
  String get cancelOrder => 'অর্ডার বাতিল করুন';

  @override
  String get cancelOrderTitle => 'এই অর্ডার বাতিল করবেন?';

  @override
  String get cancelOrderMessage => 'রেস্তোরাঁ গ্রহণ করার আগেই কেবল বাতিল করা যায়।';

  @override
  String get cancelReasonLabel => 'কারণ';

  @override
  String get cancelReasonFallback => 'ক্রেতা বাতিল করেছেন';

  @override
  String get orderCancelled => 'অর্ডার বাতিল হয়েছে';

  @override
  String get currentLocationLabel => 'বর্তমান অবস্থান';
}
