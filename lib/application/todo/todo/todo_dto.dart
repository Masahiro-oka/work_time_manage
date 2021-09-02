import 'package:flutter/foundation.dart';
import 'package:work_time_manage/domain/todo/todo.dart';

@immutable
class TodoDto {
  final String id;
  final DateTime date;
  final String text;
  final int isDone;
  TodoDto({required Todo data})
      : id = data.id.value,
        date = data.date.date,
        text = data.text.text,
        isDone = data.isDone.idDone;
}
