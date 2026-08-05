// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'تيز ڊليوري. تازا مرڪون.';

  @override
  String get chooseLanguageTitle => 'پنهنجي ٻولي چونڊيو';

  @override
  String get chooseLanguageSubtitle => 'اها ٻولي چونڊيو جنهن ۾ توهان کي آساني ٿئي. توهان ان کي ڪنهن به وقت سيٽنگون ۾ تبديل ڪري سگهو ٿا.';

  @override
  String get searchLanguageHint => 'ٻولي ڳوليو';

  @override
  String get noLanguageFound => 'ڪا به ٻولي نه ملي';

  @override
  String languagesAvailable(int count) {
    return '$count ٻوليون موجود آهن';
  }

  @override
  String get continueLabel => 'اڳتي وڌو';

  @override
  String get selectedLabel => 'چونڊيل';

  @override
  String get defaultLabel => 'ڊفالٽ';

  @override
  String get homeTitle => 'Nexmile ۾ ڀلي ڪري آيا';

  @override
  String get homeSubtitle => 'تازو راشن، گرم کاڌو ۽ روزمره جون ضرورتون توهان جي ويجهن دڪانن مان.';

  @override
  String get changeLanguage => 'ٻولي تبديل ڪريو';

  @override
  String get languageUpdated => 'ٻولي تبديل ٿي وئي';

  @override
  String get appLanguageLabel => 'ايپ جي ٻولي';

  @override
  String greetingNamed(String name) {
    return 'ڀلي ڪري آيا، $name';
  }

  @override
  String get loginTitle => 'Nexmile ۾ سائن ان ڪريو';

  @override
  String get loginSubtitle => 'پنهنجو اي ميل يا موبائل نمبر داخل ڪريو، اسان توهان کي تصديقي ڪوڊ موڪلينداسين.';

  @override
  String get emailOrPhoneLabel => 'اي ميل يا موبائل نمبر';

  @override
  String get emailOrPhoneHint => 'name@example.com يا 9876543210';

  @override
  String get invalidEmailOrPhone => 'صحيح اي ميل پتو يا 10 عددن جو موبائل نمبر داخل ڪريو';

  @override
  String get sendCode => 'ڪوڊ موڪليو';

  @override
  String get agreeToTermsOnContinue => 'اڳتي وڌڻ سان توهان اسان جي خدمت جي شرطن ۽ رازداري پاليسي سان متفق ٿيو ٿا.';

  @override
  String get otpTitle => 'تصديق ڪريو ته هي توهان ئي آهيو';

  @override
  String otpSubtitle(String target) {
    return '$target تي موڪليل 6 عددن جو ڪوڊ داخل ڪريو';
  }

  @override
  String get verifyCode => 'تصديق ڪريو';

  @override
  String get resendCode => 'ڪوڊ ٻيهر موڪليو';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds سيڪنڊن ۾ ٻيهر موڪليو';
  }

  @override
  String get codeResent => 'نئون ڪوڊ موڪليو ويو آهي';

  @override
  String get incorrectCode => 'هي ڪوڊ غلط آهي يا ان جي مدت ختم ٿي وئي. نئون ڪوڊ گهرو.';

  @override
  String get enterFullCode => 'پورا 6 عدد داخل ڪريو';

  @override
  String get accountSuspended => 'هي اڪائونٽ معطل ڪيو ويو آهي. مهرباني ڪري سپورٽ سان رابطو ڪريو.';

  @override
  String get tooManyAttempts => 'تمام گهڻيون ڪوششون ٿي ويون. مهرباني ڪري ٿوري دير کان پوءِ ٻيهر ڪوشش ڪريو.';

  @override
  String get sessionExpired => 'توهان جو سيشن ختم ٿي ويو آهي. مهرباني ڪري ٻيهر سائن ان ڪريو.';

  @override
  String get networkError => 'انٽرنيٽ ڪنيڪشن ناهي. پنهنجو ڪنيڪشن چيڪ ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get developmentCode => 'ڊولپمينٽ ڪوڊ';

  @override
  String get signOut => 'سائن آئوٽ';

  @override
  String get signedOut => 'توهان سائن آئوٽ ٿي ويا آهيو';

  @override
  String get somethingWentWrong => 'ڪجهه غلط ٿي ويو. مهرباني ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get profileTitle => 'پروفائل';

  @override
  String get viewProfile => 'پروفائل ڏسو';

  @override
  String get nameLabel => 'نالو';

  @override
  String get emailLabel => 'اي ميل';

  @override
  String get mobileLabel => 'موبائل نمبر';

  @override
  String get accountStatusLabel => 'اڪائونٽ جي حالت';

  @override
  String get statusActive => 'فعال';

  @override
  String get statusPending => 'زير التوا';

  @override
  String get statusSuspended => 'معطل';

  @override
  String get verifiedLabel => 'تصديق ٿيل';

  @override
  String get notProvided => 'شامل نه ڪيو ويو';

  @override
  String get retry => 'ٻيهر ڪوشش ڪريو';

  @override
  String get navHome => 'هوم';

  @override
  String get navSearch => 'ڳوليو';

  @override
  String get navOrders => 'آرڊر';

  @override
  String get cancelLabel => 'منسوخ ڪريو';

  @override
  String get deliverTo => 'ڊليوري جو پتو';

  @override
  String get searchDishesHint => 'کاڌو يا ريسٽورنٽ ڳوليو';

  @override
  String get searchTitle => 'ڳوليو';

  @override
  String get searchNoResultsTitle => 'ڪجهه نه مليو';

  @override
  String get searchNoResultsSubtitle => 'ٻيو ڪو کاڌو، پچائڻ جو انداز يا ريسٽورنٽ جو نالو آزمايو.';

  @override
  String get cravingTitle => 'اڄ ڇا کائڻ جو دل آهي؟';

  @override
  String get offersTitle => 'توهان لاءِ آفرون';

  @override
  String get restaurantsNearby => 'توهان جي ويجهو ريسٽورنٽ';

  @override
  String restaurantsCount(int count) {
    return '$count ريسٽورنٽ';
  }

  @override
  String get noRestaurantsTitle => 'هتي اڃا ڪجهه ناهي';

  @override
  String get noRestaurantsSubtitle => 'ٻيو ڪو قسم ڏسو يا فلٽر هٽايو.';

  @override
  String minutesAway(int minutes) {
    return '$minutes منٽ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance ڪلوميٽر';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ريٽنگون';
  }

  @override
  String priceForTwo(int amount) {
    return 'ٻن لاءِ ₹$amount';
  }

  @override
  String get freeDelivery => 'مفت ڊليوري';

  @override
  String percentOff(int percent) {
    return '$percent% رعايت';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'توهان جي آرڊر تي $percent% رعايت';
  }

  @override
  String get vegOnly => 'رڳو ڀاڄيون';

  @override
  String get bestseller => 'سڀ کان وڌيڪ وڪرو';

  @override
  String get addLabel => 'شامل';

  @override
  String get noVegDishesTitle => 'هتي ڀاڄين وارو کاڌو ناهي';

  @override
  String get noVegDishesSubtitle => 'پورو مينيو ڏسڻ لاءِ ڀاڄين وارو فلٽر بند ڪريو.';

  @override
  String get replaceCartTitle => 'نئين ڪارٽ شروع ڪجي؟';

  @override
  String replaceCartMessage(String restaurant) {
    return 'توهان جي ڪارٽ ۾ $restaurant جون شيون آهن. هي شامل ڪرڻ سان اهي هٽي وينديون.';
  }

  @override
  String get replaceCartConfirm => 'هٽائي شامل ڪريو';

  @override
  String get cartTitle => 'توهان جي ڪارٽ';

  @override
  String get cartEmptyTitle => 'توهان جي ڪارٽ خالي آهي';

  @override
  String get cartEmptySubtitle => 'شروع ڪرڻ لاءِ ڪنهن ريسٽورنٽ مان کاڌو شامل ڪريو.';

  @override
  String get browseRestaurants => 'ريسٽورنٽ ڏسو';

  @override
  String itemsInCart(int count) {
    return '$count شيون';
  }

  @override
  String get viewCart => 'ڪارٽ ڏسو';

  @override
  String get itemTotal => 'شين جو ڪل';

  @override
  String get deliveryFeeLabel => 'ڊليوري فيس';

  @override
  String get taxesAndCharges => 'ٽيڪس ۽ چارج';

  @override
  String get freeLabel => 'مفت';

  @override
  String get toPay => 'ادا ڪرڻو';

  @override
  String placeOrderFor(int amount) {
    return 'آرڊر ڪريو · ₹$amount';
  }

  @override
  String get ordersTitle => 'توهان جا آرڊر';

  @override
  String get ordersEmptyTitle => 'اڃا ڪو آرڊر ناهي';

  @override
  String get ordersEmptySubtitle => 'توهان جا اڳيان آرڊر هتي نظر ايندا.';

  @override
  String get reorder => 'ٻيهر آرڊر';

  @override
  String orderTitle(String id) {
    return 'آرڊر $id';
  }

  @override
  String get orderPlacedTitle => 'آرڊر ٿي ويو';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'لڳ ڀڳ $minutes منٽن ۾ پهچندو.';
  }

  @override
  String get orderDeliveredTitle => 'ڊليور ٿي ويو';

  @override
  String get orderDeliveredSubtitle => 'کاڌي جو مزو وٺو.';

  @override
  String get statusOrderPlaced => 'آرڊر ٿي ويو';

  @override
  String get statusPreparing => 'کاڌو تيار ٿي رهيو آهي';

  @override
  String get statusOnTheWay => 'رستي ۾ آهي';

  @override
  String get statusDelivered => 'ڊليور ٿي ويو';

  @override
  String get keepBrowsing => 'ڏسندا رهو';

  @override
  String get backToHome => 'هوم تي واپس';

  @override
  String get prototypeNotice => 'نمونو اسٽور فرنٽ — اصل دڪان ڪيٽلاگ API سان گڏ ايندا.';

  @override
  String get prototypeCheckoutNotice => 'هي هڪ پروٽوٽائپ آهي. ڪا ادائگي نه ورتي ويندي آهي ۽ نه ئي ڪو حقيقي آرڊر ٿيندو آهي.';

  @override
  String get prototypeTrackingNotice => 'پروٽوٽائپ لاءِ ٽريڪنگ مصنوعي آهي.';
}
