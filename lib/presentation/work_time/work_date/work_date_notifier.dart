import 'package:flutter/material.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_delete_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_id_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_save_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/work_date_dto.dart';
import 'package:work_time_manage/application/work_time/work_date_app_service.dart';

class WorkDateNotifier extends ChangeNotifier {
  final WorkDateAppService _appService;

  WorkDateNotifier({required WorkDateAppService appService})
      : _appService = appService;

  List<WorkDateDto> _list = [];
  List<WorkDateDto> get list => _list;

  Future<void> save(WorkDateSaveCommand command) async {
    await _appService.register(command);
    findAll();
  }

  Future<void> delete(WorkDateDeleteCommand command) async {
    await _appService.delete(command);
    findAll();
  }

  Future<WorkDateDto> findById(WorkDateIdCommand command) async {
    WorkDateDto workDate = await _appService.findById(command);
    return workDate;
  }

  Future<WorkDateDto> findByDate(WorkDateCommand command) async {
    WorkDateDto workDate = await _appService.findByDate(command);
    return workDate;
  }

  Future<void> findAll() async {
    _list = await _appService.findAll();
    notifyListeners();
  }
}
