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
  String get tagline => 'వేగవంతమైన డెలివరీ. తాజా చిరునవ్వులు.';

  @override
  String get chooseLanguageTitle => 'మీ భాషను ఎంచుకోండి';

  @override
  String get chooseLanguageSubtitle => 'మీకు సౌకర్యంగా ఉండే భాషను ఎంచుకోండి. దీన్ని ఎప్పుడైనా సెట్టింగ్‌లలో మార్చుకోవచ్చు.';

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
  String get homeSubtitle => 'తాజా కిరాణా సరుకులు, వేడి ఆహారం మరియు నిత్యావసరాలు మీ దగ్గరి దుకాణాల నుండి.';

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
  String get loginSubtitle => 'మీ ఇమెయిల్ లేదా మొబైల్ నంబర్‌ను నమోదు చేయండి, మేము ధృవీకరణ కోడ్ పంపుతాము.';

  @override
  String get emailOrPhoneLabel => 'ఇమెయిల్ లేదా మొబైల్ నంబర్';

  @override
  String get emailOrPhoneHint => 'name@example.com లేదా 9876543210';

  @override
  String get invalidEmailOrPhone => 'సరైన ఇమెయిల్ చిరునామా లేదా 10 అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get sendCode => 'కోడ్ పంపు';

  @override
  String get agreeToTermsOnContinue => 'కొనసాగించడం ద్వారా మీరు మా సేవా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తున్నారు.';

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
  String get incorrectCode => 'ఈ కోడ్ తప్పు లేదా గడువు ముగిసింది. కొత్తది కోరండి.';

  @override
  String get enterFullCode => 'మొత్తం 6 అంకెలు నమోదు చేయండి';

  @override
  String get accountSuspended => 'ఈ ఖాతా నిలిపివేయబడింది. దయచేసి సపోర్ట్‌ను సంప్రదించండి.';

  @override
  String get tooManyAttempts => 'చాలా సార్లు ప్రయత్నించారు. కొంతసేపటి తర్వాత మళ్ళీ ప్రయత్నించండి.';

  @override
  String get sessionExpired => 'మీ సెషన్ గడువు ముగిసింది. దయచేసి మళ్ళీ సైన్ ఇన్ చేయండి.';

  @override
  String get networkError => 'ఇంటర్నెట్ కనెక్షన్ లేదు. మీ కనెక్షన్‌ను తనిఖీ చేసి మళ్ళీ ప్రయత్నించండి.';

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
  String get searchNoResultsSubtitle => 'వేరే వంటకం, వంటకాల శైలి లేదా రెస్టారెంట్ పేరు ప్రయత్నించండి.';

  @override
  String get cravingTitle => 'ఏం తినాలని ఉంది?';

  @override
  String get offersTitle => 'మీ కోసం ఆఫర్లు';

  @override
  String get restaurantsNearby => 'మీ దగ్గరి రెస్టారెంట్లు';

  @override
  String restaurantsCount(int count) {
    return '$count రెస్టారెంట్లు';
  }

  @override
  String get noRestaurantsTitle => 'ఇక్కడ ఇంకా ఏమీ లేదు';

  @override
  String get noRestaurantsSubtitle => 'వేరే విభాగం చూడండి లేదా ఫిల్టర్ తీసేయండి.';

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
    return '$count+ రేటింగ్‌లు';
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
  String get noVegDishesSubtitle => 'పూర్తి మెనూ చూడటానికి శాకాహార ఫిల్టర్ ఆఫ్ చేయండి.';

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
  String get cartEmptySubtitle => 'మొదలుపెట్టడానికి ఏదైనా రెస్టారెంట్ నుండి వంటకాలు జోడించండి.';

  @override
  String get browseRestaurants => 'రెస్టారెంట్లు చూడండి';

  @override
  String itemsInCart(int count) {
    return '$count వస్తువులు';
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
  String placeOrderFor(int amount) {
    return 'ఆర్డర్ చేయండి · ₹$amount';
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
  String get prototypeNotice => 'నమూనా స్టోర్‌ఫ్రంట్ — నిజమైన దుకాణాలు కేటలాగ్ APIతో వస్తాయి.';

  @override
  String get prototypeCheckoutNotice => 'ఇది ఒక ప్రోటోటైప్. ఎలాంటి చెల్లింపు తీసుకోబడదు, నిజమైన ఆర్డర్ కూడా ఉండదు.';

  @override
  String get prototypeTrackingNotice => 'ప్రోటోటైప్ కోసం ట్రాకింగ్ కృత్రిమం.';
}
