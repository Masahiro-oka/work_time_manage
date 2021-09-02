import 'package:flutter/cupertino.dart';
import 'package:work_time_manage/domain/work_time_domain/comment/comment.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';

@immutable
abstract class CommentRepositoryBase {
  Future<void> insertData(Comment comment);
  Future<List<Comment>> getAllComment();
  Future<Comment> findComment(WorkDateId workDateId);
  Future<void> deleteData(Comment comment);
}
