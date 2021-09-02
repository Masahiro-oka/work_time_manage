import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
class LeaveWork {
  final LeaveWorkId leaveWorkId;
  final WorkDateId workDateId;
  final LeaveWorkTime leaveWorkTime;
  const LeaveWork(
      {required this.leaveWorkId,
      required this.workDateId,
      required this.leaveWorkTime});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is LeaveWork && other.leaveWorkId == leaveWorkId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ leaveWorkId.hashCode;
}
