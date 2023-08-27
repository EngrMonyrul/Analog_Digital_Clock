import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class AnalogWatch3 extends StatefulWidget {
  @override
  _AnalogWatch3State createState() => _AnalogWatch3State();
}

class _AnalogWatch3State extends State<AnalogWatch3> {
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
        title: Text('Analog Watch'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              CustomPaint(
                painter: WatchPainter(
                  hours: currentTime.hour,
                  minutes: currentTime.minute,
                  seconds: currentTime.second,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: AnalogClock(
                  hours: currentTime.hour,
                  minutes: currentTime.minute,
                  seconds: currentTime.second,
                ),
              ),
              Positioned(
                top: 100,
                left: 80,
                child: Text(
                  '${currentTime.hour.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 130,
                left: 80,
                child: Text(
                  '${currentTime.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WatchPainter extends CustomPainter {
  final int hours;
  final int minutes;
  final int seconds;

  WatchPainter({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw watch hands
    // ...
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
