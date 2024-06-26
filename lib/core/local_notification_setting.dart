import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin localNotification = FlutterLocalNotificationsPlugin();


Future<void> initLocalNotification() async {
  AndroidInitializationSettings initSettingsAndroid =
  const AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings initSettingsIOS =
  const DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  InitializationSettings initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  await localNotification.initialize(
    initSettings,
  );
}