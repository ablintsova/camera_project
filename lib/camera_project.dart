import 'dart:typed_data';

import 'camera_project_platform_interface.dart';

class CameraProject {
  Future<String?> getPlatformVersion() {
    return CameraProjectPlatform.instance.getPlatformVersion();
  }

  Future<Uint8List?> openCamera() {
    return CameraProjectPlatform.instance.openCamera();
  }
}
