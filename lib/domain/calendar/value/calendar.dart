import 'package:flutter/cupertino.dart';

@immutable
class Calendar {
  const Calendar({required this.calendar});
  final DateTime calendar;

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is Calendar && other.calendar == calendar);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ calendar.hashCode;

  Calendar dateChange(DateTime other) {
    final afterDate = Calendar(calendar: other);
    return afterDate;
  }
}
