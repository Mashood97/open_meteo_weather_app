import 'package:dartz/dartz.dart';
import 'package:open_meteo_weather_app/core/error/response_error.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/weather_forecast_details_response_entity.dart';

abstract class WeatherRepository {
  Future<Either<ResponseError, List<CountryLatLngResponseEntity>>>
      fetchCountryLatLng({
    required String countryName,
  });

  Future<Either<ResponseError, WeatherForecastDetailsResponseEntity>>
      fetchWeatherDetails({
    required WeatherDetailRequestEntity requestEntity,
  });
}
