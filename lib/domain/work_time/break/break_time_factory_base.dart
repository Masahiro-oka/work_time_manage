import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

import 'break_time.dart';

@immutable
abstract class BreakTimeFactoryBase {
  BreakTime create({required WorkDateId id, required BreakHour time});
}
