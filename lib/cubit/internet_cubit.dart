import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionState {
  final bool connected;

  MyConnectionState({required this.connected});
}

class ConnectionCubit extends Cubit<MyConnectionState> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectionCubit() : super(MyConnectionState(connected: false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      emit(MyConnectionState(
          connected:
              event.every((element) => element != ConnectivityResult.none)));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
