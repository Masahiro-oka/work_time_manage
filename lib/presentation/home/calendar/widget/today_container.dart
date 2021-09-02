import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/calendar/value/week_day.dart';

import 'box_decoration_circlr.dart';

class TodayContainer extends StatelessWidget {
  TodayContainer({Key? key, required this.days}) : super(key: key);

  final DateTime days;
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final WeekDay weekDay = WeekDay(days: days.day);
    return (DateTime(now.year, now.month, now.day) == days)
        ? BoxDecorationCircle(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${days.day}',
                    style: const TextStyle(color: Colors.white)),
                Text(
                  weekDay.weekDay(days),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${days.day}'),
              Text(weekDay.weekDay(days)),
            ],
          );
  }
}
