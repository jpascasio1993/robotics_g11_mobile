abstract class RoboticsG11BluetoothMotorInterface {
  Future<String?> runMotorForward(int speed);

  Future<String?> runMotorBackward(int speed);

  Future<String?> turnLeft(int speed);

  Future<String?> turnRight(int speed);
}