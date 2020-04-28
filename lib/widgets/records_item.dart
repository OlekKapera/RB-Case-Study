import 'package:flutter/material.dart';

class RecordsItem extends StatefulWidget {
  @override
  _RecordsItemState createState() => _RecordsItemState();
}

class _RecordsItemState extends State<RecordsItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            color: Color(0xfff7f6f3),
            child: Column(
              children: <Widget>[
                Text(
                  '10:42',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 1.0),
                Text(
                  'PM',
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
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}
