import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work_factory_base.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
class LeaveWorkFactory implements LeaveWorkFactoryBase {
  @override
  LeaveWork create(
      {required LeaveWorkTime leaveWorkTime, required WorkDateId workDateId}) {
    return LeaveWork(
        leaveWorkId: LeaveWorkId(leaveWorkId: const Uuid().v4()),
        workDateId: workDateId,
        leaveWorkTime: leaveWorkTime);
  }
}
