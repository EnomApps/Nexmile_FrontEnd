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
  String placeOrderFor(int amount) {
    return 'ഓർഡർ ചെയ്യുക · ₹$amount';
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
}
