import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifier/calendar_notifier.dart';
import 'list_tile/attendance_list_tile.dart';

@immutable
class CalendarList extends StatelessWidget {
  const CalendarList({required this.calendarIndex, Key? key}) : super(key: key);
  final int calendarIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, CalendarNotifier calendar, child) {
      final calendars = calendar.calendar.date;
      final days = DateTime(calendars.year, calendars.month, calendarIndex);
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            AttendanceListTile(days: days),
          ],
        ),
      );
    });
  }
}
