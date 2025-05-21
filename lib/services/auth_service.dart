import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signup here
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      dev.log('Signup error: $e', name: 'auth_service');
      rethrow;
    }
  }

  // Login below
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      dev.log('Login error: $e', name: 'auth_service');
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Auth stream
  Stream<User?> get userChanges => _auth.authStateChanges();
}
