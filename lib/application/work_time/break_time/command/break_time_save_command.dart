import 'package:flutter/material.dart';

@immutable
class BreakTimeSaveCommand {
  final String workDateId;
  final int breakTime;
  const BreakTimeSaveCommand(
      {required this.workDateId, required this.breakTime});
}
