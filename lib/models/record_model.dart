import 'sleep_type_enum.dart';

class RecordModel {

  DateTime _dateTime;
  SleepTypeEnum _sleepType;
  Duration _duration;

  RecordModel(this._dateTime, this._sleepType, this._duration);
}