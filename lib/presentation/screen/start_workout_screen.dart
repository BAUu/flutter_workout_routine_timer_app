import 'dart:async';

import 'package:flutter/material.dart';

import 'breaktime_screen.dart';

class StartWorkOutScreen extends StatefulWidget {
  final double breakTime;

  const StartWorkOutScreen({super.key, required this.breakTime});

  @override
  State<StartWorkOutScreen> createState() => _StartWorkOutScreenState();
}




class _StartWorkOutScreenState extends State<StartWorkOutScreen> {
  Stopwatch stopwatch = Stopwatch(); // Create a Stopwatch instance
  final duration = const Duration(microseconds: 1); // Timer tick duration
  bool isRunning = false; // Variable to track timer state


  @override
  void initState() {
    startTimer();
    super.initState();
  }
  void handleTick() {
    if (stopwatch.isRunning) {
      setState(() {}); // UI 업데이트
      Timer(duration, handleTick);
    }
  }

  void startTimer() {
    Timer(duration, handleTick);
    stopwatch.start();
  }

  void stopTimer() {
    stopwatch.stop();
    stopwatch.reset();
  }

  String formattedTime() {
    final milliseconds = stopwatch.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();

    final formattedMilliseconds = (milliseconds % 1000).toString().padLeft(3, '0');
    final formattedSeconds = (seconds % 60).toString().padLeft(2, '0');
    final formattedMinutes = (minutes % 60).toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds.$formattedMilliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D1E23),
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff959EA2),
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 340,
                height: 120,
                child: Center(
                  child: Text(
                    'Workout Routine Timer',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff959EA2),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 340,
              height: 240,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Start WorkOut',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'April16thTTF-Safety',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    formattedTime(),
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              color: Color(0xff525E66),
              borderRadius: BorderRadius.circular(360 / 2),
              border: Border.all(color: Colors.black, width: 6),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BreakTimeScreen(breakTime: widget.breakTime),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'To\nBreak\nTime',
                    style: TextStyle(
                      fontSize: 72,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'April16thTTF-Promise',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
