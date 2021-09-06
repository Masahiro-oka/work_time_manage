import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/todo/command/todo_register_command.dart';
import 'package:work_time_manage/presentation/todo/notifier/todo_change_notifier.dart';

import '../../widget/date_format.dart';

class TodoAdd extends StatelessWidget {
  TodoAdd({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodoChangeNotifier todoNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                TodoRegisterCommand command = TodoRegisterCommand(
                    date: todoNotifier.date, text: _controller.text, check: 0);
                await todoNotifier.saveTodo(command);
                todoNotifier.dateChange(DateTime.now());
                Navigator.pop(context);
              },
              child: const Text('保存'),
            )
          ],
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Todoの追加',
                alignLabelWithHint: true,
                border: InputBorder.none,
              ),
              controller: _controller,
              onChanged: (text) {
                _controller.text = text;
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title:
                  Text(StringToDateFormat.dateTime.format(todoNotifier.date)),
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (date) {
                          todoNotifier.dateChange(date);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
