import 'package:flutter/material.dart';
import 'start_workout_screen.dart';

class StartWorkOutScreen extends StatefulWidget {
  const StartWorkOutScreen({super.key});

  @override
  State<StartWorkOutScreen> createState() => _StartWorkOutScreenState();
}

class _StartWorkOutScreenState extends State<StartWorkOutScreen> {
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
                    '',
                    style: TextStyle(
                      fontSize: 24,
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
              onPressed: () {},
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
