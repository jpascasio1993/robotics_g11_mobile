import 'package:injectable/injectable.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';

@module
abstract class CoreDependencies {
  @lazySingleton
  RoboticsG11Bluetooth get roboticsG11Bluetooth => RoboticsG11Bluetooth();
}