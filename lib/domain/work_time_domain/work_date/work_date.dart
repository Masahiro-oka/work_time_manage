import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';

@immutable
class WorkDate {
  final WorkDateId workDateId;
  final WorkDateValue workDate;
  const WorkDate({required this.workDate, required this.workDateId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is WorkDate && other.workDate == workDate);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ workDate.hashCode;
}
