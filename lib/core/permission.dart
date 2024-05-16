import 'package:permission_handler/permission_handler.dart';

Future<PermissionStatus> requestNotificationPermission() async {
  final notificationPermission = await Permission.notification.status;

  if (notificationPermission == PermissionStatus.denied) {
    final status = await [Permission.notification].request();

    if (status[Permission.notification] != null) {
      return status[Permission.notification]!;
    }
  }

  if (notificationPermission == PermissionStatus.permanentlyDenied) {
    return PermissionStatus.permanentlyDenied;
  }

  return PermissionStatus.provisional;
}