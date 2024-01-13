import 'package:contextual_logging/contextual_logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/common/cubit/request_state/request_state_state.dart';
import 'package:robotics_g11/common/enums/store_state.dart';

class RequestState<T> extends _AbstractRequestState<T> {}

abstract class _AbstractRequestState<T> extends Cubit<RequestStateState<T>> with ContextualLogger {
  _AbstractRequestState() : super(RequestStateState<T>());

  T? get data => state.data;

  bool get hasError => state.storeState == StoreState.ERROR;

  bool get isInitial => state.storeState == StoreState.INITIAL;

  bool get isLoaded => state.storeState == StoreState.LOADED;

  bool get isLoading => state.storeState == StoreState.LOADING;

  Exception? get error => state.exception;

  @override
  String get logContext => runtimeType.toString();

  @override
  void emit(RequestStateState<T> state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  void reset() => emit(RequestStateState<T>());

  void setRequestState(StoreState storeState) {
    if (storeState == StoreState.ERROR) {
      emit(state.copyWith(storeState: StoreState.ERROR));

      return;
    }

    if (storeState == StoreState.LOADING) {
      emit(state.copyWith(storeState: StoreState.LOADING, isLoading: true, hasError: false));

      return;
    }

    if (storeState == StoreState.LOADED) {
      emit(state.copyWith(storeState: StoreState.LOADED, isLoading: false, hasError: false));

      return;
    }
  }

  Future<void> doRequest(Future<T?> Function() request) async {
    if (state.storeState == StoreState.LOADING) {
      log.i('Already loading... Skipping');

      return;
    }

    emit(state.copyWith(storeState: StoreState.LOADING, isLoading: true, hasError: false, exception: null));

    try {
      final res = await request();
      emit(state.copyWith(storeState: StoreState.LOADED, data: res, isLoading: false, hasError: false));
    } on Exception catch (e, s) {
      log.e('Could not perform request', error: e, stackTrace: s);
      emit(
        state.copyWith(
          storeState: StoreState.ERROR,
          data: state.data,
          exception: e,
          isLoading: false,
          hasError: true,
        ),
      );
      addError(e, s);

      /// TODO: log to sentry
    }
  }
}
