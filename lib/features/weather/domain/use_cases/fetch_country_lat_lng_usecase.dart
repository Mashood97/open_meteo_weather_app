import 'package:dartz/dartz.dart';

import 'package:open_meteo_weather_app/core/error/response_error.dart';
import 'package:open_meteo_weather_app/core/usecase/usecase.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/repositories/weather_repository.dart';

class FetchCountryLatLngUseCase
    extends UseCase<List<CountryLatLngResponseEntity>, String> {
  FetchCountryLatLngUseCase({
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  @override
  Future<Either<ResponseError, List<CountryLatLngResponseEntity>>> call(
    String params,
  ) async {
    return weatherRepository.fetchCountryLatLng(countryName: params);
  }
}
