import 'package:flutter/material.dart';
import 'package:work_time_manage/application/enum/check/check_box.dart';

@immutable
class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({Key? key, required this.boxType}) : super(key: key);

  final CheckBox boxType;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: true,
        title: Text(boxType.name),
        onChanged: (_) {});
  }
}
