import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime d = DateTime.now();

  void startClock() {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('analogue_clock');
              },
              child: Text("Analogue"),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('digital_clock');
              },
              child: Text("Digital Clock"),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('timer');
              },
              child: Text("timer"),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('strap_watch');
              },
              child: Text("Stap Watch"),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('reverse_timer');
              },
              child: Text("Reverse Timer"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
