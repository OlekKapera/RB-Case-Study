import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/models/sleep_type_enum.dart';
import 'package:rbcasestudy/pages/add_record.dart';
import 'package:rbcasestudy/widgets/gradient_button.dart';
import 'package:rbcasestudy/widgets/records_item.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  SplayTreeMap<DateTime, SplayTreeSet<RecordModel>> records =
      SplayTreeMap<DateTime, SplayTreeSet<RecordModel>>();

  @override
  Widget build(BuildContext context) {
    SplayTreeSet splayTreeSet = SplayTreeSet<RecordModel>(
        (key1, key2) => key1.dateTime.compareTo(key2.dateTime));
    splayTreeSet.add(RecordModel(
        dateTime: DateTime.now().add(Duration(days: 2)),
        sleepType: SleepTypeEnum.NAP,
        duration: Duration(hours: 2, minutes: 10)));
    splayTreeSet.add(RecordModel(
        dateTime: DateTime.now(),
        sleepType: SleepTypeEnum.NAP,
        duration: Duration(hours: 1, minutes: 20)));
    splayTreeSet.add(RecordModel(
        dateTime: DateTime.now().add(Duration(hours: 2)),
        sleepType: SleepTypeEnum.NIGHT,
        duration: Duration(hours: 1, minutes: 20)));

    records.addAll({
      DateTime.now().add(Duration(days: 2)): splayTreeSet,
      DateTime.now(): splayTreeSet,
      DateTime.now().add(Duration(days: 4)): splayTreeSet,
    });
    List recordKeys = records.keys.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 54.0),
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
      body: CustomScrollView(slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 32, 16.0, 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
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
              GradientButton('Add new sleeping record', () async {
                final RecordModel newRecord = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddRecord(),
                    ));
              }),
              Expanded(
                child: ListView.builder(
                  itemCount: recordKeys.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    SplayTreeSet recordsInDay = records[recordKeys[index]];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 64, 0, 32),
                          child: Text(
                            DateFormat('EEEE, d LLL yyyy')
                                .format(recordKeys[index])
                                .toUpperCase(),
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                Divider(height: 1, thickness: 1),
                            itemCount: recordsInDay.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return RecordsItem(recordsInDay.elementAt(index));
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
