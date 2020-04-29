import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationDialog extends StatefulWidget {
  Duration duration;
  Function callback;

  DurationDialog({this.duration, this.callback}) {
    if (duration == null) duration = Duration();
  }

  @override
  _DurationDialogState createState() => _DurationDialogState();
}

class _DurationDialogState extends State<DurationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick sleep duration'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NumberPicker.integer(
                  initialValue: widget.duration.inHours,
                  minValue: 0,
                  maxValue: 23,
                  onChanged: (hour) {
                    setState(() {
                      widget.duration = Duration(
                          hours: hour,
                          minutes: (widget.duration.inMinutes % 60));
                    });
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  'HOURS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NumberPicker.integer(
                  initialValue: widget.duration.inMinutes % 60,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (minute) {
                    setState(() {
                      widget.duration = Duration(
                          hours: widget.duration.inHours, minutes: minute);
                    });
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  'MINUTES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
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
            if (widget.duration != Duration()) widget.callback(widget.duration);
            Navigator.pop(context, widget.duration);
          },
        ),
      ],
    );
  }
}
