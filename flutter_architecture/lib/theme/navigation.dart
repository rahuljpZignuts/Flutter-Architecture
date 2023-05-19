import 'package:flutter/cupertino.dart';

import '../screens/forgot_password.dart';
import '../screens/forgot_password_success.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/user_dashboard_screen.dart';

class Navigation {
  static const String login = "/login";
  static const String splash = "/";
  static const String forgot_password = "/forgot_password";
  static const String forgot_password_success = "/forgot_password_success";
  static const String user_dashboard = "/user_dashboard";

  static Map<String, WidgetBuilder> routes = {
    Navigation.splash: (context) => const SplashScreen(),
    Navigation.login: (context) => const LoginScreen(),
    Navigation.forgot_password: (context) => const ForgotPasswordScreen(),
    Navigation.forgot_password_success: (context) =>
        const ForgotPasswordSuccess(),
    Navigation.user_dashboard: (context) => const UserDashboardScreen(),
  };
}
