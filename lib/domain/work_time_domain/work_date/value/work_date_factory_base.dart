import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';

abstract class WorkDateFactoryBase {
  WorkDate create({required DateTime workDate});
}
