import 'package:campus_companion/components/loginbtn.dart';
import 'package:campus_companion/components/textfield.dart';
import 'package:campus_companion/data/auth_data.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final newusernameController = TextEditingController();
  final newpasswordController = TextEditingController();
  final newpasswordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Register',
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
                const SizedBox(height: 100),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: newusernameController,
                  hintText: 'Enter your new username',
                  obsecureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: newpasswordController,
                  hintText: 'Enter your new password',
                  obsecureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: newpasswordConfirmController,
                  hintText: 'Confirm your new password',
                  obsecureText: true,
                ),
                const SizedBox(height: 25),
                MyLoginBtn(
                  onTap: () async {
                    try {
                      await AuthenticationRemote().register(
                        newusernameController.text,
                        newpasswordController.text,
                        newpasswordController.text,
                      );
                      Navigator.pushNamed(context, '/home');
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  buttonText: 'Register',
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
