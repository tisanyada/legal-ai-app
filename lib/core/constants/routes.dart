import 'package:get/get.dart';
import 'package:legalai/presentation/dashboard/dashboard.dart';
import 'package:legalai/presentation/public/splash_screen.dart';
import 'package:legalai/presentation/public/onboarding_screen.dart';
import 'package:legalai/presentation/authentication/login/login_screen.dart';

class AppRoutes {
  /// ROOT_SCREEN_ROUTE
  ///
  /// Navigates to splash screen
  static const String rootRoute = '/';

  /// APP_UPDATE_SCREEN_ROUTE
  ///
  /// Navigates to app update screen
  static const String appUpdateRoute = '/APP_UPDATE_SCREEN_ROUTE';

  /// ONBOARDING_SCREEN_ROUTE
  ///
  /// Navigates to onboarding screen
  static const String onboardingRoute = '/ONBOARDING_ROUTE';

  /// DASHBOARD_SCREEN_ROUTE
  ///
  /// Navigates to dashboard screen
  static const String dashboardRoute = '/DASHBOARD_ROUTE';

  /// NOTIFICATIONS_SCREEN_ROUTE
  ///
  /// Navigates to dashboard screen
  static const String notificationsRoute = '/NOTIFICATIONS_ROUTE';

  /// LOGIN_SCREEN_ROUTE
  ///
  /// Navigates to login screen
  static const String loginRoute = '/LOGIN_ROUTE';

  /// FORGOT_PASSWORD_SCREEN_ROUTE
  ///
  /// Navigates to forgot password screen
  static const String forgotPasswordRoute = '/FORGOT_PASSWORD_ROUTE';

  /// FORGOT_PASSWORD_OTP_VERIFICATION_SCREEN_ROUTE
  ///
  /// Navigates to forgot password otp verification screen
  static const String forgotPasswordOtpVerificationRoute =
      '/FORGOT_PASSWORD_OTP_VERIFICATION_ROUTE';

  /// RESET_PASSWORD_SCREEN_ROUTE
  ///
  /// Navigates to reset password screen
  static const String resetPasswordRoute = '/RESET_PASSWORD_ROUTE';

  static List<GetPage> routes = [
    // PUBLIC
    GetPage(
      name: rootRoute,
      page: () => const SplashScreen(),
    ),

    // ONBOARDING
    GetPage(
      name: onboardingRoute,
      page: () => const OnboardingScreen(),
    ),

    // AUTHENTICATION
    GetPage(
      name: loginRoute,
      page: () => const LoginScreen(),
    ),

    // DASHBOARD
    GetPage(
      name: dashboardRoute,
      page: () => const Dashboard(),
    ),
  ];
}
