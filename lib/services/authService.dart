import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? user;
  void signInAnonymously() {
    _firebaseAuth.signInAnonymously().then((value) {
      print('user logged in.');
      user = "anonymous";
    });
  }
}
