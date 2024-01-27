import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:robotics_g11/common/widgets/widget_view.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_bluetooth_mixin/robotics_g11_bluetooth_mixin.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';

class RCController extends StatefulWidget {
  const RCController({Key? key}) : super(key: key);

  @override
  _RCControllerController createState() => _RCControllerController();
}

class _RCControllerController extends State<RCController> with ServiceLocatorMixin, RoboticsG11BluetoothMixin {
  @override
  Widget build(BuildContext context) => _RCControllerView(this);

  void y(double speed) {
    if (speed == 0) {
      roboticsG11BluetoothStore.stop();
      return;
    }

    if (speed.isNegative) {
      roboticsG11BluetoothStore.forward(speed);
      return;
    }

    if (!speed.isNegative) {
      roboticsG11BluetoothStore.backward(speed);
      return;
    }
  }

  void x(double speed) {
    if (speed == 0) {
      roboticsG11BluetoothStore.stop();
      return;
    }

    if (speed.isNegative) {
      roboticsG11BluetoothStore.left(speed);
      return;
    }

    if (!speed.isNegative) {
      roboticsG11BluetoothStore.right(speed);
      return;
    }
  }
}

class _RCControllerView extends WidgetView<RCController, _RCControllerController> {
  const _RCControllerView(_RCControllerController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: JoystickArea(
          initialJoystickAlignment: Alignment.center,
          listener: (details) {
            final x = details.x;
            final y = details.y;
            state.x(x);
            state.y(y);
          },
        ));
  }
}
