import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_value.dart';

import 'break_time.dart';

@immutable
abstract class BreakTimeRepositoryBase {
  Future<void> insertData(BreakTime breakTime);
  Future<List<BreakTime>> getAllTimeData();
  Future<BreakTime> findWorkData(WorkDateValue workDate);
  Future<void> deleteData(BreakId breakId);
  Future<void> update(BreakTime breakTime);
  Future<BreakTime> findById(BreakId breakId);
}
