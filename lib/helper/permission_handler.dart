import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission() async {
  if (await Permission.storage.request().isGranted) {
    return true;
  }

  if (await Permission.photos.request().isGranted) {
    return true;
  }

  return false;
}
