import 'package:flutter/material.dart';

@immutable
class BreakHour {
  final int breakHour;
  static const _thousandMinutes = 1000;
  static const _zeroMinutes = 0;
  BreakHour({required this.breakHour}) {
    if (breakHour > _thousandMinutes) throw StateError('1000分以下で入力してください');
    if (breakHour < _zeroMinutes) throw StateError('0時間以上で入力してください');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is BreakHour && other.breakHour == breakHour);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ breakHour.hashCode;
}
