import 'package:flutter/material.dart';

@immutable
class TransportationId {
  final int transportationId;
  const TransportationId({required this.transportationId});

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is TransportationId &&
            other.transportationId == transportationId);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ transportationId.hashCode;
}
