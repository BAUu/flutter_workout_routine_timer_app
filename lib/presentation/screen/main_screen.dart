import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workout_routine_timer_app/core/local_notification_setting.dart';

import '../../core/permission.dart';
import 'start_workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _selectedMinutes = 1;
  late PermissionStatus _notificationPermission;

  @override
  void initState() {
    super.initState();
    initLocalNotification();
  }

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
                    '$_selectedMinutes minutes',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'April16thTTF-Safety',
                    ),
                  ),
                  Slider(
                    value: _selectedMinutes,
                    min: 0.5,
                    max: 10,
                    divisions: 19,
                    // Slider의 구분선 수
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
              onPressed: () async {
                _notificationPermission =
                await requestNotificationPermission();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StartWorkOutScreen(
                          breakTime: _selectedMinutes,
                          stopwatch: Stopwatch(),
                          notificationPermission: _notificationPermission,
                        ),
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
//
// void _showExit(BuildContext context) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text('한번더 누르면 앱이 종료 됩니다.'),
//     action: SnackBarAction(
//       label: '네',
//       onPressed: () {
//         Navigator
//             .of(context)
//             .pop;
//       },
//     ),
//   ));
// }
