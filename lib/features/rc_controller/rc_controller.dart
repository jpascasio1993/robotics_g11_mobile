import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robotics_g11/common/widgets/widget_view.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_bluetooth_mixin/robotics_g11_bluetooth_mixin.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_joystick_state_mixin/robotics_g11_joystick_state_mixin.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';

class RCController extends StatefulWidget {
  const RCController({Key? key}) : super(key: key);

  @override
  _RCControllerController createState() => _RCControllerController();
}

class _RCControllerController extends State<RCController>
    with ServiceLocatorMixin, RoboticsG11BluetoothMixin, RoboticsG11JoystickStateMixin {
  @override
  Widget build(BuildContext context) => _RCControllerView(this);

  void move(double speed) {
    if (speed == 0) {
      roboticsG11JoystickState.stop();
      return;
    }

    if (speed.isNegative) {
      roboticsG11JoystickState.forward();
      return;
    }

    if (!speed.isNegative) {
      roboticsG11JoystickState.backward();
      return;
    }
  }

  void turn(double speed) {
    if (speed.isNegative) {
      roboticsG11JoystickState.left();
      return;
    }

    if (!speed.isNegative) {
      roboticsG11JoystickState.right();
      return;
    }
  }

  void pwm(double value) {
    if (!value.isNegative) {
      roboticsG11JoystickState.setPwm(0);
      return;
    }
    // print('zzz :: $value');
    roboticsG11JoystickState.setPwm(value.abs());
  }
}

class _RCControllerView extends WidgetView<RCController, _RCControllerController> {
  const _RCControllerView(_RCControllerController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: JoystickArea(
              initialJoystickAlignment: Alignment.center,
              listener: (details) {
                final x = details.x;
                final y = details.y;
                state.turn(x);
                state.move(y);
              },
            )),
            Expanded(
                child: JoystickArea(
              initialJoystickAlignment: Alignment.center,
              listener: (details) {
                // print('detailszz :${details.y}');
                state.pwm(details.y);
              },
            ))
          ],
        ));
  }
}
