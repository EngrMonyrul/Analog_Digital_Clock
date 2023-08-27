import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'analogclock.dart';
import 'digitalclock.dart';
import 'digitalclock2.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: watch(),
    );
  }
}

class watch extends StatefulWidget {
  const watch({super.key});

  @override
  State<watch> createState() => _watchState();
}

class _watchState extends State<watch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AnalogWatch1()));
              },
              child: Text('Analog'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ClockApp()));
              },
              child: Text('Digital 1'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AnalogWatch3()));
              },
              child: Text('Digital 2'),
            )
          ],
        ),
      ),
    );
  }
}
