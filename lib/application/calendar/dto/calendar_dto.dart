import 'package:work_time_manage/domain/calendar/value/calendar.dart';

class CalendarDto {
  final DateTime date;
  CalendarDto({required Calendar date}) : date = date.calendar;
}
