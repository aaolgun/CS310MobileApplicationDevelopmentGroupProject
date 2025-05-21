import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  AuthProvider() {
    _authService.userChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
  }

  Future<void> login(String email, String password) async {
    await _authService.login(email, password);
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
