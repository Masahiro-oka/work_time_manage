import 'package:flutter/material.dart';

enum WorkType {
  workDate,
  atWork,
  leaveWork,
  workTimeTotal,
  overTime,
  midnightTime,
  breakTime,
  transportationExpenses,
  comment,
  delete
}

extension WorkTypeName on WorkType {
  static final typeNames = {
    WorkType.atWork: '出勤',
    WorkType.leaveWork: '退勤',
    WorkType.breakTime: '休憩',
    WorkType.workTimeTotal: '就業',
    WorkType.overTime: '残業',
    WorkType.midnightTime: '深夜',
    WorkType.transportationExpenses: '交通費',
    WorkType.comment: '備考',
    WorkType.delete: '削除',
  };
  String get typeName => typeNames[this].toString();
}

extension WorkTypeColor on WorkType {
  static final typeColors = {
    WorkType.atWork: Colors.amberAccent,
    WorkType.leaveWork: Colors.green,
    WorkType.breakTime: Colors.brown,
    WorkType.transportationExpenses: Colors.green,
    WorkType.comment: Colors.amberAccent,
    WorkType.delete: Colors.red
  };
  ColorSwatch<int>? get typeColor => typeColors[this];
}

extension WorkTypeIcon on WorkType {
  static final typeIcons = {
    WorkType.workDate: const Icon(Icons.calendar_today),
    WorkType.atWork: const Icon(Icons.work),
    WorkType.leaveWork: const Icon(Icons.door_back),
    WorkType.workTimeTotal: const Icon(Icons.access_time_sharp),
    WorkType.overTime: const Icon(Icons.more_time),
    WorkType.midnightTime: const Icon(Icons.nightlight_round),
    WorkType.breakTime: const Icon(Icons.free_breakfast),
    WorkType.transportationExpenses: const Icon(Icons.train),
    WorkType.comment: const Icon(Icons.comment),
    WorkType.delete: const Icon(Icons.delete_forever)
  };
  Icon? get typeIcon => typeIcons[this];
}
