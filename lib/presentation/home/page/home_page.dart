import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/presentation/home/calendar/notifier/calendar_notifier.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/calendar_list_generate.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/picker/calendar_roll_picker.dart';
import 'package:work_time_manage/presentation/home/drawer/drawer_body.dart';
import 'package:work_time_manage/presentation/widget/floating_action_column/floating_column.dart';
import 'package:work_time_manage/presentation/widget/home_app_bar_title.dart';

@immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Consumer(
      builder: (context, CalendarNotifier calendar, child) {
        return Scaffold(
          drawer: const DrawerBody(),
          appBar: AppBar(
            bottom: (calendar.showCalendar)
                ? PreferredSize(
                    preferredSize: Size.fromHeight(size.size.height / 5),
                    child: CalendarRollPicker())
                : null,
            title: const HomeAppBarMonthTitle(),
          ),
          body: const CalendarListGenerate(),
          floatingActionButton: const FloatingButtonColumn(),
        );
      },
    );
  }
}
