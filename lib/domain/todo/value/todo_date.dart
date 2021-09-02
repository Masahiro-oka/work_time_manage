import 'package:flutter/foundation.dart';

@immutable
class TodoDate {
  final DateTime date;
  const TodoDate({required this.date});

  @override
  bool operator ==(Object other) {
    return identical(other, this) || (other is TodoDate && other.date == date);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ date.hashCode;
}
