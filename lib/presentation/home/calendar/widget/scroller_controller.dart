import 'package:flutter/cupertino.dart';

class ScrollerController extends ChangeNotifier {
  final ScrollController controller = ScrollController();

  void slideToday(DateTime dateTime) {
    final DateTime now = DateTime.now();
    double position = 0;
    if (now.day > 20) position = controller.position.maxScrollExtent;
    if (now.day < 20) position = controller.position.viewportDimension;
    if (now.day < 10) position = controller.position.minScrollExtent;
    Future<void> _controller = controller.animateTo(
      position,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 700),
    );
    if (dateTime == DateTime(now.year, now.month)) _controller;
  }
}
