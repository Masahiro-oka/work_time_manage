import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/scroller_controller.dart';

import '../../notifier/calendar_notifier.dart';
import 'calendar_list.dart';

@immutable
class CalendarListGenerate extends StatelessWidget {
  const CalendarListGenerate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, CalendarNotifier calendar, child) {
      return Consumer(
          builder: (context, ScrollerController scrollToToday, child) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          return scrollToToday.slideToday(calendar.calendar.date);
        });
        ListView _list = ListView.builder(
            controller: scrollToToday.controller,
            itemCount: calendar.list.length,
            itemBuilder: (context, index) => CalendarList(
                  calendarIndex: ++index,
                ));
        return _list;
      });
    });
  }
}
