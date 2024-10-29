import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:open_meteo_weather_app/utils/internet_checker/network_bloc.dart';
import 'package:open_meteo_weather_app/utils/internet_checker/network_event.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        // if (GoRouterNavigationDelegate().parentNavigationKey.currentContext !=
        //     null) {
        //   AppSnackBar().showErrorSnackBar(
        //       context: GoRouterNavigationDelegate()
        //           .parentNavigationKey
        //           .currentContext!,
        //       error:
        //           "It seems that your device is not connected to the network.Please check your internet connectivity or try again later.");
        // }
        NetworkBloc().add(NetworkNotify());
      } else {
        // if (GoRouterNavigationDelegate().parentNavigationKey.currentContext !=
        //     null) {
        //   AppSnackBar().showSuccessSnackBar(
        //       context: GoRouterNavigationDelegate()
        //           .parentNavigationKey
        //           .currentContext!,
        //       successMsg: "Internet connection has been restored!");
        // }

        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
