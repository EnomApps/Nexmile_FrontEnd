/// Build-time configuration.
///
/// Override the base URL without touching source:
///
/// ```bash
/// flutter run --dart-define=NEXMILE_API_BASE_URL=http://10.0.2.2:8000/api
/// ```
///
/// `10.0.2.2` is how the Android emulator reaches the host machine's
/// `localhost`; on a physical device use the machine's LAN address.
class AppConfig {
  const AppConfig._();

  static const String apiBaseUrl = String.fromEnvironment(
    'NEXMILE_API_BASE_URL',
    defaultValue: 'https://api.nexmile.in/api',
  );

  /// The app talks to the customer surface of the API only.
  static const String intendedRole = 'customer';

  /// Sent as `device_name` on OTP verification so the customer can recognise
  /// the session in the sessions list.
  static const String deviceNameFallback = 'Nexmile app';

  static const Duration requestTimeout = Duration(seconds: 30);
}
