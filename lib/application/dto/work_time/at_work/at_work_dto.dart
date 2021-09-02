import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work.dart';

@immutable
class AtWorkDto {
  final String id;
  final String workDateId;
  final DateTime date;
  AtWorkDto({required AtWork data})
      : id = data.atWorkId.atWorkId,
        workDateId = data.workDateId.workDateId,
        date = data.atWorkTime.atWorkTime;
}
