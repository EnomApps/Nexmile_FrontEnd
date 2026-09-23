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
  String get fieldRequired => 'یہ خانہ ضروری ہے';

  @override
  String get tagline => 'تیز ڈیلیوری۔ تازہ مسکراہٹیں۔';

  @override
  String get chooseLanguageTitle => 'اپنی زبان منتخب کریں';

  @override
  String get chooseLanguageSubtitle =>
      'وہ زبان منتخب کریں جس میں آپ آسانی محسوس کرتے ہیں۔ آپ اسے کسی بھی وقت ترتیبات میں تبدیل کر سکتے ہیں۔';

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
  String get homeSubtitle =>
      'تازہ گروسری، گرم کھانا اور روزمرہ کی ضروریات آپ کے قریبی دکانوں سے۔';

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
  String get loginSubtitle =>
      'اپنا ای میل یا موبائل نمبر درج کریں، ہم آپ کو تصدیقی کوڈ بھیجیں گے۔';

  @override
  String get emailOrPhoneLabel => 'ای میل یا موبائل نمبر';

  @override
  String get emailOrPhoneHint => 'name@example.com یا 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'درست ای میل پتہ یا 10 ہندسوں کا موبائل نمبر درج کریں';

  @override
  String get sendCode => 'کوڈ بھیجیں';

  @override
  String get agreeToTermsOnContinue =>
      'جاری رکھنے سے آپ ہماری سروس کی شرائط اور رازداری کی پالیسی سے اتفاق کرتے ہیں۔';

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
  String get incorrectCode =>
      'یہ کوڈ غلط ہے یا اس کی میعاد ختم ہو چکی ہے۔ نیا کوڈ منگوائیں۔';

  @override
  String get enterFullCode => 'پورے 6 ہندسے درج کریں';

  @override
  String get accountSuspended =>
      'یہ اکاؤنٹ معطل کر دیا گیا ہے۔ براہ کرم سپورٹ سے رابطہ کریں۔';

  @override
  String get tooManyAttempts =>
      'بہت زیادہ کوششیں ہو گئیں۔ براہ کرم کچھ دیر بعد دوبارہ کوشش کریں۔';

  @override
  String get sessionExpired =>
      'آپ کا سیشن ختم ہو گیا ہے۔ براہ کرم دوبارہ سائن ان کریں۔';

  @override
  String get networkError =>
      'انٹرنیٹ کنکشن نہیں ہے۔ اپنا کنکشن دیکھیں اور دوبارہ کوشش کریں۔';

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
  String get searchNoResultsSubtitle =>
      'کوئی اور کھانا، کھانے کا انداز یا ریستوران کا نام آزمائیں۔';

  @override
  String get cravingTitle => 'آج کیا کھانے کا دل ہے؟';

  @override
  String get offersTitle => 'آپ کے لیے آفرز';

  @override
  String get restaurantsNearby => 'آپ کے قریبی ریستوران';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ریستوران',
      one: '1 ریستوران',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ریٹنگز',
      one: '1 ریٹنگ',
    );
    return '$_temp0';
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
  String get noVegDishesSubtitle =>
      'پورا مینو دیکھنے کے لیے سبزی فلٹر بند کریں۔';

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
  String get cartEmptySubtitle =>
      'شروع کرنے کے لیے کسی ریستوران سے کھانا شامل کریں۔';

  @override
  String get browseRestaurants => 'ریستوران دیکھیں';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں',
      one: '1 چیز',
    );
    return '$_temp0';
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
  String placeOrderFor(String amount) {
    return 'آرڈر کریں · $amount';
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
  String get prototypeNotice =>
      'نمونہ اسٹور فرنٹ — اصلی دکانیں کیٹلاگ API کے ساتھ آئیں گی۔';

  @override
  String get prototypeCheckoutNotice =>
      'یہ ایک پروٹوٹائپ ہے۔ کوئی ادائیگی نہیں لی جاتی اور نہ ہی کوئی حقیقی آرڈر ہوتا ہے۔';

  @override
  String get prototypeTrackingNotice => 'پروٹوٹائپ کے لیے ٹریکنگ مصنوعی ہے۔';

  @override
  String get locationTitle => 'ڈیلیوری کہاں کرنی ہے؟';

  @override
  String get locationSubtitle =>
      'Nexmile صرف 1 کلومیٹر کے اندر کی دکانوں سے ڈیلیوری کرتا ہے، اس لیے ہمیں آپ کی درست جگہ چاہیے۔';

  @override
  String get locationReasonRadiusTitle => '1 کلومیٹر کے اندر کی دکانیں';

  @override
  String get locationReasonRadiusBody =>
      'ہم صرف وہی باورچی خانے دکھاتے ہیں جہاں سے کھانا گرم پہنچے۔';

  @override
  String get locationReasonAccuracyTitle => 'بالکل صحیح دروازے تک';

  @override
  String get locationReasonAccuracyBody =>
      'درست پن ہو تو ڈیلیوری پارٹنر فون کیے بغیر آپ تک پہنچ جاتا ہے۔';

  @override
  String get locationReasonPrivacyTitle => 'صرف ایپ استعمال کرتے وقت';

  @override
  String get locationReasonPrivacyBody =>
      'ہم پس منظر میں آپ کو ٹریک نہیں کرتے، اور پتہ آپ خود بھی لکھ سکتے ہیں۔';

  @override
  String get allowLocation => 'مقام کی اجازت دیں';

  @override
  String get enterAddressManually => 'میں پتہ خود لکھوں گا';

  @override
  String get locationDenied =>
      'مقام کی اجازت نہیں ملی۔ آپ پن خود بھی لگا سکتے ہیں۔';

  @override
  String get locationDeniedForever =>
      'Nexmile کے لیے مقام بند ہے۔ ترتیبات میں آن کریں یا پن خود لگائیں۔';

  @override
  String get locationServiceOff => 'اس ڈیوائس پر مقام بند ہے۔';

  @override
  String get locationUnavailable =>
      'مقام حاصل نہیں ہو سکا۔ براہ کرم پن خود لگائیں۔';

  @override
  String get openSettings => 'ترتیبات';

  @override
  String get pinLocationTitle => 'اپنا ڈیلیوری پن لگائیں';

  @override
  String get deliveryRadiusHint =>
      'دائرہ وہ 1 کلومیٹر دکھاتا ہے جس میں Nexmile ڈیلیوری کرتا ہے۔';

  @override
  String get useMyLocation => 'میرا مقام استعمال کریں';

  @override
  String get deliveringHere => 'یہاں ڈیلیوری';

  @override
  String get dragToAdjust => 'پن بدلنے کے لیے نقشہ کھسکائیں';

  @override
  String get confirmLocation => 'مقام کی تصدیق کریں';

  @override
  String get addressDetailsTitle => 'پتے کی تفصیلات';

  @override
  String get addressDetailsSubtitle =>
      'صحیح دروازے تک پہنچنے کے لیے مکان نمبر اور نشانی شامل کریں۔';

  @override
  String get pinnedLocation => 'منتخب مقام';

  @override
  String get changePin => 'تبدیل کریں';

  @override
  String get saveAddressAs => 'یہ پتہ ایسے محفوظ کریں';

  @override
  String get labelHome => 'گھر';

  @override
  String get labelWork => 'دفتر';

  @override
  String get labelOther => 'دیگر';

  @override
  String get addressLine1Label => 'مکان، فلیٹ یا عمارت';

  @override
  String get addressLine1Hint => '12A، گرین ریزیڈنسی';

  @override
  String get addressLine2Label => 'گلی یا علاقہ';

  @override
  String get addressLine2Hint => 'دوسری ایونیو، انا نگر';

  @override
  String get landmarkLabel => 'نشانی';

  @override
  String get landmarkHint => 'بس اسٹاپ کے سامنے';

  @override
  String get cityLabel => 'شہر';

  @override
  String get stateLabel => 'ریاست';

  @override
  String get pincodeLabel => 'پن کوڈ';

  @override
  String get invalidPincode => 'درست 6 ہندسوں کا پن کوڈ درج کریں';

  @override
  String get contactNameLabel => 'رابطہ نام';

  @override
  String get contactPhoneLabel => 'رابطہ نمبر';

  @override
  String get invalidMobileNumber => 'درست 10 ہندسوں کا موبائل نمبر درج کریں';

  @override
  String get makeDefaultAddress => 'بطور ڈیفالٹ یہیں ڈیلیوری';

  @override
  String get saveAddress => 'پتہ محفوظ کریں';

  @override
  String get addressSaved => 'پتہ محفوظ ہو گیا';

  @override
  String get addressBookTitle => 'ڈیلیوری کے پتے';

  @override
  String get manageAddresses => 'محفوظ پتے سنبھالیں';

  @override
  String get noAddressesTitle => 'ابھی کوئی پتہ نہیں';

  @override
  String get noAddressesSubtitle =>
      'ایک پتہ شامل کریں تاکہ ہم آپ تک ڈیلیوری کرنے والی دکانیں دکھا سکیں۔';

  @override
  String get addAddress => 'پتہ شامل کریں';

  @override
  String get setAsDefault => 'ڈیفالٹ بنائیں';

  @override
  String get editLabel => 'ترمیم';

  @override
  String get addressUpdated => 'پتہ اپ ڈیٹ ہو گیا';

  @override
  String get deleteLabel => 'حذف کریں';

  @override
  String get deleteAddressTitle => 'یہ پتہ حذف کریں؟';

  @override
  String get deleteAddressMessage => 'آپ اسے بعد میں دوبارہ شامل کر سکتے ہیں۔';

  @override
  String get rescueDealsTitle => 'فوڈ ریسکیو';

  @override
  String get notTakingOrders => 'آرڈر نہیں لیے جا رہے';

  @override
  String get closedRightNow => 'ابھی بند ہے';

  @override
  String minimumOrder(String amount) {
    return 'کم از کم $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count باقی';
  }

  @override
  String get soldOut => 'ختم ہو گیا';

  @override
  String get menuEmptyTitle => 'ابھی کوئی پکوان نہیں';

  @override
  String get menuEmptySubtitle => 'اس ریستوران نے اپنا مینو شامل نہیں کیا۔';

  @override
  String get moreDishesTitle => 'مزید پکوان';

  @override
  String get customisable => 'اپنی پسند کے مطابق';

  @override
  String get requiredLabel => 'لازمی';

  @override
  String get optionalLabel => 'اختیاری';

  @override
  String get chooseOne => 'ایک منتخب کریں';

  @override
  String chooseUpTo(int count) {
    return 'زیادہ سے زیادہ $count منتخب کریں';
  }

  @override
  String chooseAtLeast(int count) {
    return 'کم از کم $count منتخب کریں';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min سے $max منتخب کریں';
  }

  @override
  String get specialInstructions => 'خاص ہدایات';

  @override
  String get specialInstructionsHint => 'کم مرچ، پیاز نہیں…';

  @override
  String addForAmount(String amount) {
    return 'شامل کریں · $amount';
  }

  @override
  String get deliveryLabel => 'ڈیلیوری';

  @override
  String get pickupLabel => 'خود لے جانا';

  @override
  String get packagingLabel => 'پیکنگ';

  @override
  String get discountLabel => 'رعایت';

  @override
  String get billDetailsTitle => 'بل کی تفصیل';

  @override
  String get clearCart => 'کارٹ خالی کریں';

  @override
  String get clearCartTitle => 'یہ کارٹ خالی کریں؟';

  @override
  String get clearCartMessage => 'اس میں موجود ہر چیز ہٹا دی جائے گی۔';

  @override
  String unavailableItemsNotice(String items) {
    return 'اب دستیاب نہیں: $items';
  }

  @override
  String get removeUnavailable => 'انہیں ہٹا دیں';

  @override
  String minimumNotMet(String amount) {
    return 'کم از کم آرڈر $amount ہے';
  }

  @override
  String get checkoutTitle => 'چیک آؤٹ';

  @override
  String get deliveryAddressLabel => 'ڈیلیوری کا پتہ';

  @override
  String get noAddressSelected => 'کوئی پتہ منتخب نہیں';

  @override
  String get paymentMethodLabel => 'ادائیگی';

  @override
  String get payOnDelivery => 'ڈیلیوری پر نقد';

  @override
  String get noteToRestaurant => 'ریستوران کے لیے نوٹ';

  @override
  String get noteToRestaurantHint => 'گھنٹی دو بار بجائیں…';

  @override
  String get activeOrdersTitle => 'جاری آرڈر';

  @override
  String get pastOrdersTitle => 'پرانے آرڈر';

  @override
  String get orderItemsTitle => 'پکوان';

  @override
  String get orderProgressTitle => 'پیش رفت';

  @override
  String get arrivingIn => 'پہنچنے میں';

  @override
  String get pickupCodeLabel => 'پک اپ کوڈ';

  @override
  String get cancellationReasonLabel => 'منسوخی کی وجہ';

  @override
  String get riderLabel => 'ڈیلیوری پارٹنر';

  @override
  String get callRider => 'کال کریں';

  @override
  String get viewInvoice => 'ٹیکس انوائس';

  @override
  String get cancelOrder => 'آرڈر منسوخ کریں';

  @override
  String get cancelOrderTitle => 'یہ آرڈر منسوخ کریں؟';

  @override
  String get cancelOrderMessage =>
      'ریستوران کے قبول کرنے سے پہلے ہی منسوخ کیا جا سکتا ہے۔';

  @override
  String get cancelReasonLabel => 'وجہ';

  @override
  String get cancelReasonFallback => 'گاہک نے منسوخ کیا';

  @override
  String get orderCancelled => 'آرڈر منسوخ ہو گیا';

  @override
  String get currentLocationLabel => 'موجودہ مقام';

  @override
  String get editProfileTitle => 'پروفائل میں تبدیلی';

  @override
  String get editProfileSubtitle =>
      'ریستوران اور ڈیلیوری پارٹنر کو آپ کا نام ہی نظر آتا ہے۔';

  @override
  String get saveChanges => 'تبدیلیاں محفوظ کریں';

  @override
  String get profileUpdated => 'پروفائل اپ ڈیٹ ہو گئی';

  @override
  String get deleteAccount => 'اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountTitle => 'اپنا اکاؤنٹ حذف کریں؟';

  @override
  String get deleteAccountMessage =>
      'ہر ڈیوائس سے سائن آؤٹ ہو جائیں گے۔ پرانے آرڈر اور بل ٹیکس ریکارڈ کے لیے رکھے جاتے ہیں۔';

  @override
  String get accountDeleted => 'آپ کا اکاؤنٹ حذف کر دیا گیا';

  @override
  String get devicesTitle => 'سائن ان ڈیوائسز';

  @override
  String get devicesSubtitle => 'آپ کہاں سائن ان ہیں';

  @override
  String get devicesEmptyTitle => 'کوئی اور ڈیوائس نہیں';

  @override
  String get devicesEmptySubtitle => 'آپ صرف اسی ڈیوائس پر سائن ان ہیں۔';

  @override
  String get signOutDevice => 'سائن آؤٹ';

  @override
  String get signOutDeviceTitle => 'یہ ڈیوائس سائن آؤٹ کریں؟';

  @override
  String get signOutDeviceMessage =>
      'اگر آپ یہی ڈیوائس استعمال کر رہے ہیں تو دوبارہ سائن ان کرنا ہوگا۔';

  @override
  String get deviceSignedOut => 'ڈیوائس سائن آؤٹ ہو گئی';

  @override
  String get signOutEverywhere => 'ہر جگہ سے سائن آؤٹ';

  @override
  String get signOutEverywhereTitle => 'ہر جگہ سے سائن آؤٹ کریں؟';

  @override
  String get signOutEverywhereMessage =>
      'اس ڈیوائس سمیت ہر ڈیوائس سائن آؤٹ ہو جائے گی۔';

  @override
  String get unknownDevice => 'نامعلوم ڈیوائس';

  @override
  String get activeNow => 'ابھی فعال';

  @override
  String minutesAgo(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String hoursAgo(int count) {
    return '$count گھنٹے پہلے';
  }

  @override
  String daysAgo(int count) {
    return '$count دن پہلے';
  }

  @override
  String get filtersAndSorting => 'فلٹر اور ترتیب';

  @override
  String get clearAll => 'سب ہٹا دیں';

  @override
  String get showResults => 'نتائج دیکھیں';

  @override
  String get closeLabel => 'بند کریں';

  @override
  String get sortByTitle => 'ترتیب دیں';

  @override
  String get sortRelevance => 'مطابقت';

  @override
  String get sortRating => 'ریٹنگ';

  @override
  String get sortDeliveryTime => 'ڈیلیوری وقت';

  @override
  String get sortCostLowHigh => 'قیمت: کم سے زیادہ';

  @override
  String get sortCostHighLow => 'قیمت: زیادہ سے کم';

  @override
  String get timeSection => 'وقت';

  @override
  String get nearAndFast => 'قریب اور تیز';

  @override
  String get openNow => 'ابھی کھلا';

  @override
  String get ratingSection => 'ریستوران ریٹنگ';

  @override
  String ratedAbove(String rating) {
    return '$rating+ ریٹنگ';
  }

  @override
  String get offersSection => 'آفرز';

  @override
  String get hasOffersLabel => 'آفر والے';

  @override
  String get dishPriceSection => 'پکوان کی قیمت';

  @override
  String costUnder(String amount) {
    return '$amount سے کم';
  }

  @override
  String costBetween(String min, String max) {
    return '$min – $max';
  }

  @override
  String costOver(String amount) {
    return '$amount+';
  }

  @override
  String get moreSection => 'مزید';

  @override
  String get noPackagingCharges => 'پیکنگ چارج نہیں';

  @override
  String get allRestaurantsTitle => 'تمام ریستوران';

  @override
  String get whatsOnYourMind => 'کیا کھانے کا دل ہے؟';

  @override
  String get listeningNow => 'سن رہے ہیں…';

  @override
  String get speakNowHint => 'کوئی پکوان یا ریستوران بولیں';

  @override
  String get voiceUnavailable => 'وائس سرچ دستیاب نہیں';

  @override
  String get voiceUnavailableBody => 'آپ ٹائپ کر کے بھی تلاش کر سکتے ہیں۔';

  @override
  String get microphoneDenied => 'مائیکروفون کی اجازت بند ہے';

  @override
  String get voiceSearchLabel => 'آواز سے تلاش کریں';

  @override
  String get ratingsAndReviews => 'ریٹنگ اور جائزے';

  @override
  String get reviewsWithTextOnly => 'جائزے والے';

  @override
  String get noReviewsTitle => 'ابھی کوئی ریٹنگ نہیں';

  @override
  String get noReviewsSubtitle => 'آرڈر کے بعد پہلی ریٹنگ آپ دیں۔';

  @override
  String get rateOrderTitle => 'اپنے آرڈر کو ریٹ کریں';

  @override
  String get rateDishesTitle => 'کھانوں کو ریٹ کریں';

  @override
  String get reviewHint => 'کچھ اور کہنا چاہیں گے؟ (اختیاری)';

  @override
  String get submitRating => 'ریٹنگ بھیجیں';

  @override
  String get reviewThanks => 'شکریہ — آپ کی ریٹنگ موصول ہو گئی۔';

  @override
  String get rateThisOrder => 'اس آرڈر کو ریٹ کریں';
}
