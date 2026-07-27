import 'package:flutter/material.dart';

import '../../features/home/home_screen.dart';
import '../../features/language/language_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static const String splash = '/';
  static const String language = '/language';
  static const String home = '/home';
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

      case AppRoutes.home:
        return _fadeRoute(const HomeScreen(), settings);

      default:
        return _fadeRoute(const SplashScreen(), settings);
    }
  }

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
}
