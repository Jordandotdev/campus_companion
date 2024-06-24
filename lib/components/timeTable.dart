import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:campus_companion/models/time_table_module.dart';

class TimeTableScreen extends StatelessWidget {
  final modules note;

  const TimeTableScreen(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.module,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 5),
              Text(note.day),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 5),
              Text(note.time),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.room, size: 16),
              SizedBox(width: 5),
              Text(note.room),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.person, size: 16),
              SizedBox(width: 5),
              Text(note.lecturer),
            ],
          ),
        ],
      ),
    );
  }
}
