
// ignore_for_file: empty_catches

import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(
            message: 'The email address is already in use.',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      } else {
        showToast(
            message: 'An error occurred: ${e.code}',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException {}
    return null;
  }

  Future<User?> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return null;
  }
}

void showToast({required String message, required MaterialColor backgroundColor, required List<MaterialAccentColor> textColor}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}