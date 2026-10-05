import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository/auth_repository.dart';
import '../data/services/auth_services.dart';

/// Provides an instance of [AuthRepository] to the application.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthService();
});

/// Streams the authentication state (logged in vs logged out) from Firebase.
final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

/// ViewModel responsible for managing authentication operations and loading/error states.
class AuthViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Initial state is idle.
  }

  /// Attempts to sign in an existing user.
  /// Returns `true` on success, or `false` if an error occurred.
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signIn(
            email: email,
            password: password,
          );
    });
    return !state.hasError;
  }

  /// Registers a new user and creates their Firestore record.
  /// Returns `true` on success, or `false` if an error occurred.
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signUp(
            name: name,
            email: email,
            password: password,
          );
    });
    return !state.hasError;
  }

  /// Signs out the currently authenticated user.
  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signOut();
    });
  }
}

/// Provider for accessing the [AuthViewModel] state and actions.
final authViewModelProvider =
    AsyncNotifierProvider<AuthViewModel, void>(AuthViewModel.new);
