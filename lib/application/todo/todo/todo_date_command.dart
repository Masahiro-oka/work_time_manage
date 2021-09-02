import 'package:flutter/cupertino.dart';

@immutable
class TodoDateCommand {
  final DateTime date;
  const TodoDateCommand({required this.date});
}
