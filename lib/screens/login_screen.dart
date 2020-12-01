import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button_component.dart';
import 'package:flash_chat/components/wave_component.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String password;
  String email;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Container(
          height: size.height - 200,
          color: Colors.blueAccent,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutQuad,
          top: keyboardOpen ? -size.height / 3.7 : 0.0,
          child: WaveWidget(
            size: size,
            yOffset: size.height / 3.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: keyboardOpen ? 0.0 : 100.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: keyboardOpen ? 0.0 : 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ]),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kInputDecoration.copyWith(hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Login',
                color: Colors.blueAccent,
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
