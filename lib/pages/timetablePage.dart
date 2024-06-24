import 'package:campus_companion/components/timeTable.dart';
import 'package:campus_companion/data/firestore_data.dart';
import 'package:campus_companion/pages/addtimetable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:campus_companion/data/firestore_data.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TimeTablePage> {
  ConnectivityResult? connectivityResult;
  bool show = true;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    setState(() {
      connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            if (connectivityResult == ConnectivityResult.none) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('No internet connection'),
              ));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Add_Screen(),
              ));
            }
          },
          backgroundColor: Colors.blue.shade400,
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              if (notification.direction == ScrollDirection.forward) {
                setState(() {
                  show = true;
                });
              } else if (notification.direction == ScrollDirection.reverse) {
                setState(() {
                  show = false;
                });
              }
            }
            return true;
          },
          child: StreamBuilder<QuerySnapshot>(
            stream: FirestoreDatasource().stream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final notesList = FirestoreDatasource().getNotes(snapshot);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final note = notesList[index];
                  return TimeTableScreen(note);
                },
                itemCount: notesList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
