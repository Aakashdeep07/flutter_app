import 'package:bpibs_project/utils/authservice.dart';
import 'package:bpibs_project/utils/homescreen.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to BPIBS Admin', home: HomePage());
    // title: 'Welcome to BPIBS Admin', home: AuthService().handleAuth());
  }
}
