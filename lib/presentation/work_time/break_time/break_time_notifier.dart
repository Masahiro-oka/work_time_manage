import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/application/work_time/break_time/break_app_service.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_delete_command.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_id_command.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_save_command.dart';
import 'package:work_time_manage/application/work_time/break_time/dto/break_dto.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_command.dart';

class BreakTimeNotifier extends ChangeNotifier {
  final BreakAppService _appService;
  BreakTimeNotifier({required BreakAppService appService})
      : _appService = appService;

  List<BreakDto> _list = [];
  List<BreakDto> get list => List.unmodifiable(_list);

  Future<void> save(BreakTimeSaveCommand command) async {
    await _appService.save(command);
    findAll();
  }

  Future<void> delete(BreakTimeDeleteCommand command) async {
    await _appService.delete(command);
    findAll();
  }

  Future<BreakDto> findById(BreakTimeIdCommand command) async {
    BreakDto workDate = await _appService.findById(command);
    return workDate;
  }

  Future<BreakDto> findByDate(WorkDateCommand command) async {
    BreakDto workDate = await _appService.findByDate(command);
    return workDate;
  }

  Future<void> findAll() async {
    _list = await _appService.findAll();
    notifyListeners();
  }
}
