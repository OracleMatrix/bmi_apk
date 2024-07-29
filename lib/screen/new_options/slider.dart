import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  final double sliderValue;

  const MySlider({super.key, required this.sliderValue});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    Color sliderColor;
    if (widget.sliderValue < 18.5) {
      sliderColor = Colors.orange;
    } else if (widget.sliderValue >= 18.5 && widget.sliderValue <= 25) {
      sliderColor = Colors.green;
    } else {
      sliderColor = Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sliderColor,
        ),
        child: Slider(
          value: widget.sliderValue,
          min: 0,
          max: 40,
          onChanged: null,
        ),
      ),
    );
  }
}
