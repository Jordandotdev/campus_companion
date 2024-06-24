import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityResult? connectivityResult;
  bool show = true;
  String quote = "Fetching quote...";

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    fetchQuote();
  }

  void checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    setState(() {
      connectivityResult = result;
    });
  }

  void fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));
    if (response.statusCode == 200) {
      setState(() {
        quote = json.decode(response.body)['content'];
      });
    } else {
      setState(() {
        quote = "Failed to fetch quote";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 11, 49, 80),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome !',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                quote,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Timetable',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            timeTable(),
          ],
        ),
      ),
    );
  }
}

class timeTable extends StatelessWidget {
  const timeTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.white),
      children: const [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Day',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Module',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Time',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Monday', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Math', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('9:00 - 10:00', style: TextStyle(color: Colors.white)),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Tuesday', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Physics', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('9:00 - 10:00', style: TextStyle(color: Colors.white)),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Wednesday', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Chemistry', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('9:00 - 10:00', style: TextStyle(color: Colors.white)),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Thursday', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Biology', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('9:00 - 10:00', style: TextStyle(color: Colors.white)),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Friday', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('History', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('9:00 - 10:00', style: TextStyle(color: Colors.white)),
          ),
        ]),
      ],
    );
  }
}
