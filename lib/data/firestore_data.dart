// Corrected file name
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:campus_companion/models/time_table_module.dart'; // Ensure this doesn't conflict with the Table class
import 'package:uuid/uuid.dart';

// Renamed class to follow UpperCamelCase convention
class FirestoreDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      return true;
    }
  }

  // Renamed method to follow lowerCamelCase convention
  Future<bool> addTimeTable(String module, String title, String day,
      String room, String lecturer) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = DateTime.now(); // Removed 'new' keyword
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        "id": uuid,
        "module": module,
        'day': day,
        'time': '${data.hour}:${data.minute}',
        'room': room,
        'lecturer': lecturer
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notelist = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        // Assuming Table is correctly aliased or resolved elsewhere
        return modules(data['id'], data['module'], data['time'], data['day'],
            data['room'], data['lecturer']);
      }).toList();
      return notelist;
    } catch (e) {
      return [];
    }
  }

  Stream<QuerySnapshot> stream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .snapshots();
  }

  Future<bool> isDone(String uuid, bool isDone) async {
    // Renamed method to follow lowerCamelCase convention
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid);

      // Delete the document after successful update
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .delete();

      return true;
    } catch (e) {
      // Consider replacing print(e); with proper logging
      return false; // Return false to indicate failure
    }
  }
}
