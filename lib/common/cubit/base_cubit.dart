import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_g11/common/cubit/request_state/request_state.dart';

abstract class BaseStore<S> extends Cubit<S> {
  BaseStore(super.initialState) {
    this.init();
  }

  List<StreamSubscription<dynamic>> subscriptions = [];

  List<RequestState<dynamic>> requestStates = [];

  bool get isLoading => false;

  @override
  Future<void> close() async {
    await dispose();

    return super.close();
  }

  @override
  void emit(S state) {
    if (isClosed) {
      return;
    }

    super.emit(state);
  }

  void init() {
    subscriptions = [];
  }

  Future<void> dispose() async {
    await Future.forEach(requestStates, (element) => element.close());
    await Future.forEach(subscriptions, (element) => element.cancel());
  }
}
