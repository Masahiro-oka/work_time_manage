import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/break/break_time.dart';
import 'package:work_time_manage/domain/work_time_domain/break/value/break_id.dart';

@immutable
abstract class BreakTimeFactory {
  BreakTime create({required BreakId id, required BreakTime time});
}
