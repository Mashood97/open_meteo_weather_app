import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/weather_forecast_details_response_entity.dart';

part 'weather_forecast_details_response_model.g.dart';

@JsonSerializable(checked: true)
class WeatherForecastDetailsResponseModel
    extends WeatherForecastDetailsResponseEntity {
  const WeatherForecastDetailsResponseModel({
    required this.latitude,
    required this.longitude,
    required this.weatherForecastCurrentUnits,
    required this.weatherForecastCurrentDetails,
  }) : super(
          longitude: longitude,
          latitude: latitude,
          weatherForecastCurrentDetails: weatherForecastCurrentDetails,
          weatherForecastCurrentUnits: weatherForecastCurrentUnits,
        );

  factory WeatherForecastDetailsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherForecastDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForecastDetailsResponseModelToJson(this);
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'current_units')
  final WeatherForecastCurrentUnitsResponseModel? weatherForecastCurrentUnits;
  @JsonKey(name: 'current')
  final WeatherForecastCurrentDetailsResponseModel?
      weatherForecastCurrentDetails;
}

@JsonSerializable(checked: true)
class WeatherForecastCurrentUnitsResponseModel
    extends WeatherForecastCurrentUnits {
  const WeatherForecastCurrentUnitsResponseModel({
    required this.intervalUnit,
    required this.temperatureUnit,
    required this.humidityUnit,
    required this.windSpeedUnit,
  }) : super(
          humidityUnit: humidityUnit,
          intervalUnit: intervalUnit,
          temperatureUnit: temperatureUnit,
          windSpeedUnit: windSpeedUnit,
        );

  factory WeatherForecastCurrentUnitsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherForecastCurrentUnitsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForecastCurrentUnitsResponseModelToJson(this);
  @JsonKey(name: 'interval')
  final String intervalUnit;
  @JsonKey(name: 'temperature_2m')
  final String temperatureUnit;
  @JsonKey(name: 'relative_humidity_2m')
  final String humidityUnit;
  @JsonKey(name: 'wind_speed_10m')
  final String windSpeedUnit;
}

@JsonSerializable(checked: true)
class WeatherForecastCurrentDetailsResponseModel
    extends WeatherForecastCurrentDetails {
  const WeatherForecastCurrentDetailsResponseModel({
    required this.weatherForecastTime,
    required this.intervalTime,
    required this.temperature,
    required this.humidity,
    required this.weatherCode,
    required this.windSpeed,
  }) : super(
          humidity: humidity,
          intervalTime: intervalTime,
          temperature: temperature,
          weatherCode: weatherCode,
          weatherForecastTime: weatherForecastTime,
          windSpeed: windSpeed,
        );

  factory WeatherForecastCurrentDetailsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherForecastCurrentDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForecastCurrentDetailsResponseModelToJson(this);

  @JsonKey(name: 'time')
  final String? weatherForecastTime;
  @JsonKey(name: 'interval')
  final int? intervalTime;
  @JsonKey(name: 'temperature_2m')
  final double? temperature;
  @JsonKey(name: 'relative_humidity_2m')
  final double? humidity;
  @JsonKey(name: 'weather_code')
  final int? weatherCode;
  @JsonKey(name: 'wind_speed_10m')
  final double? windSpeed;
}
