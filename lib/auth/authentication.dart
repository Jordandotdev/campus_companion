import 'package:flutter/material.dart';
import 'package:campus_companion/pages/loginPage.dart';
import 'package:campus_companion/pages/registerPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginPage();
    } else {
      return RegisterPage();
    }
  }
}
