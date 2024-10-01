import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  var statusLocation = await Permission.location.status;
  var statusLocationAlways = await Permission.locationAlways.status;
  var statusNotification = await Permission.notification.status;

  // Request foreground location permission
  if (statusLocation.isDenied) {
    await Permission.location.request();
  }

  // Request background location permission
  if (statusLocationAlways.isDenied) {
    await Permission.locationAlways.request();
  }

  // Check again
  if (await Permission.location.isGranted &&
      await Permission.locationAlways.isGranted) {
    // Permissions granted, you can start the service
    // startBackgroundService();
  } else {
    // Permissions not granted
    print("Location permissions are not granted");
  }

  if (statusNotification.isDenied) {
    await Permission.notification.request();
  }
}
