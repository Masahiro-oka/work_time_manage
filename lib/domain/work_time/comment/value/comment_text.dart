import 'package:flutter/foundation.dart';

@immutable
class CommentText {
  final String commentText;
  static const hundredCharacters = 100;

  CommentText({required this.commentText}) {
    if (commentText.length > hundredCharacters)
      throw StateError('100文字以下で入力してください');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is CommentText && other.commentText == commentText);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ commentText.hashCode;
}
