import 'package:flutter/material.dart';

class DialogBase {
  static Future showAlertDialog(BuildContext context, Widget child) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
