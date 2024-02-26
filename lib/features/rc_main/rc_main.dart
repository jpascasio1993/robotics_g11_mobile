import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/common/widgets/widget_view.dart';
import 'package:robotics_g11/features/rc_controller/rc_controller.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_bluetooth_mixin/create_robotics_g11_bluetooth_mixin.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_joystick_state_mixin/create_robotics_g11_joystick_state_mixin.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state.dart';
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state_state.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart';

class RCMain extends StatefulWidget {
  const RCMain({Key? key}) : super(key: key);

  @override
  _RCMainController createState() => _RCMainController();
}

class _RCMainController extends State<RCMain>
    with ServiceLocatorMixin, CreateRoboticsG11BluetoothMixin, CreateRoboticsG11JoystickStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      super.roboticsG11BluetoothStore.checkBluetooth();
    });
  }

  @override
  void dispose() {
    super.roboticsG11BluetoothStore.disposeBluetooth();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider<RoboticsG11BluetoothStore>.value(value: roboticsG11BluetoothStore),
            BlocProvider<RoboticsG11JoystickState>.value(value: super.roboticsG11JoystickState)
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<RoboticsG11JoystickState, RoboticsG11JoystickStateState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  // print(super.roboticsG11JoystickState.command);
                  super.roboticsG11BluetoothStore.sendCustomCommand(super.roboticsG11JoystickState.command);
              })
            ],
            child: _RCMainView(this),
          ));
}

class _RCMainView extends WidgetView<RCMain, _RCMainController> {
  const _RCMainView(_RCMainController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Robotics G11'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return const RCController();
            // final permissionGranted = context.select<RoboticsG11BluetoothStore, bool>((value) => value.state.permissionGranted);
            // if(!permissionGranted) {
            //   return Text('Bluetooth Permission not granted');
            // }
            //
            // return Container(
            //   child: Column(
            //     children: [
            //       ElevatedButton(onPressed: () {
            //         state.roboticsG11BluetoothStore.forward(0.5);
            //       }, child: Text('Forward')),
            //       ElevatedButton(onPressed: () {
            //         state.roboticsG11BluetoothStore.backward(0.5);
            //       }, child: Text('Backward'))
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
