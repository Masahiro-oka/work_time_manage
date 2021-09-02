import 'package:work_time_manage/domain/todo/todo.dart';
import 'package:work_time_manage/domain/todo/value/todo_date.dart';
import 'package:work_time_manage/domain/todo/value/todo_id.dart';

abstract class TodoRepositoryBase {
  Future<void> save(Todo todo);
  Future<void> delete(Todo todo);
  Future<Todo> findByDate(TodoDate date);
  Future<Todo> findById(TodoId id);
  Future<List<Todo>> findAll();
  Future<void> update(Todo todo);
}
