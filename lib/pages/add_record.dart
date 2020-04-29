import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/widgets/picker_description.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Sleeping Tracker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset(
                'assets/img_add_record.jpg',
                height: 200,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          PickerDescription(
            icon: CustomIcons.calendar,
            title: 'Date and time',
            onClick: () {
              print('aaa');
            },
          ),
          Divider(height: 0, color: Colors.grey),
        ],
      ),
    );
  }
}
