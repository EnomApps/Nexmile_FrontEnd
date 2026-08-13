// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sanskrit (`sa`).
class AppLocalizationsSa extends AppLocalizations {
  AppLocalizationsSa([String locale = 'sa']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'इदं क्षेत्रम् आवश्यकम्';

  @override
  String get tagline => 'शीघ्रं वितरणम्। नवीनं स्मितम्।';

  @override
  String get chooseLanguageTitle => 'स्वभाषां चिनोतु';

  @override
  String get chooseLanguageSubtitle => 'यस्यां भाषायां भवान् सुखं अनुभवति तां चिनोतु। कदापि सेटिंग्स् इत्यत्र परिवर्तयितुं शक्नोति।';

  @override
  String get searchLanguageHint => 'भाषाम् अन्विष्यतु';

  @override
  String get noLanguageFound => 'काचिदपि भाषा न प्राप्ता';

  @override
  String languagesAvailable(int count) {
    return '$count भाषाः उपलब्धाः';
  }

  @override
  String get continueLabel => 'अग्रे गच्छतु';

  @override
  String get selectedLabel => 'चितम्';

  @override
  String get defaultLabel => 'पूर्वनिर्धारितम्';

  @override
  String get homeTitle => 'Nexmile इत्यत्र स्वागतम्';

  @override
  String get homeSubtitle => 'नवीनं किराणं, उष्णम् अन्नं, दैनन्दिनानि आवश्यकवस्तूनि च समीपस्थेभ्यः आपणेभ्यः।';

  @override
  String get changeLanguage => 'भाषां परिवर्तयतु';

  @override
  String get languageUpdated => 'भाषा परिवर्तिता';

  @override
  String get appLanguageLabel => 'अनुप्रयोगभाषा';

  @override
  String greetingNamed(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get loginTitle => 'Nexmile इत्यत्र प्रविशतु';

  @override
  String get loginSubtitle => 'स्वस्य विद्युत्पत्रं चलभाषसङ्ख्यां वा लिखतु, वयं सत्यापनसङ्केतं प्रेषयिष्यामः।';

  @override
  String get emailOrPhoneLabel => 'विद्युत्पत्रं चलभाषसङ्ख्या वा';

  @override
  String get emailOrPhoneHint => 'name@example.com अथवा 9876543210';

  @override
  String get invalidEmailOrPhone => 'सम्यक् विद्युत्पत्रसङ्केतं दशाङ्कीयां चलभाषसङ्ख्यां वा लिखतु';

  @override
  String get sendCode => 'सङ्केतं प्रेषयतु';

  @override
  String get agreeToTermsOnContinue => 'अग्रे गच्छन् भवान् अस्माकं सेवानियमान् गोपनीयतानीतिं च स्वीकरोति।';

  @override
  String get otpTitle => 'भवान् एव इति निश्चिनोतु';

  @override
  String otpSubtitle(String target) {
    return '$target प्रति प्रेषितं षडङ्कीयं सङ्केतं लिखतु';
  }

  @override
  String get verifyCode => 'सत्यापयतु';

  @override
  String get resendCode => 'सङ्केतं पुनः प्रेषयतु';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds क्षणेषु पुनः प्रेषयतु';
  }

  @override
  String get codeResent => 'नवीनः सङ्केतः प्रेषितः';

  @override
  String get incorrectCode => 'अयं सङ्केतः अशुद्धः कालातीतो वा। नवीनं सङ्केतं याचतु।';

  @override
  String get enterFullCode => 'सर्वाणि षट् अङ्कानि लिखतु';

  @override
  String get accountSuspended => 'इयं लेखा स्थगिता। कृपया सहायकैः सह सम्पर्कं करोतु।';

  @override
  String get tooManyAttempts => 'अतीव प्रयत्नाः कृताः। कृपया किञ्चित्कालानन्तरं पुनः प्रयत्नं करोतु।';

  @override
  String get sessionExpired => 'भवतः सत्रं समाप्तम्। कृपया पुनः प्रविशतु।';

  @override
  String get networkError => 'अन्तर्जालसम्बन्धः नास्ति। सम्बन्धं परीक्ष्य पुनः प्रयत्नं करोतु।';

  @override
  String get developmentCode => 'विकाससङ्केतः';

  @override
  String get signOut => 'निर्गच्छतु';

  @override
  String get signedOut => 'भवान् निर्गतः';

  @override
  String get somethingWentWrong => 'किमपि दोषः अभवत्। कृपया पुनः प्रयत्नं करोतु।';

  @override
  String get profileTitle => 'परिचयपत्रम्';

  @override
  String get viewProfile => 'परिचयपत्रं पश्यतु';

  @override
  String get nameLabel => 'नाम';

  @override
  String get emailLabel => 'विद्युत्पत्रम्';

  @override
  String get mobileLabel => 'चलभाषसङ्ख्या';

  @override
  String get accountStatusLabel => 'लेखायाः स्थितिः';

  @override
  String get statusActive => 'सक्रियम्';

  @override
  String get statusPending => 'प्रतीक्षमाणम्';

  @override
  String get statusSuspended => 'स्थगितम्';

  @override
  String get verifiedLabel => 'सत्यापितम्';

  @override
  String get notProvided => 'न योजितम्';

  @override
  String get retry => 'पुनः प्रयत्नं करोतु';

  @override
  String get navHome => 'गृहम्';

  @override
  String get navSearch => 'अन्वेषणम्';

  @override
  String get navOrders => 'आदेशाः';

  @override
  String get cancelLabel => 'निरसयतु';

  @override
  String get deliverTo => 'वितरणस्थानम्';

  @override
  String get searchDishesHint => 'व्यञ्जनं भोजनालयं वा अन्विष्यतु';

  @override
  String get searchTitle => 'अन्वेषणम्';

  @override
  String get searchNoResultsTitle => 'किमपि न प्राप्तम्';

  @override
  String get searchNoResultsSubtitle => 'अन्यत् व्यञ्जनं, पाकशैलीं वा भोजनालयनाम प्रयत्नं करोतु।';

  @override
  String get cravingTitle => 'अद्य किं खादितुम् इच्छति?';

  @override
  String get offersTitle => 'भवदर्थं विशेषप्रस्तावाः';

  @override
  String get restaurantsNearby => 'समीपस्थानि भोजनालयानि';

  @override
  String restaurantsCount(int count) {
    return '$count भोजनालयानि';
  }

  @override
  String get noRestaurantsTitle => 'अत्र अद्यापि किमपि नास्ति';

  @override
  String get noRestaurantsSubtitle => 'अन्यं वर्गं पश्यतु अथवा छाननं निष्कासयतु।';

  @override
  String minutesAway(int minutes) {
    return '$minutes निमेषाः';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance किमी';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ मूल्याङ्कनानि';
  }

  @override
  String priceForTwo(int amount) {
    return 'द्वयोः कृते ₹$amount';
  }

  @override
  String get freeDelivery => 'निःशुल्कं वितरणम्';

  @override
  String percentOff(int percent) {
    return '$percent% छूटः';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'भवतः आदेशे $percent% छूटः';
  }

  @override
  String get vegOnly => 'केवलं शाकाहारम्';

  @override
  String get bestseller => 'सर्वाधिकविक्रीतम्';

  @override
  String get addLabel => 'योजयतु';

  @override
  String get noVegDishesTitle => 'अत्र शाकाहारव्यञ्जनानि न सन्ति';

  @override
  String get noVegDishesSubtitle => 'पूर्णं सूचीपत्रं द्रष्टुं शाकाहारछाननं निष्क्रियं करोतु।';

  @override
  String get replaceCartTitle => 'नवीनं शकटं आरभताम्?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'भवतः शकटे $restaurant तः वस्तूनि सन्ति। एतत् योजयित्वा तानि निष्कासितानि भविष्यन्ति।';
  }

  @override
  String get replaceCartConfirm => 'निष्कास्य योजयतु';

  @override
  String get cartTitle => 'भवतः शकटम्';

  @override
  String get cartEmptyTitle => 'भवतः शकटं रिक्तम् अस्ति';

  @override
  String get cartEmptySubtitle => 'आरम्भार्थं कस्मादपि भोजनालयात् व्यञ्जनानि योजयतु।';

  @override
  String get browseRestaurants => 'भोजनालयानि पश्यतु';

  @override
  String itemsInCart(int count) {
    return '$count वस्तूनि';
  }

  @override
  String get viewCart => 'शकटं पश्यतु';

  @override
  String get itemTotal => 'वस्तूनां योगः';

  @override
  String get deliveryFeeLabel => 'वितरणशुल्कम्';

  @override
  String get taxesAndCharges => 'कराः शुल्कानि च';

  @override
  String get freeLabel => 'निःशुल्कम्';

  @override
  String get toPay => 'देयम्';

  @override
  String placeOrderFor(String amount) {
    return 'आदेशं ददातु · $amount';
  }

  @override
  String get ordersTitle => 'भवतः आदेशाः';

  @override
  String get ordersEmptyTitle => 'अद्यापि आदेशाः न सन्ति';

  @override
  String get ordersEmptySubtitle => 'भवतः पूर्वादेशाः अत्र दृश्यन्ते।';

  @override
  String get reorder => 'पुनः आदेशः';

  @override
  String orderTitle(String id) {
    return 'आदेशः $id';
  }

  @override
  String get orderPlacedTitle => 'आदेशः दत्तः';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'प्रायः $minutes निमेषेषु आगमिष्यति।';
  }

  @override
  String get orderDeliveredTitle => 'वितरितम्';

  @override
  String get orderDeliveredSubtitle => 'भोजनम् आस्वादयतु।';

  @override
  String get statusOrderPlaced => 'आदेशः दत्तः';

  @override
  String get statusPreparing => 'भोजनं सज्जीक्रियते';

  @override
  String get statusOnTheWay => 'मार्गे अस्ति';

  @override
  String get statusDelivered => 'वितरितम्';

  @override
  String get keepBrowsing => 'पश्यन् तिष्ठतु';

  @override
  String get backToHome => 'गृहं प्रत्यागच्छतु';

  @override
  String get prototypeNotice => 'नमूनासङ्ग्रहः — वास्तविकापणाः सूचीपत्र-API सह आगमिष्यन्ति।';

  @override
  String get prototypeCheckoutNotice => 'इदं प्रतिरूपम् अस्ति। किमपि धनं न गृह्यते, वास्तविकः आदेशः अपि न भवति।';

  @override
  String get prototypeTrackingNotice => 'प्रतिरूपार्थं अनुसरणं कृत्रिमम् अस्ति।';

  @override
  String get locationTitle => 'कुत्र वितरणं करणीयम्?';

  @override
  String get locationSubtitle => 'Nexmile एककिलोमीटर-अन्तः स्थितेभ्यः आपणेभ्यः एव वितरणं करोति, अतः भवतः सम्यक् स्थानम् आवश्यकम्।';

  @override
  String get locationReasonRadiusTitle => 'एककिलोमीटर-अन्तः आपणाः';

  @override
  String get locationReasonRadiusBody => 'यतः अन्नम् उष्णं प्राप्नोति, तानि एव पाकशालानि दर्शयामः।';

  @override
  String get locationReasonAccuracyTitle => 'सम्यक् द्वारपर्यन्तम्';

  @override
  String get locationReasonAccuracyBody => 'यथार्थस्थानेन वितरकः दूरवाणीं विना एव भवन्तं प्राप्नोति।';

  @override
  String get locationReasonPrivacyTitle => 'अनुप्रयोगप्रयोगकाले एव';

  @override
  String get locationReasonPrivacyBody => 'वयं पृष्ठभूमौ भवन्तं न अनुसरामः, सङ्केतं भवान् स्वयम् अपि लिखितुं शक्नोति।';

  @override
  String get allowLocation => 'स्थानानुमतिं ददातु';

  @override
  String get enterAddressManually => 'अहं स्वयं सङ्केतं लिखामि';

  @override
  String get locationDenied => 'स्थानानुमतिः निराकृता। भवान् स्वयं चिह्नं स्थापयितुं शक्नोति।';

  @override
  String get locationDeniedForever => 'Nexmile कृते स्थानं निषिद्धम्। सेटिंग्स् इत्यत्र सक्रियं करोतु अथवा चिह्नं स्वयं स्थापयतु।';

  @override
  String get locationServiceOff => 'अस्मिन् यन्त्रे स्थानं निष्क्रियम् अस्ति।';

  @override
  String get locationUnavailable => 'स्थानं न प्राप्तम्। कृपया चिह्नं स्वयं स्थापयतु।';

  @override
  String get openSettings => 'सेटिंग्स्';

  @override
  String get pinLocationTitle => 'स्ववितरणचिह्नं स्थापयतु';

  @override
  String get deliveryRadiusHint => 'वृत्तं तत् एकं किलोमीटरं दर्शयति यस्मिन् Nexmile वितरणं करोति।';

  @override
  String get useMyLocation => 'मम स्थानं प्रयुङ्क्ताम्';

  @override
  String get deliveringHere => 'अत्र वितरणम्';

  @override
  String get dragToAdjust => 'चिह्नं समायोजयितुं मानचित्रं चालयतु';

  @override
  String get confirmLocation => 'स्थानं निश्चिनोतु';

  @override
  String get addressDetailsTitle => 'सङ्केतविवरणम्';

  @override
  String get addressDetailsSubtitle => 'सम्यक् द्वारं प्राप्तुं गृहसङ्ख्यां चिह्नं च योजयतु।';

  @override
  String get pinnedLocation => 'चिह्नितं स्थानम्';

  @override
  String get changePin => 'परिवर्तयतु';

  @override
  String get saveAddressAs => 'एनं सङ्केतम् एवं रक्षतु';

  @override
  String get labelHome => 'गृहम्';

  @override
  String get labelWork => 'कार्यालयः';

  @override
  String get labelOther => 'अन्यत्';

  @override
  String get addressLine1Label => 'गृहं, सदनं वा भवनम्';

  @override
  String get addressLine1Hint => '12A, ग्रीन् रेसिडेन्सी';

  @override
  String get addressLine2Label => 'मार्गः वा प्रदेशः';

  @override
  String get addressLine2Hint => 'द्वितीयः मार्गः, अण्णानगरम्';

  @override
  String get landmarkLabel => 'चिह्नस्थलम्';

  @override
  String get landmarkHint => 'बस्-स्थानकस्य सम्मुखम्';

  @override
  String get cityLabel => 'नगरम्';

  @override
  String get stateLabel => 'राज्यम्';

  @override
  String get pincodeLabel => 'पिन्-सङ्केतः';

  @override
  String get invalidPincode => 'सम्यक् षडङ्कीयं पिन्-सङ्केतं लिखतु';

  @override
  String get contactNameLabel => 'सम्पर्कनाम';

  @override
  String get contactPhoneLabel => 'सम्पर्कसङ्ख्या';

  @override
  String get invalidMobileNumber => 'सम्यक् दशाङ्कीयां चलभाषसङ्ख्यां लिखतु';

  @override
  String get makeDefaultAddress => 'पूर्वनिर्धारितरूपेण अत्रैव वितरणम्';

  @override
  String get saveAddress => 'सङ्केतं रक्षतु';

  @override
  String get addressSaved => 'सङ्केतः रक्षितः';

  @override
  String get addressBookTitle => 'वितरणसङ्केताः';

  @override
  String get manageAddresses => 'रक्षितसङ्केतान् प्रबन्धयतु';

  @override
  String get noAddressesTitle => 'अद्यापि सङ्केताः न सन्ति';

  @override
  String get noAddressesSubtitle => 'भवतः समीपं वितरणं कुर्वतः आपणान् दर्शयितुम् एकं सङ्केतं योजयतु।';

  @override
  String get addAddress => 'सङ्केतं योजयतु';

  @override
  String get setAsDefault => 'पूर्वनिर्धारितं करोतु';

  @override
  String get editLabel => 'सम्पादयतु';

  @override
  String get addressUpdated => 'सङ्केतः नवीकृतः';

  @override
  String get deleteLabel => 'अपाकरोतु';

  @override
  String get deleteAddressTitle => 'एनं सङ्केतम् अपाकरोतु?';

  @override
  String get deleteAddressMessage => 'भवान् पश्चात् पुनः योजयितुं शक्नोति।';

  @override
  String get rescueDealsTitle => 'अन्नरक्षणम्';

  @override
  String get notTakingOrders => 'आदेशाः न स्वीक्रियन्ते';

  @override
  String get closedRightNow => 'सम्प्रति पिहितम्';

  @override
  String minimumOrder(String amount) {
    return 'न्यूनातिन्यूनं $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count अवशिष्टम्';
  }

  @override
  String get soldOut => 'समाप्तम्';

  @override
  String get menuEmptyTitle => 'अद्यापि व्यञ्जनानि न सन्ति';

  @override
  String get menuEmptySubtitle => 'अस्य भोजनालयस्य सूची न योजिता।';

  @override
  String get moreDishesTitle => 'अधिकानि व्यञ्जनानि';

  @override
  String get customisable => 'रुच्यनुसारम्';

  @override
  String get requiredLabel => 'आवश्यकम्';

  @override
  String get optionalLabel => 'वैकल्पिकम्';

  @override
  String get chooseOne => 'एकं चिनोतु';

  @override
  String chooseUpTo(int count) {
    return 'अधिकतमं $count चिनोतु';
  }

  @override
  String chooseAtLeast(int count) {
    return 'न्यूनातिन्यूनं $count चिनोतु';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min तः $max पर्यन्तं चिनोतु';
  }

  @override
  String get specialInstructions => 'विशेषनिर्देशाः';

  @override
  String get specialInstructionsHint => 'अल्पकटु, पलाण्डुः न…';

  @override
  String addForAmount(String amount) {
    return 'योजयतु · $amount';
  }

  @override
  String get deliveryLabel => 'गृहप्रापणम्';

  @override
  String get pickupLabel => 'स्वयं ग्रहणम्';

  @override
  String get packagingLabel => 'वेष्टनम्';

  @override
  String get discountLabel => 'छूटः';

  @override
  String get billDetailsTitle => 'देयविवरणम्';

  @override
  String get clearCart => 'शकटं रिक्तं करोतु';

  @override
  String get clearCartTitle => 'इदं शकटं रिक्तं क्रियताम्?';

  @override
  String get clearCartMessage => 'अस्मिन् स्थितं सर्वं निष्कासयिष्यते।';

  @override
  String unavailableItemsNotice(String items) {
    return 'अधुना न उपलभ्यते: $items';
  }

  @override
  String get removeUnavailable => 'तानि निष्कासयतु';

  @override
  String minimumNotMet(String amount) {
    return 'न्यूनतमः आदेशः $amount';
  }

  @override
  String get checkoutTitle => 'निष्क्रमणम्';

  @override
  String get deliveryAddressLabel => 'प्रापणस्थानम्';

  @override
  String get noAddressSelected => 'स्थानं न चितम्';

  @override
  String get paymentMethodLabel => 'शुल्कदानम्';

  @override
  String get payOnDelivery => 'प्रापणसमये नगदम्';

  @override
  String get noteToRestaurant => 'भोजनालयाय टिप्पणी';

  @override
  String get noteToRestaurantHint => 'घण्टां द्विवारं वादयतु…';

  @override
  String get activeOrdersTitle => 'प्रचलन्तः आदेशाः';

  @override
  String get pastOrdersTitle => 'पूर्वादेशाः';

  @override
  String get orderItemsTitle => 'व्यञ्जनानि';

  @override
  String get orderProgressTitle => 'प्रगतिः';

  @override
  String get arrivingIn => 'आगमनकालः';

  @override
  String get pickupCodeLabel => 'ग्रहणसङ्केतः';

  @override
  String get cancellationReasonLabel => 'निरसनकारणम्';

  @override
  String get riderLabel => 'प्रापणसहभागी';

  @override
  String get callRider => 'आह्वयतु';

  @override
  String get viewInvoice => 'करपत्रम्';

  @override
  String get cancelOrder => 'आदेशं निरस्यतु';

  @override
  String get cancelOrderTitle => 'अयम् आदेशः निरस्यताम्?';

  @override
  String get cancelOrderMessage => 'भोजनालयस्य स्वीकारात् पूर्वमेव निरसनं शक्यते।';

  @override
  String get cancelReasonLabel => 'कारणम्';

  @override
  String get cancelReasonFallback => 'ग्राहकेण निरस्तम्';

  @override
  String get orderCancelled => 'आदेशः निरस्तः';

  @override
  String get currentLocationLabel => 'वर्तमानस्थानम्';
}
