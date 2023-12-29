import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelRoboticsG11Bluetooth platform = MethodChannelRoboticsG11Bluetooth();
  const MethodChannel channel = MethodChannel('robotics_g11_bluetooth');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
