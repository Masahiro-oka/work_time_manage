import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:work_time_manage/application/enum/work_manage/work_time_enum.dart';
import 'package:work_time_manage/presentation/todo/page/todo_add.dart';
import 'package:work_time_manage/presentation/widget/floating_action_column/slide_floating_child.dart';

import '../build_bottom_sheet.dart';

class SlideFloatingButton extends StatelessWidget {
  const SlideFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      direction: SpeedDialDirection.Up,
      icon: Icons.add,
      activeIcon: Icons.close,
      activeBackgroundColor: Colors.white,
      overlayOpacity: 0.95,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
            foregroundColor: Colors.white,
            child: const Icon(Icons.task),
            backgroundColor: Colors.blue,
            label: 'タスク',
            onTap: () {
              BuildBottomSheet(context: context, child: TodoAdd())
                  .buildBottomSheet();
            },
            labelStyle: const TextStyle(fontWeight: FontWeight.w500)),
        SlideFloatingChild(context: context, workType: WorkType.delete)
            .speedDialChild(),
        SlideFloatingChild(context: context, workType: WorkType.comment)
            .speedDialChild(),
        SlideFloatingChild(
                context: context, workType: WorkType.transportationExpenses)
            .speedDialChild(),
        SlideFloatingChild(context: context, workType: WorkType.breakTime)
            .speedDialChild(),
      ],
    );
  }
}
