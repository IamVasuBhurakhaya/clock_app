import 'package:flutter/material.dart';

class ReverseTimer extends StatefulWidget {
  const ReverseTimer({super.key});

  @override
  State<ReverseTimer> createState() => _ReverseTimerState();
}

class _ReverseTimerState extends State<ReverseTimer> {
  Duration duration = const Duration(hours: 1); // Default duration
  late Duration remainingTime;
  final TextEditingController _controller = TextEditingController();
  bool _timerStarted = false;

  @override
  void initState() {
    super.initState();
    remainingTime = duration;
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (remainingTime > Duration.zero) {
        setState(() {
          remainingTime = remainingTime - const Duration(seconds: 1);
        });
        startTimer();
      }
    });
  }

  void setDurationFromInput(String input) {
    final int? hours = int.tryParse(input);
    if (hours != null && hours >= 0) {
      setState(() {
        duration = Duration(hours: hours);
        remainingTime = duration;
        _timerStarted = true;
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final int h = remainingTime.inHours;
    final int m = remainingTime.inMinutes.remainder(60);
    final int s = remainingTime.inSeconds.remainder(60);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverse Timer"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_timerStarted) ...[
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter duration in hours',
                  ),
                  onSubmitted: setDurationFromInput,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setDurationFromInput(_controller.text);
                  },
                  child: const Text('Start Timer'),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    "$h : $m : $s",
                    style: const TextStyle(
                      fontSize: 48.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
