import 'package:dartz/dartz.dart';
import 'package:open_meteo_weather_app/core/error/response_error.dart';
import 'package:open_meteo_weather_app/core/platform/network_information.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/request/weather_detail_request_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/data_sources/weather_remote_data_source_repository.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/data_sources/weather_remote_data_source_repository_impl.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/weather_forecast_details_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  WeatherRepositoryImplementation({
    required this.networkInfo,
    required this.weatherRemoteDataSourceRepository,
  });

  final NetworkInfo networkInfo;
  final WeatherRemoteDataSourceRepository weatherRemoteDataSourceRepository;

  @override
  Future<Either<ResponseError, List<CountryLatLngResponseEntity>>>
      fetchCountryLatLng({required String countryName}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await weatherRemoteDataSourceRepository
            .fetchLatLngByCountryFromServer(
          countryName: countryName,
        );

        return Right(response);
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(
        ResponseError(
          errorStatus:
              'It seems that your device is not connected to the network.please check your internet connectivity or try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<ResponseError, WeatherForecastDetailsResponseEntity>>
      fetchWeatherDetails(
          {required WeatherDetailRequestEntity requestEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await weatherRemoteDataSourceRepository.fetchWeatherForecastDetails(
          weatherRequestParam: WeatherDetailRequestModel(
            latitude: requestEntity.latitude,
            longitude: requestEntity.longitude,
            forecastDetailQueryData: requestEntity.forecastDetailQueryData,
          ),
        );

        if (response != null) {
          return Right(response);
        }
        return Left(
          ResponseError(
            errorStatus: 'Something went wrong',
          ),
        );
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(
        ResponseError(
          errorStatus:
              'It seems that your device is not connected to the network.please check your internet connectivity or try again later.',
        ),
      );
    }
  }
}
