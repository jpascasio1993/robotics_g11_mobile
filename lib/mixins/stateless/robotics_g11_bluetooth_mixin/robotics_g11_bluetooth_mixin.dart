import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/common/widgets/abstract_stateless_widget/abstract_stateless_widget.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart';

mixin RoboticsG11BluetoothMixin on AbstractStatelessWidget {
  late RoboticsG11BluetoothStore roboticsG11BluetoothStore;

  @override
  Widget build(BuildContext context) {
    roboticsG11BluetoothStore = BlocProvider.of<RoboticsG11BluetoothStore>(context);
    return super.build(context);
  }
}
