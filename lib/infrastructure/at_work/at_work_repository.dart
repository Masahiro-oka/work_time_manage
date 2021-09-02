import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/at_work_repository_base.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/at_work/value/at_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

import '../../presentation/widget/date_format.dart';
import '../db_storage.dart';

@immutable
class AtWorkRepository implements AtWorkRepositoryBase {
  final DbStorage _instance = DbStorage();
  static const String _tableName = 'at_work_time';

  AtWork fromMap(Map<String, dynamic> map) {
    AtWorkId _atWorkId = AtWorkId(atWorkId: map["at_work_id"]);
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"]);
    AtWorkTime _atWorkTime =
        AtWorkTime(atWorkTime: DateTime.parse(map["atWork"]));
    AtWork _atWork = AtWork(
        atWorkId: _atWorkId, workDateId: _workId, atWorkTime: _atWorkTime);
    return _atWork;
  }

  Map<String, dynamic> createTableRowMap(AtWork atWork) {
    Map<String, dynamic> _tableRow = {
      'workTime_id': atWork.workDateId.workDateId,
      'atWork':
          StringToDateFormat.hourMinute.format(atWork.atWorkTime.atWorkTime),
    };
    return _tableRow;
  }

  @override
  Future<void> insertData(AtWork atWork) async {
    final Database db = await _instance.dataBase;
    db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $_tableName(at_work_id, workTime_id, atWork) VALUES(?, ?, ?)',
          [
            atWork.atWorkId.atWorkId,
            atWork.workDateId.workDateId,
            atWork.atWorkTime.atWorkTime.toString(),
          ]);
    });
    print('出勤時間のデータをインサートしました');
  }

  @override
  Future<AtWork> findById(AtWorkId id) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [id]);
    if (rows.isEmpty) print(rows);
    return fromMap(rows.first);
  }

  @override
  Future<List<AtWork>> getAllTimeData() async {
    final Database db = await _instance.dataBase;
    const query = "SELECT * FROM $_tableName ORDER BY workTime_id DESC";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }

  @override
  Future<AtWork> findWorkData(WorkDateId workDateId) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE workTime_id = ?';
    final rows = await db.rawQuery(query, [workDateId.workDateId]);
    return fromMap(rows.first);
  }

  @override
  Future<void> deleteData(AtWork atWork) async {
    final Database db = await _instance.dataBase;
    db.delete(
      _tableName,
      where: "at_work_id = ?",
      whereArgs: [atWork.atWorkId.atWorkId],
    );
  }
}
