import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'robotics_g11_bluetooth_method_channel.dart';

abstract class RoboticsG11BluetoothPlatform extends PlatformInterface {
  /// Constructs a RoboticsG11BluetoothPlatform.
  RoboticsG11BluetoothPlatform() : super(token: _token);

  static final Object _token = Object();

  static RoboticsG11BluetoothPlatform _instance = MethodChannelRoboticsG11Bluetooth();

  /// The default instance of [RoboticsG11BluetoothPlatform] to use.
  ///
  /// Defaults to [MethodChannelRoboticsG11Bluetooth].
  static RoboticsG11BluetoothPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RoboticsG11BluetoothPlatform] when
  /// they register themselves.
  static set instance(RoboticsG11BluetoothPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> turnServo(int degree);

  Future<bool> runMotor(int speed);

  Future<bool> checkBluetoothConnection();
}
