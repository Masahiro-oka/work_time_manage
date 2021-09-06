import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/enum/work_manage/work_time_enum.dart';
import 'package:work_time_manage/application/work_time/at_work/command/at_work_save_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_save_command.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_command.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_save_command.dart';
import 'package:work_time_manage/presentation/work_time/at_work/at_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/leave_work/leave_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/work_date/work_date_notifier.dart';

@immutable
class FloatingButton extends StatelessWidget {
  const FloatingButton({required this.type, Key? key}) : super(key: key);

  final WorkType type;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    return Consumer(builder: (context, AtWorkNotifier atNotifier, child) {
      return Consumer(
          builder: (context, LeaveWorkNotifier leaveNotifier, child) {
        return Consumer(
          builder: (context, WorkDateNotifier workNotifier, child) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: FloatingActionButton.extended(
                label: Text(
                  type.typeName,
                  style: TextStyle(fontSize: _queryData.textScaleFactor * 19),
                ),
                backgroundColor: const Color(0xFFc4467a),
                onPressed: () async {
                  if (type.typeName == '出勤') {
                    await workNotifier
                        .save(WorkDateSaveCommand(workDate: DateTime.now()));
                    final target = await workNotifier
                        .findByDate(WorkDateCommand(date: DateTime.now()));
                    atNotifier.save(AtWorkSaveCommand(
                        date: DateTime.now(), workDateId: target.id));
                  } else {
                    final target = await workNotifier
                        .findByDate(WorkDateCommand(date: DateTime.now()));
                    leaveNotifier.save(LeaveWorkSaveCommand(
                        workDateId: target.id, date: DateTime.now()));
                  }
                },
              ),
            );
          },
        );
      });
    });
  }
}
