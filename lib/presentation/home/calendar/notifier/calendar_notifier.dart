import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/application/calendar/calendar_app_service.dart';
import 'package:work_time_manage/application/calendar/command/calendar_save_command.dart';
import 'package:work_time_manage/application/calendar/dto/calendar_dto.dart';
import 'package:work_time_manage/domain/calendar/calendar_repository_base.dart';
import 'package:work_time_manage/domain/calendar/value/calendar.dart';

class CalendarNotifier extends ChangeNotifier {
  final CalendarAppService _appService;
  bool showCalendar = false;
  List<int> _list = [];
  List<int> get list => _list;

  CalendarDto _calendar = CalendarDto(date: Calendar(calendar: DateTime.now()));
  CalendarDto get calendar => _calendar;

  CalendarNotifier({required CalendarAppService appService})
      : _appService = appService;

  Future<void> save(CalendarSaveCommand command) async {
    await _appService.save(command);
    _calendar = await _appService.getData(calendarKey);
    convertList();
  }

  void show() {
    showCalendar ? showCalendar = false : showCalendar = true;
    convertList();
  }

  void convertList() {
    int daysOfMonth = DateTime(_calendar.date.year, _calendar.date.month + 1, 1)
        .add(const Duration(days: -1))
        .day;
    _list = List.generate(daysOfMonth, (i) => i);
    notifyListeners();
  }
}
