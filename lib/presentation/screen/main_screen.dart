import 'package:flutter/material.dart';
import 'start_workout_screen.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _selectedMinutes = 5; // 초기 선택값: 5분

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
                  Text(
                    'Break Timer',
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$_selectedMinutes minutes',
                    style: TextStyle(
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
                // GoRouter.of(context).go('/alim', breakTime: _selectedMinutes); // Navigate to '/alim' route
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  StartWorkOutScreen(breakTime: _selectedMinutes),
                  ),
                );
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 96,
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
