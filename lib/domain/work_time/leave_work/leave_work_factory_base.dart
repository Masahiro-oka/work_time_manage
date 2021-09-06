import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/work_time/leave_work/value/leave_work_time.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

import 'leave_work.dart';

@immutable
abstract class LeaveWorkFactoryBase {
  LeaveWork create(
      {required LeaveWorkTime leaveWorkTime, required WorkDateId workDateId});
}
