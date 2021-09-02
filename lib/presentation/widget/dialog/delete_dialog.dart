import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_time_manage/application/enum/work_manage/work_time_enum.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_value.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key, required this.selectDate}) : super(key: key);

  final WorkDateValue selectDate;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: const Text('この日の勤務情報を削除します。\nよろしいですか？'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            print(selectDate.workDateValue);
          },
          child: Text(
            '削除',
            style: TextStyle(color: WorkType.delete.typeColor),
          ),
        ),
      ],
    );
  }
}
