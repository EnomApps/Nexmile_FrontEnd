import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/network/api_client.dart';
import 'core/services/preferences_service.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/data/auth_session.dart';
import 'features/auth/data/token_store.dart';
import 'features/auth/state/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait only: the splash lockup and the language grid are both designed
  // for a tall viewport.
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  // Read the stored language before the first frame so the app never flashes
  // English at a customer who has already picked something else.
  final PreferencesService preferences = await PreferencesService.create();

  // Restore the session from the platform keystore, so a returning customer
  // goes straight from the splash to the dashboard.
  final TokenStore tokenStore = SecureTokenStore();
  final AuthSession? session = await tokenStore.read();

  // The client and the controller reference each other: the client needs a
  // bearer token and a way to refresh it, the controller needs the client to
  // make calls. Build the client first, then attach the controller as its
  // token provider.
  final ApiClient apiClient = ApiClient();
  final AuthController authController = AuthController(
    repository: ApiAuthRepository(apiClient),
    tokenStore: tokenStore,
    initialSession: session,
  );
  apiClient.tokenProvider = authController;

  runApp(
    NexmileApp(
      preferences: preferences,
      authController: authController,
    ),
  );
}
