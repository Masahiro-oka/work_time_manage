import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:work_time_manage/domain/work_time/at_work/at_work.dart';
import 'package:work_time_manage/domain/work_time/at_work/at_work_factory_base.dart';
import 'package:work_time_manage/domain/work_time/at_work/value/at_work_id.dart';
import 'package:work_time_manage/domain/work_time/at_work/value/at_work_time.dart';
import 'package:work_time_manage/domain/work_time/work_date/value/work_date_id.dart';

@immutable
class AtWorkFactory implements AtWorkFactoryBase {
  @override
  AtWork create(
      {required AtWorkTime atWorkTime, required WorkDateId workDateId}) {
    return AtWork(
      atWorkId: AtWorkId(atWorkId: const Uuid().v4()),
      workDateId: workDateId,
      atWorkTime: atWorkTime,
    );
  }
}
