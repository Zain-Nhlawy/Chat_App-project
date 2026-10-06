import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view_model/auth_provider.dart';
import '../../features/home/view/pages/home_page.dart';
import 'auth_routes.dart';

/// Listenable that notifies [GoRouter] when Firebase auth state changes.
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(authStateChangesProvider, (previous, next) {
      notifyListeners();
    });
  }

  final Ref _ref;
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

/// Root GoRouter provider configured with route guards for authentication.
final appRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);
  final authState = ref.read(authStateChangesProvider);

  return GoRouter(
    initialLocation: AuthRoutes.signup,
    refreshListenable: notifier,
    redirect: (context, state) {
      // While initial auth state is still resolving, don't redirect yet
      if (authState.isLoading) return null;

      final isLoggedIn = authState.value != null;
      final isAuthRoute =
          state.matchedLocation == AuthRoutes.login ||
          state.matchedLocation == AuthRoutes.signup;

      // If user is not logged in and trying to access a protected screen
      if (!isLoggedIn && !isAuthRoute) {
        return AuthRoutes.login;
      }

      // If user is logged in and on an auth screen (login/signup), redirect to home
      if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      ...AuthRoutes.routes,
    ],
  );
});
