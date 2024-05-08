import 'package:flutter/material.dart';
import 'start_workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key,});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _selectedMinutes = 5; // 초기 선택값: 5분

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text(
                    'Break Time Set',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${_selectedMinutes.toInt()} minutes',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                  Slider(
                    value: _selectedMinutes,
                    min: 1,
                    max: 10,
                    divisions: 9, // Slider의 구분선 수
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMinutes = newValue;
                      });
                    },
                  ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartWorkOutScreen(breakTime: _selectedMinutes, stopwatch: Stopwatch()),
                  ),
                );
              },
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 88,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'April16thTTF-Promise',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
