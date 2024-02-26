import 'package:flutter/material.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state.dart';

mixin CreateRoboticsG11JoystickStateMixin<E extends StatefulWidget> on ServiceLocatorMixin<E> {
  late RoboticsG11JoystickState roboticsG11JoystickState;

  @override
  void initState() {
    super.initState();
    roboticsG11JoystickState = serviceLocator<RoboticsG11JoystickState>();
  }

  @override
  void dispose() {
    roboticsG11JoystickState.close();
    super.dispose();
  }
}
