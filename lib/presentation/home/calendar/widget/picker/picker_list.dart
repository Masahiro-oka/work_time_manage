import 'package:flutter/cupertino.dart';

@immutable
class PickerList {
  const PickerList({required this.list, required this.scrollController});
  final List<Widget> list;
  final FixedExtentScrollController scrollController;

  Widget pickerList() {
    return Expanded(
      child: CupertinoPicker(
        scrollController: scrollController,
        looping: true,
        itemExtent: 30,
        children: list,
        onSelectedItemChanged: (_) {},
      ),
    );
  }
}
