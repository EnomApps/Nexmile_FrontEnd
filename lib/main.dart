import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/network/api_client.dart';
import 'core/push/device_registrar.dart';
import 'core/push/push_service.dart';
import 'core/services/preferences_service.dart';
import 'features/address/data/address_repository.dart';
import 'features/address/data/location_service.dart';
import 'features/address/state/address_controller.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/data/auth_session.dart';
import 'features/auth/data/device_repository.dart';
import 'features/auth/data/token_store.dart';
import 'features/auth/state/auth_controller.dart';
import 'features/catalogue/data/storefront_repository.dart';

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

  // The no-op transport until Firebase is wired in: the app builds, signs in
  // and takes orders exactly as it does now, with nothing to register and no
  // tap to route. See docs/PUSH-SETUP.md for the one-file swap.
  const PushService pushService = NoopPushService();
  final DeviceRegistrar deviceRegistrar = DeviceRegistrar(
    push: pushService,
    repository: ApiDeviceRepository(apiClient),
  );

  final AuthController authController = AuthController(
    repository: ApiAuthRepository(apiClient),
    tokenStore: tokenStore,
    initialSession: session,
    deviceRegistrar: deviceRegistrar,
  );
  apiClient.tokenProvider = authController;

  // The channel has to exist before the first notification lands, and a
  // mismatched id fails silently, so it is created at launch rather than at
  // sign-in.
  unawaited(pushService.ensureChannel());

  // A token can rotate while the app is closed, and a rotated token that was
  // never re-registered means notifications stop arriving with nothing to see.
  if (authController.isSignedIn) unawaited(deviceRegistrar.register());

  runApp(
    NexmileApp(
      preferences: preferences,
      authController: authController,
      addressController: AddressController(
        repository: ApiAddressRepository(apiClient),
      ),
      locationService: const GeolocatorLocationService(),
      storefrontRepository: ApiStorefrontRepository(apiClient),
      pushService: pushService,
    ),
  );
}
