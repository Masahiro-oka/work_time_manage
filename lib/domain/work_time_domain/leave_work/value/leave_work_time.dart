import 'package:flutter/material.dart';

@immutable
class LeaveWorkTime {
  final DateTime leaveWorkTime;
  const LeaveWorkTime({required this.leaveWorkTime});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is LeaveWorkTime && other.leaveWorkTime == leaveWorkTime);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ leaveWorkTime.hashCode;
}
