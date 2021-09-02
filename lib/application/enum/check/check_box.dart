enum CheckBox {
  attendanceTimeCheck,
  workTimeCheck,
  overTimeCheck,
  midnightTimeCheck,
  breakTimeCheck,
  transportationExpenseCheck,
  commentCheck,
  todoCheck
}

extension TypeName on CheckBox {
  static final names = {
    CheckBox.attendanceTimeCheck: "出退勤時間",
    CheckBox.workTimeCheck: "就業時間",
    CheckBox.overTimeCheck: "残業時間",
    CheckBox.midnightTimeCheck: "深夜時間",
    CheckBox.breakTimeCheck: "休憩時間",
    CheckBox.transportationExpenseCheck: "交通費",
    CheckBox.commentCheck: "備考",
    CheckBox.todoCheck: "Todo"
  };

  String get name => names[this].toString();
}
