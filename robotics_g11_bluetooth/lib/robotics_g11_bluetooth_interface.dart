abstract class RoboticsG11BluetoothInterface {
  Future<String?> runMotorForward(double speed);

  Future<String?> runMotorBackward(double speed);

  Future<String?> turnLeft(double speed);

  Future<String?> turnRight(double speed);

  Future<bool> checkBluetoothConnection();

  Future<void> bluetoothConnectionDispose();

}