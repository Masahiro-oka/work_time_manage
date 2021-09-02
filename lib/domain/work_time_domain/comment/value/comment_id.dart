import 'package:flutter/material.dart';

@immutable
class CommentId {
  final int commentId;
  const CommentId({required this.commentId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is CommentId && other.commentId == commentId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ commentId.hashCode;
}
