import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_value.dart';

import 'at_work.dart';

@immutable
abstract class AtWorkRepositoryBase {
  Future<void> insertData(AtWork atWork);
  Future<List<AtWork>> getAllTimeData();
  Future<AtWork> findWorkData(WorkDateValue workDate);
  Future<void> deleteData(AtWork atWork);
  Future<AtWork> findById(AtWorkId atWork);
}
