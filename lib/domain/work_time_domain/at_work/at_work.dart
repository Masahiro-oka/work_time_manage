import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
class AtWork {
  final AtWorkTime atWorkTime;
  final WorkDateId workDateId;
  final AtWorkId atWorkId;
  const AtWork(
      {required this.atWorkTime,
      required this.atWorkId,
      required this.workDateId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is AtWork && other.atWorkTime == atWorkTime);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ atWorkTime.hashCode;
}
