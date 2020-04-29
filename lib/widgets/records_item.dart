import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/models/record_model.dart';

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
                    record.getSleepTitle(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    record.getFormattedDuration(),
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
}
