import 'dart:math';

import 'package:flutter/cupertino.dart';

@immutable
class TransportationExpenses {
  final int transportationExpenses;
  static final _thousandHours = pow(10, 6);
  static const _zeroYen = 0;

  TransportationExpenses({required this.transportationExpenses}) {
    if (transportationExpenses < _zeroYen) throw StateError('値は1以上にしてください。');
    if (transportationExpenses > _thousandHours)
      throw StateError('¥1,000,000以下の値にしてください。');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is TransportationExpenses &&
            other.transportationExpenses == transportationExpenses);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ transportationExpenses.hashCode;
}
