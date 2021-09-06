import 'package:flutter/cupertino.dart';

@immutable
class WorkDateSaveCommand {
  final DateTime workDate;
  const WorkDateSaveCommand({required this.workDate});
}
