import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

import 'at_work.dart';

@immutable
abstract class AtWorkRepositoryBase {
  Future<void> insertData(AtWork atWork);
  Future<List<AtWork>> getAllTimeData();
  Future<AtWork> findWorkData(WorkDateId workDateId);
  Future<void> deleteData(AtWork atWork);
  Future<AtWork> findById(AtWorkId atWork);
}
