import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'start_workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _selectedMinutes = 1; // 초기 선택값: 5분


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
                    '${_selectedMinutes} minutes',
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartWorkOutScreen(
                        breakTime: _selectedMinutes, stopwatch: Stopwatch()),
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


// final FlutterLocalNotificationsPlugin _local =
//     FlutterLocalNotificationsPlugin();

// void _permissionWithNotification() async {
//   if (await Permission.notification.isDenied &&
//       !await Permission.notification.isPermanentlyDenied) {
//     await [Permission.notification].request();
//   }
// }

// Future<void> _initNotiSetting() async {
//   //Notification 플러그인 객체 생성
//
//   //안드로이드 초기 설정
//   final AndroidInitializationSettings initSettingsAndroid =
//       AndroidInitializationSettings("app_icon");

//IOS 초기 설정
// final DarwinInitializationSettings initSettingsIos =
//     DarwinInitializationSettings(
//         requestAlertPermission: false,
//         requestSoundPermission: false,
//         requestBadgePermission: false);
//
// //Notification에 위에서 설정한 안드로이드, IOS 초기 설정 값 삽입
// final InitializationSettings initSettings = InitializationSettings(
//   android: initSettingsAndroid,
//   iOS: initSettingsIos,
// );
// await _local.initialize(initSettings);
// //Notification 초기 설정
// }

// void test() async {
//   NotificationDetails details = const NotificationDetails(
//     iOS: DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     ),
//     android: AndroidNotificationDetails(
//       "1",
//       "test",
//       importance: Importance.max,
//       priority: Priority.high,
//     ),
//   );
//
//   await _local.show(1, "title", "body", details);
// }

// @override
// void initState() async {
//   super.initState();
//   _permissionWithNotification();
//   await _initNotiSetting();
// }