import 'package:flutter/material.dart';

@immutable
class LeaveWorkId {
  final String leaveWorkId;
  const LeaveWorkId({required this.leaveWorkId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is LeaveWorkId && other.leaveWorkId == leaveWorkId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ leaveWorkId.hashCode;
}
