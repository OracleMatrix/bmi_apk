import 'package:first_project/screen/body.dart';
import 'package:flutter/material.dart';

class MyMainApp extends StatefulWidget {
  const MyMainApp({super.key});

  @override
  State<MyMainApp> createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[900],
        body: const MyBody(),
      ),
    );
  }
}
