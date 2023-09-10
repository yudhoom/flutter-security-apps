// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum NetworkStatus { NotDetermined, On, Off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  StreamController<ConnectivityResult> controller = StreamController<ConnectivityResult>();

  NetworkStatus lastResult;

  NetworkDetectorNotifier({
    required this.lastResult,
  }) : super(NetworkStatus.NotDetermined) {
    lastResult = NetworkStatus.NotDetermined;
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        NetworkStatus newState = NetworkStatus.Off;
        switch (result) {
          case ConnectivityResult.mobile:
            newState = NetworkStatus.On;
            break;
          case ConnectivityResult.wifi:
            newState = NetworkStatus.On;
            break;
          case ConnectivityResult.bluetooth:
            newState = NetworkStatus.On;
            break;
          case ConnectivityResult.ethernet:
            newState = NetworkStatus.On;
            break;
          case ConnectivityResult.none:
            newState = NetworkStatus.Off;
            break;
          case ConnectivityResult.vpn:
            break;
        }
        if (newState != state) {
          state = newState;
        }
      },
    );
  }
}

final networkAwareProvider = StateNotifierProvider(
  (ref) {
    return NetworkDetectorNotifier(lastResult: NetworkStatus.NotDetermined);
  },
);
