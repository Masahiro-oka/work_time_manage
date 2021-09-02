import 'package:work_time_manage/domain/todo/value/todo_done.dart';

import 'value/todo_contents.dart';
import 'value/todo_date.dart';
import 'value/todo_id.dart';

class Todo {
  final TodoId id;
  final TodoDate date;
  TodoContents _text;
  TodoDone _isDone;

  Todo(
      {required this.id,
      required this.date,
      required TodoContents text,
      required TodoDone check})
      : _text = text,
        _isDone = check;

  TodoContents get text => _text;
  TodoDone get isDone => _isDone;

  @override
  bool operator ==(Object other) {
    return identical(other, this) || (other is Todo && other.id == id);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;

  void changeText({required TodoContents newText}) {
    _text = newText;
  }

  void changeCheck({required TodoDone newCheck}) {
    _isDone = newCheck;
  }
}
