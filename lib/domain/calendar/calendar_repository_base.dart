import 'package:work_time_manage/domain/calendar/value/calendar.dart';

abstract class CalendarRepositoryBase {
  Future<void> insertData(Calendar calendar);
  Future<Calendar> getCalendarData(String key);
}

const String calendarKey = 'calendar';
