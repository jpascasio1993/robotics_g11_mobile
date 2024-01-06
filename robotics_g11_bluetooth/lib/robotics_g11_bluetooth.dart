import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth_motor_interface.dart';

import 'robotics_g11_bluetooth_platform_interface.dart';

class RoboticsG11Bluetooth implements RoboticsG11BluetoothMotorInterface {
  static const MAX_PWM = 255;

  Future<String?> getPlatformVersion() {
    return RoboticsG11BluetoothPlatform.instance.getPlatformVersion();
  }

  Future<bool> checkBluetoothConnection() => RoboticsG11BluetoothPlatform.instance.checkBluetoothConnection();

  @override
  Future<String?> runMotorForward(int speed) =>
      RoboticsG11BluetoothPlatform.instance.runMotorForward(speed.clamp(0, MAX_PWM));

  @override
  Future<String?> runMotorBackward(int speed) =>
      RoboticsG11BluetoothPlatform.instance.runMotorBackward(speed.clamp(0, MAX_PWM));

  @override
  Future<String?> turnLeft(int speed) => RoboticsG11BluetoothPlatform.instance.turnLeft(speed.clamp(0, MAX_PWM));

  @override
  Future<String?> turnRight(int speed) => RoboticsG11BluetoothPlatform.instance.turnRight(speed.clamp(0, MAX_PWM));
}
