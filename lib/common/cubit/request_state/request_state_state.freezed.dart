// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestStateState<T> {
  StoreState get storeState => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestStateStateCopyWith<T, RequestStateState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateStateCopyWith<T, $Res> {
  factory $RequestStateStateCopyWith(RequestStateState<T> value,
          $Res Function(RequestStateState<T>) then) =
      _$RequestStateStateCopyWithImpl<T, $Res, RequestStateState<T>>;
  @useResult
  $Res call(
      {StoreState storeState,
      T? data,
      bool isLoading,
      bool hasError,
      Exception? exception});
}

/// @nodoc
class _$RequestStateStateCopyWithImpl<T, $Res,
        $Val extends RequestStateState<T>>
    implements $RequestStateStateCopyWith<T, $Res> {
  _$RequestStateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeState = null,
    Object? data = freezed,
    Object? isLoading = null,
    Object? hasError = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      storeState: null == storeState
          ? _value.storeState
          : storeState // ignore: cast_nullable_to_non_nullable
              as StoreState,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestStateStateImplCopyWith<T, $Res>
    implements $RequestStateStateCopyWith<T, $Res> {
  factory _$$RequestStateStateImplCopyWith(_$RequestStateStateImpl<T> value,
          $Res Function(_$RequestStateStateImpl<T>) then) =
      __$$RequestStateStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {StoreState storeState,
      T? data,
      bool isLoading,
      bool hasError,
      Exception? exception});
}

/// @nodoc
class __$$RequestStateStateImplCopyWithImpl<T, $Res>
    extends _$RequestStateStateCopyWithImpl<T, $Res, _$RequestStateStateImpl<T>>
    implements _$$RequestStateStateImplCopyWith<T, $Res> {
  __$$RequestStateStateImplCopyWithImpl(_$RequestStateStateImpl<T> _value,
      $Res Function(_$RequestStateStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeState = null,
    Object? data = freezed,
    Object? isLoading = null,
    Object? hasError = null,
    Object? exception = freezed,
  }) {
    return _then(_$RequestStateStateImpl<T>(
      storeState: null == storeState
          ? _value.storeState
          : storeState // ignore: cast_nullable_to_non_nullable
              as StoreState,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$RequestStateStateImpl<T> implements _RequestStateState<T> {
  const _$RequestStateStateImpl(
      {this.storeState = StoreState.INITIAL,
      this.data,
      this.isLoading = false,
      this.hasError = false,
      this.exception});

  @override
  @JsonKey()
  final StoreState storeState;
  @override
  final T? data;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'RequestStateState<$T>(storeState: $storeState, data: $data, isLoading: $isLoading, hasError: $hasError, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateStateImpl<T> &&
            (identical(other.storeState, storeState) ||
                other.storeState == storeState) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeState,
      const DeepCollectionEquality().hash(data),
      isLoading,
      hasError,
      exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateStateImplCopyWith<T, _$RequestStateStateImpl<T>>
      get copyWith =>
          __$$RequestStateStateImplCopyWithImpl<T, _$RequestStateStateImpl<T>>(
              this, _$identity);
}

abstract class _RequestStateState<T> implements RequestStateState<T> {
  const factory _RequestStateState(
      {final StoreState storeState,
      final T? data,
      final bool isLoading,
      final bool hasError,
      final Exception? exception}) = _$RequestStateStateImpl<T>;

  @override
  StoreState get storeState;
  @override
  T? get data;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$RequestStateStateImplCopyWith<T, _$RequestStateStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
