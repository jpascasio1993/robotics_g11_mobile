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
  Future<String?> runMotorForward(int speed) async {
    final command = await methodChannel.invokeMethod<String>('runMotorForward', speed);
    return command;
  }

  @override
  Future<String?> runMotorBackward(int speed) async {
    final command = await methodChannel.invokeMethod<String>('runMotorBackward', speed);
    return command;
  }

  @override
  Future<bool> checkBluetoothConnection() async {
    final res = await methodChannel.invokeMethod<bool>('checkBluetoothState');
    return res ?? false;
  }

  @override
  Future<String?> turnLeft(int speed) async {
    final command = await methodChannel.invokeMethod<String>('turnLeft', speed);
    return command;
  }

  @override
  Future<String?> turnRight(int speed) async {
    final command = await methodChannel.invokeMethod<String>('turnRight', speed);
    return command;
  }

  @override
  Future<void> bluetoothConnectionDispose() async {
    await methodChannel.invokeMethod<bool>('bluetoothDispose');
  }

  @override
  Future<String?> customCommand(String command) async {
    await methodChannel.invokeMethod<String>('customCommand', command);
    return command;
  }
}
