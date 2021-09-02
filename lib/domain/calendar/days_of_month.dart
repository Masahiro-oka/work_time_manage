import 'package:flutter/material.dart';

@immutable
class DaysOfMonth {
  static const _thisMonthLastDay = -1;
  static const _firstDay = 1;

  final int days;
  const DaysOfMonth({this.days = 0});

  DateTime _thisMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, _firstDay)
        .add(const Duration(days: _thisMonthLastDay));
  }

  int _daysOfMonth(DateTime dateTime) {
    int _days = _thisMonth(dateTime).day;
    return _days;
  }

  DaysOfMonth daysOfMonth(DateTime dateTime) {
    int days = _daysOfMonth(dateTime);
    return DaysOfMonth(days: days);
  }

  DaysOfMonth businessDay(DateTime dateTime) {
    int _businessDays = _removeSaturdayAndSundayIndex(dateTime);
    return DaysOfMonth(days: _businessDays);
  }

  int _removeSaturdayAndSundayIndex(DateTime dateTime) {
    int days = _daysOfMonth(dateTime);
    List _thisMonthWeekDayList = List.generate(
        days,
        (thisMonthWeekDaysIndex) =>
            DateTime(dateTime.year, dateTime.month, thisMonthWeekDaysIndex++)
                .weekday);
    _thisMonthWeekDayList.removeWhere((saturday) => saturday == 6);
    _thisMonthWeekDayList.removeWhere((sunday) => sunday == 7);
    return _thisMonthWeekDayList.length;
  }
}
