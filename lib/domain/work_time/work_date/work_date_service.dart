import 'package:flutter/material.dart';
import 'package:work_time_manage/domain/work_time/work_date/work_date.dart';
import 'package:work_time_manage/domain/work_time/work_date/work_date_repository_base.dart';

@immutable
class WorkDateService {
  final WorkDateRepositoryBase _repository;

  const WorkDateService({required WorkDateRepositoryBase repository})
      : _repository = repository;

  Future<bool> exists(WorkDate workDate) async {
    final WorkDate? duplicateWorkDate =
        await _repository.findWorkDateData(workDate.workDate);
    return duplicateWorkDate != null;
  }
}
