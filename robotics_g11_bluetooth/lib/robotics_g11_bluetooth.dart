import 'dart:ui';

import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth_interface.dart';

import 'robotics_g11_bluetooth_platform_interface.dart';

class RoboticsG11Bluetooth implements RoboticsG11BluetoothInterface {
  static const MAX_PWM = 255;
  static const RUN_MOTOR_FORWARD_CODE = 50;
  static const RUN_MOTOR_BACKWARD_CODE = 51;
  static const DIRECTION_LEFT_CODE = 1;
  static const DIRECTION_RIGHT_CODE = 2;
  static const DIRECTION_CENTER = 0;

  Future<String?> getPlatformVersion() {
    return RoboticsG11BluetoothPlatform.instance.getPlatformVersion();
  }

  @override
  Future<bool> checkBluetoothConnection() => RoboticsG11BluetoothPlatform.instance.checkBluetoothConnection();

  @override
  Future<String?> runMotorForward(double speed) =>
      RoboticsG11BluetoothPlatform.instance.runMotorForward(lerpDouble(0, 255, speed)!.toInt().clamp(0, MAX_PWM));

  @override
  Future<String?> runMotorBackward(double speed) =>
      RoboticsG11BluetoothPlatform.instance.runMotorBackward(lerpDouble(0, 255, speed)!.toInt().clamp(0, MAX_PWM));

  @override
  Future<String?> turnLeft(double speed) => RoboticsG11BluetoothPlatform.instance.turnLeft(lerpDouble(0, 255, speed)!.toInt().clamp(0, MAX_PWM));

  @override
  Future<String?> turnRight(double speed) => RoboticsG11BluetoothPlatform.instance.turnRight(lerpDouble(0, 255, speed)!.toInt().clamp(0, MAX_PWM));

  @override
  Future<void> bluetoothConnectionDispose() => RoboticsG11BluetoothPlatform.instance.bluetoothConnectionDispose();

  @override
  Future<String?> customCommand(String command) => RoboticsG11BluetoothPlatform.instance.customCommand(command);
}
