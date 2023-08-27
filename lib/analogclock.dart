import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class AnalogWatch1 extends StatefulWidget {
  @override
  _AnalogWatch1State createState() => _AnalogWatch1State();
}

class _AnalogWatch1State extends State<AnalogWatch1> {
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
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Draw watch face
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),

              // Draw hour hand
              Transform.rotate(
                angle: -pi / 2 + (2 * pi * currentTime.hour / 12),
                child: Container(
                  width: 6,
                  height: 60,
                  color: Colors.black,
                ),
              ),

              // Draw minute hand
              Transform.rotate(
                angle: -pi / 2 + (2 * pi * currentTime.minute / 60),
                child: Container(
                  width: 4,
                  height: 80,
                  color: Colors.blue,
                ),
              ),

              // Draw second hand
              Transform.rotate(
                angle: -pi / 2 + (2 * pi * currentTime.second / 60),
                child: Container(
                  width: 2,
                  height: 90,
                  color: Colors.red,
                ),
              ),

              // Draw center dot
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
