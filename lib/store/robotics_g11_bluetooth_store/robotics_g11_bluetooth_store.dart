import 'package:contextual_logging/contextual_logging.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:robotics_g11/common/cubit/base_cubit.dart';
import 'package:robotics_g11/common/cubit/request_state/request_state.dart';
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store_state.dart';
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart';
import 'package:rxdart/rxdart.dart';

class RoboticsG11BluetoothStore extends BaseStore<RoboticsG11BluetoothStoreState> with ContextualLogger {
  final RoboticsG11Bluetooth roboticsG11Bluetooth;

  RoboticsG11BluetoothStore({required this.roboticsG11Bluetooth}) : super(const RoboticsG11BluetoothStoreState());

  final RequestState<bool> _bluetoothScanRequest = RequestState();

  RequestState<bool> get bluetoothScanRequest => _bluetoothScanRequest;

  RequestState<bool> _sendCommandRequest = RequestState();

  RequestState<bool> get sendCommandRequest => _sendCommandRequest;

  @override
  String get logContext => super.runtimeType.toString();

  @override
  void init() {
    requestStates = [
      _bluetoothScanRequest,
      _sendCommandRequest
    ];
  }

  void forward(double speed) async {
    final command = await roboticsG11Bluetooth.runMotorForward(speed.abs().roundToDouble());
    log.i('runForward: $command');
  }

  void backward(double speed) {
    roboticsG11Bluetooth.runMotorBackward(speed.abs().roundToDouble());
  }

  void left(double speed) {
    roboticsG11Bluetooth.turnLeft(speed.abs().roundToDouble());
  }

  void right(double speed) {
    roboticsG11Bluetooth.turnRight(speed.abs().roundToDouble());
  }

  void stop() {
    roboticsG11Bluetooth.runMotorForward(0);
  }

  void sendCustomCommand(String command) => EasyDebounce.debounce('sendCustomCommand', const Duration(milliseconds: 300), () {
    roboticsG11Bluetooth.customCommand(command);
  });


  void checkBluetooth() {
    _bluetoothScanRequest.doRequest(() async {
      final Map<Permission, PermissionStatus> res = await [
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
        Permission.bluetooth
      ].request();

      final hasGranted = res.values.toList().indexWhere((element) => element == PermissionStatus.denied).isNegative;
      if (!hasGranted) {
        emit(state.copyWith(permissionGranted: false));
        return;
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(permissionGranted: true));
      final bluetoothConnected = await roboticsG11Bluetooth.checkBluetoothConnection();
      emit(state.copyWith(bluetoothConnected: bluetoothConnected));
      return;
    });
  }

  void disposeBluetooth() {
    roboticsG11Bluetooth.bluetoothConnectionDispose();
  }
}
