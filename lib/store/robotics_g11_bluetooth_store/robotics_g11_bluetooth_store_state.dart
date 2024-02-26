import 'package:freezed_annotation/freezed_annotation.dart';

part 'robotics_g11_bluetooth_store_state.freezed.dart';

@freezed
class RoboticsG11BluetoothStoreState with _$RoboticsG11BluetoothStoreState {
  const factory RoboticsG11BluetoothStoreState({
    @Default(false) bool permissionGranted,
    @Default(false) bool bluetoothConnected,
    @Default(false) bool isLoading,
    Exception? exception}) =
      _RoboticsG11BluetoothStoreState;
}
