import 'package:clock_app/view/screens/analogue_clock.dart';
import 'package:clock_app/view/screens/digital_clock.dart';
import 'package:clock_app/view/screens/home_page.dart';
import 'package:clock_app/view/screens/reverse_timer.dart';
import 'package:clock_app/view/screens/strap_watch.dart';
import 'package:clock_app/view/screens/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'analogue_clock': (context) => const Analogue(),
        'digital_clock': (context) => const DigitalClock(),
        'timer': (context) => const TimerClock(),
        'strap_watch': (context) => const StrapWatch(),
        'reverse_timer': (context) => const ReverseTimer(),
      },
    );
  }
}
