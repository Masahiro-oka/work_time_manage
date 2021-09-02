import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time_domain/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
class BreakTime {
  final BreakId breakId;
  final WorkDateId workDateId;
  final BreakHour breakHour;
  const BreakTime(
      {required this.breakId,
      required this.workDateId,
      required this.breakHour});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is BreakTime && other.breakId == breakId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ breakId.hashCode;

  static BreakTime fromMap(Map<String, dynamic> map) {
    BreakId _breakId = BreakId(breakId: int.parse('${map["id"]}'));
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"]);
    BreakHour _breakHour =
        BreakHour(breakHour: int.parse('${map["breakTime"]}'));
    return BreakTime(
        breakId: _breakId, workDateId: _workId, breakHour: _breakHour);
  }
}
