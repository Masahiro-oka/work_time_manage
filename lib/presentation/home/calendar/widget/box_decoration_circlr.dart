import 'package:flutter/material.dart';

@immutable
class BoxDecorationCircle extends StatelessWidget {
  const BoxDecorationCircle({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF93848b),
        ),
        child: child);
  }
}
