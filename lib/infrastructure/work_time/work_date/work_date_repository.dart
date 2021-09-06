import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_value.dart';
import 'package:work_time_manage/domain/work_time/work_date/work_date.dart';
import 'package:work_time_manage/domain/work_time/work_date/work_date_repository_base.dart';

import '../../../presentation/widget/date_format.dart';
import '../../db_storage.dart';

@immutable
class WorkDateRepository implements WorkDateRepositoryBase {
  final DbStorage _instance;
  static const String _tableName = 'work_time';

  const WorkDateRepository({required DbStorage storage}) : _instance = storage;

  WorkDate fromMap(Map<String, dynamic> map) {
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"].toString());
    WorkDateValue _workDate = WorkDateValue(
        workDateValue: StringToDateFormat.dateTime.parse('${map["date"]}'));
    return WorkDate(workDateId: _workId, workDate: _workDate);
  }

  @override
  Future<void> insertData(WorkDate workDate) async {
    final Database db = await _instance.dataBase;
    db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $_tableName(workTime_id, date) VALUES(?, ?)', [
        workDate.workDateId.workDateId,
        StringToDateFormat.dateTime.format(workDate.workDate.workDateValue),
      ]);
    });
  }

  @override
  Future<List<WorkDate>> getBetWeenWorkDateData(
      DateTime startDate, DateTime endDate) async {
    String _startDate = StringToDateFormat.dateTime.format(startDate);
    String _endDate = StringToDateFormat.dateTime.format(endDate);
    final Database db = await _instance.dataBase;
    final query =
        "SELECT * FROM $_tableName WHERE date BETWEEN '$_startDate' AND '$_endDate'";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }

  @override
  Future<List<WorkDate>> getAllWorkDateData() async {
    final Database db = await _instance.dataBase;
    const query = "SELECT * FROM $_tableName ORDER BY workTime_id DESC";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }

  @override
  Future<WorkDate> findById(WorkDateId id) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [id]);
    if (rows.isEmpty) print(rows);
    return fromMap(rows.first);
  }

  @override
  Future<WorkDate> findWorkDateData(WorkDateValue workDate) async {
    final Database db = await _instance.dataBase;
    final _dateFormatTime =
        StringToDateFormat.dateTime.format(workDate.workDateValue);
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final result =
        Result(() async => await db.rawQuery(query, [_dateFormatTime]));
    if (result.isError) {
      final rows = await db.rawQuery(query, [_dateFormatTime]);
      return fromMap(rows.first);
    } else {
      throw StateError("null");
    }
  }

  @override
  Future<void> deleteData(WorkDate workDate) async {
    final Database db = await _instance.dataBase;
    db.delete(
      _tableName,
      where: "workTime_id = ?",
      whereArgs: [workDate.workDateId.workDateId],
    );
  }
}
