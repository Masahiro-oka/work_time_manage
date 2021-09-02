import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/at_work_dto.dart';
import 'package:work_time_manage/application/dto/work_time/leave_work/leave_work_dto.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/work_date_dto.dart';
import 'package:work_time_manage/presentation/work_time/at_work/at_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/leave_work/leave_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/work_date/work_date_notifier.dart';

import '../../../widget/date_format.dart';

@immutable
class WorkTimeDisplay extends StatelessWidget {
  const WorkTimeDisplay({Key? key, required this.days}) : super(key: key);

  final DateTime days;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WorkDateNotifier workNotifier, child) {
      return Consumer(
        builder: (context, LeaveWorkNotifier leaveNotifier, child) {
          return Consumer(builder: (context, AtWorkNotifier atNotifier, child) {
            String atWorkText = "";
            String leaveWorkText = '';
            List<WorkDateDto> workDateList = workNotifier.list
                .where((element) => element.date == days)
                .toList();
            if (workDateList.isNotEmpty) {
              try {
                AtWorkDto atWorkTime = atNotifier.list
                    .where(
                        (element) => element.workDateId == workDateList[0].id)
                    .first;
                atWorkText =
                    StringToDateFormat.hourMinute.format(atWorkTime.date);

                LeaveWorkDto? leaveWorkTime = leaveNotifier.list
                    .where(
                        (element) => element.workDateId == workDateList[0].id)
                    .first;
                leaveWorkText =
                    " 〜 ${StringToDateFormat.hourMinute.format(leaveWorkTime.date)}";
              } catch (e) {
                print(e);
              } finally {}
            }
            return Row(
              children: [
                Text(atWorkText),
                Text(leaveWorkText),
              ],
            );
          });
        },
      );
    });
  }
}
