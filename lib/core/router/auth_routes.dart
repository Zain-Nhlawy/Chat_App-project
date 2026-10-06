import 'package:go_router/go_router.dart';

import '../../features/auth/view/pages/login_page.dart';
import '../../features/auth/view/pages/signup_page.dart';

/// Class containing route path constants and route definitions for authentication.
abstract final class AuthRoutes {
  static const String login = '/login';
  static const String signup = '/signup';

  /// List of routes belonging to the authentication feature.
  static final List<RouteBase> routes = [
    GoRoute(
      path: login,
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: signup,
      name: 'signup',
      builder: (context, state) => const SignUpPage(),
    ),
  ];
}
