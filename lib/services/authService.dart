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

  //make function to sign in with email and password
  void signInWithEmailAndPassword(String email, String password) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {user = email});
  }

  //make function to register with email and password
  void registerWithEmailAndPassword(String email, String password) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {user = email});
  }

  //make function to sign out
  void signOut() {
    _firebaseAuth.signOut();
    user = null;
  }
}
