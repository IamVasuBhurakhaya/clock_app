import 'dart:math';

import 'package:flutter/material.dart';

class Analogue extends StatefulWidget {
  const Analogue({super.key});

  @override
  State<Analogue> createState() => _AnalogueState();
}

class _AnalogueState extends State<Analogue> {
  DateTime d = DateTime.now();
  late int h, m, s;

  void startClock() {
    h = DateTime.now().hour;
    m = DateTime.now().minute;
    s = DateTime.now().second;

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        d = DateTime.now();
      });
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
    Size size = MediaQuery.of(context).size;
    double clockRadius = min(size.width * 0.4, size.height * 0.4);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Analogue Clock"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Clock Face
            const SizedBox(
              height: 400,
              width: 400,
              child: Image(
                image: NetworkImage(
                  "https://www.clockparts.com/wp-content/uploads/2021/09/round-metal-clock-dials.jpg",
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: s * (pi * 2) / 60,
                child: Divider(
                  color: Colors.red,
                  thickness: 3,
                  indent: 120,
                  endIndent: size.width * 0.5 - 16,
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: m * (pi * 2) / 60,
                child: Divider(
                  color: Colors.black,
                  thickness: 4,
                  indent: 160,
                  endIndent: size.width * 0.5 - 16,
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: h * (pi * 2) / 12,
                child: Divider(
                  color: Colors.black,
                  thickness: 6,
                  indent: 200,
                  endIndent: size.width * 0.5 - 16,
                ),
              ),
            ),
            // Center Dot
            Container(
              width: clockRadius * 0.1,
              height: clockRadius * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
