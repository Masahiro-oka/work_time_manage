import 'package:flutter/material.dart';

@immutable
class AtWorkId {
  final String atWorkId;
  const AtWorkId({required this.atWorkId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is AtWorkId && other.atWorkId == atWorkId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ atWorkId.hashCode;
}
