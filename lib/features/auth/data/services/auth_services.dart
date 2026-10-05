import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../repository/auth_repository.dart';

class AuthService implements AuthRepository {
  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// Stream of user authentication state changes.
  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Gets the currently authenticated Firebase user, if any.
  @override
  User? get currentUser => _auth.currentUser;

  /// Registers a new user with email, password, and name,
  /// updates their display name, and creates a document in Firestore.
  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'USER_NULL',
        message: 'User creation failed: null user returned.',
      );
    }

    await user.updateDisplayName(name);

    final userModel = UserModel(
      uid: user.uid,
      name: name,
      email: email,
      status: 'Unavailable',
    );

    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());

    return userModel;
  }

  /// Signs in an existing user with email and password.
  @override
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  /// Fetches a user's profile document from Firestore.
  @override
  Future<UserModel?> getUserData(String uid) async {
    final docSnapshot = await _firestore.collection('users').doc(uid).get();
    final data = docSnapshot.data();
    if (docSnapshot.exists && data != null) {
      return UserModel.fromMap(data);
    }
    return null;
  }

  /// Signs out the currently authenticated user.
  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
