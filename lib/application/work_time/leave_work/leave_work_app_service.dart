import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_delete_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_id_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/command/leave_work_save_command.dart';
import 'package:work_time_manage/application/work_time/leave_work/dto/leave_work_dto.dart';
import 'package:work_time_manage/application/work_time/work_date/command/work_date_id_command.dart';
import 'package:work_time_manage/domain/work_time/leave_work/leave_work.dart';
import 'package:work_time_manage/domain/work_time/leave_work/leave_work_factory_base.dart';
import 'package:work_time_manage/domain/work_time/leave_work/leave_work_repository_base.dart';
import 'package:work_time_manage/domain/work_time/leave_work/value/leave_work_id.dart';
import 'package:work_time_manage/domain/work_time/leave_work/value/leave_work_time.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

class LeaveWorkAppService {
  final LeaveWorkRepositoryBase _repository;
  final LeaveWorkFactoryBase _factory;

  LeaveWorkAppService(
      {required LeaveWorkRepositoryBase repository,
      required LeaveWorkFactoryBase factory})
      : _repository = repository,
        _factory = factory;

  Future<void> save(LeaveWorkSaveCommand command) async {
    try {
      final factory = _factory.create(
        workDateId: WorkDateId(workDateId: command.workDateId),
        leaveWorkTime: LeaveWorkTime(leaveWorkTime: command.date),
      );
      await _repository.insertData(factory);
    } on DatabaseException {
      throw StateError("DatabaseException");
    }
  }

  Future<LeaveWorkDto> get(LeaveWorkIdCommand command) async {
    final LeaveWorkId targetId = LeaveWorkId(leaveWorkId: command.id);
    final LeaveWork leaveWork = await _repository.findById(targetId);
    final LeaveWorkDto leaveWorkDto = LeaveWorkDto(data: leaveWork);
    return leaveWorkDto;
  }

  Future<LeaveWorkDto> findByDate(WorkDateIdCommand command) async {
    final WorkDateId targetDate = WorkDateId(workDateId: command.id);
    final LeaveWork atWorkData = await _repository.findWorkData(targetDate);
    final LeaveWorkDto atWork = LeaveWorkDto(data: atWorkData);
    return atWork;
  }

  Future<void> delete(LeaveWorkDeleteCommand command) async {
    final LeaveWorkId targetId = LeaveWorkId(leaveWorkId: command.id);
    final LeaveWork todo = await _repository.findById(targetId);
    _repository.deleteData(todo);
  }

  Future<List<LeaveWorkDto>> findAll() async {
    final List<LeaveWork> list = await _repository.getAllTimeData();
    return list.map((data) => LeaveWorkDto(data: data)).toList();
  }
}
