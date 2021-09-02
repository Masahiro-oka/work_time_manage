import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/application/todo/todo/todo_date_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_delete_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_dto.dart';
import 'package:work_time_manage/application/todo/todo/todo_id_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_register_command.dart';
import 'package:work_time_manage/application/todo/todo/todo_update_command.dart';
import 'package:work_time_manage/application/todo/todo_app_service.dart';

class TodoChangeNotifier extends ChangeNotifier {
  final TodoAppService _appService;
  TodoChangeNotifier({required TodoAppService appService})
      : _appService = appService;

  List<TodoDto> _list = [];
  List<TodoDto> get list => _list;
  DateTime date = DateTime.now();

  void sort() {
    _list.sort((a, b) => a.date.compareTo(b.date));
  }

  Future<void> saveTodo(TodoRegisterCommand command) async {
    await _appService.register(command);
    findAll();
  }

  Future<void> delete(TodoDeleteCommand command) async {
    await _appService.delete(command);
    findAll();
  }

  Future<TodoDto> findById(TodoIdCommand command) async {
    TodoDto todoDto = await _appService.get(command);
    return todoDto;
  }

  Future<TodoDto> findByDate(TodoDateCommand command) async {
    TodoDto todoDto = await _appService.findByDate(command);
    return todoDto;
  }

  Future<void> update(TodoUpdateCommand command) async {
    await _appService.update(command);
    findAll();
  }

  Future<void> findAll() async {
    _list = await _appService.findAll();
    sort();
    notifyListeners();
  }

  void dateChange(DateTime other) {
    date = other;
    notifyListeners();
  }
}
