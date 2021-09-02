import 'package:flutter/cupertino.dart';

@immutable
class TodoId {
  final String value;

  TodoId({required this.value}) {
    if (value.isEmpty) throw StateError('値がありません');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) || (other is TodoId && other.value == value);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ value.hashCode;
}
