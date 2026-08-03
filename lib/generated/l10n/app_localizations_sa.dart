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
}
