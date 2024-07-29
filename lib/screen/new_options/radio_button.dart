// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  int value;
  int groupValue;
  ValueChanged<int?> onChanged;
  MyRadioButton(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  int group = 1;
  @override
  Widget build(BuildContext context) {
    return Radio(
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: widget.onChanged,
    );
  }
}
