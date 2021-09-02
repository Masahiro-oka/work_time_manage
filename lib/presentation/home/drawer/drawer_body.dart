import 'package:flutter/material.dart';
import 'package:work_time_manage/application/enum/check/check_box.dart';
import 'package:work_time_manage/presentation/home/drawer/widget/chek_box_tile.dart';
import 'package:work_time_manage/presentation/todo/page/todo_list_body.dart';
import 'package:work_time_manage/presentation/widget/build_bottom_sheet.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: size.height / 14.5,
                child: const DrawerHeader(
                  child: Text('WorkManager'),
                  decoration: BoxDecoration(),
                ),
              ),
              ListTile(
                subtitle: Text('表示項目'),
              ),
              const CheckBoxTile(
                boxType: CheckBox.attendanceTimeCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.workTimeCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.overTimeCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.midnightTimeCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.breakTimeCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.transportationExpenseCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.commentCheck,
              ),
              const CheckBoxTile(
                boxType: CheckBox.todoCheck,
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.task),
                title: Text("Todo一覧"),
                onTap: () {
                  BuildBottomSheet(
                          context: context, child: const TodoListBody())
                      .buildBottomSheet();
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text("集計"),
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text("ファイル"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("設定"),
              ),
              ListTile(
                leading: Icon(Icons.smartphone),
                title: Text("アプリについて"),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
