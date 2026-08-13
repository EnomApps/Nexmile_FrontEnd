// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ഈ ഫീൽഡ് നിർബന്ധമാണ്';

  @override
  String get tagline => 'വേഗത്തിലുള്ള ഡെലിവറി. പുതിയ പുഞ്ചിരികൾ.';

  @override
  String get chooseLanguageTitle => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get chooseLanguageSubtitle => 'നിങ്ങൾക്ക് സൗകര്യപ്രദമായ ഭാഷ തിരഞ്ഞെടുക്കുക. ഇത് എപ്പോൾ വേണമെങ്കിലും ക്രമീകരണങ്ങളിൽ മാറ്റാം.';

  @override
  String get searchLanguageHint => 'ഭാഷ തിരയുക';

  @override
  String get noLanguageFound => 'ഭാഷയൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String languagesAvailable(int count) {
    return '$count ഭാഷകൾ ലഭ്യമാണ്';
  }

  @override
  String get continueLabel => 'തുടരുക';

  @override
  String get selectedLabel => 'തിരഞ്ഞെടുത്തു';

  @override
  String get defaultLabel => 'ഡിഫോൾട്ട്';

  @override
  String get homeTitle => 'Nexmile ലേക്ക് സ്വാഗതം';

  @override
  String get homeSubtitle => 'പുതിയ പലവ്യഞ്ജനങ്ങൾ, ചൂടുള്ള ഭക്ഷണം, ദൈനംദിന ആവശ്യസാധനങ്ങൾ എന്നിവ അടുത്തുള്ള കടകളിൽ നിന്ന്.';

  @override
  String get changeLanguage => 'ഭാഷ മാറ്റുക';

  @override
  String get languageUpdated => 'ഭാഷ മാറ്റി';

  @override
  String get appLanguageLabel => 'ആപ്പ് ഭാഷ';

  @override
  String greetingNamed(String name) {
    return 'നമസ്കാരം, $name';
  }

  @override
  String get loginTitle => 'Nexmile ൽ സൈൻ ഇൻ ചെയ്യുക';

  @override
  String get loginSubtitle => 'നിങ്ങളുടെ ഇമെയിലോ മൊബൈൽ നമ്പറോ നൽകുക, ഞങ്ങൾ പരിശോധനാ കോഡ് അയയ്ക്കും.';

  @override
  String get emailOrPhoneLabel => 'ഇമെയിൽ അല്ലെങ്കിൽ മൊബൈൽ നമ്പർ';

  @override
  String get emailOrPhoneHint => 'name@example.com അല്ലെങ്കിൽ 9876543210';

  @override
  String get invalidEmailOrPhone => 'സാധുവായ ഇമെയിൽ വിലാസമോ 10 അക്ക മൊബൈൽ നമ്പറോ നൽകുക';

  @override
  String get sendCode => 'കോഡ് അയയ്ക്കുക';

  @override
  String get agreeToTermsOnContinue => 'തുടരുന്നതിലൂടെ ഞങ്ങളുടെ സേവന നിബന്ധനകളും സ്വകാര്യതാ നയവും നിങ്ങൾ അംഗീകരിക്കുന്നു.';

  @override
  String get otpTitle => 'ഇത് നിങ്ങൾ തന്നെയെന്ന് ഉറപ്പാക്കുക';

  @override
  String otpSubtitle(String target) {
    return '$target ലേക്ക് അയച്ച 6 അക്ക കോഡ് നൽകുക';
  }

  @override
  String get verifyCode => 'പരിശോധിക്കുക';

  @override
  String get resendCode => 'കോഡ് വീണ്ടും അയയ്ക്കുക';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds സെക്കൻഡിൽ വീണ്ടും അയയ്ക്കുക';
  }

  @override
  String get codeResent => 'പുതിയ കോഡ് അയച്ചിട്ടുണ്ട്';

  @override
  String get incorrectCode => 'ഈ കോഡ് തെറ്റാണ് അല്ലെങ്കിൽ കാലഹരണപ്പെട്ടു. പുതിയത് ആവശ്യപ്പെടുക.';

  @override
  String get enterFullCode => '6 അക്കങ്ങളും നൽകുക';

  @override
  String get accountSuspended => 'ഈ അക്കൗണ്ട് താൽക്കാലികമായി നിർത്തിവച്ചിരിക്കുന്നു. സപ്പോർട്ടുമായി ബന്ധപ്പെടുക.';

  @override
  String get tooManyAttempts => 'വളരെയധികം ശ്രമങ്ങൾ. കുറച്ച് സമയത്തിന് ശേഷം വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get sessionExpired => 'നിങ്ങളുടെ സെഷൻ കാലഹരണപ്പെട്ടു. വീണ്ടും സൈൻ ഇൻ ചെയ്യുക.';

  @override
  String get networkError => 'ഇന്റർനെറ്റ് കണക്ഷൻ ഇല്ല. കണക്ഷൻ പരിശോധിച്ച് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get developmentCode => 'ഡെവലപ്പ്മെന്റ് കോഡ്';

  @override
  String get signOut => 'സൈൻ ഔട്ട്';

  @override
  String get signedOut => 'നിങ്ങൾ സൈൻ ഔട്ട് ചെയ്തു';

  @override
  String get somethingWentWrong => 'എന്തോ കുഴപ്പം സംഭവിച്ചു. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get profileTitle => 'പ്രൊഫൈൽ';

  @override
  String get viewProfile => 'പ്രൊഫൈൽ കാണുക';

  @override
  String get nameLabel => 'പേര്';

  @override
  String get emailLabel => 'ഇമെയിൽ';

  @override
  String get mobileLabel => 'മൊബൈൽ നമ്പർ';

  @override
  String get accountStatusLabel => 'അക്കൗണ്ട് നില';

  @override
  String get statusActive => 'സജീവം';

  @override
  String get statusPending => 'തീർപ്പാക്കാത്തത്';

  @override
  String get statusSuspended => 'നിർത്തിവച്ചു';

  @override
  String get verifiedLabel => 'പരിശോധിച്ചു';

  @override
  String get notProvided => 'ചേർത്തിട്ടില്ല';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get navHome => 'ഹോം';

  @override
  String get navSearch => 'തിരയുക';

  @override
  String get navOrders => 'ഓർഡറുകൾ';

  @override
  String get cancelLabel => 'റദ്ദാക്കുക';

  @override
  String get deliverTo => 'ഡെലിവറി വിലാസം';

  @override
  String get searchDishesHint => 'വിഭവങ്ങളോ റെസ്റ്റോറന്റുകളോ തിരയുക';

  @override
  String get searchTitle => 'തിരയുക';

  @override
  String get searchNoResultsTitle => 'ഒന്നും കണ്ടെത്തിയില്ല';

  @override
  String get searchNoResultsSubtitle => 'മറ്റൊരു വിഭവം, പാചകരീതി അല്ലെങ്കിൽ റെസ്റ്റോറന്റ് പേര് പരീക്ഷിക്കുക.';

  @override
  String get cravingTitle => 'ഇന്ന് എന്ത് കഴിക്കാൻ തോന്നുന്നു?';

  @override
  String get offersTitle => 'നിങ്ങൾക്കുള്ള ഓഫറുകൾ';

  @override
  String get restaurantsNearby => 'അടുത്തുള്ള റെസ്റ്റോറന്റുകൾ';

  @override
  String restaurantsCount(int count) {
    return '$count റെസ്റ്റോറന്റുകൾ';
  }

  @override
  String get noRestaurantsTitle => 'ഇവിടെ ഇതുവരെ ഒന്നുമില്ല';

  @override
  String get noRestaurantsSubtitle => 'മറ്റൊരു വിഭാഗം നോക്കുക അല്ലെങ്കിൽ ഫിൽട്ടർ നീക്കുക.';

  @override
  String minutesAway(int minutes) {
    return '$minutes മിനിറ്റ്';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance കിമീ';
  }

  @override
  String ratingsCount(int count) {
    return '$count+ റേറ്റിംഗുകൾ';
  }

  @override
  String priceForTwo(int amount) {
    return 'രണ്ടുപേർക്ക് ₹$amount';
  }

  @override
  String get freeDelivery => 'സൗജന്യ ഡെലിവറി';

  @override
  String percentOff(int percent) {
    return '$percent% കിഴിവ്';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'നിങ്ങളുടെ ഓർഡറിന് $percent% കിഴിവ്';
  }

  @override
  String get vegOnly => 'വെജ് മാത്രം';

  @override
  String get bestseller => 'ഏറ്റവും വിറ്റഴിയുന്നത്';

  @override
  String get addLabel => 'ചേർക്കുക';

  @override
  String get noVegDishesTitle => 'ഇവിടെ വെജ് വിഭവങ്ങളില്ല';

  @override
  String get noVegDishesSubtitle => 'മുഴുവൻ മെനു കാണാൻ വെജ് ഫിൽട്ടർ ഓഫ് ചെയ്യുക.';

  @override
  String get replaceCartTitle => 'പുതിയ കാർട്ട് തുടങ്ങണോ?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'നിങ്ങളുടെ കാർട്ടിൽ $restaurant ൽ നിന്നുള്ള സാധനങ്ങളുണ്ട്. ഇത് ചേർത്താൽ അവ നീക്കപ്പെടും.';
  }

  @override
  String get replaceCartConfirm => 'നീക്കി ചേർക്കുക';

  @override
  String get cartTitle => 'നിങ്ങളുടെ കാർട്ട്';

  @override
  String get cartEmptyTitle => 'നിങ്ങളുടെ കാർട്ട് ശൂന്യമാണ്';

  @override
  String get cartEmptySubtitle => 'തുടങ്ങാൻ ഏതെങ്കിലും റെസ്റ്റോറന്റിൽ നിന്ന് വിഭവങ്ങൾ ചേർക്കുക.';

  @override
  String get browseRestaurants => 'റെസ്റ്റോറന്റുകൾ കാണുക';

  @override
  String itemsInCart(int count) {
    return '$count സാധനങ്ങൾ';
  }

  @override
  String get viewCart => 'കാർട്ട് കാണുക';

  @override
  String get itemTotal => 'സാധനങ്ങളുടെ ആകെ';

  @override
  String get deliveryFeeLabel => 'ഡെലിവറി ഫീസ്';

  @override
  String get taxesAndCharges => 'നികുതികളും ചാർജുകളും';

  @override
  String get freeLabel => 'സൗജന്യം';

  @override
  String get toPay => 'അടയ്ക്കേണ്ടത്';

  @override
  String placeOrderFor(String amount) {
    return 'ഓർഡർ ചെയ്യുക · $amount';
  }

  @override
  String get ordersTitle => 'നിങ്ങളുടെ ഓർഡറുകൾ';

  @override
  String get ordersEmptyTitle => 'ഇതുവരെ ഓർഡറുകളില്ല';

  @override
  String get ordersEmptySubtitle => 'നിങ്ങളുടെ പഴയ ഓർഡറുകൾ ഇവിടെ കാണാം.';

  @override
  String get reorder => 'വീണ്ടും ഓർഡർ';

  @override
  String orderTitle(String id) {
    return 'ഓർഡർ $id';
  }

  @override
  String get orderPlacedTitle => 'ഓർഡർ ചെയ്തു';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'ഏകദേശം $minutes മിനിറ്റിനുള്ളിൽ എത്തും.';
  }

  @override
  String get orderDeliveredTitle => 'ഡെലിവർ ചെയ്തു';

  @override
  String get orderDeliveredSubtitle => 'ഭക്ഷണം ആസ്വദിക്കൂ.';

  @override
  String get statusOrderPlaced => 'ഓർഡർ ചെയ്തു';

  @override
  String get statusPreparing => 'ഭക്ഷണം തയ്യാറാകുന്നു';

  @override
  String get statusOnTheWay => 'വഴിയിലാണ്';

  @override
  String get statusDelivered => 'ഡെലിവർ ചെയ്തു';

  @override
  String get keepBrowsing => 'കാണുന്നത് തുടരുക';

  @override
  String get backToHome => 'ഹോമിലേക്ക് മടങ്ങുക';

  @override
  String get prototypeNotice => 'മാതൃകാ സ്റ്റോർഫ്രണ്ട് — യഥാർത്ഥ കടകൾ കാറ്റലോഗ് API യോടൊപ്പം വരും.';

  @override
  String get prototypeCheckoutNotice => 'ഇതൊരു പ്രോട്ടോടൈപ്പാണ്. പണം ഈടാക്കുന്നില്ല, യഥാർത്ഥ ഓർഡറും നടക്കുന്നില്ല.';

  @override
  String get prototypeTrackingNotice => 'പ്രോട്ടോടൈപ്പിനായി ട്രാക്കിംഗ് കൃത്രിമമാണ്.';

  @override
  String get locationTitle => 'എവിടെ ഡെലിവർ ചെയ്യണം?';

  @override
  String get locationSubtitle => 'Nexmile 1 കിമീ പരിധിയിലുള്ള കടകളിൽ നിന്ന് മാത്രമേ ഡെലിവർ ചെയ്യൂ, അതിനാൽ നിങ്ങളുടെ കൃത്യമായ സ്ഥലം വേണം.';

  @override
  String get locationReasonRadiusTitle => '1 കിമീയ്ക്കുള്ളിലെ കടകൾ';

  @override
  String get locationReasonRadiusBody => 'ചൂടോടെ എത്താൻ കഴിയുന്ന അടുക്കളകൾ മാത്രമേ കാണിക്കൂ.';

  @override
  String get locationReasonAccuracyTitle => 'ശരിയായ വാതിൽക്കൽ';

  @override
  String get locationReasonAccuracyBody => 'കൃത്യമായ പിൻ ഉണ്ടെങ്കിൽ ഡെലിവറി പങ്കാളി വിളിക്കാതെ തന്നെ നിങ്ങളെ കണ്ടെത്തും.';

  @override
  String get locationReasonPrivacyTitle => 'ആപ്പ് ഉപയോഗിക്കുമ്പോൾ മാത്രം';

  @override
  String get locationReasonPrivacyBody => 'പശ്ചാത്തലത്തിൽ ഞങ്ങൾ നിങ്ങളെ ട്രാക്ക് ചെയ്യില്ല, വിലാസം സ്വയം ടൈപ്പ് ചെയ്യാം.';

  @override
  String get allowLocation => 'ലൊക്കേഷൻ അനുവദിക്കുക';

  @override
  String get enterAddressManually => 'ഞാൻ വിലാസം സ്വയം എഴുതാം';

  @override
  String get locationDenied => 'ലൊക്കേഷൻ അനുമതി നിരസിച്ചു. നിങ്ങൾക്ക് പിൻ സ്വയം വയ്ക്കാം.';

  @override
  String get locationDeniedForever => 'Nexmile നായി ലൊക്കേഷൻ തടഞ്ഞിരിക്കുന്നു. ക്രമീകരണങ്ങളിൽ ഓണാക്കുക അല്ലെങ്കിൽ പിൻ സ്വയം വയ്ക്കുക.';

  @override
  String get locationServiceOff => 'ഈ ഉപകരണത്തിൽ ലൊക്കേഷൻ ഓഫാണ്.';

  @override
  String get locationUnavailable => 'ലൊക്കേഷൻ ലഭിച്ചില്ല. ദയവായി പിൻ സ്വയം വയ്ക്കുക.';

  @override
  String get openSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get pinLocationTitle => 'നിങ്ങളുടെ ഡെലിവറി പിൻ വയ്ക്കുക';

  @override
  String get deliveryRadiusHint => 'Nexmile ഡെലിവർ ചെയ്യുന്ന 1 കിമീ വൃത്തം കാണിക്കുന്നു.';

  @override
  String get useMyLocation => 'എന്റെ ലൊക്കേഷൻ ഉപയോഗിക്കുക';

  @override
  String get deliveringHere => 'ഇവിടെ ഡെലിവറി';

  @override
  String get dragToAdjust => 'പിൻ ക്രമീകരിക്കാൻ മാപ്പ് നീക്കുക';

  @override
  String get confirmLocation => 'ലൊക്കേഷൻ സ്ഥിരീകരിക്കുക';

  @override
  String get addressDetailsTitle => 'വിലാസ വിവരങ്ങൾ';

  @override
  String get addressDetailsSubtitle => 'ശരിയായ വാതിലിൽ എത്താൻ വീട്ടുനമ്പറും അടയാളവും ചേർക്കുക.';

  @override
  String get pinnedLocation => 'അടയാളപ്പെടുത്തിയ സ്ഥലം';

  @override
  String get changePin => 'മാറ്റുക';

  @override
  String get saveAddressAs => 'ഈ വിലാസം ഇങ്ങനെ സൂക്ഷിക്കുക';

  @override
  String get labelHome => 'വീട്';

  @override
  String get labelWork => 'ഓഫീസ്';

  @override
  String get labelOther => 'മറ്റുള്ളവ';

  @override
  String get addressLine1Label => 'വീട്, ഫ്ലാറ്റ് അല്ലെങ്കിൽ കെട്ടിടം';

  @override
  String get addressLine1Hint => '12A, ഗ്രീൻ റെസിഡൻസി';

  @override
  String get addressLine2Label => 'തെരുവ് അല്ലെങ്കിൽ പ്രദേശം';

  @override
  String get addressLine2Hint => '2-ാം അവന്യൂ, അണ്ണാ നഗർ';

  @override
  String get landmarkLabel => 'അടയാളം';

  @override
  String get landmarkHint => 'ബസ് സ്റ്റോപ്പിന് എതിർവശം';

  @override
  String get cityLabel => 'നഗരം';

  @override
  String get stateLabel => 'സംസ്ഥാനം';

  @override
  String get pincodeLabel => 'പിൻ കോഡ്';

  @override
  String get invalidPincode => 'സാധുവായ 6 അക്ക പിൻ കോഡ് നൽകുക';

  @override
  String get contactNameLabel => 'ബന്ധപ്പെടേണ്ട പേര്';

  @override
  String get contactPhoneLabel => 'ബന്ധപ്പെടേണ്ട നമ്പർ';

  @override
  String get invalidMobileNumber => 'സാധുവായ 10 അക്ക മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get makeDefaultAddress => 'ഡിഫോൾട്ടായി ഇവിടെ ഡെലിവറി';

  @override
  String get saveAddress => 'വിലാസം സൂക്ഷിക്കുക';

  @override
  String get addressSaved => 'വിലാസം സൂക്ഷിച്ചു';

  @override
  String get addressBookTitle => 'ഡെലിവറി വിലാസങ്ങൾ';

  @override
  String get manageAddresses => 'സൂക്ഷിച്ച വിലാസങ്ങൾ കൈകാര്യം ചെയ്യുക';

  @override
  String get noAddressesTitle => 'ഇതുവരെ വിലാസങ്ങളില്ല';

  @override
  String get noAddressesSubtitle => 'നിങ്ങൾക്ക് ഡെലിവർ ചെയ്യുന്ന കടകൾ കാണിക്കാൻ ഒരു വിലാസം ചേർക്കുക.';

  @override
  String get addAddress => 'വിലാസം ചേർക്കുക';

  @override
  String get setAsDefault => 'ഡിഫോൾട്ടാക്കുക';

  @override
  String get editLabel => 'എഡിറ്റ് ചെയ്യുക';

  @override
  String get addressUpdated => 'വിലാസം അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get deleteLabel => 'ഇല്ലാതാക്കുക';

  @override
  String get deleteAddressTitle => 'ഈ വിലാസം ഇല്ലാതാക്കണോ?';

  @override
  String get deleteAddressMessage => 'പിന്നീട് എപ്പോൾ വേണമെങ്കിലും വീണ്ടും ചേർക്കാം.';

  @override
  String get rescueDealsTitle => 'ഫുഡ് റെസ്ക്യൂ';

  @override
  String get notTakingOrders => 'ഓർഡർ എടുക്കുന്നില്ല';

  @override
  String get closedRightNow => 'ഇപ്പോൾ അടച്ചിരിക്കുന്നു';

  @override
  String minimumOrder(String amount) {
    return 'കുറഞ്ഞത് $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ബാക്കി';
  }

  @override
  String get soldOut => 'തീർന്നു';

  @override
  String get menuEmptyTitle => 'ഇതുവരെ വിഭവങ്ങളില്ല';

  @override
  String get menuEmptySubtitle => 'ഈ റെസ്റ്റോറന്റ് അതിന്റെ മെനു ചേർത്തിട്ടില്ല.';

  @override
  String get moreDishesTitle => 'കൂടുതൽ വിഭവങ്ങൾ';

  @override
  String get customisable => 'ഇഷ്ടാനുസരണം';

  @override
  String get requiredLabel => 'നിർബന്ധം';

  @override
  String get optionalLabel => 'ഐച്ഛികം';

  @override
  String get chooseOne => 'ഒന്ന് തിരഞ്ഞെടുക്കുക';

  @override
  String chooseUpTo(int count) {
    return 'പരമാവധി $count തിരഞ്ഞെടുക്കുക';
  }

  @override
  String chooseAtLeast(int count) {
    return 'കുറഞ്ഞത് $count തിരഞ്ഞെടുക്കുക';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min മുതൽ $max വരെ തിരഞ്ഞെടുക്കുക';
  }

  @override
  String get specialInstructions => 'പ്രത്യേക നിർദ്ദേശങ്ങൾ';

  @override
  String get specialInstructionsHint => 'എരിവ് കുറച്ച്, സവാള വേണ്ട…';

  @override
  String addForAmount(String amount) {
    return 'ചേർക്കുക · $amount';
  }

  @override
  String get deliveryLabel => 'ഡെലിവറി';

  @override
  String get pickupLabel => 'നേരിട്ട് വാങ്ങൽ';

  @override
  String get packagingLabel => 'പാക്കിംഗ്';

  @override
  String get discountLabel => 'കിഴിവ്';

  @override
  String get billDetailsTitle => 'ബിൽ വിവരങ്ങൾ';

  @override
  String get clearCart => 'കാർട്ട് ശൂന്യമാക്കുക';

  @override
  String get clearCartTitle => 'ഈ കാർട്ട് ശൂന്യമാക്കണോ?';

  @override
  String get clearCartMessage => 'അതിലുള്ളതെല്ലാം നീക്കം ചെയ്യും.';

  @override
  String unavailableItemsNotice(String items) {
    return 'ഇപ്പോൾ ലഭ്യമല്ല: $items';
  }

  @override
  String get removeUnavailable => 'അവ നീക്കം ചെയ്യുക';

  @override
  String minimumNotMet(String amount) {
    return 'കുറഞ്ഞ ഓർഡർ $amount ആണ്';
  }

  @override
  String get checkoutTitle => 'ചെക്ക്ഔട്ട്';

  @override
  String get deliveryAddressLabel => 'ഡെലിവറി വിലാസം';

  @override
  String get noAddressSelected => 'വിലാസം തിരഞ്ഞെടുത്തിട്ടില്ല';

  @override
  String get paymentMethodLabel => 'പണമടയ്ക്കൽ';

  @override
  String get payOnDelivery => 'ഡെലിവറി സമയത്ത് പണം';

  @override
  String get noteToRestaurant => 'റെസ്റ്റോറന്റിനുള്ള കുറിപ്പ്';

  @override
  String get noteToRestaurantHint => 'ബെൽ രണ്ടു തവണ അടിക്കുക…';

  @override
  String get activeOrdersTitle => 'നടക്കുന്ന ഓർഡറുകൾ';

  @override
  String get pastOrdersTitle => 'പഴയ ഓർഡറുകൾ';

  @override
  String get orderItemsTitle => 'വിഭവങ്ങൾ';

  @override
  String get orderProgressTitle => 'പുരോഗതി';

  @override
  String get arrivingIn => 'എത്തിച്ചേരാൻ';

  @override
  String get pickupCodeLabel => 'പിക്കപ്പ് കോഡ്';

  @override
  String get cancellationReasonLabel => 'റദ്ദാക്കിയ കാരണം';

  @override
  String get riderLabel => 'ഡെലിവറി പങ്കാളി';

  @override
  String get callRider => 'വിളിക്കുക';

  @override
  String get viewInvoice => 'ടാക്സ് ഇൻവോയ്സ്';

  @override
  String get cancelOrder => 'ഓർഡർ റദ്ദാക്കുക';

  @override
  String get cancelOrderTitle => 'ഈ ഓർഡർ റദ്ദാക്കണോ?';

  @override
  String get cancelOrderMessage => 'റെസ്റ്റോറന്റ് സ്വീകരിക്കുന്നതിനു മുൻപ് മാത്രമേ റദ്ദാക്കാനാകൂ.';

  @override
  String get cancelReasonLabel => 'കാരണം';

  @override
  String get cancelReasonFallback => 'ഉപഭോക്താവ് റദ്ദാക്കി';

  @override
  String get orderCancelled => 'ഓർഡർ റദ്ദാക്കി';

  @override
  String get currentLocationLabel => 'നിലവിലെ സ്ഥലം';
}
