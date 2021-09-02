import 'package:intl/intl.dart';

class StringToDateFormat {
  static final dateTimeAndWeekDay = DateFormat.yMMMEd('ja_JP');
  static final dateMonth = DateFormat.yMMM('ja_JP');
  static final weekDay = DateFormat.E('ja_JP');
  static final dateTime = DateFormat('yyyy-MM-dd');
  static final hourMinute = DateFormat.Hm('ja_JP');
  static final hourMinuteSecond = DateFormat.Hms('ja_JP');
}
