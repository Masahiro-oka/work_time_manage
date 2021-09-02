import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/leave_work_repository_base.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_id.dart';
import 'package:work_time_manage/domain/work_time_domain/leave_work/value/leave_work_time.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

import '../db_storage.dart';

@immutable
class LeaveWorkRepository implements LeaveWorkRepositoryBase {
  final DbStorage _instance = DbStorage();
  static const String _tableName = 'leave_work_time';

  static LeaveWork fromMap(Map<String, dynamic> map) {
    LeaveWorkId _leaveWorkId = LeaveWorkId(leaveWorkId: map["leave_work_id"]);
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"]);
    LeaveWorkTime _leaveWorkTime =
        LeaveWorkTime(leaveWorkTime: DateTime.parse(map["leaveWork"]));
    return LeaveWork(
        leaveWorkId: _leaveWorkId,
        workDateId: _workId,
        leaveWorkTime: _leaveWorkTime);
  }

  @override
  Future<void> insertData(LeaveWork leaveWork) async {
    final Database db = await _instance.dataBase;
    db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $_tableName(leave_work_id, workTime_id, leaveWork) VALUES(?, ?, ?)',
          [
            leaveWork.leaveWorkId.leaveWorkId,
            leaveWork.workDateId.workDateId,
            leaveWork.leaveWorkTime.leaveWorkTime.toString(),
          ]);
    });
    print('退勤時間のデータをインサートしました');
  }

  @override
  Future<List<LeaveWork>> getAllTimeData() async {
    final Database db = await _instance.dataBase;
    const query = "SELECT * FROM $_tableName ORDER BY workTime_id DESC";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }

  @override
  Future<LeaveWork> findWorkData(WorkDateId workDateId) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE workTime_id = ?';
    final rows = await db.rawQuery(query, [workDateId.workDateId]);
    print(rows.first);
    return fromMap(rows.first);
  }

  @override
  Future<LeaveWork> findById(LeaveWorkId id) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [id]);
    if (rows.isEmpty) print(rows);
    return fromMap(rows.first);
  }

  @override
  Future<void> deleteData(LeaveWork leaveWork) async {
    final Database db = await _instance.dataBase;
    db.delete(
      _tableName,
      where: "leave_work_id = ?",
      whereArgs: [leaveWork.leaveWorkId.leaveWorkId],
    );
  }
}
