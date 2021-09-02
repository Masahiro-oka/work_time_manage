import 'package:flutter/material.dart';

@immutable
class AtWorkTime {
  final DateTime atWorkTime;
  const AtWorkTime({required this.atWorkTime});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is AtWorkTime && other.atWorkTime == atWorkTime);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ atWorkTime.hashCode;
}
