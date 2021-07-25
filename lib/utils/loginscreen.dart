import 'package:bpibs_project/utils/authservice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '', password = '';

  checkFields() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        onChanged: (value) {
                          this.email = value;
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'Email cannot be blank' : null,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          this.password = value;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        validator: (value) =>
                            value!.isEmpty ? 'Password cannot be blank' : null,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            // AuthService().signIn(email, password);
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
