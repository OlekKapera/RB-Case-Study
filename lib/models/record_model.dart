import 'sleep_type_enum.dart';

class RecordModel {

  DateTime dateTime;
  SleepTypeEnum sleepType;
  Duration duration;

  RecordModel(this.dateTime, this.sleepType, this.duration);
}