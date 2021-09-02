import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/presentation/todo/notifier/todo_change_notifier.dart';
import 'package:work_time_manage/presentation/todo/widget/todo_list.dart';

class TodoListBody extends StatelessWidget {
  const TodoListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodoChangeNotifier todoNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Todo一覧'),
        ),
        body: ListView.builder(
          itemCount: todoNotifier.list.length,
          itemBuilder: (context, listQuantity) => TodoList(
            listQuantity: listQuantity,
          ),
        ),
      );
    });
  }
}
