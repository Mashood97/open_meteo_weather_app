import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/service/weather_chopper_service.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/service/weather_detail_chopper_service.dart';
import 'package:open_meteo_weather_app/utils/chopper_client/interceptor/internet_connection_interceptor.dart';
import 'package:open_meteo_weather_app/utils/constant/api_routes.dart';

class ChopperClientInstance {
  factory ChopperClientInstance() {
    return _singleton;
  }

  ChopperClientInstance._internal();

  static final ChopperClientInstance _singleton =
      ChopperClientInstance._internal();

  static ChopperClient? client;

  static void initializeChopperClient() {
    client ??= ChopperClient(
      services: [
        // Create and pass an instance of the generated service to the client
        WeatherChopperService.create(),
        WeatherDetailChopperService.create(),
      ],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: kDebugMode
          ? [
              InternetConnectionInterceptor(),
              HttpLoggingInterceptor(),
            ]
          : [
              InternetConnectionInterceptor(),
            ],
    );
  }
}
