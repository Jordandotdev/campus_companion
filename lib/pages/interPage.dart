import 'package:campus_companion/pages/eventsPage.dart';
import 'package:campus_companion/pages/profilePage.dart';
import 'package:campus_companion/pages/servicesPage.dart';
import 'package:campus_companion/pages/timetablePage.dart';
import 'package:flutter/material.dart';
import 'package:campus_companion/pages/homePage.dart';

class interPage extends StatefulWidget {
  const interPage({super.key});

  @override
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
    TimeTablePage(),
    EventsPage(),
    ServicePage(),
    profilePage(),
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 31, 90, 138),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_available_rounded), label: 'Timetable'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week_rounded), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 250, 250, 250),
        onTap: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
