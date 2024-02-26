// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:robotics_g11/di/core_dependencies.dart' as _i6;
import 'package:robotics_g11/di/store_dependencies.dart' as _i7;
import 'package:robotics_g11/state/robotics_g11_joystick_state/robotics_g11_joystick_state.dart'
    as _i5;
import 'package:robotics_g11/store/robotics_g11_bluetooth_store/robotics_g11_bluetooth_store.dart'
    as _i4;
import 'package:robotics_g11_bluetooth/robotics_g11_bluetooth.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreDependencies = _$CoreDependencies();
    final storeDependencies = _$StoreDependencies();
    gh.lazySingleton<_i3.RoboticsG11Bluetooth>(
        () => coreDependencies.roboticsG11Bluetooth);
    gh.lazySingleton<_i4.RoboticsG11BluetoothStore>(() =>
        storeDependencies.roboticsG11BluetoothStore(
            roboticsG11Bluetooth: gh<_i3.RoboticsG11Bluetooth>()));
    gh.lazySingleton<_i5.RoboticsG11JoystickState>(
        () => storeDependencies.roboticsG11JoystickState());
    return this;
  }
}

class _$CoreDependencies extends _i6.CoreDependencies {}

class _$StoreDependencies extends _i7.StoreDependencies {}
