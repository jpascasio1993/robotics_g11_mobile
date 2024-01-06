import 'robotics_g11_bluetooth_platform_interface.dart';

class RoboticsG11Bluetooth {
  Future<String?> getPlatformVersion() {
    return RoboticsG11BluetoothPlatform.instance.getPlatformVersion();
  }

  Future<bool> runMotor(int speed) => RoboticsG11BluetoothPlatform.instance.runMotor(speed.clamp(0, 255));

  Future<bool> turnServo(int degree) => RoboticsG11BluetoothPlatform.instance.turnServo(degree.clamp(0, 180));

  Future<bool> checkBluetoothConnection() => RoboticsG11BluetoothPlatform.instance.checkBluetoothConnection();
}
