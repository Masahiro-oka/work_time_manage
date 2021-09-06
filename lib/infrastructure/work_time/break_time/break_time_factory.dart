import 'package:uuid/uuid.dart';
import 'package:work_time_manage/domain/work_time/break/break_time.dart';
import 'package:work_time_manage/domain/work_time/break/break_time_factory_base.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

class BreakTimeFactory implements BreakTimeFactoryBase {
  @override
  BreakTime create({required WorkDateId id, required BreakHour time}) {
    return BreakTime(
      breakId: BreakId(breakId: const Uuid().v4()),
      workDateId: id,
      breakHour: time,
    );
  }
}
