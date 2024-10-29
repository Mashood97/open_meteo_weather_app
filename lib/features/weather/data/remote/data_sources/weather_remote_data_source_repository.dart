import 'package:open_meteo_weather_app/features/weather/data/models/request/weather_detail_request_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/response/country_lat_lng_response_model.dart';
import 'package:open_meteo_weather_app/features/weather/data/models/response/weather_forecast_details_response_model.dart';

abstract class WeatherRemoteDataSourceRepository {
  Future<List<CountryLatLngResponseModel>> fetchLatLngByCountryFromServer({
    required String countryName,
  });

  Future<WeatherForecastDetailsResponseModel?> fetchWeatherForecastDetails({
    required WeatherDetailRequestModel weatherRequestParam,
  });
}
