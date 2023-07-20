import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_project_platform_interface.dart';

/// An implementation of [CameraProjectPlatform] that uses method channels.
class MethodChannelCameraProject extends CameraProjectPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camera_project');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Uint8List?> openCamera() async {
    final version = await methodChannel.invokeMethod<Uint8List>('openCamera');
    return version;
  }
}
