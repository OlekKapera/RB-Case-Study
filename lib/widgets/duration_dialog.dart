import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationDialog extends AlertDialog {
  Duration duration;
  Function callback;

  DurationDialog({this.duration, this.callback}) {
    if (duration == null) duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick sleep duration'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberPicker.integer(
              initialValue: 0,
              minValue: 0,
              maxValue: 23,
              onChanged: (hour) {
                duration =
                    Duration(hours: hour, minutes: (duration.inSeconds % 60));
              }),
          Text(':'),
          NumberPicker.integer(
              initialValue: 0,
              minValue: 0,
              maxValue: 59,
              onChanged: (minute) {
                duration = Duration(hours: duration.inHours, minutes: minute);
              }),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            callback(duration);
            Navigator.pop(context, duration);
          },
        ),
      ],
    );
  }
}
