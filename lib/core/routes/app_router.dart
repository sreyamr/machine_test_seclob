import 'package:flutter/material.dart';
import 'package:machine_test/features/auth/presentation/pages/welcome_screen.dart';

import '../../features/auth/presentation/pages/otp_screen.dart';
import '../../features/auth/presentation/pages/phone_number_screen.dart';
import '../../features/home/presentation/pages/main_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/onboarding/presentation/pages/splash_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const LogoScreen(),
        );

      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case AppRoutes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );

      case AppRoutes.phoneNumber:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case AppRoutes.otp:
        final phone = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => OtpScreen(phone: phone),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}
