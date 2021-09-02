import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:work_time_manage/domain/todo/todo.dart';
import 'package:work_time_manage/domain/todo/todo_factory_base.dart';
import 'package:work_time_manage/domain/todo/value/todo_contents.dart';
import 'package:work_time_manage/domain/todo/value/todo_date.dart';
import 'package:work_time_manage/domain/todo/value/todo_done.dart';
import 'package:work_time_manage/domain/todo/value/todo_id.dart';

@immutable
class TodoFactory implements TodoFactoryBase {
  @override
  Todo create(
      {required TodoDate date,
      required TodoContents text,
      required TodoDone check}) {
    return Todo(
        id: TodoId(value: const Uuid().v4()),
        date: date,
        text: text,
        check: check);
  }
}
