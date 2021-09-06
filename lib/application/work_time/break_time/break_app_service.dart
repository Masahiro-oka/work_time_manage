import 'package:flutter/material.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_delete_command.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_id_command.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_save_command.dart';
import 'package:work_time_manage/application/work_time/break_time/command/break_time_update_command.dart';
import 'package:work_time_manage/application/work_time/break_time/dto/break_dto.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_command.dart';
import 'package:work_time_manage/domain/work_time/break/break_repository_base.dart';
import 'package:work_time_manage/domain/work_time/break/break_time_factory_base.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_value.dart';

@immutable
class BreakAppService {
  final BreakTimeRepositoryBase _repository;
  final BreakTimeFactoryBase _factory;

  const BreakAppService(
      {required BreakTimeRepositoryBase repository,
      required BreakTimeFactoryBase factory})
      : _repository = repository,
        _factory = factory;

  Future<void> save(BreakTimeSaveCommand command) async {
    final _breakTime = _factory.create(
        id: WorkDateId(workDateId: command.workDateId),
        time: BreakHour(breakHour: command.breakTime));
    _repository.insertData(_breakTime);
  }

  Future<BreakDto> findByDate(WorkDateCommand command) async {
    final WorkDateValue target = WorkDateValue(workDateValue: command.date);
    final workDate = await _repository.findWorkData(target);
    final breakTime = BreakDto(data: workDate);
    return breakTime;
  }

  Future<BreakDto> findById(BreakTimeIdCommand command) async {
    final id = BreakId(breakId: command.id);
    final findData = await _repository.findById(id);
    final breakTime = BreakDto(data: findData);
    return breakTime;
  }

  Future<List<BreakDto>> findAll() async {
    final _list = await _repository.getAllTimeData();
    return _list.map((data) => BreakDto(data: data)).toList();
  }

  Future<void> update(BreakTimeUpdateCommand command) async {
    final targetId = BreakId(breakId: command.id);
    final breakTime = await _repository.findById(targetId);
    final beforeTime = breakTime.breakTime.breakHour;
    breakTime.changeBreakTime(
        newTime: BreakHour(breakHour: command.time ?? beforeTime));
    _repository.update(breakTime);
  }

  Future<void> delete(BreakTimeDeleteCommand command) async {
    final targetId = BreakId(breakId: command.id);
    _repository.deleteData(targetId);
  }
}
