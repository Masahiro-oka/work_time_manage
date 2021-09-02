import 'package:flutter/material.dart';
import 'package:work_time_manage/application/todo/todo/todo_date_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_delete_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_dto.dart';
import 'package:work_time_manage/application/todo/todo/todo_id_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_register_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_update_command.dart';
import 'package:work_time_manage/domain/todo/todo.dart';
import 'package:work_time_manage/domain/todo/todo_factory_base.dart';
import 'package:work_time_manage/domain/todo/todo_repository_base.dart';
import 'package:work_time_manage/domain/todo/value/todo_contents.dart';
import 'package:work_time_manage/domain/todo/value/todo_date.dart';
import 'package:work_time_manage/domain/todo/value/todo_done.dart';
import 'package:work_time_manage/domain/todo/value/todo_id.dart';

@immutable
class TodoAppService {
  final TodoRepositoryBase _todoRepository;
  final TodoFactoryBase _todoFactory;

  const TodoAppService(
      {required TodoRepositoryBase repository,
      required TodoFactoryBase factory})
      : _todoRepository = repository,
        _todoFactory = factory;

  Future<void> register(TodoRegisterCommand command) async {
    final todo = _todoFactory.create(
        date: TodoDate(date: command.date),
        text: TodoContents(text: command.text),
        check: TodoDone(idDone: command.check));
    await _todoRepository.save(todo);
  }

  Future<TodoDto> get(TodoIdCommand command) async {
    final TodoId targetId = TodoId(value: command.id);
    final Todo todo = await _todoRepository.findById(targetId);

    final TodoDto todoDto = TodoDto(data: todo);
    return todoDto;
  }

  Future<TodoDto> findByDate(TodoDateCommand command) async {
    final TodoDate targetDate = TodoDate(date: command.date);
    final Todo todo = await _todoRepository.findByDate(targetDate);
    final TodoDto todoDto = TodoDto(data: todo);
    return todoDto;
  }

  Future<void> update(TodoUpdateCommand command) async {
    const String blank = '';
    final TodoId targetId = TodoId(value: command.id);
    final Todo todo = await _todoRepository.findById(targetId);
    final String contents = command.text ?? blank;
    final TodoContents newText = TodoContents(text: contents);
    final beforeCheck = todo.isDone.idDone;
    final int newCheck = command.check ?? beforeCheck;
    todo.changeCheck(newCheck: TodoDone(idDone: newCheck));
    todo.changeText(newText: newText);
    await _todoRepository.update(todo);
  }

  Future<void> delete(TodoDeleteCommand command) async {
    final TodoId targetId = TodoId(value: command.id);
    final Todo todo = await _todoRepository.findById(targetId);
    _todoRepository.delete(todo);
  }

  Future<List<TodoDto>> findAll() async {
    final List<Todo> list = await _todoRepository.findAll();
    return list.map((data) => TodoDto(data: data)).toList();
  }
}
