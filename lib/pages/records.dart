import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:rbcasestudy/pages/add_record.dart';
import 'package:rbcasestudy/widgets/gradient_button.dart';
import 'package:rbcasestudy/widgets/records_item.dart';

class Records extends StatefulWidget {
  SplayTreeMap<DateTime, SplayTreeSet<RecordModel>> records;
  SplayTreeSet<DateTime> recordKeys;

  Records() {
    records = SplayTreeMap<DateTime, SplayTreeSet<RecordModel>>();
    recordKeys = SplayTreeSet((key1, key2) => key2.compareTo(key1));
  }

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  DateTime dateKey = DateTime(
                      newRecord.dateTime.year.toInt(),
                      newRecord.dateTime.month.toInt(),
                      newRecord.dateTime.day.toInt());
                  if (widget.records[dateKey] == null)
                    widget.records[dateKey] = SplayTreeSet<RecordModel>(
                        (key1, key2) => key2.dateTime.compareTo(key1.dateTime));
                  widget.records[dateKey].add(newRecord);
                  widget.recordKeys.add(dateKey);
                });
              }),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.recordKeys.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    SplayTreeSet recordsInDay =
                        widget.records[widget.recordKeys.elementAt(index)];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 64, 0, 32),
                          child: Text(
                            DateFormat('EEEE, d LLL yyyy')
                                .format(widget.recordKeys.elementAt(index))
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
