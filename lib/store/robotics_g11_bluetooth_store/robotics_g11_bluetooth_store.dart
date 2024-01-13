import 'package:robotics_g11/common/cubit/base_cubit.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store_state.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';

class RoboticsG11BluetoothStore extends BaseStore<RoboticsG11BluetoothStoreState>{

  final RoboticsG11Bluetooth roboticsG11Bluetooth;

  RoboticsG11BluetoothStore({required this.roboticsG11Bluetooth}): super(const RoboticsG11BluetoothStoreState());

  void forward(double speed) {
    roboticsG11Bluetooth.runMotorForward(speed);
  }

  void backward(double speed) {
    roboticsG11Bluetooth.runMotorBackward(speed);
  }
}