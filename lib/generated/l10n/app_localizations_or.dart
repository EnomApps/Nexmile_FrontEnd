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
  String get tagline => 'ଦ୍ରୁତ ଡେଲିଭରି। ସତେଜ ହସ।';

  @override
  String get chooseLanguageTitle => 'ଆପଣଙ୍କ ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get chooseLanguageSubtitle => 'ଆପଣ ସହଜ ଅନୁଭବ କରୁଥିବା ଭାଷା ବାଛନ୍ତୁ। ଆପଣ ଏହାକୁ ଯେକୌଣସି ସମୟରେ ସେଟିଂସରେ ବଦଳାଇ ପାରିବେ।';

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
  String get homeSubtitle => 'ସତେଜ ମୁଦି ସାମଗ୍ରୀ, ଗରମ ଖାଦ୍ୟ ଏବଂ ଦୈନନ୍ଦିନ ଆବଶ୍ୟକତା ଆପଣଙ୍କ ନିକଟସ୍ଥ ଦୋକାନରୁ।';

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
  String get loginSubtitle => 'ଆପଣଙ୍କ ଇମେଲ କିମ୍ବା ମୋବାଇଲ ନମ୍ବର ଦିଅନ୍ତୁ, ଆମେ ଯାଞ୍ଚ କୋଡ ପଠାଇବୁ।';

  @override
  String get emailOrPhoneLabel => 'ଇମେଲ କିମ୍ବା ମୋବାଇଲ ନମ୍ବର';

  @override
  String get emailOrPhoneHint => 'name@example.com କିମ୍ବା 9876543210';

  @override
  String get invalidEmailOrPhone => 'ସଠିକ ଇମେଲ ଠିକଣା କିମ୍ବା 10 ଅଙ୍କର ମୋବାଇଲ ନମ୍ବର ଦିଅନ୍ତୁ';

  @override
  String get sendCode => 'କୋଡ ପଠାନ୍ତୁ';

  @override
  String get agreeToTermsOnContinue => 'ଆଗକୁ ବଢ଼ିବା ଦ୍ୱାରା ଆପଣ ଆମର ସେବା ସର୍ତ୍ତାବଳୀ ଓ ଗୋପନୀୟତା ନୀତିରେ ସହମତ ହେଉଛନ୍ତି।';

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
  String get incorrectCode => 'ଏହି କୋଡ ଭୁଲ କିମ୍ବା ମିଆଦ ସରିଯାଇଛି। ନୂଆ କୋଡ ମାଗନ୍ତୁ।';

  @override
  String get enterFullCode => 'ପୂରା 6 ଅଙ୍କ ଦିଅନ୍ତୁ';

  @override
  String get accountSuspended => 'ଏହି ଖାତା ନିଲମ୍ବିତ କରାଯାଇଛି। ଦୟାକରି ସହାୟତା ସହ ଯୋଗାଯୋଗ କରନ୍ତୁ।';

  @override
  String get tooManyAttempts => 'ବହୁତ ଅଧିକ ଚେଷ୍ଟା ହୋଇଗଲା। ଦୟାକରି କିଛି ସମୟ ପରେ ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get sessionExpired => 'ଆପଣଙ୍କ ସେସନର ମିଆଦ ସରିଯାଇଛି। ଦୟାକରି ପୁଣି ସାଇନ ଇନ କରନ୍ତୁ।';

  @override
  String get networkError => 'ଇଣ୍ଟରନେଟ ସଂଯୋଗ ନାହିଁ। ସଂଯୋଗ ଯାଞ୍ଚ କରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

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
  String get searchNoResultsSubtitle => 'ଅନ୍ୟ ଖାଦ୍ୟ, ରନ୍ଧନ ଶୈଳୀ କିମ୍ବା ରେଷ୍ଟୁରାଣ୍ଟ ନାମ ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get cravingTitle => 'ଆଜି କଣ ଖାଇବାକୁ ଇଚ୍ଛା?';

  @override
  String get offersTitle => 'ଆପଣଙ୍କ ପାଇଁ ଅଫର';

  @override
  String get restaurantsNearby => 'ଆପଣଙ୍କ ନିକଟସ୍ଥ ରେଷ୍ଟୁରାଣ୍ଟ';

  @override
  String restaurantsCount(int count) {
    return '$countଟି ରେଷ୍ଟୁରାଣ୍ଟ';
  }

  @override
  String get noRestaurantsTitle => 'ଏଠାରେ ଏପର୍ଯ୍ୟନ୍ତ କିଛି ନାହିଁ';

  @override
  String get noRestaurantsSubtitle => 'ଅନ୍ୟ ବର୍ଗ ଦେଖନ୍ତୁ କିମ୍ବା ଫିଲ୍ଟର ହଟାନ୍ତୁ।';

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
    return '$count+ ରେଟିଂ';
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
  String get noVegDishesSubtitle => 'ପୂର୍ଣ୍ଣ ମେନୁ ଦେଖିବାକୁ ନିରାମିଷ ଫିଲ୍ଟର ବନ୍ଦ କରନ୍ତୁ।';

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
  String get cartEmptySubtitle => 'ଆରମ୍ଭ କରିବାକୁ କୌଣସି ରେଷ୍ଟୁରାଣ୍ଟରୁ ଖାଦ୍ୟ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get browseRestaurants => 'ରେଷ୍ଟୁରାଣ୍ଟ ଦେଖନ୍ତୁ';

  @override
  String itemsInCart(int count) {
    return '$countଟି ଜିନିଷ';
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
  String placeOrderFor(int amount) {
    return 'ଅର୍ଡର କରନ୍ତୁ · ₹$amount';
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
  String get prototypeNotice => 'ନମୁନା ଷ୍ଟୋରଫ୍ରଣ୍ଟ — ପ୍ରକୃତ ଦୋକାନ କାଟାଲଗ APIସହ ଆସିବ।';

  @override
  String get prototypeCheckoutNotice => 'ଏହା ଏକ ପ୍ରୋଟୋଟାଇପ। କୌଣସି ଦେୟ ନିଆଯାଏ ନାହିଁ ଏବଂ ପ୍ରକୃତ ଅର୍ଡର ମଧ୍ୟ ହୁଏ ନାହିଁ।';

  @override
  String get prototypeTrackingNotice => 'ପ୍ରୋଟୋଟାଇପ ପାଇଁ ଟ୍ରାକିଂ କୃତ୍ରିମ।';
}
