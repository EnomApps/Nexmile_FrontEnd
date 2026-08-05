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

  @override
  String get navHome => 'ہوم';

  @override
  String get navSearch => 'ژھانڈٕو';

  @override
  String get navOrders => 'آرڈر';

  @override
  String get cancelLabel => 'منسوخ کرِو';

  @override
  String get deliverTo => 'ڈیلیوری پتہٕ';

  @override
  String get searchDishesHint => 'کھَنہٕ یا ریسٹورنٹ ژھانڈٕو';

  @override
  String get searchTitle => 'ژھانڈٕو';

  @override
  String get searchNoResultsTitle => 'کینٛہہ نہ لبنہٕ آو';

  @override
  String get searchNoResultsSubtitle => 'بیٚاکھ کھَنہٕ، پکاونُک طریقہٕ یا ریسٹورنٹ ناو آزماوِو۔';

  @override
  String get cravingTitle => 'اَز کیٚاہ کھیٚنُک دِل چھُ؟';

  @override
  String get offersTitle => 'توہہِ خٲطرٕ آفر';

  @override
  String get restaurantsNearby => 'توہنٛدِن نزدیٚکی ریسٹورنٹ';

  @override
  String restaurantsCount(int count) {
    return '$count ریسٹورنٹ';
  }

  @override
  String get noRestaurantsTitle => 'یَتہِ چھُ ناوُ کینٛہہ نہ';

  @override
  String get noRestaurantsSubtitle => 'بیٚاکھ قِسم وُچھِو یا فلٹر ہٹاوِو۔';

  @override
  String minutesAway(int minutes) {
    return '$minutes مِنٹ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance کِلومیٹر';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ریٹِنگ';
  }

  @override
  String priceForTwo(int amount) {
    return 'زٕن خٲطرٕ ₹$amount';
  }

  @override
  String get freeDelivery => 'مُفت ڈیلیوری';

  @override
  String percentOff(int percent) {
    return '$percent% رعایت';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'توہنٛدِس آرڈرس پؠٹھٕ $percent% رعایت';
  }

  @override
  String get vegOnly => 'صرف سبزی';

  @override
  String get bestseller => 'سٲری خۄتہٕ زیادٕ ووٚنمُت';

  @override
  String get addLabel => 'شٲمِل';

  @override
  String get noVegDishesTitle => 'یَتہِ چھِ نہ سبزی کھَنہٕ';

  @override
  String get noVegDishesSubtitle => 'پورٕ مینو وُچھنہٕ خٲطرٕ سبزی فلٹر بند کرِو۔';

  @override
  String get replaceCartTitle => 'نوٚو کارٹ شُروع کرٕو؟';

  @override
  String replaceCartMessage(String restaurant) {
    return 'توہنٛدِس کارٹس منٛز چھِ $restaurant ہٕنٛدؠ چیٖز۔ یہ شٲمِل کٔرِتھ گژھن تِم ہٹاونہٕ۔';
  }

  @override
  String get replaceCartConfirm => 'ہٹٲوِتھ شٲمِل کرِو';

  @override
  String get cartTitle => 'توہنٛد کارٹ';

  @override
  String get cartEmptyTitle => 'توہنٛد کارٹ چھُ خٲلی';

  @override
  String get cartEmptySubtitle => 'شُروع کرنہٕ خٲطرٕ کُنہِ ریسٹورنٹ پؠٹھٕ کھَنہٕ شٲمِل کرِو۔';

  @override
  String get browseRestaurants => 'ریسٹورنٹ وُچھِو';

  @override
  String itemsInCart(int count) {
    return '$count چیٖز';
  }

  @override
  String get viewCart => 'کارٹ وُچھِو';

  @override
  String get itemTotal => 'چیٖزَن ہُند کُل';

  @override
  String get deliveryFeeLabel => 'ڈیلیوری فیٖس';

  @override
  String get taxesAndCharges => 'ٹیکس تہٕ چارجہٕ';

  @override
  String get freeLabel => 'مُفت';

  @override
  String get toPay => 'أدا کرُن';

  @override
  String placeOrderFor(int amount) {
    return 'آرڈر کرِو · ₹$amount';
  }

  @override
  String get ordersTitle => 'توہنٛدؠ آرڈر';

  @override
  String get ordersEmptyTitle => 'ناوُ کانہہ آرڈر نہ';

  @override
  String get ordersEmptySubtitle => 'توہنٛدؠ برونہہ کٕنؠ آرڈر ییٚنہٕ یَتہِ ہاونہٕ۔';

  @override
  String get reorder => 'دوبارٕ آرڈر';

  @override
  String orderTitle(String id) {
    return 'آرڈر $id';
  }

  @override
  String get orderPlacedTitle => 'آرڈر گو';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'تخمیناً $minutes مِنٹن منٛز پکھِ۔';
  }

  @override
  String get orderDeliveredTitle => 'ڈیلیور گو';

  @override
  String get orderDeliveredSubtitle => 'کھَنہٕ کھیٚو تہٕ مزٕ لِیو۔';

  @override
  String get statusOrderPlaced => 'آرڈر گو';

  @override
  String get statusPreparing => 'کھَنہٕ چھُ تیار گژھان';

  @override
  String get statusOnTheWay => 'وَتہِ پؠٹھٕ چھُ';

  @override
  String get statusDelivered => 'ڈیلیور گو';

  @override
  String get keepBrowsing => 'وُچھان رۄزِو';

  @override
  String get backToHome => 'ہوم کُن واپس';

  @override
  String get prototypeNotice => 'نمونہٕ سٹور فرنٹ — اصلی دُکان ییٚنہٕ کیٹلاگ API سٕتؠ۔';

  @override
  String get prototypeCheckoutNotice => 'یہ چھُ اکھ پروٹوٹائپ۔ کانہہ أدایگی چھِ نہ ییٚنہٕ ہیٚنہٕ تہٕ نہ کانہہ اصلی آرڈر چھُ گژھان۔';

  @override
  String get prototypeTrackingNotice => 'پروٹوٹائپ خٲطرٕ چھُ ٹریکِنگ مصنوعی۔';
}
