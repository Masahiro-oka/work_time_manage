import 'package:flutter/foundation.dart';

@immutable
class TodoDone {
  final int idDone;
  TodoDone({required this.idDone}) {
    if (idDone != 0 && idDone != 1) throw StateError('値は0か1のみです。');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is TodoDone && other.idDone == idDone);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ idDone.hashCode;
}
