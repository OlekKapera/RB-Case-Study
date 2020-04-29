import 'package:flutter/material.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';

class PickerDescription extends StatefulWidget {
  @override
  _PickerDescriptionState createState() => _PickerDescriptionState();
}

class _PickerDescriptionState extends State<PickerDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            CustomIcons.calendar,
            color: Colors.indigo[700],
            size: 20,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Date and Time',
                style: TextStyle(
                  color: Colors.indigo[700],
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '29 November 2019, 17:48',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
