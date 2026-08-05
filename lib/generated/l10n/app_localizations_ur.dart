// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get tagline => 'تیز ڈیلیوری۔ تازہ مسکراہٹیں۔';

  @override
  String get chooseLanguageTitle => 'اپنی زبان منتخب کریں';

  @override
  String get chooseLanguageSubtitle => 'وہ زبان منتخب کریں جس میں آپ آسانی محسوس کرتے ہیں۔ آپ اسے کسی بھی وقت ترتیبات میں تبدیل کر سکتے ہیں۔';

  @override
  String get searchLanguageHint => 'زبان تلاش کریں';

  @override
  String get noLanguageFound => 'کوئی زبان نہیں ملی';

  @override
  String languagesAvailable(int count) {
    return '$count زبانیں دستیاب ہیں';
  }

  @override
  String get continueLabel => 'جاری رکھیں';

  @override
  String get selectedLabel => 'منتخب شدہ';

  @override
  String get defaultLabel => 'ڈیفالٹ';

  @override
  String get homeTitle => 'Nexmile میں خوش آمدید';

  @override
  String get homeSubtitle => 'تازہ گروسری، گرم کھانا اور روزمرہ کی ضروریات آپ کے قریبی دکانوں سے۔';

  @override
  String get changeLanguage => 'زبان تبدیل کریں';

  @override
  String get languageUpdated => 'زبان تبدیل ہو گئی';

  @override
  String get appLanguageLabel => 'ایپ کی زبان';

  @override
  String greetingNamed(String name) {
    return 'خوش آمدید، $name';
  }

  @override
  String get loginTitle => 'Nexmile میں سائن ان کریں';

  @override
  String get loginSubtitle => 'اپنا ای میل یا موبائل نمبر درج کریں، ہم آپ کو تصدیقی کوڈ بھیجیں گے۔';

  @override
  String get emailOrPhoneLabel => 'ای میل یا موبائل نمبر';

  @override
  String get emailOrPhoneHint => 'name@example.com یا 9876543210';

  @override
  String get invalidEmailOrPhone => 'درست ای میل پتہ یا 10 ہندسوں کا موبائل نمبر درج کریں';

  @override
  String get sendCode => 'کوڈ بھیجیں';

  @override
  String get agreeToTermsOnContinue => 'جاری رکھنے سے آپ ہماری سروس کی شرائط اور رازداری کی پالیسی سے اتفاق کرتے ہیں۔';

  @override
  String get otpTitle => 'تصدیق کریں کہ یہ آپ ہی ہیں';

  @override
  String otpSubtitle(String target) {
    return '$target پر بھیجا گیا 6 ہندسوں کا کوڈ درج کریں';
  }

  @override
  String get verifyCode => 'تصدیق کریں';

  @override
  String get resendCode => 'کوڈ دوبارہ بھیجیں';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds سیکنڈ میں دوبارہ بھیجیں';
  }

  @override
  String get codeResent => 'نیا کوڈ بھیج دیا گیا ہے';

  @override
  String get incorrectCode => 'یہ کوڈ غلط ہے یا اس کی میعاد ختم ہو چکی ہے۔ نیا کوڈ منگوائیں۔';

  @override
  String get enterFullCode => 'پورے 6 ہندسے درج کریں';

  @override
  String get accountSuspended => 'یہ اکاؤنٹ معطل کر دیا گیا ہے۔ براہ کرم سپورٹ سے رابطہ کریں۔';

  @override
  String get tooManyAttempts => 'بہت زیادہ کوششیں ہو گئیں۔ براہ کرم کچھ دیر بعد دوبارہ کوشش کریں۔';

  @override
  String get sessionExpired => 'آپ کا سیشن ختم ہو گیا ہے۔ براہ کرم دوبارہ سائن ان کریں۔';

  @override
  String get networkError => 'انٹرنیٹ کنکشن نہیں ہے۔ اپنا کنکشن دیکھیں اور دوبارہ کوشش کریں۔';

  @override
  String get developmentCode => 'ڈیویلپمنٹ کوڈ';

  @override
  String get signOut => 'سائن آؤٹ';

  @override
  String get signedOut => 'آپ سائن آؤٹ ہو گئے ہیں';

  @override
  String get somethingWentWrong => 'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get profileTitle => 'پروفائل';

  @override
  String get viewProfile => 'پروفائل دیکھیں';

  @override
  String get nameLabel => 'نام';

  @override
  String get emailLabel => 'ای میل';

  @override
  String get mobileLabel => 'موبائل نمبر';

  @override
  String get accountStatusLabel => 'اکاؤنٹ کی حالت';

  @override
  String get statusActive => 'فعال';

  @override
  String get statusPending => 'زیر التوا';

  @override
  String get statusSuspended => 'معطل';

  @override
  String get verifiedLabel => 'تصدیق شدہ';

  @override
  String get notProvided => 'شامل نہیں کیا گیا';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get navHome => 'ہوم';

  @override
  String get navSearch => 'تلاش';

  @override
  String get navOrders => 'آرڈرز';

  @override
  String get cancelLabel => 'منسوخ کریں';

  @override
  String get deliverTo => 'ڈیلیوری کا پتہ';

  @override
  String get searchDishesHint => 'کھانا یا ریستوران تلاش کریں';

  @override
  String get searchTitle => 'تلاش';

  @override
  String get searchNoResultsTitle => 'کچھ نہیں ملا';

  @override
  String get searchNoResultsSubtitle => 'کوئی اور کھانا، کھانے کا انداز یا ریستوران کا نام آزمائیں۔';

  @override
  String get cravingTitle => 'آج کیا کھانے کا دل ہے؟';

  @override
  String get offersTitle => 'آپ کے لیے آفرز';

  @override
  String get restaurantsNearby => 'آپ کے قریبی ریستوران';

  @override
  String restaurantsCount(int count) {
    return '$count ریستوران';
  }

  @override
  String get noRestaurantsTitle => 'یہاں ابھی کچھ نہیں ہے';

  @override
  String get noRestaurantsSubtitle => 'کوئی اور قسم دیکھیں یا فلٹر ہٹا دیں۔';

  @override
  String minutesAway(int minutes) {
    return '$minutes منٹ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance کلومیٹر';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ ریٹنگز';
  }

  @override
  String priceForTwo(int amount) {
    return 'دو افراد کے لیے ₹$amount';
  }

  @override
  String get freeDelivery => 'مفت ڈیلیوری';

  @override
  String percentOff(int percent) {
    return '$percent% رعایت';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'آپ کے آرڈر پر $percent% رعایت';
  }

  @override
  String get vegOnly => 'صرف سبزی';

  @override
  String get bestseller => 'سب سے زیادہ فروخت';

  @override
  String get addLabel => 'شامل';

  @override
  String get noVegDishesTitle => 'یہاں سبزی کھانے نہیں ہیں';

  @override
  String get noVegDishesSubtitle => 'پورا مینو دیکھنے کے لیے سبزی فلٹر بند کریں۔';

  @override
  String get replaceCartTitle => 'نئی کارٹ شروع کریں؟';

  @override
  String replaceCartMessage(String restaurant) {
    return 'آپ کی کارٹ میں $restaurant کی چیزیں ہیں۔ یہ شامل کرنے پر وہ ہٹ جائیں گی۔';
  }

  @override
  String get replaceCartConfirm => 'ہٹا کر شامل کریں';

  @override
  String get cartTitle => 'آپ کی کارٹ';

  @override
  String get cartEmptyTitle => 'آپ کی کارٹ خالی ہے';

  @override
  String get cartEmptySubtitle => 'شروع کرنے کے لیے کسی ریستوران سے کھانا شامل کریں۔';

  @override
  String get browseRestaurants => 'ریستوران دیکھیں';

  @override
  String itemsInCart(int count) {
    return '$count چیزیں';
  }

  @override
  String get viewCart => 'کارٹ دیکھیں';

  @override
  String get itemTotal => 'اشیاء کا کل';

  @override
  String get deliveryFeeLabel => 'ڈیلیوری فیس';

  @override
  String get taxesAndCharges => 'ٹیکس اور چارجز';

  @override
  String get freeLabel => 'مفت';

  @override
  String get toPay => 'قابل ادائیگی';

  @override
  String placeOrderFor(int amount) {
    return 'آرڈر کریں · ₹$amount';
  }

  @override
  String get ordersTitle => 'آپ کے آرڈرز';

  @override
  String get ordersEmptyTitle => 'ابھی کوئی آرڈر نہیں';

  @override
  String get ordersEmptySubtitle => 'آپ کے پچھلے آرڈرز یہاں دکھائی دیں گے۔';

  @override
  String get reorder => 'دوبارہ آرڈر';

  @override
  String orderTitle(String id) {
    return 'آرڈر $id';
  }

  @override
  String get orderPlacedTitle => 'آرڈر ہو گیا';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'تقریباً $minutes منٹ میں پہنچ جائے گا۔';
  }

  @override
  String get orderDeliveredTitle => 'ڈیلیور ہو گیا';

  @override
  String get orderDeliveredSubtitle => 'کھانے سے لطف اٹھائیں۔';

  @override
  String get statusOrderPlaced => 'آرڈر ہو گیا';

  @override
  String get statusPreparing => 'کھانا تیار ہو رہا ہے';

  @override
  String get statusOnTheWay => 'راستے میں ہے';

  @override
  String get statusDelivered => 'ڈیلیور ہو گیا';

  @override
  String get keepBrowsing => 'دیکھتے رہیں';

  @override
  String get backToHome => 'ہوم پر واپس';

  @override
  String get prototypeNotice => 'نمونہ اسٹور فرنٹ — اصلی دکانیں کیٹلاگ API کے ساتھ آئیں گی۔';

  @override
  String get prototypeCheckoutNotice => 'یہ ایک پروٹوٹائپ ہے۔ کوئی ادائیگی نہیں لی جاتی اور نہ ہی کوئی حقیقی آرڈر ہوتا ہے۔';

  @override
  String get prototypeTrackingNotice => 'پروٹوٹائپ کے لیے ٹریکنگ مصنوعی ہے۔';
}
