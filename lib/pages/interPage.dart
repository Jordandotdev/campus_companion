import 'package:flutter/material.dart';
import 'package:campus_companion/pages/homePage.dart';

class interPage extends StatefulWidget {
  const interPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _interPageState createState() => _interPageState();
}

class _interPageState extends State<interPage> {
  //navigate function
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'Timetable'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade400,
        onTap: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
