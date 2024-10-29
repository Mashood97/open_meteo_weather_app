import 'package:dartz/dartz.dart';

import 'package:open_meteo_weather_app/core/error/response_error.dart';
import 'package:open_meteo_weather_app/core/usecase/usecase.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/weather_forecast_details_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/repositories/weather_repository.dart';

class FetchCountryWeatherInfoUseCase extends UseCase<
    WeatherForecastDetailsResponseEntity, WeatherDetailRequestEntity> {
  FetchCountryWeatherInfoUseCase({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  @override
  Future<Either<ResponseError, WeatherForecastDetailsResponseEntity>> call(
    WeatherDetailRequestEntity params,
  ) async {
    return weatherRepository.fetchWeatherDetails(requestEntity: params);
  }
}
