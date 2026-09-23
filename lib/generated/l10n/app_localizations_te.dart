// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ఈ ఫీల్డ్ తప్పనిసరి';

  @override
  String get tagline => 'వేగవంతమైన డెలివరీ. తాజా చిరునవ్వులు.';

  @override
  String get chooseLanguageTitle => 'మీ భాషను ఎంచుకోండి';

  @override
  String get chooseLanguageSubtitle =>
      'మీకు సౌకర్యంగా ఉండే భాషను ఎంచుకోండి. దీన్ని ఎప్పుడైనా సెట్టింగ్‌లలో మార్చుకోవచ్చు.';

  @override
  String get searchLanguageHint => 'భాషను వెతకండి';

  @override
  String get noLanguageFound => 'ఏ భాష కనబడలేదు';

  @override
  String languagesAvailable(int count) {
    return '$count భాషలు అందుబాటులో ఉన్నాయి';
  }

  @override
  String get continueLabel => 'కొనసాగించు';

  @override
  String get selectedLabel => 'ఎంపిక చేయబడింది';

  @override
  String get defaultLabel => 'డిఫాల్ట్';

  @override
  String get homeTitle => 'Nexmile కు స్వాగతం';

  @override
  String get homeSubtitle =>
      'తాజా కిరాణా సరుకులు, వేడి ఆహారం మరియు నిత్యావసరాలు మీ దగ్గరి దుకాణాల నుండి.';

  @override
  String get changeLanguage => 'భాషను మార్చండి';

  @override
  String get languageUpdated => 'భాష మార్చబడింది';

  @override
  String get appLanguageLabel => 'యాప్ భాష';

  @override
  String greetingNamed(String name) {
    return 'నమస్కారం, $name';
  }

  @override
  String get loginTitle => 'Nexmile లో సైన్ ఇన్ చేయండి';

  @override
  String get loginSubtitle =>
      'మీ ఇమెయిల్ లేదా మొబైల్ నంబర్‌ను నమోదు చేయండి, మేము ధృవీకరణ కోడ్ పంపుతాము.';

  @override
  String get emailOrPhoneLabel => 'ఇమెయిల్ లేదా మొబైల్ నంబర్';

  @override
  String get emailOrPhoneHint => 'name@example.com లేదా 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'సరైన ఇమెయిల్ చిరునామా లేదా 10 అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get sendCode => 'కోడ్ పంపు';

  @override
  String get agreeToTermsOnContinue =>
      'కొనసాగించడం ద్వారా మీరు మా సేవా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తున్నారు.';

  @override
  String get otpTitle => 'ఇది మీరేనని ధృవీకరించండి';

  @override
  String otpSubtitle(String target) {
    return '$target కు పంపిన 6 అంకెల కోడ్‌ను నమోదు చేయండి';
  }

  @override
  String get verifyCode => 'ధృవీకరించు';

  @override
  String get resendCode => 'కోడ్‌ను మళ్ళీ పంపు';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds సెకన్లలో మళ్ళీ పంపు';
  }

  @override
  String get codeResent => 'కొత్త కోడ్ పంపబడింది';

  @override
  String get incorrectCode =>
      'ఈ కోడ్ తప్పు లేదా గడువు ముగిసింది. కొత్తది కోరండి.';

  @override
  String get enterFullCode => 'మొత్తం 6 అంకెలు నమోదు చేయండి';

  @override
  String get accountSuspended =>
      'ఈ ఖాతా నిలిపివేయబడింది. దయచేసి సపోర్ట్‌ను సంప్రదించండి.';

  @override
  String get tooManyAttempts =>
      'చాలా సార్లు ప్రయత్నించారు. కొంతసేపటి తర్వాత మళ్ళీ ప్రయత్నించండి.';

  @override
  String get sessionExpired =>
      'మీ సెషన్ గడువు ముగిసింది. దయచేసి మళ్ళీ సైన్ ఇన్ చేయండి.';

  @override
  String get networkError =>
      'ఇంటర్నెట్ కనెక్షన్ లేదు. మీ కనెక్షన్‌ను తనిఖీ చేసి మళ్ళీ ప్రయత్నించండి.';

  @override
  String get developmentCode => 'డెవలప్‌మెంట్ కోడ్';

  @override
  String get signOut => 'సైన్ అవుట్';

  @override
  String get signedOut => 'మీరు సైన్ అవుట్ అయ్యారు';

  @override
  String get somethingWentWrong => 'ఏదో తప్పు జరిగింది. మళ్ళీ ప్రయత్నించండి.';

  @override
  String get profileTitle => 'ప్రొఫైల్';

  @override
  String get viewProfile => 'ప్రొఫైల్ చూడండి';

  @override
  String get nameLabel => 'పేరు';

  @override
  String get emailLabel => 'ఇమెయిల్';

  @override
  String get mobileLabel => 'మొబైల్ నంబర్';

  @override
  String get accountStatusLabel => 'ఖాతా స్థితి';

  @override
  String get statusActive => 'క్రియాశీలం';

  @override
  String get statusPending => 'పెండింగ్';

  @override
  String get statusSuspended => 'నిలిపివేయబడింది';

  @override
  String get verifiedLabel => 'ధృవీకరించబడింది';

  @override
  String get notProvided => 'జోడించలేదు';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించండి';

  @override
  String get navHome => 'హోమ్';

  @override
  String get navSearch => 'వెతకండి';

  @override
  String get navOrders => 'ఆర్డర్లు';

  @override
  String get cancelLabel => 'రద్దు';

  @override
  String get deliverTo => 'డెలివరీ చిరునామా';

  @override
  String get searchDishesHint => 'వంటకాలు లేదా రెస్టారెంట్లను వెతకండి';

  @override
  String get searchTitle => 'వెతకండి';

  @override
  String get searchNoResultsTitle => 'ఏదీ దొరకలేదు';

  @override
  String get searchNoResultsSubtitle =>
      'వేరే వంటకం, వంటకాల శైలి లేదా రెస్టారెంట్ పేరు ప్రయత్నించండి.';

  @override
  String get cravingTitle => 'ఏం తినాలని ఉంది?';

  @override
  String get offersTitle => 'మీ కోసం ఆఫర్లు';

  @override
  String get restaurantsNearby => 'మీ దగ్గరి రెస్టారెంట్లు';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count రెస్టారెంట్లు',
      one: '1 రెస్టారెంట్',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'ఇక్కడ ఇంకా ఏమీ లేదు';

  @override
  String get noRestaurantsSubtitle =>
      'వేరే విభాగం చూడండి లేదా ఫిల్టర్ తీసేయండి.';

  @override
  String minutesAway(int minutes) {
    return '$minutes నిమి';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance కి.మీ';
  }

  @override
  String ratingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count రేటింగ్‌లు',
      one: '1 రేటింగ్',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'ఇద్దరికి ₹$amount';
  }

  @override
  String get freeDelivery => 'ఉచిత డెలివరీ';

  @override
  String percentOff(int percent) {
    return '$percent% తగ్గింపు';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'మీ ఆర్డర్‌పై $percent% తగ్గింపు';
  }

  @override
  String get vegOnly => 'శాకాహారం మాత్రమే';

  @override
  String get bestseller => 'అత్యధిక అమ్మకం';

  @override
  String get addLabel => 'జోడించు';

  @override
  String get noVegDishesTitle => 'ఇక్కడ శాకాహార వంటకాలు లేవు';

  @override
  String get noVegDishesSubtitle =>
      'పూర్తి మెనూ చూడటానికి శాకాహార ఫిల్టర్ ఆఫ్ చేయండి.';

  @override
  String get replaceCartTitle => 'కొత్త కార్ట్ మొదలుపెట్టాలా?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'మీ కార్ట్‌లో $restaurant నుండి వస్తువులు ఉన్నాయి. దీన్ని జోడిస్తే అవి తొలగిపోతాయి.';
  }

  @override
  String get replaceCartConfirm => 'తొలగించి జోడించు';

  @override
  String get cartTitle => 'మీ కార్ట్';

  @override
  String get cartEmptyTitle => 'మీ కార్ట్ ఖాళీగా ఉంది';

  @override
  String get cartEmptySubtitle =>
      'మొదలుపెట్టడానికి ఏదైనా రెస్టారెంట్ నుండి వంటకాలు జోడించండి.';

  @override
  String get browseRestaurants => 'రెస్టారెంట్లు చూడండి';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count వస్తువులు',
      one: '1 వస్తువు',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'కార్ట్ చూడండి';

  @override
  String get itemTotal => 'వస్తువుల మొత్తం';

  @override
  String get deliveryFeeLabel => 'డెలివరీ ఛార్జీ';

  @override
  String get taxesAndCharges => 'పన్నులు మరియు ఛార్జీలు';

  @override
  String get freeLabel => 'ఉచితం';

  @override
  String get toPay => 'చెల్లించవలసినది';

  @override
  String placeOrderFor(String amount) {
    return 'ఆర్డర్ చేయండి · $amount';
  }

  @override
  String get ordersTitle => 'మీ ఆర్డర్లు';

  @override
  String get ordersEmptyTitle => 'ఇంకా ఆర్డర్లు లేవు';

  @override
  String get ordersEmptySubtitle => 'మీ గత ఆర్డర్లు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get reorder => 'మళ్ళీ ఆర్డర్';

  @override
  String orderTitle(String id) {
    return 'ఆర్డర్ $id';
  }

  @override
  String get orderPlacedTitle => 'ఆర్డర్ చేయబడింది';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'సుమారు $minutes నిమిషాల్లో వస్తుంది.';
  }

  @override
  String get orderDeliveredTitle => 'డెలివరీ అయ్యింది';

  @override
  String get orderDeliveredSubtitle => 'భోజనం ఆస్వాదించండి.';

  @override
  String get statusOrderPlaced => 'ఆర్డర్ చేయబడింది';

  @override
  String get statusPreparing => 'ఆహారం తయారవుతోంది';

  @override
  String get statusOnTheWay => 'దారిలో ఉంది';

  @override
  String get statusDelivered => 'డెలివరీ అయ్యింది';

  @override
  String get keepBrowsing => 'చూస్తూ ఉండండి';

  @override
  String get backToHome => 'హోమ్‌కు తిరిగి';

  @override
  String get prototypeNotice =>
      'నమూనా స్టోర్‌ఫ్రంట్ — నిజమైన దుకాణాలు కేటలాగ్ APIతో వస్తాయి.';

  @override
  String get prototypeCheckoutNotice =>
      'ఇది ఒక ప్రోటోటైప్. ఎలాంటి చెల్లింపు తీసుకోబడదు, నిజమైన ఆర్డర్ కూడా ఉండదు.';

  @override
  String get prototypeTrackingNotice => 'ప్రోటోటైప్ కోసం ట్రాకింగ్ కృత్రిమం.';

  @override
  String get locationTitle => 'ఎక్కడ డెలివరీ చేయాలి?';

  @override
  String get locationSubtitle =>
      'Nexmile 1 కి.మీ లోపు ఉన్న దుకాణాల నుండి మాత్రమే డెలివరీ చేస్తుంది, అందుకే మీ ఖచ్చితమైన ప్రదేశం కావాలి.';

  @override
  String get locationReasonRadiusTitle => '1 కి.మీ లోపు దుకాణాలు';

  @override
  String get locationReasonRadiusBody =>
      'వేడిగా చేరగలిగే వంటశాలలను మాత్రమే చూపిస్తాము.';

  @override
  String get locationReasonAccuracyTitle => 'సరైన గుమ్మం వద్దకే';

  @override
  String get locationReasonAccuracyBody =>
      'ఖచ్చితమైన పిన్ ఉంటే డెలివరీ భాగస్వామి ఫోన్ చేయకుండానే మిమ్మల్ని కనుగొంటారు.';

  @override
  String get locationReasonPrivacyTitle => 'యాప్ వాడుతున్నప్పుడు మాత్రమే';

  @override
  String get locationReasonPrivacyBody =>
      'నేపథ్యంలో మిమ్మల్ని ట్రాక్ చేయము, చిరునామాను మీరే టైప్ చేయవచ్చు.';

  @override
  String get allowLocation => 'లొకేషన్ అనుమతించండి';

  @override
  String get enterAddressManually => 'నేనే చిరునామా రాస్తాను';

  @override
  String get locationDenied =>
      'లొకేషన్ అనుమతి నిరాకరించబడింది. మీరే పిన్ పెట్టుకోవచ్చు.';

  @override
  String get locationDeniedForever =>
      'Nexmile కు లొకేషన్ నిరోధించబడింది. సెట్టింగ్‌లలో ఆన్ చేయండి లేదా పిన్ మీరే పెట్టండి.';

  @override
  String get locationServiceOff => 'ఈ పరికరంలో లొకేషన్ ఆఫ్‌లో ఉంది.';

  @override
  String get locationUnavailable =>
      'లొకేషన్ దొరకలేదు. దయచేసి పిన్ మీరే పెట్టండి.';

  @override
  String get openSettings => 'సెట్టింగ్‌లు';

  @override
  String get pinLocationTitle => 'మీ డెలివరీ పిన్ పెట్టండి';

  @override
  String get deliveryRadiusHint =>
      'Nexmile డెలివరీ చేసే 1 కి.మీ పరిధిని వృత్తం చూపిస్తుంది.';

  @override
  String get useMyLocation => 'నా లొకేషన్ వాడు';

  @override
  String get deliveringHere => 'ఇక్కడ డెలివరీ';

  @override
  String get dragToAdjust => 'పిన్ సర్దుబాటు చేయడానికి మ్యాప్ లాగండి';

  @override
  String get confirmLocation => 'లొకేషన్ నిర్ధారించు';

  @override
  String get addressDetailsTitle => 'చిరునామా వివరాలు';

  @override
  String get addressDetailsSubtitle =>
      'సరైన తలుపు వద్దకు చేరడానికి ఇంటి నంబర్ మరియు ల్యాండ్‌మార్క్ ఇవ్వండి.';

  @override
  String get pinnedLocation => 'గుర్తించిన ప్రదేశం';

  @override
  String get changePin => 'మార్చు';

  @override
  String get saveAddressAs => 'ఈ చిరునామాను ఇలా సేవ్ చేయి';

  @override
  String get labelHome => 'ఇల్లు';

  @override
  String get labelWork => 'ఆఫీసు';

  @override
  String get labelOther => 'ఇతర';

  @override
  String get addressLine1Label => 'ఇల్లు, ఫ్లాట్ లేదా భవనం';

  @override
  String get addressLine1Hint => '12A, గ్రీన్ రెసిడెన్సీ';

  @override
  String get addressLine2Label => 'వీధి లేదా ప్రాంతం';

  @override
  String get addressLine2Hint => '2వ అవెన్యూ, అన్నా నగర్';

  @override
  String get landmarkLabel => 'ల్యాండ్‌మార్క్';

  @override
  String get landmarkHint => 'బస్ స్టాప్ ఎదురుగా';

  @override
  String get cityLabel => 'నగరం';

  @override
  String get stateLabel => 'రాష్ట్రం';

  @override
  String get pincodeLabel => 'పిన్ కోడ్';

  @override
  String get invalidPincode => 'సరైన 6 అంకెల పిన్ కోడ్ నమోదు చేయండి';

  @override
  String get contactNameLabel => 'సంప్రదింపు పేరు';

  @override
  String get contactPhoneLabel => 'సంప్రదింపు నంబర్';

  @override
  String get invalidMobileNumber => 'సరైన 10 అంకెల మొబైల్ నంబర్ నమోదు చేయండి';

  @override
  String get makeDefaultAddress => 'డిఫాల్ట్‌గా ఇక్కడే డెలివరీ';

  @override
  String get saveAddress => 'చిరునామా సేవ్ చేయి';

  @override
  String get addressSaved => 'చిరునామా సేవ్ చేయబడింది';

  @override
  String get addressBookTitle => 'డెలివరీ చిరునామాలు';

  @override
  String get manageAddresses => 'సేవ్ చేసిన చిరునామాలను నిర్వహించండి';

  @override
  String get noAddressesTitle => 'ఇంకా చిరునామాలు లేవు';

  @override
  String get noAddressesSubtitle =>
      'మీకు డెలివరీ చేసే దుకాణాలు చూపడానికి ఒక చిరునామా జోడించండి.';

  @override
  String get addAddress => 'చిరునామా జోడించు';

  @override
  String get setAsDefault => 'డిఫాల్ట్‌గా చేయి';

  @override
  String get editLabel => 'సవరించు';

  @override
  String get addressUpdated => 'చిరునామా నవీకరించబడింది';

  @override
  String get deleteLabel => 'తొలగించు';

  @override
  String get deleteAddressTitle => 'ఈ చిరునామాను తొలగించాలా?';

  @override
  String get deleteAddressMessage => 'మీరు తర్వాత మళ్ళీ జోడించవచ్చు.';

  @override
  String get rescueDealsTitle => 'ఫుడ్ రెస్క్యూ';

  @override
  String get notTakingOrders => 'ఆర్డర్లు తీసుకోవడం లేదు';

  @override
  String get closedRightNow => 'ఇప్పుడు మూసివేయబడింది';

  @override
  String minimumOrder(String amount) {
    return 'కనీసం $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count మిగిలాయి';
  }

  @override
  String get soldOut => 'అయిపోయింది';

  @override
  String get menuEmptyTitle => 'ఇంకా వంటకాలు లేవు';

  @override
  String get menuEmptySubtitle => 'ఈ రెస్టారెంట్ తన మెనూను చేర్చలేదు.';

  @override
  String get moreDishesTitle => 'మరిన్ని వంటకాలు';

  @override
  String get customisable => 'మీ ఇష్టం ప్రకారం';

  @override
  String get requiredLabel => 'తప్పనిసరి';

  @override
  String get optionalLabel => 'ఐచ్ఛికం';

  @override
  String get chooseOne => 'ఒకటి ఎంచుకోండి';

  @override
  String chooseUpTo(int count) {
    return 'గరిష్ఠంగా $count ఎంచుకోండి';
  }

  @override
  String chooseAtLeast(int count) {
    return 'కనీసం $count ఎంచుకోండి';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min నుండి $max వరకు ఎంచుకోండి';
  }

  @override
  String get specialInstructions => 'ప్రత్యేక సూచనలు';

  @override
  String get specialInstructionsHint => 'తక్కువ కారం, ఉల్లిపాయ వద్దు…';

  @override
  String addForAmount(String amount) {
    return 'జోడించు · $amount';
  }

  @override
  String get deliveryLabel => 'డెలివరీ';

  @override
  String get pickupLabel => 'స్వయంగా తీసుకోవడం';

  @override
  String get packagingLabel => 'ప్యాకింగ్';

  @override
  String get discountLabel => 'తగ్గింపు';

  @override
  String get billDetailsTitle => 'బిల్లు వివరాలు';

  @override
  String get clearCart => 'కార్ట్ ఖాళీ చేయి';

  @override
  String get clearCartTitle => 'ఈ కార్ట్ ఖాళీ చేయాలా?';

  @override
  String get clearCartMessage => 'ఇందులోని అన్నీ తొలగించబడతాయి.';

  @override
  String unavailableItemsNotice(String items) {
    return 'ఇప్పుడు అందుబాటులో లేవు: $items';
  }

  @override
  String get removeUnavailable => 'వాటిని తొలగించు';

  @override
  String minimumNotMet(String amount) {
    return 'కనీస ఆర్డర్ $amount';
  }

  @override
  String get checkoutTitle => 'చెక్అవుట్';

  @override
  String get deliveryAddressLabel => 'డెలివరీ చిరునామా';

  @override
  String get noAddressSelected => 'చిరునామా ఎంచుకోలేదు';

  @override
  String get paymentMethodLabel => 'చెల్లింపు';

  @override
  String get payOnDelivery => 'డెలివరీ సమయంలో నగదు';

  @override
  String get noteToRestaurant => 'రెస్టారెంట్‌కు గమనిక';

  @override
  String get noteToRestaurantHint => 'గంట రెండుసార్లు కొట్టండి…';

  @override
  String get activeOrdersTitle => 'జరుగుతున్న ఆర్డర్లు';

  @override
  String get pastOrdersTitle => 'పాత ఆర్డర్లు';

  @override
  String get orderItemsTitle => 'వంటకాలు';

  @override
  String get orderProgressTitle => 'పురోగతి';

  @override
  String get arrivingIn => 'చేరుకునే సమయం';

  @override
  String get pickupCodeLabel => 'పికప్ కోడ్';

  @override
  String get cancellationReasonLabel => 'రద్దు చేసిన కారణం';

  @override
  String get riderLabel => 'డెలివరీ భాగస్వామి';

  @override
  String get callRider => 'కాల్ చేయి';

  @override
  String get trackRider => 'రైడర్‌ను ట్రాక్ చేయండి';

  @override
  String get riderLocationSoon =>
      'మీ ఆర్డర్‌ను తీసుకున్న తర్వాత రైడర్ స్థానం ఇక్కడ కనిపిస్తుంది.';

  @override
  String get recentreOnRider => 'రైడర్‌పై కేంద్రీకరించు';

  @override
  String get viewInvoice => 'పన్ను ఇన్‌వాయిస్';

  @override
  String get cancelOrder => 'ఆర్డర్ రద్దు చేయి';

  @override
  String get cancelOrderTitle => 'ఈ ఆర్డర్ రద్దు చేయాలా?';

  @override
  String get cancelOrderMessage =>
      'రెస్టారెంట్ అంగీకరించే ముందు మాత్రమే రద్దు చేయగలరు.';

  @override
  String get cancelReasonLabel => 'కారణం';

  @override
  String get cancelReasonFallback => 'కస్టమర్ రద్దు చేశారు';

  @override
  String get orderCancelled => 'ఆర్డర్ రద్దు అయింది';

  @override
  String get currentLocationLabel => 'ప్రస్తుత స్థానం';

  @override
  String get editProfileTitle => 'ప్రొఫైల్ మార్చు';

  @override
  String get editProfileSubtitle =>
      'రెస్టారెంట్‌కు, డెలివరీ భాగస్వామికి మీ పేరే కనిపిస్తుంది.';

  @override
  String get saveChanges => 'మార్పులను భద్రపరచు';

  @override
  String get profileUpdated => 'ప్రొఫైల్ నవీకరించబడింది';

  @override
  String get deleteAccount => 'ఖాతా తొలగించు';

  @override
  String get deleteAccountTitle => 'మీ ఖాతాను తొలగించాలా?';

  @override
  String get deleteAccountMessage =>
      'అన్ని పరికరాల నుండి సైన్ అవుట్ అవుతారు. పాత ఆర్డర్లు, బిల్లులు పన్ను రికార్డుల కోసం ఉంచబడతాయి.';

  @override
  String get accountDeleted => 'మీ ఖాతా తొలగించబడింది';

  @override
  String get devicesTitle => 'సైన్ ఇన్ చేసిన పరికరాలు';

  @override
  String get devicesSubtitle => 'మీరు ఎక్కడ సైన్ ఇన్ అయ్యారు';

  @override
  String get devicesEmptyTitle => 'ఇతర పరికరాలు లేవు';

  @override
  String get devicesEmptySubtitle =>
      'మీరు ఈ పరికరంలో మాత్రమే సైన్ ఇన్ అయ్యారు.';

  @override
  String get signOutDevice => 'సైన్ అవుట్';

  @override
  String get signOutDeviceTitle => 'ఈ పరికరం నుండి సైన్ అవుట్ చేయాలా?';

  @override
  String get signOutDeviceMessage =>
      'మీరు వాడుతున్నది ఇదే అయితే మళ్ళీ సైన్ ఇన్ చేయాల్సి ఉంటుంది.';

  @override
  String get deviceSignedOut => 'పరికరం సైన్ అవుట్ అయింది';

  @override
  String get signOutEverywhere => 'అన్ని చోట్ల నుండి సైన్ అవుట్';

  @override
  String get signOutEverywhereTitle => 'అన్ని చోట్ల నుండి సైన్ అవుట్ చేయాలా?';

  @override
  String get signOutEverywhereMessage =>
      'ఈ పరికరంతో సహా అన్ని పరికరాలు సైన్ అవుట్ అవుతాయి.';

  @override
  String get unknownDevice => 'తెలియని పరికరం';

  @override
  String get activeNow => 'ఇప్పుడు క్రియాశీలం';

  @override
  String minutesAgo(int count) {
    return '$count నిమిషాల క్రితం';
  }

  @override
  String hoursAgo(int count) {
    return '$count గంటల క్రితం';
  }

  @override
  String daysAgo(int count) {
    return '$count రోజుల క్రితం';
  }

  @override
  String get filtersAndSorting => 'ఫిల్టర్‌లు, క్రమం';

  @override
  String get clearAll => 'అన్నీ తీసివేయి';

  @override
  String get showResults => 'ఫలితాలు చూపు';

  @override
  String get closeLabel => 'మూసివేయి';

  @override
  String get sortByTitle => 'క్రమబద్ధీకరణ';

  @override
  String get sortRelevance => 'సంబంధితం';

  @override
  String get sortRating => 'రేటింగ్';

  @override
  String get sortDeliveryTime => 'డెలివరీ సమయం';

  @override
  String get sortCostLowHigh => 'ధర: తక్కువ నుండి ఎక్కువ';

  @override
  String get sortCostHighLow => 'ధర: ఎక్కువ నుండి తక్కువ';

  @override
  String get timeSection => 'సమయం';

  @override
  String get nearAndFast => 'దగ్గర & వేగం';

  @override
  String get openNow => 'ఇప్పుడు తెరిచి ఉంది';

  @override
  String get ratingSection => 'రెస్టారెంట్ రేటింగ్';

  @override
  String ratedAbove(String rating) {
    return '$rating+ రేటింగ్';
  }

  @override
  String get offersSection => 'ఆఫర్‌లు';

  @override
  String get hasOffersLabel => 'ఆఫర్‌లు ఉన్నవి';

  @override
  String get dishPriceSection => 'వంటకం ధర';

  @override
  String costUnder(String amount) {
    return '$amount కంటే తక్కువ';
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
  String get moreSection => 'మరిన్ని';

  @override
  String get noPackagingCharges => 'ప్యాకింగ్ రుసుము లేదు';

  @override
  String get allRestaurantsTitle => 'అన్ని రెస్టారెంట్లు';

  @override
  String get whatsOnYourMind => 'ఏం తినాలని ఉంది?';

  @override
  String get listeningNow => 'వింటున్నాం…';

  @override
  String get speakNowHint => 'వంటకం లేదా రెస్టారెంట్ చెప్పండి';

  @override
  String get voiceUnavailable => 'వాయిస్ సెర్చ్ అందుబాటులో లేదు';

  @override
  String get voiceUnavailableBody => 'మీరు టైప్ చేసి కూడా వెతకవచ్చు.';

  @override
  String get microphoneDenied => 'మైక్రోఫోన్ అనుమతి లేదు';

  @override
  String get voiceSearchLabel => 'వాయిస్‌తో వెతకండి';

  @override
  String get ratingsAndReviews => 'రేటింగ్‌లు & సమీక్షలు';

  @override
  String get reviewsWithTextOnly => 'సమీక్షలు ఉన్నవి';

  @override
  String get noReviewsTitle => 'ఇంకా రేటింగ్‌లు లేవు';

  @override
  String get noReviewsSubtitle => 'ఆర్డర్ తర్వాత మొదటి రేటింగ్ మీరే ఇవ్వండి.';

  @override
  String get rateOrderTitle => 'మీ ఆర్డర్‌కు రేటింగ్ ఇవ్వండి';

  @override
  String get rateDishesTitle => 'వంటకాలకు రేటింగ్ ఇవ్వండి';

  @override
  String get reviewHint => 'ఇంకా ఏమైనా చెప్పాలనుకుంటున్నారా? (ఐచ్ఛికం)';

  @override
  String get submitRating => 'రేటింగ్ పంపండి';

  @override
  String get reviewThanks => 'ధన్యవాదాలు — మీ రేటింగ్ అందింది.';

  @override
  String get rateThisOrder => 'ఈ ఆర్డర్‌కు రేటింగ్ ఇవ్వండి';
}
