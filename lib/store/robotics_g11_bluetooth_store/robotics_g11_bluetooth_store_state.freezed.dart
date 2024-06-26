// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robotics_g11_bluetooth_store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoboticsG11BluetoothStoreState {
  bool get permissionGranted => throw _privateConstructorUsedError;
  bool get bluetoothConnected => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoboticsG11BluetoothStoreStateCopyWith<RoboticsG11BluetoothStoreState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoboticsG11BluetoothStoreStateCopyWith<$Res> {
  factory $RoboticsG11BluetoothStoreStateCopyWith(
          RoboticsG11BluetoothStoreState value,
          $Res Function(RoboticsG11BluetoothStoreState) then) =
      _$RoboticsG11BluetoothStoreStateCopyWithImpl<$Res,
          RoboticsG11BluetoothStoreState>;
  @useResult
  $Res call(
      {bool permissionGranted,
      bool bluetoothConnected,
      bool isLoading,
      Exception? exception});
}

/// @nodoc
class _$RoboticsG11BluetoothStoreStateCopyWithImpl<$Res,
        $Val extends RoboticsG11BluetoothStoreState>
    implements $RoboticsG11BluetoothStoreStateCopyWith<$Res> {
  _$RoboticsG11BluetoothStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionGranted = null,
    Object? bluetoothConnected = null,
    Object? isLoading = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      bluetoothConnected: null == bluetoothConnected
          ? _value.bluetoothConnected
          : bluetoothConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoboticsG11BluetoothStoreStateImplCopyWith<$Res>
    implements $RoboticsG11BluetoothStoreStateCopyWith<$Res> {
  factory _$$RoboticsG11BluetoothStoreStateImplCopyWith(
          _$RoboticsG11BluetoothStoreStateImpl value,
          $Res Function(_$RoboticsG11BluetoothStoreStateImpl) then) =
      __$$RoboticsG11BluetoothStoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool permissionGranted,
      bool bluetoothConnected,
      bool isLoading,
      Exception? exception});
}

/// @nodoc
class __$$RoboticsG11BluetoothStoreStateImplCopyWithImpl<$Res>
    extends _$RoboticsG11BluetoothStoreStateCopyWithImpl<$Res,
        _$RoboticsG11BluetoothStoreStateImpl>
    implements _$$RoboticsG11BluetoothStoreStateImplCopyWith<$Res> {
  __$$RoboticsG11BluetoothStoreStateImplCopyWithImpl(
      _$RoboticsG11BluetoothStoreStateImpl _value,
      $Res Function(_$RoboticsG11BluetoothStoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionGranted = null,
    Object? bluetoothConnected = null,
    Object? isLoading = null,
    Object? exception = freezed,
  }) {
    return _then(_$RoboticsG11BluetoothStoreStateImpl(
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
      bluetoothConnected: null == bluetoothConnected
          ? _value.bluetoothConnected
          : bluetoothConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$RoboticsG11BluetoothStoreStateImpl
    implements _RoboticsG11BluetoothStoreState {
  const _$RoboticsG11BluetoothStoreStateImpl(
      {this.permissionGranted = false,
      this.bluetoothConnected = false,
      this.isLoading = false,
      this.exception});

  @override
  @JsonKey()
  final bool permissionGranted;
  @override
  @JsonKey()
  final bool bluetoothConnected;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'RoboticsG11BluetoothStoreState(permissionGranted: $permissionGranted, bluetoothConnected: $bluetoothConnected, isLoading: $isLoading, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoboticsG11BluetoothStoreStateImpl &&
            (identical(other.permissionGranted, permissionGranted) ||
                other.permissionGranted == permissionGranted) &&
            (identical(other.bluetoothConnected, bluetoothConnected) ||
                other.bluetoothConnected == bluetoothConnected) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, permissionGranted, bluetoothConnected, isLoading, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoboticsG11BluetoothStoreStateImplCopyWith<
          _$RoboticsG11BluetoothStoreStateImpl>
      get copyWith => __$$RoboticsG11BluetoothStoreStateImplCopyWithImpl<
          _$RoboticsG11BluetoothStoreStateImpl>(this, _$identity);
}

abstract class _RoboticsG11BluetoothStoreState
    implements RoboticsG11BluetoothStoreState {
  const factory _RoboticsG11BluetoothStoreState(
      {final bool permissionGranted,
      final bool bluetoothConnected,
      final bool isLoading,
      final Exception? exception}) = _$RoboticsG11BluetoothStoreStateImpl;

  @override
  bool get permissionGranted;
  @override
  bool get bluetoothConnected;
  @override
  bool get isLoading;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$RoboticsG11BluetoothStoreStateImplCopyWith<
          _$RoboticsG11BluetoothStoreStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
