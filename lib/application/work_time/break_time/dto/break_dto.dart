import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/break/break_time.dart';

@immutable
class BreakDto {
  final String id;
  final String workDateId;
  final int breakTIme;
  BreakDto({required BreakTime data})
      : id = data.breakId.breakId,
        workDateId = data.workDateId.workDateId,
        breakTIme = data.breakTime.breakHour;
}
