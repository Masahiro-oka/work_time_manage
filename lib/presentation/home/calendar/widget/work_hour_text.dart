import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/at_work_dto.dart';
import 'package:work_time_manage/application/dto/work_time/leave_work/leave_work_dto.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/work_date_dto.dart';
import 'package:work_time_manage/presentation/work_time/at_work/at_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/leave_work/leave_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/work_date/work_date_notifier.dart';

import '../../../widget/date_format.dart';

@immutable
class WorkHourText extends StatelessWidget {
  const WorkHourText({Key? key, required this.days}) : super(key: key);

  final DateTime days;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WorkDateNotifier workNotifier, child) {
      return Consumer(
        builder: (context, LeaveWorkNotifier leaveNotifier, child) {
          return Consumer(builder: (context, AtWorkNotifier atNotifier, child) {
            String workTimeText = "";
            List<WorkDateDto> workDateList =
                workNotifier.list.where((e) => e.date == days).toList();
            if (workDateList.isNotEmpty) {
              try {
                AtWorkDto atWorkTime = atNotifier.list
                    .where((e) => e.workDateId == workDateList[0].id)
                    .first;
                LeaveWorkDto? leaveWorkTime = leaveNotifier.list
                    .where((e) => e.workDateId == workDateList[0].id)
                    .first;
                final workTime = leaveWorkTime.date.add(Duration(
                        hours: atWorkTime.date.hour,
                        minutes: atWorkTime.date.minute) *
                    -1);
                workTimeText =
                    "就業時間：${StringToDateFormat.hourMinute.format(workTime)}";
              } catch (e) {
                print(e);
              }
            }
            return Text(workTimeText);
          });
        },
      );
    });
  }
}
