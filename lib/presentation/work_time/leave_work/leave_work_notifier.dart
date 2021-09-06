import 'package:flutter/material.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_delete_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_id_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_save_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/dto/leave_work_dto.dart';
import 'package:work_time_manage/application/work_time/leave_work/leave_work_app_service.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_id_command.dart';

class LeaveWorkNotifier extends ChangeNotifier {
  final LeaveWorkAppService _appService;

  LeaveWorkNotifier({required LeaveWorkAppService appService})
      : _appService = appService;

  List<LeaveWorkDto> _list = [];
  List<LeaveWorkDto> get list => List.unmodifiable(_list);

  void sort() {
    _list.sort((a, b) => a.date.compareTo(b.date));
  }

  Future<void> save(LeaveWorkSaveCommand command) async {
    await _appService.save(command);
    findAll();
  }

  Future<void> delete(LeaveWorkDeleteCommand command) async {
    await _appService.delete(command);
    findAll();
  }

  Future<LeaveWorkDto> findById(LeaveWorkIdCommand command) async {
    LeaveWorkDto workDate = await _appService.get(command);
    return workDate;
  }

  Future<LeaveWorkDto> findByDate(WorkDateIdCommand command) async {
    LeaveWorkDto workDate = await _appService.findByDate(command);
    return workDate;
  }

  Future<void> findAll() async {
    _list = await _appService.findAll();
    notifyListeners();
  }
}
