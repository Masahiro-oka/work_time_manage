import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time/comment/value/comment_id.dart';
import 'package:work_time_manage/domain/work_time/comment/value/comment_text.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

@immutable
class Comment {
  final CommentId commentId;
  final WorkDateId workDateId;
  final CommentText commentText;
  const Comment(
      {required this.commentId,
      required this.workDateId,
      required this.commentText});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is Comment && other.commentId == commentId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ commentId.hashCode;

  static Comment fromMap(Map<String, dynamic> map) {
    CommentId _commentId = CommentId(commentId: int.parse('${map["id"]}'));
    WorkDateId _workId = WorkDateId(workDateId: map["workTime_id"]);
    CommentText _commentText = CommentText(commentText: map['comment']);
    return Comment(
        commentId: _commentId, workDateId: _workId, commentText: _commentText);
  }
}
