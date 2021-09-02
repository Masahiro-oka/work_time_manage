import 'package:flutter/foundation.dart';

@immutable
class TodoDone {
  final int idDone;
  TodoDone({required this.idDone}) {
    if (idDone < 0 && idDone > 1) throw StateError('Only 0 or 1');
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is TodoDone && other.idDone == idDone);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ idDone.hashCode;
}
