import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

import 'break_time.dart';

@immutable
abstract class BreakRepositoryBase {
  Future<void> insertData(BreakTime breakTime);
  Future<List<BreakTime>> getAllTimeData();
  Future<BreakTime> findWorkData(WorkDateId workDateId);
  Future<void> deleteData(BreakTime breakTime);
  Future<BreakTime> findById(BreakTime breakTime);
}
