import 'package:flutter/material.dart';

import '../../features/address/data/address.dart';
import '../../features/address/data/location_service.dart';
import '../../features/address/presentation/address_book_screen.dart';
import '../../features/address/presentation/address_form_screen.dart';
import '../../features/address/presentation/address_map_screen.dart';
import '../../features/address/presentation/location_permission_screen.dart';
import '../../features/auth/data/login_identifier.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/otp_verification_screen.dart';
import '../../features/catalogue/presentation/cart_screen.dart';
import '../../features/catalogue/presentation/order_status_screen.dart';
import '../../features/catalogue/presentation/restaurant_screen.dart';
import '../../features/language/language_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const String splash = '/';
  static const String language = '/language';

  // Customer auth is two screens. The API offers no registration, password
  // recovery or password reset for customers — an account is created on the
  // first successful code verification.
  static const String login = '/login';
  static const String otpVerification = '/otp';

  /// Signed-in home. Hosts the storefront tabs.
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';

  // Storefront: nearby restaurants, the per-restaurant cart, and orders.
  static const String restaurant = '/restaurant';
  static const String cart = '/cart';
  static const String orderStatus = '/order';

  // Address book. Delivery is limited to 1 km and the API makes coordinates
  // mandatory, so the pin step is not skippable — only the GPS part is.
  static const String locationPermission = '/location';
  static const String addressMap = '/address/map';
  static const String addressForm = '/address/form';
  static const String addressBook = '/addresses';
}

/// Argument bundle for [AppRoutes.locationPermission].
@immutable
class LocationPermissionArgs {
  const LocationPermissionArgs({this.isFirstAddress = true});

  /// True during onboarding, when saving lands on the storefront instead of
  /// returning to the address book.
  final bool isFirstAddress;
}

/// Argument bundle for [AppRoutes.addressMap].
@immutable
class AddressMapArgs {
  const AddressMapArgs({
    this.latitude,
    this.longitude,
    this.isFirstAddress = true,
    this.editing,
  });

  /// A GPS fix to open on. Null when the customer declined location — the map
  /// falls back to a city-level centre and they drag from there.
  final double? latitude;
  final double? longitude;
  final bool isFirstAddress;

  /// Set when correcting a saved address, so the pin opens where it already is
  /// and saving issues a PATCH rather than a POST.
  final Address? editing;
}

/// Argument bundle for [AppRoutes.addressForm].
@immutable
class AddressFormArgs {
  const AddressFormArgs({
    required this.latitude,
    required this.longitude,
    this.prefill,
    this.isFirstAddress = true,
    this.editing,
  });

  /// The address being corrected, or null when adding a new one.
  final Address? editing;

  /// Set on the map and not editable in the form — the API computes the 1 km
  /// radius from these.
  final double latitude;
  final double longitude;

  /// Reverse-geocoded starting point for the text fields.
  final ResolvedPlace? prefill;

  final bool isFirstAddress;
}

/// Argument bundle for [AppRoutes.restaurant].
@immutable
class RestaurantArgs {
  const RestaurantArgs({required this.restaurantId});

  final String restaurantId;
}

/// Argument bundle for [AppRoutes.cart].
@immutable
class CartArgs {
  const CartArgs({required this.restaurantId});

  /// Carts are per-restaurant server-side, so the screen is always opened
  /// against one shop rather than a global basket.
  final String restaurantId;
}

/// Argument bundle for [AppRoutes.orderStatus].
@immutable
class OrderArgs {
  const OrderArgs({required this.orderId});

  final int orderId;
}

/// Argument bundle for [AppRoutes.otpVerification].
@immutable
class OtpArgs {
  const OtpArgs({required this.identifier});

  /// The email or mobile number the code was sent to. The same value has to be
  /// sent back on verify, so it is carried rather than re-parsed.
  final LoginIdentifier identifier;
}

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        // Fade out of the black splash rather than sliding — a horizontal
        // push from a full-bleed black screen reads as a glitch.
        return _fadeRoute(const SplashScreen(), settings);

      case AppRoutes.language:
        final Object? args = settings.arguments;
        final bool isInitialSetup = args is bool ? args : true;
        return _fadeRoute(
          LanguageScreen(isInitialSetup: isInitialSetup),
          settings,
        );

      case AppRoutes.login:
        return _fadeRoute(const LoginScreen(), settings);

      case AppRoutes.otpVerification:
        final Object? args = settings.arguments;
        if (args is! OtpArgs) return _misroute(settings);
        return _slideRoute(OtpVerificationScreen(args: args), settings);

      case AppRoutes.dashboard:
        return _fadeRoute(const AppShell(), settings);

      case AppRoutes.profile:
        return _slideRoute(const ProfileScreen(), settings);

      case AppRoutes.locationPermission:
        return _slideRoute(const LocationPermissionScreen(), settings);

      case AppRoutes.addressMap:
        final Object? args = settings.arguments;
        return _slideRoute(
          AddressMapScreen(
            args: args is AddressMapArgs ? args : const AddressMapArgs(),
          ),
          settings,
        );

      case AppRoutes.addressForm:
        final Object? args = settings.arguments;
        if (args is! AddressFormArgs) return _misroute(settings);
        return _slideRoute(AddressFormScreen(args: args), settings);

      case AppRoutes.addressBook:
        return _slideRoute(const AddressBookScreen(), settings);

      case AppRoutes.restaurant:
        final Object? args = settings.arguments;
        if (args is! RestaurantArgs) return _misroute(settings);
        return _slideRoute(RestaurantScreen(args: args), settings);

      case AppRoutes.cart:
        final Object? args = settings.arguments;
        if (args is! CartArgs) return _misroute(settings);
        return _slideRoute(CartScreen(args: args), settings);

      case AppRoutes.orderStatus:
        final Object? args = settings.arguments;
        if (args is! OrderArgs) return _misroute(settings);
        return _slideRoute(OrderStatusScreen(args: args), settings);

      default:
        return _fadeRoute(const SplashScreen(), settings);
    }
  }

  /// A route that needs typed arguments was pushed without them. Rather than
  /// crashing on a bad cast, fall back to the start of the auth flow.
  static Route<dynamic> _misroute(RouteSettings settings) =>
      _fadeRoute(const LoginScreen(), settings);

  static PageRoute<T> _fadeRoute<T>(Widget page, RouteSettings settings) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 420),
      reverseTransitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        );
      },
    );
  }

  /// Standard forward navigation inside a flow. Uses the platform's own
  /// transition, so it slides on Android and swipes back on iOS, and it
  /// mirrors automatically in the right-to-left languages.
  static PageRoute<T> _slideRoute<T>(Widget page, RouteSettings settings) =>
      MaterialPageRoute<T>(settings: settings, builder: (_) => page);
}
