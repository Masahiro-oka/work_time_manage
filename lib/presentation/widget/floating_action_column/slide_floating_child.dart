import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:work_time_manage/application/enum/work_manage/work_time_enum.dart';

class SlideFloatingChild {
  SlideFloatingChild({required this.context, required this.workType});

  final WorkType workType;
  final BuildContext context;

  SpeedDialChild speedDialChild() {
    return SpeedDialChild(
        foregroundColor: Colors.white,
        child: workType.typeIcon,
        backgroundColor: workType.typeColor,
        label: workType.typeName,
        onTap: () {
          print(workType.typeName);
        },
        labelStyle: const TextStyle(fontWeight: FontWeight.w500));
  }
}
