import 'package:flutter/material.dart';
import 'package:work_time_manage/application/enum/work_manage/work_time_enum.dart';
import 'package:work_time_manage/presentation/widget/floating_action_column/slide_floating_button.dart';

import 'floating_button.dart';

@immutable
class FloatingButtonColumn extends StatelessWidget {
  const FloatingButtonColumn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const <Widget>[
        SizedBox(height: 60, child: SlideFloatingButton()),
        FloatingButton(
          type: WorkType.leaveWork,
        ),
        FloatingButton(
          type: WorkType.atWork,
        ),
      ],
    );
  }
}
