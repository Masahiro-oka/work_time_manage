import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work.dart';

@immutable
class LeaveWorkDto {
  final String id;
  final String workDateId;
  final DateTime date;
  LeaveWorkDto({required LeaveWork data})
      : id = data.leaveWorkId.leaveWorkId,
        workDateId = data.workDateId.workDateId,
        date = data.leaveWorkTime.leaveWorkTime;
}
