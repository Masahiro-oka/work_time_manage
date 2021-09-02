import 'package:uuid/uuid.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_factory_base.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';

class WorkDateFactory implements WorkDateFactoryBase {
  @override
  WorkDate create({required DateTime workDate}) {
    return WorkDate(
        workDateId: WorkDateId(workDateId: const Uuid().v4()),
        workDate: WorkDateValue(workDateValue: workDate));
  }
}
