import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/transportation_expenses/transportation.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
abstract class TransportationRepositoryBase {
  Future<void> insertData(Transportation transportation);
  Future<List<Transportation>> getAllTransportationData();
  Future<Transportation> findTransportationData(WorkDateId workDateId);
  Future<void> deleteData(Transportation transportation);
}
