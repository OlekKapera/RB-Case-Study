import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:rbcasestudy/widgets/duration_dialog.dart';
import 'package:rbcasestudy/widgets/gradient_button.dart';
import 'package:rbcasestudy/widgets/picker_description.dart';

class AddRecord extends StatefulWidget {
  RecordModel record;

  AddRecord({this.record}) {
    this.record = record == null ? RecordModel() : record;
  }

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
            text: _formatDateTime(widget.record.dateTime),
            onClick: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(0),
                      lastDate: DateTime.now())
                  .then((date) {
                if (date != null)
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((time) {
                    if (time != null)
                      setState(() {
                        widget.record.dateTime = DateTime(date.year, date.month,
                            date.day, time.hour, time.minute);
                      });
                  });
              });
            },
          ),
          PickerDescription(
            icon: CustomIcons.moon,
            title: 'Sleep type',
            holderText: 'Night, nap, etc',
            onClick: () {
              print('bbb');
            },
          ),
          PickerDescription(
            icon: CustomIcons.clock,
            title: 'Sleep duration',
            holderText: '-',
            text: widget.record.getFormattedDuration(),
            onClick: () {
             showDialog(context: context, builder: (BuildContext context){
               return DurationDialog(duration: widget.record.duration,callback: (duration) {
                 setState(() {
                   widget.record.duration = duration;
                 });
               });
             });
            },
          ),
          GradientButton('Save', () {
            Navigator.pop(context, widget.record);
          })
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    if (dateTime != null)
      return DateFormat('d MMMM yyyy, H:mm').format(dateTime).toString();
    return null;
  }
}
