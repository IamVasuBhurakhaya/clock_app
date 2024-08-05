import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Strap Watch"),
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 9,
              child: CircularProgressIndicator(
                value: s / 60,
                color: Colors.blue,
                strokeWidth: 1.5,
                backgroundColor: Colors.blue.shade200,
              ),
            ),
            Transform.scale(
              scale: 7,
              child: CircularProgressIndicator(
                value: m / 60,
                color: Colors.green.shade900,
                backgroundColor: Colors.green.shade200,
                strokeWidth: 3,
              ),
            ),
            Transform.scale(
              scale: 5,
              child: CircularProgressIndicator(
                value: (h % 12) / 12,
                color: Colors.blue.shade900,
                backgroundColor: Colors.blue.shade200,
                strokeWidth: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
