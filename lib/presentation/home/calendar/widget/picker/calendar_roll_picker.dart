import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/calendar/command/calendar_save_command.dart';
import 'package:work_time_manage/presentation/home/calendar/notifier/calendar_notifier.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/picker/picker_list.dart';

@immutable
class CalendarRollPicker extends StatelessWidget {
  CalendarRollPicker({Key? key}) : super(key: key);

  static const int monthIndex = 12;
  //todo 無限スクロールの実装
  static const int year = 100000;
  final _monthList = List<Text>.generate(monthIndex, (i) => Text('${++i}'));
  final _yearList = List<Text>.generate(year, (i) => Text('$i'));

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, CalendarNotifier calendar, child) {
      final date = calendar.calendar.date;
      final _yearController =
          FixedExtentScrollController(initialItem: date.year);
      final _monthController =
          FixedExtentScrollController(initialItem: date.month - 1);
      final _yearPickerList =
          PickerList(list: _yearList, scrollController: _yearController);
      final _monthPickerList =
          PickerList(list: _monthList, scrollController: _monthController);
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          await calendar.save(CalendarSaveCommand(
              date: DateTime(_yearController.selectedItem,
                  _monthController.selectedItem + 1)));
          calendar.show();
        },
        child: Row(
          children: [
            _yearPickerList.pickerList(),
            _monthPickerList.pickerList(),
          ],
        ),
      );
    });
  }
}
