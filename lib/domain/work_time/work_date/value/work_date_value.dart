import 'package:flutter/cupertino.dart';

@immutable
class WorkDateValue {
  final DateTime workDateValue;
  const WorkDateValue({required this.workDateValue});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is WorkDateValue && other.workDateValue == workDateValue);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ workDateValue.hashCode;
}
