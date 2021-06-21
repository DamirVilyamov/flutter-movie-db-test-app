import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_prime_test_app/common/bloc/internet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;

  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    _subscribeToConnectivity();
  }

  void _subscribeToConnectivity() {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.wifi || event == ConnectivityResult.mobile) {
          emitInternetConnected();
        } else if (event == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      },
    );
  }

  void emitInternetConnected() {
    emit(InternetConnected());
  }

  void emitInternetDisconnected() {
    emit(InternetDisconnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
