import 'package:injectable/injectable.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';

@module
abstract class StoreDependencies {
  @lazySingleton
  RoboticsG11BluetoothStore roboticsG11BluetoothStore({required RoboticsG11Bluetooth roboticsG11Bluetooth}) =>
      RoboticsG11BluetoothStore(roboticsG11Bluetooth: roboticsG11Bluetooth);
}
