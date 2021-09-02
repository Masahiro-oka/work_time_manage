import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

abstract class GetSelectDataBase {
  Future getSelectData(WorkDateId workDateId);
}
