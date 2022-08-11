// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:achat/componets/rondedbutton.dart';
import 'package:achat/constants.dart';
import 'package:achat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

var id = 'logins_screen';

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('lib/images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: KTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: "Ligin",
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
