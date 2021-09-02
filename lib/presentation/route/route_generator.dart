import 'package:flutter/material.dart';

class RouteGenerator {
  static Future<dynamic> generateRoute(
      {required BuildContext context, required Widget thisChild}) {
    return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => thisChild,
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          barrierColor: Colors.white60,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ));
  }
}
