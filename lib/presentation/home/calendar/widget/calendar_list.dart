import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';
import 'package:work_time_manage/presentation/home/calendar/select/select_day_work_data.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/today_container.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/work_time_display.dart';
import 'package:work_time_manage/presentation/widget/dialog/delete_dialog.dart';
import 'package:work_time_manage/presentation/widget/dialog/show_dialog_base.dart';

import '../../../route/route_generator.dart';
import '../notifier/calendar_notifier.dart';
import 'work_hour_text.dart';

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
            ListTile(
              onLongPress: () {
                DialogBase.showAlertDialog(
                    context,
                    DeleteDialog(
                        selectDate: WorkDateValue(workDateValue: days)));
              },
              onTap: () async {
                return await RouteGenerator.generateRoute(
                    context: context,
                    thisChild: SelectDayWorkDate(
                      thisWorkData: days,
                    ));
              },
              leading: TodayContainer(
                days: days,
              ),
              title: WorkTimeDisplay(
                days: days,
              ),
              subtitle: WorkHourText(
                days: days,
              ),
            ),
          ],
        ),
      );
    });
  }
}
