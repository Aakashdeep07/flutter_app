import 'dart:js';

import 'package:bpibs_project/utils/homescreen.dart';
import 'package:bpibs_project/utils/loginscreen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  var cont;
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        cont = context;
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signout() {
    FirebaseAuth.instance.signOut();
  }

  String signIn(email, password) {
    var response;
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) => print('Signed In'))
        .catchError((e) {
      if (e.toString().contains('user-not-found')) {
        print('Invalid Credentials');
        response = 'Invalid Credentials';
      }
    });
    return response;
  }
}
