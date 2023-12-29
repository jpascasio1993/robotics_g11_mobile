import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'robotics_g11_bluetooth_platform_interface.dart';

/// An implementation of [RoboticsG11BluetoothPlatform] that uses method channels.
class MethodChannelRoboticsG11Bluetooth extends RoboticsG11BluetoothPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('robotics_g11_bluetooth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> runMotor(int speed) async {
    final res = await methodChannel.invokeMethod<bool>('runMotor');
    return res ?? false;
  }

  @override
  Future<bool> turnServo(int degree) async {
    final res = await methodChannel.invokeMethod<bool>('turnServo');
    return res ?? false;
  }
}
