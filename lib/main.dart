// ignore_for_file: prefer_const_constructors, duplicate_import

import 'package:achat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:achat/screens/welcome_screen.dart';
import 'package:achat/screens/login_screen.dart';
import 'package:achat/screens/registration_screen.dart';
import 'package:achat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
