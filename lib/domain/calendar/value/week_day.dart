import 'package:work_time_manage/presentation/widget/date_format.dart';

class WeekDay {
  WeekDay({required this.days});
  final int days;

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is WeekDay && other.weekDay == weekDay);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ weekDay.hashCode;

  String weekDay(DateTime dateTime) {
    String weekday = StringToDateFormat.weekDay
        .format(DateTime(dateTime.year, dateTime.month, days));
    return weekday;
  }
}
