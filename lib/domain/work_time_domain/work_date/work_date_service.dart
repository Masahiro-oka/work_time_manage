import 'package:work_time_manage/domain/work_time_domain/work_date/work_date.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/work_date_repository_base.dart';

class WorkDateService {
  final WorkDateRepositoryBase _repository;

  WorkDateService({required WorkDateRepositoryBase repository})
      : _repository = repository;

  Future<bool> exists(WorkDate workDate) async {
    final WorkDate? duplicateWorkDate =
        await _repository.findWorkDateData(workDate.workDate);
    return duplicateWorkDate != null;
  }
}
