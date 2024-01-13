import 'package:flutter/material.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart';

mixin RoboticsG11BluetoothMixin<E extends StatefulWidget> on ServiceLocatorMixin<E> {
  late RoboticsG11BluetoothStore roboticsG11BluetoothStore;

  @override
  void initState() {
    super.initState();
    roboticsG11BluetoothStore = serviceLocator<RoboticsG11BluetoothStore>();
  }

  @override
  void dispose() {
    roboticsG11BluetoothStore.close();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider<RoboticsG11BluetoothStore>.value(value: roboticsG11BluetoothStore, child: super.build(context));
  // }
}
