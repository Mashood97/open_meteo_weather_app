import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/utils/navigation/route_names.dart';

class AppNavigations {
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory AppNavigations() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  AppNavigations._internal();

  static final AppNavigations _instance = AppNavigations._internal();

  void navigateBack(
      {required BuildContext context, dynamic value, bool isDialog = false}) {
    if (isDialog) {
      Navigator.of(context).pop();
    } else {
      context.pop(value);
    }
  }

  void navigateFromWeatherPageToWeatherDetailsPage({
    required BuildContext context,
    required double latitude,
    required double longitude,
    required String countryName,
    required String cityName,
    required int weatherId,
    bool isFromBookMark = false,
  }) {
    context.pushNamed(
      NavigationRouteNames.weatherDetailsPage.convertRoutePathToRouteName,
      queryParameters: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'countryName': countryName,
        'cityName': cityName,
        'weatherId': weatherId.toString(),
        'isFromBookMark': isFromBookMark.toString(),
      },
    );
  }

  void navigateToBookmarkPage({required BuildContext context}) {
    context.pushNamed(
        NavigationRouteNames.bookmarkPage.convertRoutePathToRouteName);
  }
}
