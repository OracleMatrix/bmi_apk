import 'package:first_project/bars/left_bar.dart';
import 'package:first_project/bars/right_bar.dart';
import 'package:first_project/screen/new_options/radio_button.dart';
import 'package:first_project/screen/new_options/slider.dart';
import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  double _bmiResult = 19.9999;
  String _textResult = "";
  double _sliderValue = 20;
  int radioGroup = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 150,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _height,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 38,
                    fontWeight: FontWeight.w300,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    helperText: radioGroup == 1 ? "in CM (175)" : "in Inches",
                    border: InputBorder.none,
                    hintText: "Height",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 38,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _weight,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 38,
                    fontWeight: FontWeight.w300,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Weight",
                    helperText: radioGroup == 1 ? "in Kg (80)" : "in Pounds",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 38,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Metric Units",
                style: TextStyle(color: Colors.white),
              ),
              MyRadioButton(
                value: 1,
                groupValue: radioGroup,
                onChanged: (value) {
                  setState(() {
                    radioGroup = value!;
                  });
                },
              ),
              const Text("US Units", style: TextStyle(color: Colors.white)),
              MyRadioButton(
                value: 2,
                groupValue: radioGroup,
                onChanged: (value) {
                  setState(() {
                    radioGroup = value!;
                  });
                },
              ),
            ],
          ),
          TextButton(
            onPressed: radioGroup == 1 ? calculatorBmi : usCalculatorBmi,
            child: const Text(
              "Calculate",
              style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          _bmiResult != 19.9999
              ? MySlider(
                  sliderValue: _sliderValue,
                )
              : Container(),
          const SizedBox(
            height: 25,
          ),
          _bmiResult != 19.9999
              ? Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              _textResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.8)),
            ),
          ),
          _bmiResult > 25
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Need Help to reduce weight?!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 17),
                    ),
                    IconButton(
                      iconSize: 25,
                      onPressed: () {
                        showDialog(
                            context: context,
                            useSafeArea: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: const Text(
                                  "Some Advices...",
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text(
                                  "Eat healthy, exercise regularly, and get enough sleep.",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.help_outlined),
                      tooltip: "Need Help?",
                    ),
                  ],
                )
              : Container(),
          _bmiResult < 18.5
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Need Help to increase weight?!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 17.0),
                    ),
                    IconButton(
                      iconSize: 25,
                      onPressed: () {
                        showDialog(
                            context: context,
                            useSafeArea: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                title: const Text(
                                  "Some Advices...",
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text(
                                  "Eat More but healthy, exercise regularly, Use some medics by Doctor's order, and get enough sleep.",
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.help_outlined),
                      tooltip: "Need Help?",
                    ),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 50,
          ),
          const RightBar(
            barWidth: 120.0,
          ),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 80),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 150),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 120),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 150)
        ],
      ),
    );
  }

  void calculatorBmi() {
    double userHeight = double.parse(_height.text) / 100;
    double userWeight = double.parse(_weight.text);

    setState(() {
      _bmiResult = userWeight / (userHeight * userHeight);
      _sliderValue = _bmiResult;

      double idealWeight;
      if (radioGroup == 1) {
        idealWeight = radioGroup == 1
            ? (48.0 + (0.91 * (double.parse(_height.text) - 152.4)))
            : (45.5 + (0.91 * (double.parse(_height.text) - 152.4)));
      } else {
        idealWeight = radioGroup == 1
            ? (110 + (3.5 * (double.parse(_height.text) - 60)))
            : (100 + (3.5 * (double.parse(_height.text) - 60)));
      }

      String idealWeightRange =
          "Your ideal weight range is ${idealWeight.round() - 5} kg to ${idealWeight.round() + 5} kg";

      if (_bmiResult > 25) {
        _textResult = "You Are OverWeight! 🙁\n$idealWeightRange";
      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
        _textResult = "You Are Normal 😎\n$idealWeightRange";
      } else {
        _textResult = "You Are UnderWeight! 😥\n$idealWeightRange";
      }
    });
  }

  void usCalculatorBmi() {
    double userHeight = double.parse(_height.text);
    double userWeight = double.parse(_weight.text);

    setState(() {
      _bmiResult = (userWeight / (userHeight * userHeight)) * 703;
      _sliderValue = _bmiResult;

      double idealWeight;
      if (radioGroup == 2) {
        idealWeight = radioGroup == 2
            ? (110 + (3.5 * (double.parse(_height.text) - 60)))
            : (100 + (3.5 * (double.parse(_height.text) - 60)));
      } else {
        idealWeight = radioGroup == 2
            ? (48.0 + (0.91 * (double.parse(_height.text) * 2.54 - 152.4)))
            : (45.5 + (0.91 * (double.parse(_height.text) * 2.54 - 152.4)));
      }

      String idealWeightRange =
          "Your ideal weight range is ${(idealWeight - 5) / 2.20462} pounds to ${(idealWeight + 5) / 2.20462} pounds";

      if (_bmiResult > 25) {
        _textResult = "You Are OverWeight! 🙁\n$idealWeightRange";
      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
        _textResult = "You Are Normal 😎\n$idealWeightRange";
      } else {
        _textResult = "You Are UnderWeight! 😥\n$idealWeightRange";
      }
    });
  }
}
