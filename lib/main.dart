import 'package:campus_companion/pages/HomePage.dart';
import 'package:campus_companion/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'pages/loginPage.dart';
import 'pages/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirebaseCheck(),
      title: 'Tick Off',
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/profile': (context) => profilePage(),
      },
    );
  }
}

class FirebaseCheck extends StatefulWidget {
  const FirebaseCheck({super.key});

  @override
  _FirebaseCheckState createState() => _FirebaseCheckState();
}

class _FirebaseCheckState extends State<FirebaseCheck> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text("Failed to connect to Firebase"),
        ),
      );
    }

    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return LoginPage();
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaskPage();
  }
}
