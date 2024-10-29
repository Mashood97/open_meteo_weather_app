import 'dart:async';
import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    log("CALLED INTERNET ${chain.request.url}");
    final connection = await Connectivity().checkConnectivity();
    if (connection.contains(ConnectivityResult.none)) {
      throw NoInternetConnectionException();
    }
    return chain.proceed(chain.request);
  }
}

class NoInternetConnectionException implements Exception {
  final String message =
      "No Internet connection available, please try again later.";

  @override
  String toString() {
    return message;
  }
}
