import 'dart:js';

import 'package:bpibs_project/utils/homescreen.dart';
import 'package:bpibs_project/utils/loginscreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      // stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signout() {
    // FirebaseAuth.instance.signOut();
  }

  // signIn(email, password) {
  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((user) => print('Signed In'))
  //       .catchError((e) {
  //     print(e);
  //   });
  // }
}
