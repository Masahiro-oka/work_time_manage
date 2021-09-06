import 'package:work_time_manage/domain/calendar/calendar_repository_base.dart';
import 'package:work_time_manage/domain/calendar/value/calendar.dart';

import 'command/calendar_save_command.dart';
import 'dto/calendar_dto.dart';

class CalendarAppService {
  final CalendarRepositoryBase _repository;

  CalendarAppService({required CalendarRepositoryBase repository})
      : _repository = repository;

  Future<void> save(CalendarSaveCommand command) async {
    final calendar = Calendar(calendar: command.date);
    await _repository.insertData(calendar);
  }

  Future<CalendarDto> getData(String key) async {
    final data = await _repository.getCalendarData(key);
    final CalendarDto calendarDto = CalendarDto(date: data);
    return calendarDto;
  }
}
