import 'package:work_time_manage/domain/calendar/get_selest_data_base.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/infrastructure/transportation/db_transportation_repository.dart';

class GetSelectTransportationData implements GetSelectDataBase {
  @override
  Future<String> getSelectData(WorkDateId workDateId) async {
    final transportation = TransportationRepository();
    final transportationExpense =
        await transportation.findTransportationData(workDateId);
    return transportationExpense.transportationExpenses.toString();
  }
}
