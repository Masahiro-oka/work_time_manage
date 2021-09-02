import 'package:work_time_manage/domain/calendar/get_selest_data_base.dart';
import 'package:work_time_manage/domain/work_time_domain/comment/comment.dart';
import 'package:work_time_manage/domain/work_time_domain/work_date/value/work_date_id.dart';
import 'package:work_time_manage/infrastructure/comment/db_comment_repository.dart';

class GetSelectCommentData implements GetSelectDataBase {
  @override
  Future<String> getSelectData(WorkDateId workDateId) async {
    final _commentData = DbCommentRepository();
    Comment commentData = await _commentData.findComment(workDateId);
    return commentData.commentText.commentText;
  }
}
