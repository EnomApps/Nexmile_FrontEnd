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
  String get fieldRequired => 'یہ خانہٕ چھُ ضروری';

  @override
  String get tagline => 'تیز ڈیلیوری۔ تازٕ مُسکراہٹ۔';

  @override
  String get chooseLanguageTitle => 'پنُن زبان ژارٕو';

  @override
  String get chooseLanguageSubtitle =>
      'یِم زبان چھِوٕ آسان محسوس کران سُہ ژارٕو۔ توہہِ ہیٚکِو یہ کُنہِ وقتہٕ سیٹِنگز منٛز بدلاوِتھ۔';

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
  String get homeSubtitle =>
      'تازٕ گروسری، گرٕم کھَنہٕ تہٕ روزمرٕ ضرورتہٕ توہنٛدِن نزدیٚکی دُکانن پؠٹھٕ۔';

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
  String get loginSubtitle =>
      'پنُن ای میل یا موبائل نمبر لیٚکھِو، اسہٕ سوزو توہہِ تصدیقی کوڈ۔';

  @override
  String get emailOrPhoneLabel => 'ای میل یا موبائل نمبر';

  @override
  String get emailOrPhoneHint => 'name@example.com یا 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'صحیح ای میل پتہٕ یا 10 ہندسن ہُند موبائل نمبر لیٚکھِو';

  @override
  String get sendCode => 'کوڈ سوزِو';

  @override
  String get agreeToTermsOnContinue =>
      'برونہہ گژھِتھ چھِوٕ توہہِ ساني سروس شرطن تہٕ پرائیویسی پالیسی سٕتؠ رٲضی گژھان۔';

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
  String get incorrectCode =>
      'یہ کوڈ چھُ غلط یا اَمِ ہُند وقت چھُ گۆمُت۔ نوٚو کوڈ ژھۆنڈِو۔';

  @override
  String get enterFullCode => 'پورٕ 6 ہندسہٕ لیٚکھِو';

  @override
  String get accountSuspended =>
      'یہ کھاتہٕ چھُ معطل کرنہٕ آمُت۔ مہربٲنی کٔرِتھ سپورٹ سٕتؠ رٲبطہٕ کرِو۔';

  @override
  String get tooManyAttempts =>
      'زیادٕ کوششہٕ آیہ کرنہٕ۔ مہربٲنی کٔرِتھ کینٛہہ وقتہٕ پتہٕ دوبارٕ کوشش کرِو۔';

  @override
  String get sessionExpired =>
      'توہنٛد سیشن چھُ ختم گۆمُت۔ مہربٲنی کٔرِتھ دوبارٕ سائن اِن کرِو۔';

  @override
  String get networkError =>
      'انٹرنیٹ کنکشن چھُ نہ۔ پنُن کنکشن چیک کٔرِتھ دوبارٕ کوشش کرِو۔';

  @override
  String get developmentCode => 'ڈیویلپمنٹ کوڈ';

  @override
  String get signOut => 'سائن آوٹ';

  @override
  String get signedOut => 'توہہِ چھِوٕ سائن آوٹ گژھمٕتؠ';

  @override
  String get somethingWentWrong =>
      'کینٛہہ غلط گو۔ مہربٲنی کٔرِتھ دوبارٕ کوشش کرِو۔';

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
  String get searchNoResultsSubtitle =>
      'بیٚاکھ کھَنہٕ، پکاونُک طریقہٕ یا ریسٹورنٹ ناو آزماوِو۔';

  @override
  String get cravingTitle => 'اَز کیٚاہ کھیٚنُک دِل چھُ؟';

  @override
  String get offersTitle => 'توہہِ خٲطرٕ آفر';

  @override
  String get restaurantsNearby => 'توہنٛدِن نزدیٚکی ریسٹورنٹ';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ریٹنگ',
      one: '1 ریٹنگ',
    );
    return '$_temp0';
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
  String get noVegDishesSubtitle =>
      'پورٕ مینو وُچھنہٕ خٲطرٕ سبزی فلٹر بند کرِو۔';

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
  String get cartEmptySubtitle =>
      'شُروع کرنہٕ خٲطرٕ کُنہِ ریسٹورنٹ پؠٹھٕ کھَنہٕ شٲمِل کرِو۔';

  @override
  String get browseRestaurants => 'ریسٹورنٹ وُچھِو';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزٕ',
      one: '1 چیز',
    );
    return '$_temp0';
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
  String placeOrderFor(String amount) {
    return 'آرڈر کرِو · $amount';
  }

  @override
  String get ordersTitle => 'توہنٛدؠ آرڈر';

  @override
  String get ordersEmptyTitle => 'ناوُ کانہہ آرڈر نہ';

  @override
  String get ordersEmptySubtitle =>
      'توہنٛدؠ برونہہ کٕنؠ آرڈر ییٚنہٕ یَتہِ ہاونہٕ۔';

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
  String get prototypeNotice =>
      'نمونہٕ سٹور فرنٹ — اصلی دُکان ییٚنہٕ کیٹلاگ API سٕتؠ۔';

  @override
  String get prototypeCheckoutNotice =>
      'یہ چھُ اکھ پروٹوٹائپ۔ کانہہ أدایگی چھِ نہ ییٚنہٕ ہیٚنہٕ تہٕ نہ کانہہ اصلی آرڈر چھُ گژھان۔';

  @override
  String get prototypeTrackingNotice => 'پروٹوٹائپ خٲطرٕ چھُ ٹریکِنگ مصنوعی۔';

  @override
  String get locationTitle => 'ڈیلیوری کۄتہٕ کرٕو؟';

  @override
  String get locationSubtitle =>
      'Nexmile کران چھُ صرف 1 کِلومیٹر اندر ہٕنٛدین دُکانن پؠٹھٕ ڈیلیوری، تہٕ امہِ خٲطرٕ چھُ توہنٛد صحیح جاے ضروری۔';

  @override
  String get locationReasonRadiusTitle => '1 کِلومیٹر اندر ہٕنٛدؠ دُکان';

  @override
  String get locationReasonRadiusBody =>
      'أسؠ چھِ صرف تِم باورچی خانہٕ ہاوان یَتہِ پؠٹھٕ کھَنہٕ گرٕم پکھِ۔';

  @override
  String get locationReasonAccuracyTitle => 'بالکل صحیح دَروازس تام';

  @override
  String get locationReasonAccuracyBody =>
      'صحیح پِن آسِتھ چھُ ڈیلیوری پارٹنر فون کٔرِتھ بغٲر توہہِ تام واتان۔';

  @override
  String get locationReasonPrivacyTitle => 'صرف ایپ استعمال کران وقتہٕ';

  @override
  String get locationReasonPrivacyBody =>
      'أسؠ چھِ نہ پس منظرس منٛز توہہِ ٹریک کران، تہٕ پتہٕ ہیٚکِو توہہِ پانہٕ تہِ لیٚکھِتھ۔';

  @override
  String get allowLocation => 'جاے ہٕنٛز اجازت دِیِو';

  @override
  String get enterAddressManually => 'بہٕ لیٚکھہٕ پتہٕ پانہٕ';

  @override
  String get locationDenied =>
      'جاے ہٕنٛز اجازت نہ میٚلہ۔ توہہِ ہیٚکِو پِن پانہٕ ٹھٲوِتھ۔';

  @override
  String get locationDeniedForever =>
      'Nexmile خٲطرٕ چھُ جاے بند۔ سیٹِنگز منٛز کھولٕو یا پِن پانہٕ ٹھٲوِو۔';

  @override
  String get locationServiceOff => 'امہِ ڈیوائسس پؠٹھٕ چھُ جاے بند۔';

  @override
  String get locationUnavailable =>
      'جاے نہ لبنہٕ آیہ۔ مہربٲنی کٔرِتھ پِن پانہٕ ٹھٲوِو۔';

  @override
  String get openSettings => 'سیٹِنگز';

  @override
  String get pinLocationTitle => 'پنُن ڈیلیوری پِن ٹھٲوِو';

  @override
  String get deliveryRadiusHint =>
      'دٲیرٕ چھُ سُہ 1 کِلومیٹر ہاوان یَتہِ منٛز Nexmile ڈیلیوری کران چھُ۔';

  @override
  String get useMyLocation => 'میٚون جاے استعمال کرِو';

  @override
  String get deliveringHere => 'یَتہِ ڈیلیوری';

  @override
  String get dragToAdjust => 'پِن بدلاونہٕ خٲطرٕ نقشہٕ ژَلٕو';

  @override
  String get confirmLocation => 'جاے تصدیق کرِو';

  @override
  String get addressDetailsTitle => 'پتہٕ تفصیل';

  @override
  String get addressDetailsSubtitle =>
      'صحیح دَروازس تام واتنہٕ خٲطرٕ گَرٕ نمبر تہٕ نِشٲنی شٲمِل کرِو۔';

  @override
  String get pinnedLocation => 'ژارنہٕ آمٕژ جاے';

  @override
  String get changePin => 'بدلاوِو';

  @override
  String get saveAddressAs => 'یہ پتہٕ ییٚتھ کٔرِتھ محفوظ کرِو';

  @override
  String get labelHome => 'گَرٕ';

  @override
  String get labelWork => 'دفتر';

  @override
  String get labelOther => 'بیٚاکھ';

  @override
  String get addressLine1Label => 'گَرٕ، فلیٹ یا عمارت';

  @override
  String get addressLine1Hint => '12A، گریٖن ریزیڈنسی';

  @override
  String get addressLine2Label => 'گلی یا علاقہٕ';

  @override
  String get addressLine2Hint => 'دۆیِم ایونیو، اَنا نگر';

  @override
  String get landmarkLabel => 'نِشٲنی';

  @override
  String get landmarkHint => 'بس اسٹاپُک برونٛہہ';

  @override
  String get cityLabel => 'شہر';

  @override
  String get stateLabel => 'ریاست';

  @override
  String get pincodeLabel => 'پِن کوڈ';

  @override
  String get invalidPincode => 'صحیح 6 ہندسن ہُند پِن کوڈ لیٚکھِو';

  @override
  String get contactNameLabel => 'رٲبطہٕ ناو';

  @override
  String get contactPhoneLabel => 'رٲبطہٕ نمبر';

  @override
  String get invalidMobileNumber => 'صحیح 10 ہندسن ہُند موبائل نمبر لیٚکھِو';

  @override
  String get makeDefaultAddress => 'ڈیفالٹ طور یَتہِ ای ڈیلیوری';

  @override
  String get saveAddress => 'پتہٕ محفوظ کرِو';

  @override
  String get addressSaved => 'پتہٕ آو محفوظ کرنہٕ';

  @override
  String get addressBookTitle => 'ڈیلیوری پتہٕ';

  @override
  String get manageAddresses => 'محفوظ پتہٕ سنبالٕو';

  @override
  String get noAddressesTitle => 'ناوُ کانہہ پتہٕ نہ';

  @override
  String get noAddressesSubtitle =>
      'اَکھ پتہٕ شٲمِل کرِو تہٕ أسؠ ہیٚکَو توہہِ تام ڈیلیوری کران وٲلؠ دُکان ہٲوِتھ۔';

  @override
  String get addAddress => 'پتہٕ شٲمِل کرِو';

  @override
  String get setAsDefault => 'ڈیفالٹ بناوِو';

  @override
  String get editLabel => 'تبدیٖلی کرِو';

  @override
  String get addressUpdated => 'پتہٕ آو اپ ڈیٹ کرنہٕ';

  @override
  String get deleteLabel => 'مِٹاوِو';

  @override
  String get deleteAddressTitle => 'یہ پتہٕ مِٹاوٕو؟';

  @override
  String get deleteAddressMessage =>
      'توہہِ ہیٚکِو یہ پتہٕ دوبارٕ شٲمِل کٔرِتھ۔';

  @override
  String get rescueDealsTitle => 'فوڈ ریسکیو';

  @override
  String get notTakingOrders => 'آرڈر چھِ نہ ہیوان';

  @override
  String get closedRightNow => 'وُنی چھُ بند';

  @override
  String minimumOrder(String amount) {
    return 'کم از کم $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count باقی';
  }

  @override
  String get soldOut => 'ختم گو';

  @override
  String get menuEmptyTitle => 'وُنی چھُ نہ کینہہ کھانہٕ';

  @override
  String get menuEmptySubtitle => 'یَتھ ریستوران چھُنہ پنُن مینو رٹِمُت۔';

  @override
  String get moreDishesTitle => 'زیادٕ کھانہٕ';

  @override
  String get customisable => 'پننِس پسندٕ مطابق';

  @override
  String get requiredLabel => 'ضروری';

  @override
  String get optionalLabel => 'اختیاری';

  @override
  String get chooseOne => 'اکھ ژارٕو';

  @override
  String chooseUpTo(int count) {
    return 'زیادٕ کھۄتہ زیادٕ $count ژارٕو';
  }

  @override
  String chooseAtLeast(int count) {
    return 'کم از کم $count ژارٕو';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min پؠٹھٕ $max تام ژارٕو';
  }

  @override
  String get specialInstructions => 'خاص ہدایژ';

  @override
  String get specialInstructionsHint => 'کم مرچ، گَندٕ نہٕ…';

  @override
  String addForAmount(String amount) {
    return 'شامل کریو · $amount';
  }

  @override
  String get deliveryLabel => 'ڈیلیوری';

  @override
  String get pickupLabel => 'پانہٕ ہیون';

  @override
  String get packagingLabel => 'پیکنگ';

  @override
  String get discountLabel => 'رعایژ';

  @override
  String get billDetailsTitle => 'بلٕچ تفصیل';

  @override
  String get clearCart => 'کارٹ خالی کریو';

  @override
  String get clearCartTitle => 'یہ کارٹ خالی کریو؟';

  @override
  String get clearCartMessage => 'یَتھ منٛز چھُ سٲری کینہہ ہٹاون یِوان۔';

  @override
  String unavailableItemsNotice(String items) {
    return 'وُنی چھُنہ دستیاب: $items';
  }

  @override
  String get removeUnavailable => 'تِم ہٹاویو';

  @override
  String minimumNotMet(String amount) {
    return 'کم از کم آرڈر چھُ $amount';
  }

  @override
  String get checkoutTitle => 'چیک آؤٹ';

  @override
  String get deliveryAddressLabel => 'ڈیلیوری ایڈریس';

  @override
  String get noAddressSelected => 'کانہہ ایڈریس چھُنہ ژارمُت';

  @override
  String get paymentMethodLabel => 'ادایگی';

  @override
  String get payOnDelivery => 'ڈیلیوری وقتہٕ نقد';

  @override
  String get noteToRestaurant => 'ریستورانس خٲطرٕ نوٹ';

  @override
  String get noteToRestaurantHint => 'گھنٹی زٕ لٹہٕ بجٲویو…';

  @override
  String get activeOrdersTitle => 'جاری آرڈر';

  @override
  String get pastOrdersTitle => 'پرانہ آرڈر';

  @override
  String get orderItemsTitle => 'کھانہٕ';

  @override
  String get orderProgressTitle => 'پیش رفت';

  @override
  String get arrivingIn => 'وۄتنس منٛز';

  @override
  String get pickupCodeLabel => 'پک اپ کوڈ';

  @override
  String get cancellationReasonLabel => 'منسوخ گژھنُک وجہ';

  @override
  String get riderLabel => 'ڈیلیوری پارٹنر';

  @override
  String get callRider => 'کال کریو';

  @override
  String get viewInvoice => 'ٹیکس انوائس';

  @override
  String get cancelOrder => 'آرڈر منسوخ کریو';

  @override
  String get cancelOrderTitle => 'یہ آرڈر منسوخ کریو؟';

  @override
  String get cancelOrderMessage =>
      'ریستوران قبول کرنہٕ برونٛہہ ہی ہیکو منسوخ کٕرِتھ۔';

  @override
  String get cancelReasonLabel => 'وجہ';

  @override
  String get cancelReasonFallback => 'گاہکن کور منسوخ';

  @override
  String get orderCancelled => 'آرڈر گو منسوخ';

  @override
  String get currentLocationLabel => 'موجودٕ جاے';

  @override
  String get editProfileTitle => 'پروفائل تبدیل کریو';

  @override
  String get editProfileSubtitle =>
      'ریستوران تہٕ ڈیلیوری پارٹنرَس چھُ توٚہنٛد ناو ہی بوٚزان۔';

  @override
  String get saveChanges => 'تبدیلی محفوظ کریو';

  @override
  String get profileUpdated => 'پروفائل گۄ اپ ڈیٹ';

  @override
  String get deleteAccount => 'اکاؤنٹ مِٹٲویو';

  @override
  String get deleteAccountTitle => 'پنُن اکاؤنٹ مِٹٲویو؟';

  @override
  String get deleteAccountMessage =>
      'سٲری ڈیوائسن پؠٹھٕ گژھِو سائن آؤٹ۔ پرانہٕ آرڈر تہٕ بل چھِ ٹیکس ریکارڈ خٲطرٕ رٹنہٕ یِوان۔';

  @override
  String get accountDeleted => 'توٚہنٛد اکاؤنٹ آو مِٹاونہٕ';

  @override
  String get devicesTitle => 'سائن ان ڈیوائسہٕ';

  @override
  String get devicesSubtitle => 'توہہِ چھِو کۄتہِ سائن ان';

  @override
  String get devicesEmptyTitle => 'بیٛاکھ کانہہ ڈیوائس چھُنہ';

  @override
  String get devicesEmptySubtitle =>
      'توہہِ چھِو صرف یَتھ ڈیوائسس پؠٹھ سائن ان۔';

  @override
  String get signOutDevice => 'سائن آؤٹ';

  @override
  String get signOutDeviceTitle => 'یہ ڈیوائس کریو سائن آؤٹ؟';

  @override
  String get signOutDeviceMessage =>
      'اگر توہہِ چھِو یہی ڈیوائس استعمال کران تہٕ پھیر گژھِو سائن ان کرُن۔';

  @override
  String get deviceSignedOut => 'ڈیوائس گۄ سائن آؤٹ';

  @override
  String get signOutEverywhere => 'ہر جایہٕ پؠٹھٕ سائن آؤٹ';

  @override
  String get signOutEverywhereTitle => 'ہر جایہٕ پؠٹھٕ کریو سائن آؤٹ؟';

  @override
  String get signOutEverywhereMessage =>
      'یَتھ ڈیوائسس سٲتؠ سٲری ڈیوائسہٕ گژھن سائن آؤٹ۔';

  @override
  String get unknownDevice => 'ناواقف ڈیوائس';

  @override
  String get activeNow => 'وُنی فعال';

  @override
  String minutesAgo(int count) {
    return '$count منٹ برونٛہہ';
  }

  @override
  String hoursAgo(int count) {
    return '$count گھنٹہٕ برونٛہہ';
  }

  @override
  String daysAgo(int count) {
    return '$count دۄہ برونٛہہ';
  }

  @override
  String get filtersAndSorting => 'فلٹر تہٕ ترتیب';

  @override
  String get clearAll => 'سٲرؠ ہٹٲویو';

  @override
  String get showResults => 'نتیجہٕ ہٲویو';

  @override
  String get closeLabel => 'بند کریو';

  @override
  String get sortByTitle => 'ترتیب';

  @override
  String get sortRelevance => 'مطابقت';

  @override
  String get sortRating => 'ریٹنگ';

  @override
  String get sortDeliveryTime => 'ڈیلیوری وَکھ';

  @override
  String get sortCostLowHigh => 'قیمت: کم پؠٹھٕ زیادٕ';

  @override
  String get sortCostHighLow => 'قیمت: زیادٕ پؠٹھٕ کم';

  @override
  String get timeSection => 'وَکھ';

  @override
  String get nearAndFast => 'نزدیک تہٕ تیز';

  @override
  String get openNow => 'وُنی کھۄلمُت';

  @override
  String get ratingSection => 'ریستوران ریٹنگ';

  @override
  String ratedAbove(String rating) {
    return '$rating+ ریٹنگ';
  }

  @override
  String get offersSection => 'آفر';

  @override
  String get hasOffersLabel => 'آفر ٲسِتھ';

  @override
  String get dishPriceSection => 'کھانَکؠ قیمت';

  @override
  String costUnder(String amount) {
    return '$amount کھۄتہٕ کم';
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
  String get moreSection => 'زیادٕ';

  @override
  String get noPackagingCharges => 'پیکنگ فیس چھُنہ';

  @override
  String get allRestaurantsTitle => 'سٲرؠ ریستوران';

  @override
  String get whatsOnYourMind => 'کیاہ کھینٕچ خواہش چھِ؟';

  @override
  String get listeningNow => 'بوزان چھِ…';

  @override
  String get speakNowHint => 'کانہہ کھانہٕ یا ریستوران وَنیو';

  @override
  String get voiceUnavailable => 'آواز ژھانڈُن چھُنہ دستیاب';

  @override
  String get voiceUnavailableBody => 'توہہِ ہیٚکِو ٹایپ کٔرِتھ تہٕ ژھانڈِتھ۔';

  @override
  String get microphoneDenied => 'مائیکروفونُک اجازت چھُ بند';

  @override
  String get voiceSearchLabel => 'آوازہٕ سٟتؠ ژھانڈیو';

  @override
  String get ratingsAndReviews => 'ریٹنگ تہٕ جائزٕ';

  @override
  String get reviewsWithTextOnly => 'جائزٕ والۍ';

  @override
  String get noReviewsTitle => 'وُنی چھُ نہٕ کانہہ ریٹنگ';

  @override
  String get noReviewsSubtitle => 'آرڈرَس پتٕ گۆڈنیُک ریٹنگ توہہِ دِیِو۔';

  @override
  String get rateOrderTitle => 'پنُن آرڈر ریٹ کریِو';

  @override
  String get rateDishesTitle => 'کھَنہٕ ریٹ کریِو';

  @override
  String get reviewHint => 'کینٛہہ بیٚیہ وننٕ چھُ؟ (اختیاری)';

  @override
  String get submitRating => 'ریٹنگ ہاوِو';

  @override
  String get reviewThanks => 'شکریہ — توٚہنٛز ریٹنگ آیہٕ۔';

  @override
  String get rateThisOrder => 'یہ آرڈر ریٹ کریِو';
}
