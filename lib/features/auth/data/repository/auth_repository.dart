import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

/// Contract defining all authentication operations in the app.
abstract interface class AuthRepository {
  /// Stream of user authentication state changes.
  Stream<User?> get authStateChanges;

  /// Gets the currently authenticated Firebase user, if any.
  User? get currentUser;

  /// Registers a new user with email, password, and name.
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  /// Authenticates an existing user using their email and password.
  Future<User?> signIn({
    required String email,
    required String password,
  });

  /// Fetches a user's data from Firestore.
  Future<UserModel?> getUserData(String uid);

  /// Signs out the currently authenticated user.
  Future<void> signOut();
}
