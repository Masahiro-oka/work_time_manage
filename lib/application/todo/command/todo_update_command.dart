class TodoUpdateCommand {
  final String id;
  final DateTime date;
  final String? _text;
  final int? _check;

  TodoUpdateCommand(
      {required this.id,
      required this.date,
      required String? text,
      required int? check})
      : _text = text,
        _check = check;

  String? get text => _text;
  int? get check => _check;
}
