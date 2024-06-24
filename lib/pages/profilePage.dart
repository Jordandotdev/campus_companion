import 'dart:io';

import 'package:campus_companion/components/loginbtn.dart';
import 'package:campus_companion/components/styleBox.dart';
import 'package:campus_companion/components/textfield.dart';
import 'package:campus_companion/data/auth_data.dart';
import 'package:campus_companion/pages/interPage.dart';
import 'package:campus_companion/pages/loginPage.dart';
import 'package:campus_companion/pages/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<profilePage> {
  XFile? _tempImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as XFile?;
    if (args != null) {
      setState(() {
        _tempImage = args;
      });
    }
  }

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

                //profile
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
                //profile icon
                InkWell(
                  child: Center(
                    // Wrap the conditionally rendered widgets with a Center widget
                    child: _tempImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(_tempImage!.path),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.person, size: 70), // Icon
                  ),
                ),

                const SizedBox(height: 20),

                //proflie picture change
                MyLoginBtn(
                  onTap: () => {
                    Navigator.pushNamed(
                      context,
                      '/camera',
                      arguments: _tempImage, // Pass the initial image if any
                    ).then((selectedPhoto) {
                      if (selectedPhoto != null) {
                        setState(() {
                          _tempImage = selectedPhoto as XFile?;
                        });
                      }
                    })
                  },
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
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
