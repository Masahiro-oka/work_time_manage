import 'package:flutter/material.dart';

@immutable
class BuildBottomSheet {
  final Widget child;
  final BuildContext context;
  const BuildBottomSheet({required this.child, required this.context});

  Future<void> buildBottomSheet() async {
    return await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.96,
          child: child,
        ); //whatever you're returning, does not have to be a Container
      },
    );
  }
}
