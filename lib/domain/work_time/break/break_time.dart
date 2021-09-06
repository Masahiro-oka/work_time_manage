import 'package:work_time_manage/domain/work_time/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

class BreakTime {
  final BreakId breakId;
  final WorkDateId workDateId;
  BreakHour _breakHour;

  BreakTime(
      {required this.breakId,
      required this.workDateId,
      required BreakHour breakHour})
      : _breakHour = breakHour;

  BreakHour get breakTime => _breakHour;

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is BreakTime && other.breakId == breakId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ breakId.hashCode;

  void changeBreakTime({required BreakHour newTime}) {
    _breakHour = newTime;
  }
}
