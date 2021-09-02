import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';

@immutable
abstract class WorkDateRepositoryBase {
  Future<void> insertData(WorkDate workDate);
  Future<List<WorkDate>> getAllWorkDateData();
  Future<List<WorkDate>> getBetWeenWorkDateData(
      DateTime startDate, DateTime endDate);
  Future<WorkDate> findWorkDateData(WorkDateValue workDate);
  Future<WorkDate> findById(WorkDateId id);
  Future<void> deleteData(WorkDate workDate);
}
