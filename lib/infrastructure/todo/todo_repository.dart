import 'package:sqflite/sqflite.dart';
import 'package:work_time_manage/domain/todo/todo.dart';
import 'package:work_time_manage/domain/todo/todo_repository_base.dart';
import 'package:work_time_manage/domain/todo/value/todo_contents.dart';
import 'package:work_time_manage/domain/todo/value/todo_date.dart';
import 'package:work_time_manage/domain/todo/value/todo_done.dart';
import 'package:work_time_manage/domain/todo/value/todo_id.dart';

import '../db_storage.dart';

class TodoRepository implements TodoRepositoryBase {
  final DbStorage _instance;
  static const String _tableName = 'todo';

  const TodoRepository({required DbStorage instance}) : _instance = instance;

  Todo fromMap(Map<String, dynamic> map) {
    final _todoId = map["id"];
    final _date = DateTime.parse(map["date"]);
    final _text = map["text"];
    final _check = map["done"];
    final _todo = Todo(
      id: TodoId(value: _todoId),
      date: TodoDate(date: _date),
      text: TodoContents(text: _text),
      check: TodoDone(idDone: _check),
    );
    return _todo;
  }

  Map<String, dynamic> toMap({required Todo todo}) {
    var map = <String, dynamic>{
      "date": todo.date.date.toString(),
      "text": todo.text.text,
      "done": todo.isDone.idDone,
    };
    return map;
  }

  @override
  Future<void> save(Todo todo) async {
    final Database db = await _instance.dataBase;
    db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO $_tableName(id, date, text, done) VALUES(?, ?, ?, ?)', [
        todo.id.value,
        todo.date.date.toString(),
        todo.text.text,
        todo.isDone.idDone,
      ]);
    });
  }

  @override
  Future<void> update(Todo todo) async {
    final Database db = await _instance.dataBase;
    await db.update(_tableName, toMap(todo: todo),
        where: "id=?", whereArgs: [todo.id.value]);
  }

  @override
  Future<void> delete(Todo todo) async {
    final Database db = await _instance.dataBase;
    db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [todo.id.value],
    );
  }

  @override
  Future<Todo> findByDate(TodoDate date) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE date = ?';
    final rows = await db.rawQuery(query, [date.toString()]);
    return fromMap(rows.first);
  }

  @override
  Future<Todo> findById(TodoId id) async {
    final Database db = await _instance.dataBase;
    const query = 'SELECT * FROM $_tableName WHERE id = ?';
    final rows = await db.rawQuery(query, [id.value]);
    return fromMap(rows.first);
  }

  @override
  Future<List<Todo>> findAll() async {
    final Database db = await _instance.dataBase;
    const query = "SELECT * FROM $_tableName ORDER BY id DESC";
    final List<Map<String, dynamic>> result = await db.rawQuery(query);
    if (result.isEmpty) return [];
    return result.map((map) => fromMap(map)).toList();
  }
}
