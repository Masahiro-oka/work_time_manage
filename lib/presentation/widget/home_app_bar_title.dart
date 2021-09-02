import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/presentation/home/calendar/notifier/calendar_notifier.dart';
import 'package:work_time_manage/presentation/widget/date_format.dart';

class HomeAppBarMonthTitle extends StatelessWidget {
  const HomeAppBarMonthTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, CalendarNotifier calendar, child) {
      Widget date =
          Text(StringToDateFormat.dateMonth.format(calendar.calendar.date));
      IconButton iconButton = IconButton(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(0),
        onPressed: () async {
          calendar.show();
        },
        icon: (calendar.showCalendar)
            ? const Icon(Icons.arrow_drop_up_rounded)
            : const Icon(Icons.arrow_drop_down_rounded),
      );
      return Row(
        children: [date, iconButton],
      );
    });
  }
}
