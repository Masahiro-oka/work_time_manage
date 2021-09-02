import 'package:flutter/foundation.dart';
import 'package:work_time_manage/presentation/widget/date_format.dart';

@immutable
class Period {
  final DateTime period;
  const Period({required this.period});

  bool canCompareToDate(Period other) {
    return other.period.difference(period).inHours <= 0;
  }

  Period compareToDate(Period other) {
    DateTime compareToDate = _compareToDate(other);
    return Period(period: compareToDate);
  }

  DateTime _compareToDate(Period other) {
    DateTime compareToDate = other.period
        .add(Duration(hours: period.hour, minutes: period.minute) * -1);
    return compareToDate;
  }

  String compareToDateString(Period other) {
    Period period = compareToDate(other);
    return StringToDateFormat.hourMinute.format(period.period);
  }
}
