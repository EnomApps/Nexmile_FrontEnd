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
}
