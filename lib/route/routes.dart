// lib/commons/routes.dart
import 'package:flutter/material.dart';
import 'package:imagetextrecognition/dashboard/dashboard_screen.dart';
import 'package:imagetextrecognition/onboarding/onboarding_screen.dart';
import 'package:imagetextrecognition/splash_screen.dart';
import 'route_constants.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteConstants.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RouteConstants.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
