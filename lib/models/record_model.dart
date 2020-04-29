import 'package:intl/intl.dart';
import 'sleep_type_enum.dart';

class RecordModel {
  DateTime dateTime;
  SleepTypeEnum sleepType;
  Duration duration;

  RecordModel({this.dateTime, this.sleepType, this.duration});

  String getFormattedDuration() {
    if (duration == null)
      return null;
    int minutes = duration.inMinutes % 60;

    String hours = Intl.plural(duration.inHours,
        zero: '',
        one: '${duration.inHours} hour',
        other: '${duration.inHours} hours');
    String minutesString = Intl.plural(minutes,
        zero: '', one: '$minutes minute', other: '$minutes minutes');
    return '$hours $minutesString';
  }

  String getFormattedType() {
    switch (sleepType) {
      case SleepTypeEnum.NIGHT:
        return "Night's sleep";
        break;
      case SleepTypeEnum.NAP:
        return "Nap";
    }
    return "";
  }
}
