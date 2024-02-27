import 'dart:ui';

import 'package:easy_debounce/easy_throttle.dart';
import 'package:robotics_g11/common/cubit/base_cubit.dart';
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state_state.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';

class RoboticsG11JoystickState extends BaseStore<RoboticsG11JoystickStateState> {
  RoboticsG11JoystickState() : super(const RoboticsG11JoystickStateState());

  void center() => emit(state.copyWith(directionLeftRight: RoboticsG11Bluetooth.DIRECTION_CENTER));

  void left() => emit(state.copyWith(directionLeftRight: RoboticsG11Bluetooth.DIRECTION_LEFT_CODE));

  void right() => emit(state.copyWith(directionLeftRight: RoboticsG11Bluetooth.DIRECTION_RIGHT_CODE));

  void forward() => emit(state.copyWith(directionForwardBackward: RoboticsG11Bluetooth.RUN_MOTOR_FORWARD_CODE));

  void backward() => emit(state.copyWith(directionForwardBackward: RoboticsG11Bluetooth.RUN_MOTOR_BACKWARD_CODE));

  void stop() => emit(state.copyWith(pwm: 0));

  void setPwm(double value) {
    final val = double.parse(value.toStringAsFixed(2));
    print('pwmSet:: $val');
    emit(state.copyWith(pwm: lerpDouble(0, RoboticsG11Bluetooth.MAX_PWM, val)!.toInt().clamp(0, RoboticsG11Bluetooth.MAX_PWM)));
  }

  String get command => '${state.directionForwardBackward}${state.pwm.toString().padLeft(3, '0')}${state.directionLeftRight}';
}
