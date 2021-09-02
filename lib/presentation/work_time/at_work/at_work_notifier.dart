import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/at_work_dto.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/command/at_work_delete_command.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/command/at_work_id_command.dart';
import 'package:work_time_manage/application/dto/work_time/at_work/command/at_work_save_command.dart';
import 'package:work_time_manage/application/dto/work_time/work_date/command/work_date_id_command.dart';
import 'package:work_time_manage/application/work_time/at_work_app_service.dart';

class AtWorkNotifier extends ChangeNotifier {
  final AtWorkAppService _appService;

  AtWorkNotifier({required AtWorkAppService appService})
      : _appService = appService;

  List<AtWorkDto> _list = [];
  List<AtWorkDto> get list => _list;

  void sort() {
    _list.sort((a, b) => a.date.compareTo(b.date));
  }

  Future<void> save(AtWorkSaveCommand command) async {
    await _appService.save(command);
    await findAll();
  }

  Future<void> delete(AtWorkDeleteCommand command) async {
    await _appService.delete(command);
    findAll();
  }

  Future<AtWorkDto> findById(AtWorkIdCommand command) async {
    AtWorkDto workDate = await _appService.get(command);
    return workDate;
  }

  Future<AtWorkDto> findByDate(WorkDateIdCommand command) async {
    AtWorkDto workDate = await _appService.findByDate(command);
    return workDate;
  }

  Future<void> findAll() async {
    _list = await _appService.findAll();
    sort();
    notifyListeners();
  }
}
