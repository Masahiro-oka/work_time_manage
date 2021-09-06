import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/work_time/leave_work/dto/leave_work_dto.dart';
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
            final result = Result(
                () => workNotifier.list.singleWhere((e) => e.date == days));
            if (result.isValue) {
              final atWorkTime = atNotifier.list
                  .singleWhere((e) => e.workDateId == result.asValue?.value.id);
              final l = Result(() => leaveNotifier.list.singleWhere(
                  (e) => e.workDateId == result.asValue?.value.id));
              if (l.isValue) {
                LeaveWorkDto? leaveWorkTime = leaveNotifier.list.singleWhere(
                    (e) => e.workDateId == result.asValue?.value.id);
                final workTime = leaveWorkTime.date.add(Duration(
                        hours: atWorkTime.date.hour,
                        minutes: atWorkTime.date.minute) *
                    -1);
                workTimeText =
                    "就業時間：${StringToDateFormat.hourMinute.format(workTime)}";
              }
            }
            return Text(workTimeText);
          });
        },
      );
    });
  }
}
