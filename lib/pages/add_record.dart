import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rbcasestudy/custom_icons_icons.dart';
import 'package:rbcasestudy/models/record_model.dart';
import 'package:rbcasestudy/models/sleep_type_enum.dart';
import 'package:rbcasestudy/widgets/duration_dialog.dart';
import 'package:rbcasestudy/widgets/gradient_button.dart';
import 'package:rbcasestudy/widgets/picker_description.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecord extends StatefulWidget {
  RecordModel record;

  AddRecord({this.record}) {
    if (this.record == null) {
      record = RecordModel();
      record.dateTime = DateTime.now();
    }
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
                      initialDate: widget.record.dateTime,
                      firstDate: DateTime(0),
                      lastDate: DateTime.now())
                  .then((date) {
                if (date != null)
                  showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: widget.record.dateTime.hour,
                              minute: widget.record.dateTime.minute))
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
            text: RecordModel.getFormattedType(widget.record.sleepType),
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _createListTile(context, SleepTypeEnum.NIGHT),
                        Divider(height: 3),
                        _createListTile(context, SleepTypeEnum.NAP),
                      ],
                    );
                  });
            },
          ),
          PickerDescription(
            icon: CustomIcons.clock,
            title: 'Sleep duration',
            holderText: '-',
            text: widget.record.getFormattedDuration(),
            onClick: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DurationDialog(
                        duration: widget.record.duration,
                        callback: (duration) {
                          setState(() {
                            widget.record.duration = duration;
                          });
                        });
                  });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: GradientButton('Save', () {
            if (widget.record.sleepType == null ||
                widget.record.duration == null)
              Fluttertoast.showToast(msg: 'All fields need to be filled!');
            else
              Navigator.pop(context, widget.record);
          }),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    if (dateTime == null) dateTime = DateTime.now();

    return DateFormat('d MMMM yyyy, H:mm').format(dateTime).toString();
  }

  ListTile _createListTile(BuildContext context, SleepTypeEnum sleepType) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.record.sleepType = sleepType;
          Navigator.pop(context);
        });
      },
      contentPadding: EdgeInsets.all(8),
      title: Text(
        RecordModel.getFormattedType(sleepType),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
