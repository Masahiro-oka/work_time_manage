class TodoRegisterCommand {
  final DateTime date;
  final String text;
  final int check;

  TodoRegisterCommand(
      {required this.date, required this.text, required this.check});
}
