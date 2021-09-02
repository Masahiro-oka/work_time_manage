import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';

@immutable
class WorkDateDto {
  final String id;
  final DateTime date;
  WorkDateDto({required WorkDate data})
      : id = data.workDateId.workDateId,
        date = data.workDate.workDateValue;
}
