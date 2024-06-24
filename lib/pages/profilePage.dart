import 'package:campus_companion/components/loginbtn.dart';
import 'package:campus_companion/components/textfield.dart';
import 'package:campus_companion/data/auth_data.dart';
import 'package:campus_companion/pages/interPage.dart';
import 'package:campus_companion/pages/loginPage.dart';
import 'package:campus_companion/pages/registerPage.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<profilePage> {
  final AuthenticationRemote _authRemote = AuthenticationRemote();

  void signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 49, 80),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                //login
                const SizedBox(height: 50),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //profile icon
                const Icon(Icons.person, size: 100, color: Colors.white),

                const SizedBox(height: 20),

                //proflie picture
                MyLoginBtn(
                  onTap: () => null,
                  buttonText: 'change profle picture',
                ),

                const SizedBox(height: 10),
                //t&c
                MyLoginBtn(
                  onTap: () => null,
                  buttonText: 'Terms and Conditions',
                ),

                const SizedBox(height: 10),
                //login button
                MyLoginBtn(
                  onTap: () => LoginPage(),
                  buttonText: 'Logout',
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
