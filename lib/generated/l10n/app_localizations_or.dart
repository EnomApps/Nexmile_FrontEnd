// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appName => 'Nexmile';

  @override
  String get fieldRequired => 'ଏହି ଘର ଆବଶ୍ୟକ';

  @override
  String get tagline => 'ଦ୍ରୁତ ଡେଲିଭରି। ସତେଜ ହସ।';

  @override
  String get chooseLanguageTitle => 'ଆପଣଙ୍କ ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get chooseLanguageSubtitle =>
      'ଆପଣ ସହଜ ଅନୁଭବ କରୁଥିବା ଭାଷା ବାଛନ୍ତୁ। ଆପଣ ଏହାକୁ ଯେକୌଣସି ସମୟରେ ସେଟିଂସରେ ବଦଳାଇ ପାରିବେ।';

  @override
  String get searchLanguageHint => 'ଭାଷା ଖୋଜନ୍ତୁ';

  @override
  String get noLanguageFound => 'କୌଣସି ଭାଷା ମିଳିଲା ନାହିଁ';

  @override
  String languagesAvailable(int count) {
    return '$countଟି ଭାଷା ଉପଲବ୍ଧ';
  }

  @override
  String get continueLabel => 'ଆଗକୁ ବଢ଼ନ୍ତୁ';

  @override
  String get selectedLabel => 'ଚୟନିତ';

  @override
  String get defaultLabel => 'ଡିଫଲ୍ଟ';

  @override
  String get homeTitle => 'Nexmile କୁ ସ୍ୱାଗତ';

  @override
  String get homeSubtitle =>
      'ସତେଜ ମୁଦି ସାମଗ୍ରୀ, ଗରମ ଖାଦ୍ୟ ଏବଂ ଦୈନନ୍ଦିନ ଆବଶ୍ୟକତା ଆପଣଙ୍କ ନିକଟସ୍ଥ ଦୋକାନରୁ।';

  @override
  String get changeLanguage => 'ଭାଷା ବଦଳାନ୍ତୁ';

  @override
  String get languageUpdated => 'ଭାଷା ବଦଳାଗଲା';

  @override
  String get appLanguageLabel => 'ଆପ୍ ଭାଷା';

  @override
  String greetingNamed(String name) {
    return 'ନମସ୍କାର, $name';
  }

  @override
  String get loginTitle => 'Nexmile ରେ ସାଇନ ଇନ କରନ୍ତୁ';

  @override
  String get loginSubtitle =>
      'ଆପଣଙ୍କ ଇମେଲ କିମ୍ବା ମୋବାଇଲ ନମ୍ବର ଦିଅନ୍ତୁ, ଆମେ ଯାଞ୍ଚ କୋଡ ପଠାଇବୁ।';

  @override
  String get emailOrPhoneLabel => 'ଇମେଲ କିମ୍ବା ମୋବାଇଲ ନମ୍ବର';

  @override
  String get emailOrPhoneHint => 'name@example.com କିମ୍ବା 9876543210';

  @override
  String get invalidEmailOrPhone =>
      'ସଠିକ ଇମେଲ ଠିକଣା କିମ୍ବା 10 ଅଙ୍କର ମୋବାଇଲ ନମ୍ବର ଦିଅନ୍ତୁ';

  @override
  String get sendCode => 'କୋଡ ପଠାନ୍ତୁ';

  @override
  String get agreeToTermsOnContinue =>
      'ଆଗକୁ ବଢ଼ିବା ଦ୍ୱାରା ଆପଣ ଆମର ସେବା ସର୍ତ୍ତାବଳୀ ଓ ଗୋପନୀୟତା ନୀତିରେ ସହମତ ହେଉଛନ୍ତି।';

  @override
  String get otpTitle => 'ଏହା ଆପଣ ବୋଲି ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String otpSubtitle(String target) {
    return '$target କୁ ପଠାଯାଇଥିବା 6 ଅଙ୍କର କୋଡ ଦିଅନ୍ତୁ';
  }

  @override
  String get verifyCode => 'ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String get resendCode => 'କୋଡ ପୁଣି ପଠାନ୍ତୁ';

  @override
  String resendCodeIn(int seconds) {
    return '$seconds ସେକେଣ୍ଡରେ ପୁଣି ପଠାନ୍ତୁ';
  }

  @override
  String get codeResent => 'ନୂଆ କୋଡ ପଠାଯାଇଛି';

  @override
  String get incorrectCode =>
      'ଏହି କୋଡ ଭୁଲ କିମ୍ବା ମିଆଦ ସରିଯାଇଛି। ନୂଆ କୋଡ ମାଗନ୍ତୁ।';

  @override
  String get enterFullCode => 'ପୂରା 6 ଅଙ୍କ ଦିଅନ୍ତୁ';

  @override
  String get accountSuspended =>
      'ଏହି ଖାତା ନିଲମ୍ବିତ କରାଯାଇଛି। ଦୟାକରି ସହାୟତା ସହ ଯୋଗାଯୋଗ କରନ୍ତୁ।';

  @override
  String get tooManyAttempts =>
      'ବହୁତ ଅଧିକ ଚେଷ୍ଟା ହୋଇଗଲା। ଦୟାକରି କିଛି ସମୟ ପରେ ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get sessionExpired =>
      'ଆପଣଙ୍କ ସେସନର ମିଆଦ ସରିଯାଇଛି। ଦୟାକରି ପୁଣି ସାଇନ ଇନ କରନ୍ତୁ।';

  @override
  String get networkError =>
      'ଇଣ୍ଟରନେଟ ସଂଯୋଗ ନାହିଁ। ସଂଯୋଗ ଯାଞ୍ଚ କରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get developmentCode => 'ଡେଭଲପମେଣ୍ଟ କୋଡ';

  @override
  String get signOut => 'ସାଇନ ଆଉଟ';

  @override
  String get signedOut => 'ଆପଣ ସାଇନ ଆଉଟ ହୋଇଛନ୍ତି';

  @override
  String get somethingWentWrong => 'କିଛି ଭୁଲ ହେଲା। ଦୟାକରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get profileTitle => 'ପ୍ରୋଫାଇଲ';

  @override
  String get viewProfile => 'ପ୍ରୋଫାଇଲ ଦେଖନ୍ତୁ';

  @override
  String get nameLabel => 'ନାମ';

  @override
  String get emailLabel => 'ଇମେଲ';

  @override
  String get mobileLabel => 'ମୋବାଇଲ ନମ୍ବର';

  @override
  String get accountStatusLabel => 'ଖାତାର ସ୍ଥିତି';

  @override
  String get statusActive => 'ସକ୍ରିୟ';

  @override
  String get statusPending => 'ବିଚାରାଧୀନ';

  @override
  String get statusSuspended => 'ନିଲମ୍ବିତ';

  @override
  String get verifiedLabel => 'ଯାଞ୍ଚ ହୋଇଛି';

  @override
  String get notProvided => 'ଯୋଡ଼ାଯାଇନାହିଁ';

  @override
  String get retry => 'ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get navHome => 'ହୋମ';

  @override
  String get navSearch => 'ଖୋଜନ୍ତୁ';

  @override
  String get navOrders => 'ଅର୍ଡର';

  @override
  String get cancelLabel => 'ବାତିଲ କରନ୍ତୁ';

  @override
  String get deliverTo => 'ଡେଲିଭରି ଠିକଣା';

  @override
  String get searchDishesHint => 'ଖାଦ୍ୟ କିମ୍ବା ରେଷ୍ଟୁରାଣ୍ଟ ଖୋଜନ୍ତୁ';

  @override
  String get searchTitle => 'ଖୋଜନ୍ତୁ';

  @override
  String get searchNoResultsTitle => 'କିଛି ମିଳିଲା ନାହିଁ';

  @override
  String get searchNoResultsSubtitle =>
      'ଅନ୍ୟ ଖାଦ୍ୟ, ରନ୍ଧନ ଶୈଳୀ କିମ୍ବା ରେଷ୍ଟୁରାଣ୍ଟ ନାମ ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get cravingTitle => 'ଆଜି କଣ ଖାଇବାକୁ ଇଚ୍ଛା?';

  @override
  String get offersTitle => 'ଆପଣଙ୍କ ପାଇଁ ଅଫର';

  @override
  String get restaurantsNearby => 'ଆପଣଙ୍କ ନିକଟସ୍ଥ ରେଷ୍ଟୁରାଣ୍ଟ';

  @override
  String restaurantsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countଟି ରେଷ୍ଟୁରାଣ୍ଟ',
      one: '1ଟି ରେଷ୍ଟୁରାଣ୍ଟ',
    );
    return '$_temp0';
  }

  @override
  String get noRestaurantsTitle => 'ଏଠାରେ ଏପର୍ଯ୍ୟନ୍ତ କିଛି ନାହିଁ';

  @override
  String get noRestaurantsSubtitle =>
      'ଅନ୍ୟ ବର୍ଗ ଦେଖନ୍ତୁ କିମ୍ବା ଫିଲ୍ଟର ହଟାନ୍ତୁ।';

  @override
  String minutesAway(int minutes) {
    return '$minutes ମିନିଟ';
  }

  @override
  String kilometresAway(String distance) {
    return '$distance କିମି';
  }

  @override
  String ratingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ରେଟିଂ',
      one: '1 ରେଟିଂ',
    );
    return '$_temp0';
  }

  @override
  String priceForTwo(int amount) {
    return 'ଦୁଇ ଜଣଙ୍କ ପାଇଁ ₹$amount';
  }

  @override
  String get freeDelivery => 'ମାଗଣା ଡେଲିଭରି';

  @override
  String percentOff(int percent) {
    return '$percent% ଛାଡ଼';
  }

  @override
  String percentOffOnOrder(int percent) {
    return 'ଆପଣଙ୍କ ଅର୍ଡରରେ $percent% ଛାଡ଼';
  }

  @override
  String get vegOnly => 'କେବଳ ନିରାମିଷ';

  @override
  String get bestseller => 'ସର୍ବାଧିକ ବିକ୍ରି';

  @override
  String get addLabel => 'ଯୋଡ଼ନ୍ତୁ';

  @override
  String get noVegDishesTitle => 'ଏଠାରେ ନିରାମିଷ ଖାଦ୍ୟ ନାହିଁ';

  @override
  String get noVegDishesSubtitle =>
      'ପୂର୍ଣ୍ଣ ମେନୁ ଦେଖିବାକୁ ନିରାମିଷ ଫିଲ୍ଟର ବନ୍ଦ କରନ୍ତୁ।';

  @override
  String get replaceCartTitle => 'ନୂଆ କାର୍ଟ ଆରମ୍ଭ କରିବେ?';

  @override
  String replaceCartMessage(String restaurant) {
    return 'ଆପଣଙ୍କ କାର୍ଟରେ $restaurantର ଜିନିଷ ଅଛି। ଏହା ଯୋଡ଼ିଲେ ସେଗୁଡ଼ିକ ହଟିଯିବ।';
  }

  @override
  String get replaceCartConfirm => 'ହଟାଇ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get cartTitle => 'ଆପଣଙ୍କ କାର୍ଟ';

  @override
  String get cartEmptyTitle => 'ଆପଣଙ୍କ କାର୍ଟ ଖାଲି';

  @override
  String get cartEmptySubtitle =>
      'ଆରମ୍ଭ କରିବାକୁ କୌଣସି ରେଷ୍ଟୁରାଣ୍ଟରୁ ଖାଦ୍ୟ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get browseRestaurants => 'ରେଷ୍ଟୁରାଣ୍ଟ ଦେଖନ୍ତୁ';

  @override
  String itemsInCart(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countଟି ଜିନିଷ',
      one: '1ଟି ଜିନିଷ',
    );
    return '$_temp0';
  }

  @override
  String get viewCart => 'କାର୍ଟ ଦେଖନ୍ତୁ';

  @override
  String get itemTotal => 'ଜିନିଷର ମୋଟ';

  @override
  String get deliveryFeeLabel => 'ଡେଲିଭରି ଶୁଳ୍କ';

  @override
  String get taxesAndCharges => 'କର ଓ ଶୁଳ୍କ';

  @override
  String get freeLabel => 'ମାଗଣା';

  @override
  String get toPay => 'ଦେୟ';

  @override
  String placeOrderFor(String amount) {
    return 'ଅର୍ଡର କରନ୍ତୁ · $amount';
  }

  @override
  String get ordersTitle => 'ଆପଣଙ୍କ ଅର୍ଡର';

  @override
  String get ordersEmptyTitle => 'ଏପର୍ଯ୍ୟନ୍ତ ଅର୍ଡର ନାହିଁ';

  @override
  String get ordersEmptySubtitle => 'ଆପଣଙ୍କ ପୂର୍ବ ଅର୍ଡର ଏଠାରେ ଦେଖାଯିବ।';

  @override
  String get reorder => 'ପୁଣି ଅର୍ଡର';

  @override
  String orderTitle(String id) {
    return 'ଅର୍ଡର $id';
  }

  @override
  String get orderPlacedTitle => 'ଅର୍ଡର ହୋଇଗଲା';

  @override
  String orderPlacedSubtitle(int minutes) {
    return 'ପ୍ରାୟ $minutes ମିନିଟରେ ପହଞ୍ଚିବ।';
  }

  @override
  String get orderDeliveredTitle => 'ଡେଲିଭର ହୋଇଗଲା';

  @override
  String get orderDeliveredSubtitle => 'ଖାଦ୍ୟ ଉପଭୋଗ କରନ୍ତୁ।';

  @override
  String get statusOrderPlaced => 'ଅର୍ଡର ହୋଇଗଲା';

  @override
  String get statusPreparing => 'ଖାଦ୍ୟ ପ୍ରସ୍ତୁତ ହେଉଛି';

  @override
  String get statusOnTheWay => 'ରାସ୍ତାରେ ଅଛି';

  @override
  String get statusDelivered => 'ଡେଲିଭର ହୋଇଗଲା';

  @override
  String get keepBrowsing => 'ଦେଖୁଥାନ୍ତୁ';

  @override
  String get backToHome => 'ହୋମକୁ ଫେରନ୍ତୁ';

  @override
  String get prototypeNotice =>
      'ନମୁନା ଷ୍ଟୋରଫ୍ରଣ୍ଟ — ପ୍ରକୃତ ଦୋକାନ କାଟାଲଗ APIସହ ଆସିବ।';

  @override
  String get prototypeCheckoutNotice =>
      'ଏହା ଏକ ପ୍ରୋଟୋଟାଇପ। କୌଣସି ଦେୟ ନିଆଯାଏ ନାହିଁ ଏବଂ ପ୍ରକୃତ ଅର୍ଡର ମଧ୍ୟ ହୁଏ ନାହିଁ।';

  @override
  String get prototypeTrackingNotice => 'ପ୍ରୋଟୋଟାଇପ ପାଇଁ ଟ୍ରାକିଂ କୃତ୍ରିମ।';

  @override
  String get locationTitle => 'କେଉଁଠାରେ ଡେଲିଭରି କରିବୁ?';

  @override
  String get locationSubtitle =>
      'Nexmile କେବଳ 1 କିମି ଭିତରର ଦୋକାନରୁ ଡେଲିଭରି କରେ, ତେଣୁ ଆପଣଙ୍କ ସଠିକ ସ୍ଥାନ ଦରକାର।';

  @override
  String get locationReasonRadiusTitle => '1 କିମି ଭିତରର ଦୋକାନ';

  @override
  String get locationReasonRadiusBody =>
      'ଯେଉଁଠାରୁ ଖାଦ୍ୟ ଗରମ ପହଞ୍ଚିବ, କେବଳ ସେହି ରୋଷେଇଘର ଦେଖାଉ।';

  @override
  String get locationReasonAccuracyTitle => 'ଠିକ୍ ଦୁଆର ପର୍ଯ୍ୟନ୍ତ';

  @override
  String get locationReasonAccuracyBody =>
      'ସଠିକ ପିନ ଥିଲେ ଡେଲିଭରି ପାର୍ଟନର ଫୋନ ନକରି ଆପଣଙ୍କୁ ଖୋଜି ପାଆନ୍ତି।';

  @override
  String get locationReasonPrivacyTitle => 'କେବଳ ଆପ୍ ବ୍ୟବହାର ସମୟରେ';

  @override
  String get locationReasonPrivacyBody =>
      'ଆମେ ପୃଷ୍ଠଭୂମିରେ ଆପଣଙ୍କୁ ଟ୍ରାକ କରୁନାହୁଁ, ଠିକଣା ଆପଣ ନିଜେ ମଧ୍ୟ ଲେଖିପାରିବେ।';

  @override
  String get allowLocation => 'ଲୋକେସନ ଅନୁମତି ଦିଅନ୍ତୁ';

  @override
  String get enterAddressManually => 'ମୁଁ ନିଜେ ଠିକଣା ଲେଖିବି';

  @override
  String get locationDenied =>
      'ଲୋକେସନ ଅନୁମତି ମିଳିଲା ନାହିଁ। ଆପଣ ନିଜେ ପିନ ରଖିପାରିବେ।';

  @override
  String get locationDeniedForever =>
      'Nexmile ପାଇଁ ଲୋକେସନ ବନ୍ଦ ଅଛି। ସେଟିଂସରେ ଚାଲୁ କରନ୍ତୁ କିମ୍ବା ପିନ ନିଜେ ରଖନ୍ତୁ।';

  @override
  String get locationServiceOff => 'ଏହି ଡିଭାଇସରେ ଲୋକେସନ ବନ୍ଦ ଅଛି।';

  @override
  String get locationUnavailable =>
      'ଲୋକେସନ ମିଳିଲା ନାହିଁ। ଦୟାକରି ପିନ ନିଜେ ରଖନ୍ତୁ।';

  @override
  String get openSettings => 'ସେଟିଂସ';

  @override
  String get pinLocationTitle => 'ଆପଣଙ୍କ ଡେଲିଭରି ପିନ ରଖନ୍ତୁ';

  @override
  String get deliveryRadiusHint =>
      'Nexmile ଡେଲିଭରି କରୁଥିବା 1 କିମି ପରିସର ବୃତ୍ତ ଦେଖାଉଛି।';

  @override
  String get useMyLocation => 'ମୋ ଲୋକେସନ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get deliveringHere => 'ଏଠାରେ ଡେଲିଭରି';

  @override
  String get dragToAdjust => 'ପିନ ବଦଳାଇବାକୁ ମାନଚିତ୍ର ଟାଣନ୍ତୁ';

  @override
  String get confirmLocation => 'ଲୋକେସନ ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get addressDetailsTitle => 'ଠିକଣା ବିବରଣୀ';

  @override
  String get addressDetailsSubtitle =>
      'ଠିକ୍ ଦୁଆରରେ ପହଞ୍ଚିବାକୁ ଘର ନମ୍ବର ଓ ଚିହ୍ନ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get pinnedLocation => 'ଚିହ୍ନିତ ସ୍ଥାନ';

  @override
  String get changePin => 'ବଦଳାନ୍ତୁ';

  @override
  String get saveAddressAs => 'ଏହି ଠିକଣା ଏହିପରି ସଞ୍ଚୟ କରନ୍ତୁ';

  @override
  String get labelHome => 'ଘର';

  @override
  String get labelWork => 'ଅଫିସ';

  @override
  String get labelOther => 'ଅନ୍ୟାନ୍ୟ';

  @override
  String get addressLine1Label => 'ଘର, ଫ୍ଲାଟ କିମ୍ବା ବିଲ୍ଡିଂ';

  @override
  String get addressLine1Hint => '12A, ଗ୍ରୀନ ରେସିଡେନ୍ସି';

  @override
  String get addressLine2Label => 'ରାସ୍ତା କିମ୍ବା ଅଞ୍ଚଳ';

  @override
  String get addressLine2Hint => '2ୟ ଆଭେନ୍ୟୁ, ଅନ୍ନା ନଗର';

  @override
  String get landmarkLabel => 'ଚିହ୍ନ';

  @override
  String get landmarkHint => 'ବସ ଷ୍ଟପ ସାମ୍ନାରେ';

  @override
  String get cityLabel => 'ସହର';

  @override
  String get stateLabel => 'ରାଜ୍ୟ';

  @override
  String get pincodeLabel => 'ପିନ କୋଡ';

  @override
  String get invalidPincode => 'ସଠିକ 6 ଅଙ୍କର ପିନ କୋଡ ଦିଅନ୍ତୁ';

  @override
  String get contactNameLabel => 'ଯୋଗାଯୋଗ ନାମ';

  @override
  String get contactPhoneLabel => 'ଯୋଗାଯୋଗ ନମ୍ବର';

  @override
  String get invalidMobileNumber => 'ସଠିକ 10 ଅଙ୍କର ମୋବାଇଲ ନମ୍ବର ଦିଅନ୍ତୁ';

  @override
  String get makeDefaultAddress => 'ଡିଫଲ୍ଟ ଭାବେ ଏଠାରେ ଡେଲିଭରି';

  @override
  String get saveAddress => 'ଠିକଣା ସଞ୍ଚୟ କରନ୍ତୁ';

  @override
  String get addressSaved => 'ଠିକଣା ସଞ୍ଚିତ ହେଲା';

  @override
  String get addressBookTitle => 'ଡେଲିଭରି ଠିକଣା';

  @override
  String get manageAddresses => 'ସଞ୍ଚିତ ଠିକଣା ପରିଚାଳନା କରନ୍ତୁ';

  @override
  String get noAddressesTitle => 'ଏପର୍ଯ୍ୟନ୍ତ ଠିକଣା ନାହିଁ';

  @override
  String get noAddressesSubtitle =>
      'ଆପଣଙ୍କ ପାଖକୁ ଡେଲିଭରି କରୁଥିବା ଦୋକାନ ଦେଖାଇବାକୁ ଗୋଟିଏ ଠିକଣା ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get addAddress => 'ଠିକଣା ଯୋଡ଼ନ୍ତୁ';

  @override
  String get setAsDefault => 'ଡିଫଲ୍ଟ କରନ୍ତୁ';

  @override
  String get editLabel => 'ସମ୍ପାଦନା';

  @override
  String get addressUpdated => 'ଠିକଣା ଅପଡେଟ ହେଲା';

  @override
  String get deleteLabel => 'ବିଲୋପ କରନ୍ତୁ';

  @override
  String get deleteAddressTitle => 'ଏହି ଠିକଣା ବିଲୋପ କରିବେ?';

  @override
  String get deleteAddressMessage => 'ଆପଣ ପରେ ପୁଣି ଯୋଡ଼ିପାରିବେ।';

  @override
  String get rescueDealsTitle => 'ଫୁଡ୍ ରେସ୍କ୍ୟୁ';

  @override
  String get notTakingOrders => 'ଅର୍ଡର ନେଉନାହିଁ';

  @override
  String get closedRightNow => 'ବର୍ତ୍ତମାନ ବନ୍ଦ';

  @override
  String minimumOrder(String amount) {
    return 'ସର୍ବନିମ୍ନ $amount';
  }

  @override
  String portionsLeft(int count) {
    return '$count ବାକି';
  }

  @override
  String get soldOut => 'ସରିଗଲା';

  @override
  String get menuEmptyTitle => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଖାଦ୍ୟ ନାହିଁ';

  @override
  String get menuEmptySubtitle => 'ଏହି ରେଷ୍ଟୁରାଣ୍ଟ ନିଜ ମେନୁ ଯୋଡ଼ିନାହିଁ।';

  @override
  String get moreDishesTitle => 'ଆଉ ଖାଦ୍ୟ';

  @override
  String get customisable => 'ପସନ୍ଦ ଅନୁଯାୟୀ';

  @override
  String get requiredLabel => 'ଆବଶ୍ୟକ';

  @override
  String get optionalLabel => 'ଐଚ୍ଛିକ';

  @override
  String get chooseOne => 'ଗୋଟିଏ ବାଛନ୍ତୁ';

  @override
  String chooseUpTo(int count) {
    return 'ସର୍ବାଧିକ $count ବାଛନ୍ତୁ';
  }

  @override
  String chooseAtLeast(int count) {
    return 'ସର୍ବନିମ୍ନ $count ବାଛନ୍ତୁ';
  }

  @override
  String chooseBetween(int min, int max) {
    return '$min ରୁ $max ବାଛନ୍ତୁ';
  }

  @override
  String get specialInstructions => 'ବିଶେଷ ନିର୍ଦ୍ଦେଶ';

  @override
  String get specialInstructionsHint => 'କମ୍ ଝାଲ, ପିଆଜ ନୁହେଁ…';

  @override
  String addForAmount(String amount) {
    return 'ଯୋଡ଼ନ୍ତୁ · $amount';
  }

  @override
  String get deliveryLabel => 'ଡେଲିଭରୀ';

  @override
  String get pickupLabel => 'ନିଜେ ନେବା';

  @override
  String get packagingLabel => 'ପ୍ୟାକିଂ';

  @override
  String get discountLabel => 'ରିହାତି';

  @override
  String get billDetailsTitle => 'ବିଲ୍ ବିବରଣୀ';

  @override
  String get clearCart => 'କାର୍ଟ ଖାଲି କରନ୍ତୁ';

  @override
  String get clearCartTitle => 'ଏହି କାର୍ଟ ଖାଲି କରିବେ?';

  @override
  String get clearCartMessage => 'ଏଥିରେ ଥିବା ସବୁକିଛି ହଟାଯିବ।';

  @override
  String unavailableItemsNotice(String items) {
    return 'ଆଉ ଉପଲବ୍ଧ ନାହିଁ: $items';
  }

  @override
  String get removeUnavailable => 'ସେଗୁଡ଼ିକ ହଟାନ୍ତୁ';

  @override
  String minimumNotMet(String amount) {
    return 'ସର୍ବନିମ୍ନ ଅର୍ଡର $amount';
  }

  @override
  String get checkoutTitle => 'ଚେକଆଉଟ';

  @override
  String get deliveryAddressLabel => 'ଡେଲିଭରୀ ଠିକଣା';

  @override
  String get noAddressSelected => 'କୌଣସି ଠିକଣା ବଛାଯାଇନାହିଁ';

  @override
  String get paymentMethodLabel => 'ଦେୟ';

  @override
  String get payOnDelivery => 'ଡେଲିଭରୀ ସମୟରେ ନଗଦ';

  @override
  String get noteToRestaurant => 'ରେଷ୍ଟୁରାଣ୍ଟ ପାଇଁ ଟିପ୍ପଣୀ';

  @override
  String get noteToRestaurantHint => 'ଘଣ୍ଟି ଦୁଇଥର ବଜାନ୍ତୁ…';

  @override
  String get activeOrdersTitle => 'ଚାଲୁଥିବା ଅର୍ଡର';

  @override
  String get pastOrdersTitle => 'ପୁରୁଣା ଅର୍ଡର';

  @override
  String get orderItemsTitle => 'ଖାଦ୍ୟ';

  @override
  String get orderProgressTitle => 'ପ୍ରଗତି';

  @override
  String get arrivingIn => 'ପହଞ୍ଚିବାକୁ';

  @override
  String get pickupCodeLabel => 'ପିକଅପ୍ କୋଡ୍';

  @override
  String get cancellationReasonLabel => 'ବାତିଲ ହେବାର କାରଣ';

  @override
  String get riderLabel => 'ଡେଲିଭରୀ ପାର୍ଟନର';

  @override
  String get callRider => 'କଲ୍ କରନ୍ତୁ';

  @override
  String get viewInvoice => 'ଟିକସ ଇନଭଏସ';

  @override
  String get cancelOrder => 'ଅର୍ଡର ବାତିଲ କରନ୍ତୁ';

  @override
  String get cancelOrderTitle => 'ଏହି ଅର୍ଡର ବାତିଲ କରିବେ?';

  @override
  String get cancelOrderMessage =>
      'ରେଷ୍ଟୁରାଣ୍ଟ ଗ୍ରହଣ କରିବା ପୂର୍ବରୁ ହିଁ ବାତିଲ କରାଯାଇପାରିବ।';

  @override
  String get cancelReasonLabel => 'କାରଣ';

  @override
  String get cancelReasonFallback => 'ଗ୍ରାହକ ବାତିଲ କରିଛନ୍ତି';

  @override
  String get orderCancelled => 'ଅର୍ଡର ବାତିଲ ହେଲା';

  @override
  String get currentLocationLabel => 'ବର୍ତ୍ତମାନ ଅବସ୍ଥାନ';

  @override
  String get editProfileTitle => 'ପ୍ରୋଫାଇଲ ସମ୍ପାଦନ କରନ୍ତୁ';

  @override
  String get editProfileSubtitle =>
      'ରେଷ୍ଟୁରାଣ୍ଟ ଓ ଡେଲିଭରୀ ପାର୍ଟନର ଆପଣଙ୍କ ନାମ ହିଁ ଦେଖନ୍ତି।';

  @override
  String get saveChanges => 'ପରିବର୍ତ୍ତନ ସଞ୍ଚୟ କରନ୍ତୁ';

  @override
  String get profileUpdated => 'ପ୍ରୋଫାଇଲ ଅପଡେଟ ହେଲା';

  @override
  String get deleteAccount => 'ଖାତା ବିଲୋପ କରନ୍ତୁ';

  @override
  String get deleteAccountTitle => 'ଆପଣଙ୍କ ଖାତା ବିଲୋପ କରିବେ?';

  @override
  String get deleteAccountMessage =>
      'ସବୁ ଉପକରଣରୁ ସାଇନ ଆଉଟ ହୋଇଯିବେ। ପୁରୁଣା ଅର୍ଡର ଓ ବିଲ କର ରେକର୍ଡ ପାଇଁ ରଖାଯାଏ।';

  @override
  String get accountDeleted => 'ଆପଣଙ୍କ ଖାତା ବିଲୋପ କରାଗଲା';

  @override
  String get devicesTitle => 'ସାଇନ-ଇନ ଉପକରଣ';

  @override
  String get devicesSubtitle => 'ଆପଣ କେଉଁଠି ସାଇନ ଇନ ଅଛନ୍ତି';

  @override
  String get devicesEmptyTitle => 'ଅନ୍ୟ କୌଣସି ଉପକରଣ ନାହିଁ';

  @override
  String get devicesEmptySubtitle => 'ଆପଣ କେବଳ ଏହି ଉପକରଣରେ ସାଇନ ଇନ ଅଛନ୍ତି।';

  @override
  String get signOutDevice => 'ସାଇନ ଆଉଟ';

  @override
  String get signOutDeviceTitle => 'ଏହି ଉପକରଣ ସାଇନ ଆଉଟ କରିବେ?';

  @override
  String get signOutDeviceMessage =>
      'ଆପଣ ଏହି ଉପକରଣ ବ୍ୟବହାର କରୁଥିଲେ ପୁଣି ସାଇନ ଇନ କରିବାକୁ ପଡ଼ିବ।';

  @override
  String get deviceSignedOut => 'ଉପକରଣ ସାଇନ ଆଉଟ ହେଲା';

  @override
  String get signOutEverywhere => 'ସବୁଠାରୁ ସାଇନ ଆଉଟ';

  @override
  String get signOutEverywhereTitle => 'ସବୁଠାରୁ ସାଇନ ଆଉଟ କରିବେ?';

  @override
  String get signOutEverywhereMessage =>
      'ଏହି ଉପକରଣ ସହିତ ପ୍ରତ୍ୟେକ ଉପକରଣ ସାଇନ ଆଉଟ ହୋଇଯିବ।';

  @override
  String get unknownDevice => 'ଅଜଣା ଉପକରଣ';

  @override
  String get activeNow => 'ବର୍ତ୍ତମାନ ସକ୍ରିୟ';

  @override
  String minutesAgo(int count) {
    return '$count ମିନିଟ ପୂର୍ବେ';
  }

  @override
  String hoursAgo(int count) {
    return '$count ଘଣ୍ଟା ପୂର୍ବେ';
  }

  @override
  String daysAgo(int count) {
    return '$count ଦିନ ପୂର୍ବେ';
  }

  @override
  String get filtersAndSorting => 'ଫିଲ୍ଟର ଓ କ୍ରମ';

  @override
  String get clearAll => 'ସବୁ ହଟାନ୍ତୁ';

  @override
  String get showResults => 'ଫଳାଫଳ ଦେଖନ୍ତୁ';

  @override
  String get closeLabel => 'ବନ୍ଦ କରନ୍ତୁ';

  @override
  String get sortByTitle => 'କ୍ରମ';

  @override
  String get sortRelevance => 'ପ୍ରାସଙ୍ଗିକତା';

  @override
  String get sortRating => 'ରେଟିଂ';

  @override
  String get sortDeliveryTime => 'ଡେଲିଭରୀ ସମୟ';

  @override
  String get sortCostLowHigh => 'ଦାମ: କମରୁ ଅଧିକ';

  @override
  String get sortCostHighLow => 'ଦାମ: ଅଧିକରୁ କମ';

  @override
  String get timeSection => 'ସମୟ';

  @override
  String get nearAndFast => 'ପାଖ ଓ ଶୀଘ୍ର';

  @override
  String get openNow => 'ବର୍ତ୍ତମାନ ଖୋଲା';

  @override
  String get ratingSection => 'ରେଷ୍ଟୁରାଣ୍ଟ ରେଟିଂ';

  @override
  String ratedAbove(String rating) {
    return '$rating+ ରେଟିଂ';
  }

  @override
  String get offersSection => 'ଅଫର';

  @override
  String get hasOffersLabel => 'ଅଫର ଥିବା';

  @override
  String get dishPriceSection => 'ଖାଦ୍ୟ ଦାମ';

  @override
  String costUnder(String amount) {
    return '$amount ରୁ କମ';
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
  String get moreSection => 'ଅଧିକ';

  @override
  String get noPackagingCharges => 'ପ୍ୟାକିଂ ଶୁଳ୍କ ନାହିଁ';

  @override
  String get allRestaurantsTitle => 'ସମସ୍ତ ରେଷ୍ଟୁରାଣ୍ଟ';

  @override
  String get whatsOnYourMind => 'କଣ ଖାଇବାକୁ ମନ ହେଉଛି?';

  @override
  String get listeningNow => 'ଶୁଣୁଛୁ…';

  @override
  String get speakNowHint => 'ଏକ ଖାଦ୍ୟ କିମ୍ବା ରେଷ୍ଟୁରାଣ୍ଟ କୁହନ୍ତୁ';

  @override
  String get voiceUnavailable => 'ଭଏସ ସର୍ଚ ଉପଲବ୍ଧ ନାହିଁ';

  @override
  String get voiceUnavailableBody => 'ଆପଣ ଟାଇପ କରି ମଧ୍ୟ ଖୋଜିପାରିବେ।';

  @override
  String get microphoneDenied => 'ମାଇକ୍ରୋଫୋନ ଅନୁମତି ନାହିଁ';

  @override
  String get voiceSearchLabel => 'ସ୍ୱରରେ ଖୋଜନ୍ତୁ';

  @override
  String get ratingsAndReviews => 'ରେଟିଂ ଓ ସମୀକ୍ଷା';

  @override
  String get reviewsWithTextOnly => 'ସମୀକ୍ଷା ଥିବା';

  @override
  String get noReviewsTitle => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ରେଟିଂ ନାହିଁ';

  @override
  String get noReviewsSubtitle => 'ଅର୍ଡର ପରେ ପ୍ରଥମ ରେଟିଂ ଆପଣ ଦିଅନ୍ତୁ।';

  @override
  String get rateOrderTitle => 'ଆପଣଙ୍କ ଅର୍ଡରକୁ ରେଟ କରନ୍ତୁ';

  @override
  String get rateDishesTitle => 'ଖାଦ୍ୟଗୁଡ଼ିକୁ ରେଟ କରନ୍ତୁ';

  @override
  String get reviewHint => 'ଆଉ କିଛି କହିବେ କି? (ଐଚ୍ଛିକ)';

  @override
  String get submitRating => 'ରେଟିଂ ପଠାନ୍ତୁ';

  @override
  String get reviewThanks => 'ଧନ୍ୟବାଦ — ଆପଣଙ୍କ ରେଟିଂ ମିଳିଲା।';

  @override
  String get rateThisOrder => 'ଏହି ଅର୍ଡରକୁ ରେଟ କରନ୍ତୁ';
}
