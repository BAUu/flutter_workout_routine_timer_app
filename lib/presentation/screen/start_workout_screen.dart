import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'breaktime_screen.dart';
import 'main_screen.dart';

class StartWorkOutScreen extends StatefulWidget {
  final double breakTime;
  final Stopwatch stopwatch;
  final PermissionStatus notificationPermission;

  const StartWorkOutScreen(
      {super.key,
      required this.breakTime,
      required this.stopwatch,
      required this.notificationPermission});

  @override
  State<StartWorkOutScreen> createState() => _StartWorkOutScreenState();
}

class _StartWorkOutScreenState extends State<StartWorkOutScreen> {
  late Stopwatch stopwatch; // Create a Stopwatch instance
  final duration = const Duration(milliseconds: 1); // Timer tick duration
  bool isRunning = false; // Variable to track timer state
  late PermissionStatus _notification;


  @override
  void initState() {
    resetStopwatch(); // Reset and start the stopwatch when the screen is initialized
    super.initState();
    _notification = widget.notificationPermission;
  }

  // Method to reset and start the stopwatch
  void resetStopwatch() {
    stopwatch = Stopwatch(); // Create a new Stopwatch instance
    stopwatch.reset(); // Reset the stopwatch
    startTimer(); // Start the timer
  }

  // Timer tick handler function
  void handleTick(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {}); // Update UI
    }
  }

  // Start the timer
  void startTimer() {
    Timer.periodic(duration, handleTick);
    stopwatch.start();
  }

  // Stop the timer
  void stopTimer() {
    stopwatch.stop();
    stopwatch.reset();
  }

  // Format the time for display
  String formattedTime() {
    final milliseconds = stopwatch.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();

    final formattedMilliseconds =
        (milliseconds % 1000).toString().padLeft(3, '0');
    final formattedSeconds = (seconds % 60).toString().padLeft(2, '0');
    final formattedMinutes = (minutes % 60).toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds.$formattedMilliseconds';
  }

  Future<bool?> _showExitConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App?'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) async {
      if (didPop) {
        return;
      }
      final bool shouldExit = await _showExitConfirmationDialog() ?? false;
      if (shouldExit) {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff1D1E23),
        body: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff959EA2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 340,
                  height: 120,
                  child: const Center(
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
                  color: const Color(0xff959EA2),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 340,
                height: 240,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Start WorkOut',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'April16thTTF-Safety',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      formattedTime(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontFamily: 'April16thTTF-Safety',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              stopwatch.reset(); // 스탑와치 초기화
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Reset',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xff525E66),
                borderRadius: BorderRadius.circular(360 / 2),
                border: Border.all(color: Colors.black, width: 6),
              ),
              child: TextButton(
                onPressed: () {
                  // Navigate back to the BreakTimeScreen and reset the stopwatch
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreakTimeScreen(
                        breakTime: widget.breakTime,
                        stopwatch: stopwatch,
                        notificationPermission: _notification,
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Break\nTime\n➡️',
                      style: TextStyle(
                        fontSize: 62,
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
      ),
    );
  }
}
