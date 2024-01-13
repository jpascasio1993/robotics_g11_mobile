import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/common/widgets/widget_view.dart';
import 'package:robotics_g11/mixins/stateful/robotics_g11_bluetooth_mixin/robotics_g11_bluetooth_mixin.dart';
import 'package:robotics_g11/mixins/stateful/service_locator_mixin/service_locator_mixin.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart';

class RCMain extends StatefulWidget {
  const RCMain({Key? key}) : super(key: key);

  @override
  _RCMainController createState() => _RCMainController();
}

class _RCMainController extends State<RCMain> with ServiceLocatorMixin, RoboticsG11BluetoothMixin {
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
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<RoboticsG11BluetoothStore>.value(value: roboticsG11BluetoothStore),
      ], child: _RCMainView(this));
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
        child: Container(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                state.roboticsG11BluetoothStore.forward(0.5);
              }, child: Text('Forward')),
              ElevatedButton(onPressed: () {
                state.roboticsG11BluetoothStore.backward(0.5);
              }, child: Text('Backward'))
            ],
          ),
        ),
      ),
    );
  }
}
