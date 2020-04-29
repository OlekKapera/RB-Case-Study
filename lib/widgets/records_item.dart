import 'package:flutter/material.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/models/sleep_type_enum.dart';

class RecordsItem extends StatelessWidget {
  final RecordModel record;

  RecordsItem(this.record);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
              color: Color(0xfff7f6f3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    DateFormat('hh:mm').format(record.dateTime),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 1.0),
                  Text(
                    DateFormat('a').format(record.dateTime).toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _getSleepTitle(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    _getSleepDuration(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getSleepTitle() {
    switch (record.sleepType) {
      case SleepTypeEnum.NIGHT:
        return "Night's sleep";
        break;
      case SleepTypeEnum.NAP:
        return "Nap";
    }
    return "";
  }

  String _getSleepDuration() {
    int minutes = record.duration.inMinutes % 60;

    String hours = Intl.plural(record.duration.inHours,
        zero: '',
        one: '${record.duration.inHours} hour',
        other: '${record.duration.inHours} hours');
    String minutesString = Intl.plural(minutes,
        zero: '',
        one: '$minutes minutes',
        other: '$minutes minutes');
    return '$hours $minutesString';
  }
}
