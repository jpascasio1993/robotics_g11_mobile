import 'package:flutter_test/flutter_test.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth_platform_interface.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRoboticsG11BluetoothPlatform
    with MockPlatformInterfaceMixin
    implements RoboticsG11BluetoothPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RoboticsG11BluetoothPlatform initialPlatform = RoboticsG11BluetoothPlatform.instance;

  test('$MethodChannelRoboticsG11Bluetooth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRoboticsG11Bluetooth>());
  });

  test('getPlatformVersion', () async {
    RoboticsG11Bluetooth roboticsG11BluetoothPlugin = RoboticsG11Bluetooth();
    MockRoboticsG11BluetoothPlatform fakePlatform = MockRoboticsG11BluetoothPlatform();
    RoboticsG11BluetoothPlatform.instance = fakePlatform;

    expect(await roboticsG11BluetoothPlugin.getPlatformVersion(), '42');
  });
}
