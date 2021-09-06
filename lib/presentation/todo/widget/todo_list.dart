import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/todo/command/todo_update_command.dart';
import 'package:work_time_manage/presentation/todo/notifier/todo_change_notifier.dart';
import 'package:work_time_manage/presentation/widget/date_format.dart';

@immutable
class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.listQuantity}) : super(key: key);

  final int listQuantity;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodoChangeNotifier todoNotifier, child) {
      return Card(
        child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: (todoNotifier.list[listQuantity].isDone == 0) ? false : true,
            dense: true,
            title: (todoNotifier.list[listQuantity].isDone == 1)
                ? Text(
                    todoNotifier.list[listQuantity].text,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                : Text(todoNotifier.list[listQuantity].text),
            subtitle: Text(StringToDateFormat.dateTime
                .format(todoNotifier.list[listQuantity].date)),
            onChanged: (value) async {
              int _isDone;
              (value == true) ? _isDone = 1 : _isDone = 0;
              TodoUpdateCommand command = TodoUpdateCommand(
                  id: todoNotifier.list[listQuantity].id,
                  date: todoNotifier.list[listQuantity].date,
                  text: todoNotifier.list[listQuantity].text,
                  check: _isDone);
              todoNotifier.update(command);
            }),
      );
    });
  }
}
