import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/todo/todo.dart';
import 'package:work_time_manage/domain/todo/value/todo_contents.dart';
import 'package:work_time_manage/domain/todo/value/todo_date.dart';
import 'package:work_time_manage/domain/todo/value/todo_done.dart';

@immutable
abstract class TodoFactoryBase {
  Todo create(
      {required TodoDate date,
      required TodoContents text,
      required TodoDone check});
}
