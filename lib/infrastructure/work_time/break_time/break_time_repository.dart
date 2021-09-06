import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/domain/work_time/break/break_repository_base.dart';
import 'package:work_time_manage/domain/work_time/break/break_time.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_hour.dart';
import 'package:work_time_manage/domain/work_time/break/value/break_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_value.dart';

import '../../db_storage.dart';

class BreaKTimeRepository implements BreakTimeRepositoryBase {
  final DbStorage _instance;
  static const String _tableName = 'break_time_table';

  const BreaKTimeRepository({required DbStorage instance})
      : _instance = instance;

  BreakTime fromMap(Map<String, dynamic> map) {
    final BreakId _id = map["break_id"];
    final WorkDateId _workId = map["workTime_id"];
    final BreakHour _breakTime = map["breakTime"];
    final breakTime =
        BreakTime(breakId: _id, workDateId: _workId, breakHour: _breakTime);
    return breakTime;
  }

  @override
  Future<void> deleteData(BreakId breakId) async {
    final Database db = await _instance.dataBase;
    db.delete(
      _tableName,
      where: "at_work_id = ?",
      whereArgs: [breakId],
    );
  }

  @override
  Future<BreakTime> findById(BreakId breakId) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [breakId]);
    if (rows.isEmpty) print(rows);
    return fromMap(rows.first);
  }

  @override
  Future<BreakTime> findWorkData(WorkDateValue workDate) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [workDate.workDateValue]);
    return fromMap(rows.first);
  }

  @override
  Future<List<BreakTime>> getAllTimeData() async {
    final Database db = await _instance.dataBase;
    const query = "SELECT * FROM $_tableName ORDER BY workTime_id DESC";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }

  @override
  Future<void> insertData(BreakTime breakTime) async {
    final Database db = await _instance.dataBase;
    db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $_tableName(break_id, workTime_id, breakTime) VALUES(?, ?, '
          '?)',
          [
            breakTime.breakId.breakId,
            breakTime.workDateId.workDateId,
            breakTime.breakTime.breakHour,
          ]);
    });
  }

  @override
  Future<void> update(BreakTime breakTime) async {
    final Database db = await _instance.dataBase;
    db.update(_tableName, {
      "break_id": breakTime.breakId.breakId,
      "workTime_id": breakTime.workDateId.workDateId,
      "breakTime": breakTime.breakTime.breakHour,
    });
  }
}
