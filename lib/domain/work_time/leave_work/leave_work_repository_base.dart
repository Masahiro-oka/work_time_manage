import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/leave_work/value/leave_work_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

import 'leave_work.dart';

@immutable
abstract class LeaveWorkRepositoryBase {
  Future<void> insertData(LeaveWork leaveWork);
  Future<List<LeaveWork>> getAllTimeData();
  Future<LeaveWork> findWorkData(WorkDateId workDateId);
  Future<LeaveWork> findById(LeaveWorkId id);
  Future<void> deleteData(LeaveWork leaveWork);
}
