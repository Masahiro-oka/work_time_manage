import 'package:flutter/cupertino.dart';

@immutable
class WorkDateId {
  final String workDateId;
  const WorkDateId({required this.workDateId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is WorkDateId && other.workDateId == workDateId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ workDateId.hashCode;
}
