import 'package:shared_preferences/shared_preferences.dart';

/// Thin typed wrapper over [SharedPreferences].
class PreferencesService {
  PreferencesService(this._prefs);

  static const String _languageCodeKey = 'nexmile.language_code';
  static const String _languageChosenKey = 'nexmile.language_chosen';

  final SharedPreferences _prefs;

  static Future<PreferencesService> create() async =>
      PreferencesService(await SharedPreferences.getInstance());

  /// The stored language code, or `null` on a fresh install.
  String? get languageCode => _prefs.getString(_languageCodeKey);

  /// Whether the user has been through the language screen at least once.
  /// Drives whether the splash lands on the language screen or straight home.
  bool get hasChosenLanguage => _prefs.getBool(_languageChosenKey) ?? false;

  Future<void> saveLanguage(String code) async {
    await _prefs.setString(_languageCodeKey, code);
    await _prefs.setBool(_languageChosenKey, true);
  }

  /// Test / "reset onboarding" helper.
  Future<void> clearLanguage() async {
    await _prefs.remove(_languageCodeKey);
    await _prefs.remove(_languageChosenKey);
  }
}
