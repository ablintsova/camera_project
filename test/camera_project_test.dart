import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:camera_project/camera_project.dart';
import 'package:camera_project/camera_project_platform_interface.dart';
import 'package:camera_project/camera_project_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraProjectPlatform with MockPlatformInterfaceMixin implements CameraProjectPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Uint8List?> openCamera() {
    // TODO: implement openCamera
    throw UnimplementedError();
  }
}

void main() {
  final CameraProjectPlatform initialPlatform = CameraProjectPlatform.instance;

  test('$MethodChannelCameraProject is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraProject>());
  });

  test('getPlatformVersion', () async {
    CameraProject cameraProjectPlugin = CameraProject();
    MockCameraProjectPlatform fakePlatform = MockCameraProjectPlatform();
    CameraProjectPlatform.instance = fakePlatform;

    expect(await cameraProjectPlugin.getPlatformVersion(), '42');
  });
}
