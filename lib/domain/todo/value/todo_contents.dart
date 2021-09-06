import 'package:flutter/material.dart';

@immutable
class TodoContents {
  final String text;
  TodoContents({required this.text}) {
    if (text.length > 100 || text.isEmpty) throw StateError('contentsは100文字以内');
  }
  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is TodoContents && other.text == text);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ text.hashCode;
}
