import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  @override
  _ClockAppState createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  late Timer timer;
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analog and Digital Clock'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnalogClock(
              hours: currentTime.hour,
              minutes: currentTime.minute,
              seconds: currentTime.second,
            ),
            SizedBox(height: 20),
            DigitalClock(
              hours: currentTime.hour,
              minutes: currentTime.minute,
              seconds: currentTime.second,
            ),
          ],
        ),
      ),
    );
  }
}

class AnalogClock extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;

  const AnalogClock({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: CustomPaint(
        painter: AnalogClockPainter(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ),
      ),
    );
  }
}

class AnalogClockPainter extends CustomPainter {
  final int hours;
  final int minutes;
  final int seconds;

  AnalogClockPainter({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw analog clock design
    // ...
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DigitalClock extends StatelessWidget {
  final int hours;
  final int minutes;
  final int seconds;

  const DigitalClock({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    String timeText = '${hours.toString().padLeft(2, '0')}'
        ':${minutes.toString().padLeft(2, '0')}'
        ':${seconds.toString().padLeft(2, '0')}';

    return Text(
      timeText,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
