import 'package:flutter/material.dart';

@immutable
class BreakTimeUpdateCommand {
  final String id;
  final int? _time;

  const BreakTimeUpdateCommand({required this.id, required int? time})
      : _time = time;

  int? get time => _time;
}
