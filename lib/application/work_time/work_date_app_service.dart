import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_delete_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_save_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/work_date_dto.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_factory_base.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date_repository_base.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date_service.dart';

import '../dto/work_time/work_date/command/work_date_command.dart';
import '../dto/work_time/work_date/command/work_date_id_command.dart';

class WorkDateAppService {
  final WorkDateRepositoryBase _repository;
  final WorkDateFactoryBase _factory;
  final WorkDateService _workDateService;

  const WorkDateAppService(
      {required WorkDateRepositoryBase repository,
      required WorkDateFactoryBase factory,
      required WorkDateService workDateService})
      : _repository = repository,
        _factory = factory,
        _workDateService = workDateService;

  Future<void> register(WorkDateSaveCommand command) async {
    final workDate = _factory.create(workDate: command.workDate);
    // if (await _workDateService.exists(workDate))
    //   throw StateError("workDateは既に存在しています");
    _repository.insertData(workDate);
  }

  Future<WorkDateDto> findById(WorkDateIdCommand command) async {
    final WorkDateId targetId = WorkDateId(workDateId: command.id);
    final WorkDate workDate = await _repository.findById(targetId);
    final WorkDateDto todoDto = WorkDateDto(data: workDate);
    return todoDto;
  }

  Future<WorkDateDto> findByDate(WorkDateCommand command) async {
    final WorkDateValue targetDate = WorkDateValue(workDateValue: command.date);
    final WorkDate workDate = await _repository.findWorkDateData(targetDate);
    final WorkDateDto workDateDto = WorkDateDto(data: workDate);
    return workDateDto;
  }

  Future<void> delete(WorkDateDeleteCommand command) async {
    final WorkDateId targetId = WorkDateId(workDateId: command.id);
    final WorkDate workDate = await _repository.findById(targetId);
    _repository.deleteData(workDate);
  }

  Future<List<WorkDateDto>> findAll() async {
    final List<WorkDate> list = await _repository.getAllWorkDateData();
    return list.map((data) => WorkDateDto(data: data)).toList();
  }
}
