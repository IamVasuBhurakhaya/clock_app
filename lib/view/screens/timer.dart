import 'dart:async';
import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  const TimerClock({super.key});

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  int sec = 0;
  int min = 0;
  int hour = 0;
  Timer? timer;
  bool started = false;

  List<String> laps = [];

  void startStopTimer() {
    if (started) {
      timer?.cancel();
    } else {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          sec++;
          if (sec >= 60) {
            sec = 0;
            min++;
            if (min >= 60) {
              min = 0;
              hour++;
            }
          }
        });
      });
    }
    setState(() {
      started = !started;
    });
  }

  void reset() {
    timer?.cancel();
    setState(() {
      sec = 0;
      min = 0;
      hour = 0;
      started = false;
      laps.clear();
    });
  }

  void addLap() {
    String lap =
        "${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
    setState(() {
      laps.add(lap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${hour.toString().padLeft(2, '0')} : ${min.toString().padLeft(2, '0')} : ${sec.toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: startStopTimer,
                  child: Text(started ? 'Pause' : 'Start'),
                ),
                ElevatedButton(
                  onPressed: addLap,
                  child: const Icon(Icons.flag),
                ),
                ElevatedButton(
                  onPressed: reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Laps List
            Expanded(
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Lap ${index + 1}"),
                    trailing: Text(laps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
