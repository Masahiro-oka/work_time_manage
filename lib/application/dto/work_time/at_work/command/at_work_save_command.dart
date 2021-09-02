import 'package:flutter/material.dart';

@immutable
class AtWorkSaveCommand {
  final String workDateId;
  final DateTime date;

  const AtWorkSaveCommand({required this.workDateId, required this.date});
}
