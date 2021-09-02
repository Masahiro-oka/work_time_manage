import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_time_manage/domain/calendar/calendar_repository_base.dart';
import 'package:work_time_manage/domain/calendar/value/calendar.dart';
import 'package:work_time_manage/infrastructure/shared_prefs_storage.dart';

class CalendarRepository implements CalendarRepositoryBase {
  final ShardPrefsStorage _instance;

  const CalendarRepository({required ShardPrefsStorage instance})
      : _instance = instance;

  @override
  Future<Calendar> getCalendarData(String key) async {
    final SharedPreferences prefs = await _instance.prefs;
    final calendar =
        prefs.getInt(calendarKey) ?? DateTime.now().millisecondsSinceEpoch;
    return Calendar(calendar: DateTime.fromMicrosecondsSinceEpoch(calendar));
  }

  @override
  Future<void> insertData(Calendar calendar) async {
    final SharedPreferences prefs = await _instance.prefs;
    prefs.setInt(calendarKey, calendar.calendar.millisecondsSinceEpoch);
  }
}
