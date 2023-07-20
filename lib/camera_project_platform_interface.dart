import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_project_method_channel.dart';

abstract class CameraProjectPlatform extends PlatformInterface {
  /// Constructs a CameraProjectPlatform.
  CameraProjectPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraProjectPlatform _instance = MethodChannelCameraProject();

  /// The default instance of [CameraProjectPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraProject].
  static CameraProjectPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraProjectPlatform] when
  /// they register themselves.
  static set instance(CameraProjectPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Uint8List?> openCamera() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
