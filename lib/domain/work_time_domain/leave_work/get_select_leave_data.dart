import 'package:work_time_manage/domain/calendar/get_selest_data_base.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/infrastructure/leave_work/leave_work_repository.dart';

import '../../../presentation/widget/date_format.dart';

class GetSelectLeaveData implements GetSelectDataBase {
  @override
  Future<String> getSelectData(WorkDateId workDateId) async {
    final leaveWorkData = LeaveWorkRepository();
    LeaveWork leaveWork = await leaveWorkData.findWorkData(workDateId);
    return StringToDateFormat.hourMinute
        .format(leaveWork.leaveWorkTime.leaveWorkTime);
  }
}
