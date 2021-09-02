import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:work_time_manage/application/calendar/calendar_app_service.dart';
import 'package:work_time_manage/application/todo/todo_app_service.dart';
import 'package:work_time_manage/application/work_time/at_work_app_service.dart';
import 'package:work_time_manage/application/work_time/work_date_app_service.dart';
import 'package:work_time_manage/domain/todo/todo_repository_base.dart';
import 'package:work_time_manage/infrastructure/calendar/calendar_repository.dart';
import 'package:work_time_manage/infrastructure/todo/todo_factory.dart';
import 'package:work_time_manage/infrastructure/todo/todo_repository.dart';
import 'package:work_time_manage/infrastructure/work_date/work_date_factory.dart';
import 'package:work_time_manage/presentation/home/calendar/notifier/calendar_notifier.dart';
import 'package:work_time_manage/presentation/home/calendar/widget/scroller_controller.dart';
import 'package:work_time_manage/presentation/home/page/home_page.dart';
import 'package:work_time_manage/presentation/todo/notifier/todo_change_notifier.dart';
import 'package:work_time_manage/presentation/work_time/at_work/at_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/leave_work/leave_work_notifier.dart';
import 'package:work_time_manage/presentation/work_time/work_date/work_date_notifier.dart';

import 'application/work_time/leave_work_app_service.dart';
import 'domain/calendar/calendar_repository_base.dart';
import 'domain/work_time_domain/at_work/at_work_repository_base.dart';
import 'domain/work_time_domain/comment/comment_repository_base.dart';
import 'domain/work_time_domain/leave_work/leave_work_repository_base.dart';
import 'domain/work_time_domain/transportation_expenses/transportation_repository_base.dart';
import 'domain/work_time_domain/work_date/work_date_repository_base.dart';
import 'domain/work_time_domain/work_date/work_date_service.dart';
import 'infrastructure/at_work/at_work_factory.dart';
import 'infrastructure/at_work/at_work_repository.dart';
import 'infrastructure/comment/db_comment_repository.dart';
import 'infrastructure/db_storage.dart';
import 'infrastructure/leave_work/leave_work_factory.dart';
import 'infrastructure/leave_work/leave_work_repository.dart';
import 'infrastructure/shared_prefs_storage.dart';
import 'infrastructure/transportation/db_transportation_repository.dart';
import 'infrastructure/work_date/work_date_repository.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<DbStorage>(create: (_) => DbStorage()),
    Provider<ShardPrefsStorage>(create: (_) => ShardPrefsStorage()),
    Provider<CalendarRepositoryBase>(
        create: (context) =>
            CalendarRepository(instance: context.read<ShardPrefsStorage>())),
    Provider<WorkDateRepositoryBase>(
        create: (context) =>
            WorkDateRepository(storage: context.read<DbStorage>())),
    Provider<AtWorkRepositoryBase>(create: (context) => AtWorkRepository()),
    Provider<LeaveWorkRepositoryBase>(
        create: (context) => LeaveWorkRepository()),
    // Provider<BreakRepositoryBase>(create: (context) => DbBreakRepository()),
    Provider<TransportationRepositoryBase>(
        create: (context) => TransportationRepository()),
    Provider<CommentRepositoryBase>(create: (context) => DbCommentRepository()),
    Provider<TodoRepositoryBase>(
        create: (context) =>
            TodoRepository(instance: context.read<DbStorage>())),
    ChangeNotifierProvider<CalendarNotifier>(
        create: (context) => CalendarNotifier(
              appService: CalendarAppService(
                  repository: context.read<CalendarRepositoryBase>()),
            )..convertList()),
    ChangeNotifierProvider<TodoChangeNotifier>(
        create: (context) => TodoChangeNotifier(
            appService: TodoAppService(
                factory: TodoFactory(),
                repository: context.read<TodoRepositoryBase>()))
          ..findAll()),
    ChangeNotifierProvider<WorkDateNotifier>(
        create: (context) => WorkDateNotifier(
            appService: WorkDateAppService(
                repository: context.read<WorkDateRepositoryBase>(),
                factory: WorkDateFactory(),
                workDateService: WorkDateService(
                    repository: context.read<WorkDateRepositoryBase>())))
          ..findAll()),
    ChangeNotifierProvider<AtWorkNotifier>(
      create: (context) => AtWorkNotifier(
        appService: AtWorkAppService(
            repository: context.read<AtWorkRepositoryBase>(),
            factory: AtWorkFactory()),
      )..findAll(),
    ),
    ChangeNotifierProvider<LeaveWorkNotifier>(
        create: (context) => LeaveWorkNotifier(
            appService: LeaveWorkAppService(
                factory: LeaveWorkFactory(), repository: LeaveWorkRepository()))
          ..findAll()),
    ChangeNotifierProvider<ScrollerController>(
        create: (context) => ScrollerController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      theme: ThemeData(
          fontFamily: "KosugiMaru",
          primaryColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
