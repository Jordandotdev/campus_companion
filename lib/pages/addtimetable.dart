import 'package:campus_companion/data/firestore_data.dart';
import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final titleController = TextEditingController();
  final moduleController = TextEditingController();
  final timeController = TextEditingController();
  final dayController = TextEditingController();
  final roomController = TextEditingController();
  final lecturerController = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              moduleWidget(),
              SizedBox(height: 20),
              timeWidget(),
              SizedBox(height: 20),
              dayWidget(),
              SizedBox(height: 20),
              roomWidget(),
              SizedBox(height: 20),
              lecturerWidget(),
              SizedBox(height: 20),
              button()
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.background,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            FirestoreDatasource().addTimeTable(
              moduleController.text,
              timeController.text,
              dayController.text,
              roomController.text,
              lecturerController.text,
            );
            Navigator.pop(context);
          },
          child: Text('Add Time Table'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Widget moduleWidget() {
    return textFieldWidget(
      controller: moduleController,
      focusNode: _focusNode2,
      hintText: 'Module',
    );
  }

  Widget timeWidget() {
    return textFieldWidget(
      controller: timeController,
      focusNode: _focusNode3,
      hintText: 'Time',
    );
  }

  Widget dayWidget() {
    return textFieldWidget(
      controller: dayController,
      focusNode: _focusNode4,
      hintText: 'Day',
    );
  }

  Widget roomWidget() {
    return textFieldWidget(
      controller: roomController,
      focusNode: _focusNode5,
      hintText: 'Room',
    );
  }

  Widget lecturerWidget() {
    return textFieldWidget(
      controller: lecturerController,
      focusNode: _focusNode6,
      hintText: 'Lecturer',
    );
  }

  Widget textFieldWidget({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.background,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
