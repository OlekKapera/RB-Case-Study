import 'package:flutter/material.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/models/sleep_type_enum.dart';
import 'package:rbcasestudy/widgets/gradient_button.dart';
import 'package:rbcasestudy/widgets/records_item.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<RecordModel> records = [
    RecordModel(DateTime.now(), SleepTypeEnum.NAP, Duration(hours: 2, minutes: 10)),
    RecordModel(DateTime.now(), SleepTypeEnum.NIGHT, Duration(hours: 1, minutes: 20)),
    RecordModel(DateTime.now(), SleepTypeEnum.NAP, Duration(hours: 0, minutes: 30)),
    RecordModel(DateTime.now(), SleepTypeEnum.NAP, Duration(hours: 0, minutes: 60)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 48.0),
          child: Text(
            'Sleep Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.yellow[800],
              radius: 22,
              child: Icon(
                CustomIcons.moon,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
                backgroundColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            GradientButton('Add new sleeping record'),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return RecordsItem(records[index]);
                  },
                  separatorBuilder: (context, index) => Divider(height: 1, thickness: 1),
                  itemCount: records.length),
            ),
          ],
        ),
      ),
    );
  }
}
