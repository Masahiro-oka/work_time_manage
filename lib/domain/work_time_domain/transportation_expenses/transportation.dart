import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/transportation_expenses/value/transportation_id.dart';
import 'package:work_time_manage/domain/work_time_domain/transportation_expenses/value/transportationexpenses.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
class Transportation {
  final TransportationId transportationId;
  final WorkDateId workDateId;
  final TransportationExpenses transportationExpenses;
  const Transportation(
      {required this.transportationId,
      required this.workDateId,
      required this.transportationExpenses});

  static Transportation fromMap(Map<String, dynamic> map) {
    TransportationId _transportationId =
        TransportationId(transportationId: int.parse('${map["id"]}'));
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"]);
    TransportationExpenses _transportationExpenses = TransportationExpenses(
        transportationExpenses: int.parse('${map["breakTime"]}'));
    return Transportation(
        transportationId: _transportationId,
        workDateId: _workId,
        transportationExpenses: _transportationExpenses);
  }
}
