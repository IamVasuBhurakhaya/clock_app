import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime d = DateTime.now();
  late int h, m, s;

  void startClock() {
    h = DateTime.now().hour;
    m = DateTime.now().minute;
    s = DateTime.now().second;
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Clock"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            "$h : $m : $s",
            style: const TextStyle(
              fontSize: 48.0,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
