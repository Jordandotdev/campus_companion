import 'package:campus_companion/components/loginbtn.dart';
import 'package:campus_companion/components/textfield.dart';
import 'package:campus_companion/data/auth_data.dart';
import 'package:campus_companion/pages/interPage.dart';
import 'package:campus_companion/pages/registerPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationRemote _authRemote = AuthenticationRemote();

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in function
  void signIn(BuildContext context) async {
    try {
      await _authRemote.login(emailController.text, passwordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const interPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }

  void signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Campus Companion',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 90, 138),
      ),
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
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),

                //Username TextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),
                const SizedBox(height: 10),

                //password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: true,
                ),

                const SizedBox(height: 20),

                //login button
                MyLoginBtn(
                  onTap: () => signIn(context),
                  buttonText: 'Login',
                ),

                const SizedBox(height: 30),

                //register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () => signUp(context),
                      child: const Text(
                        'Register Here',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
