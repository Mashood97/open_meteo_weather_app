import 'dart:convert';

import 'package:open_meteo_weather_app/core/error/response_error.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/request/weather_detail_request_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/response/country_lat_lng_response_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/response/weather_forecast_details_response_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/data_sources/weather_remote_data_source_repository.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/service/weather_chopper_service.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/service/weather_detail_chopper_service.dart';
import 'package:open_meteo_weather_app/utils/chopper_client/chopper_client.dart';

class WeatherRemoteDataSourceRepositoryImplementation
    implements WeatherRemoteDataSourceRepository {
  final WeatherChopperService weatherChopperService =
      WeatherChopperService.create(ChopperClientInstance.client);

  final WeatherDetailChopperService weatherDetailChopperService =
      WeatherDetailChopperService.create(ChopperClientInstance.client);

  @override
  Future<List<CountryLatLngResponseModel>> fetchLatLngByCountryFromServer(
      {required String countryName}) async {
    final response = await weatherChopperService.fetchTimeRecordsFromServer(
      countryName: countryName,
    );

    if (response.isSuccessful) {
      final body = response.bodyString;
      final decodedBody = jsonDecode(body);
      var _items = decodedBody['results'] as List<dynamic>;
      if (_items.isNotEmpty) {
        return _items
            .map(
              (e) => CountryLatLngResponseModel.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList();
      }
      return [];
    }

    if (response.error != null) {
      final body = response.error as Map<String, dynamic>;

      throw ResponseError(
        errorStatus: body['reason'].toString(),
      );
    }

    return [];
  }

  @override
  Future<WeatherForecastDetailsResponseModel?> fetchWeatherForecastDetails({
    required WeatherDetailRequestModel weatherRequestParam,
  }) async {
    final response =
        await weatherDetailChopperService.fetchTimeRecordsFromServer(
      latitude: weatherRequestParam.latitude,
      longitude: weatherRequestParam.longitude,
      weatherQueryData: weatherRequestParam.forecastDetailQueryData,
    );

    if (response.isSuccessful) {
      final body = response.bodyString;
      final decodedBody = jsonDecode(body) as Map<String, dynamic>;
      return WeatherForecastDetailsResponseModel.fromJson(decodedBody);
    }

    if (response.error != null) {
      final body = response.error as Map<String, dynamic>;

      throw ResponseError(
        errorStatus: body['reason'].toString(),
      );
    }

    return null;
  }
}
