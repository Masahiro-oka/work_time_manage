import 'package:flutter_test/flutter_test.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_delete_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_id_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_save_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/leave_work_app_service.dart';
import 'package:work_time_manage/infrastructure/work_time/leave_work/leave_work_factory.dart';
import 'package:work_time_manage/infrastructure/work_time/leave_work/leave_work_repository.dart';

void main() {
  final repository = LeaveWorkRepository();

  final app =
      LeaveWorkAppService(repository: repository, factory: LeaveWorkFactory());

  test("workDateIdの二重登録。", () async {
    await app.save(LeaveWorkSaveCommand(
        workDateId: "workDateId", date: DateTime(2021, 9, 1)));

    bool isSuccess = true;

    try {
      await app.save(LeaveWorkSaveCommand(
          workDateId: "workDateId", date: DateTime(2021, 9, 2)));
    } catch (e) {
      print(e);
      isSuccess = false;
    }

    expect(isSuccess, false);
  });

  test("LeaveTimeの新規登録", () async {
    await app.save(LeaveWorkSaveCommand(
        workDateId: "workDateId", date: DateTime(2021, 9, 1, 0, 0)));

    final target = await app.get(LeaveWorkIdCommand(id: "workDateId"));

    expect(target.date, DateTime(2021, 9, 1, 0, 0));
  });

  test("leaveworkdataのdelete", () async {
    await app.save(LeaveWorkSaveCommand(
        workDateId: "workDateId", date: DateTime(2021, 9, 1)));

    final getTarget = await app.get(LeaveWorkIdCommand(id: "workDateId"));
    await app.delete(LeaveWorkDeleteCommand(id: getTarget.workDateId));

    final time = await app.get(LeaveWorkIdCommand(id: getTarget.workDateId));

    expect(time, isNull);
  });
}
