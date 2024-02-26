import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state.dart';

mixin RoboticsG11JoystickStateMixin<E extends StatefulWidget> on State<E> {
  late RoboticsG11JoystickState roboticsG11JoystickState;

  @override
  void initState() {
    super.initState();
    roboticsG11JoystickState = BlocProvider.of<RoboticsG11JoystickState>(context);
  }
}
