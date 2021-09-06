import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/work_time/at_work/value/at_work_time.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

import 'at_work.dart';

@immutable
abstract class AtWorkFactoryBase {
  AtWork create(
      {required AtWorkTime atWorkTime, required WorkDateId workDateId});
}
