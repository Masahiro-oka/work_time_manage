import 'package:flutter/material.dart';

@immutable
class BreakId {
  final int breakId;
  const BreakId({required this.breakId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is BreakId && other.breakId == breakId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ breakId.hashCode;
}
