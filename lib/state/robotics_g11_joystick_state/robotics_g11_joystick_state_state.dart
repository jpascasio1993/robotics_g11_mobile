import 'package:freezed_annotation/freezed_annotation.dart';

part 'robotics_g11_joystick_state_state.freezed.dart';

@freezed
class RoboticsG11JoystickStateState with _$RoboticsG11JoystickStateState {
  const factory RoboticsG11JoystickStateState({
      @Default(0) int directionLeftRight,
      @Default(0) int directionForwardBackward,
      @Default(0) int pwm
   }) = _RoboticsG11JoystickStateState;
}
