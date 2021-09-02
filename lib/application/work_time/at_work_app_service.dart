import 'package:work_time_manage/application/dto/work_time/at_work/command/at_work_delete_command.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/command/at_work_save_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_id_command.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work_factory_base.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work_repository_base.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

import '../dto/work_time/at_work/at_work_dto.dart';
import '../dto/work_time/at_work/command/at_work_id_command.dart';

class AtWorkAppService {
  final AtWorkRepositoryBase _repository;
  final AtWorkFactoryBase _factory;

  AtWorkAppService({
    required AtWorkRepositoryBase repository,
    required AtWorkFactoryBase factory,
  })  : _repository = repository,
        _factory = factory;

  Future<void> save(AtWorkSaveCommand command) async {
    final atWork = _factory.create(
      workDateId: WorkDateId(workDateId: command.workDateId),
      atWorkTime: AtWorkTime(atWorkTime: command.date),
    );
    _repository.insertData(atWork);
  }

  Future<AtWorkDto> get(AtWorkIdCommand command) async {
    final AtWorkId targetId = AtWorkId(atWorkId: command.id);
    final AtWork atWork = await _repository.findById(targetId);
    final AtWorkDto atWorkDto = AtWorkDto(data: atWork);
    return atWorkDto;
  }

  Future<AtWorkDto> findByDate(WorkDateIdCommand command) async {
    final WorkDateId targetDate = WorkDateId(workDateId: command.id);
    final AtWork atWorkData = await _repository.findWorkData(targetDate);
    final AtWorkDto atWork = AtWorkDto(data: atWorkData);
    return atWork;
  }

  Future<void> delete(AtWorkDeleteCommand command) async {
    final AtWorkId targetId = AtWorkId(atWorkId: command.id);
    final AtWork todo = await _repository.findById(targetId);
    _repository.deleteData(todo);
  }

  Future<List<AtWorkDto>> findAll() async {
    final List<AtWork> list = await _repository.getAllTimeData();
    return list.map((data) => AtWorkDto(data: data)).toList();
  }
}
