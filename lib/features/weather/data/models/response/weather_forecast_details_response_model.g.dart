// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDetailsResponseModel
    _$WeatherForecastDetailsResponseModelFromJson(Map<String, dynamic> json) =>
        $checkedCreate(
          'WeatherForecastDetailsResponseModel',
          json,
          ($checkedConvert) {
            final val = WeatherForecastDetailsResponseModel(
              latitude:
                  $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
              longitude:
                  $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
              weatherForecastCurrentUnits: $checkedConvert(
                  'current_units',
                  (v) => v == null
                      ? null
                      : WeatherForecastCurrentUnitsResponseModel.fromJson(
                          v as Map<String, dynamic>)),
              weatherForecastCurrentDetails: $checkedConvert(
                  'current',
                  (v) => v == null
                      ? null
                      : WeatherForecastCurrentDetailsResponseModel.fromJson(
                          v as Map<String, dynamic>)),
            );
            return val;
          },
          fieldKeyMap: const {
            'weatherForecastCurrentUnits': 'current_units',
            'weatherForecastCurrentDetails': 'current'
          },
        );

Map<String, dynamic> _$WeatherForecastDetailsResponseModelToJson(
        WeatherForecastDetailsResponseModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'current_units': instance.weatherForecastCurrentUnits,
      'current': instance.weatherForecastCurrentDetails,
    };

WeatherForecastCurrentUnitsResponseModel
    _$WeatherForecastCurrentUnitsResponseModelFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'WeatherForecastCurrentUnitsResponseModel',
          json,
          ($checkedConvert) {
            final val = WeatherForecastCurrentUnitsResponseModel(
              intervalUnit: $checkedConvert('interval', (v) => v as String),
              temperatureUnit:
                  $checkedConvert('temperature_2m', (v) => v as String),
              humidityUnit:
                  $checkedConvert('relative_humidity_2m', (v) => v as String),
              windSpeedUnit:
                  $checkedConvert('wind_speed_10m', (v) => v as String),
            );
            return val;
          },
          fieldKeyMap: const {
            'intervalUnit': 'interval',
            'temperatureUnit': 'temperature_2m',
            'humidityUnit': 'relative_humidity_2m',
            'windSpeedUnit': 'wind_speed_10m'
          },
        );

Map<String, dynamic> _$WeatherForecastCurrentUnitsResponseModelToJson(
        WeatherForecastCurrentUnitsResponseModel instance) =>
    <String, dynamic>{
      'interval': instance.intervalUnit,
      'temperature_2m': instance.temperatureUnit,
      'relative_humidity_2m': instance.humidityUnit,
      'wind_speed_10m': instance.windSpeedUnit,
    };

WeatherForecastCurrentDetailsResponseModel
    _$WeatherForecastCurrentDetailsResponseModelFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'WeatherForecastCurrentDetailsResponseModel',
          json,
          ($checkedConvert) {
            final val = WeatherForecastCurrentDetailsResponseModel(
              weatherForecastTime: $checkedConvert('time', (v) => v as String?),
              intervalTime:
                  $checkedConvert('interval', (v) => (v as num?)?.toInt()),
              temperature: $checkedConvert(
                  'temperature_2m', (v) => (v as num?)?.toDouble()),
              humidity: $checkedConvert(
                  'relative_humidity_2m', (v) => (v as num?)?.toDouble()),
              weatherCode:
                  $checkedConvert('weather_code', (v) => (v as num?)?.toInt()),
              windSpeed: $checkedConvert(
                  'wind_speed_10m', (v) => (v as num?)?.toDouble()),
            );
            return val;
          },
          fieldKeyMap: const {
            'weatherForecastTime': 'time',
            'intervalTime': 'interval',
            'temperature': 'temperature_2m',
            'humidity': 'relative_humidity_2m',
            'weatherCode': 'weather_code',
            'windSpeed': 'wind_speed_10m'
          },
        );

Map<String, dynamic> _$WeatherForecastCurrentDetailsResponseModelToJson(
        WeatherForecastCurrentDetailsResponseModel instance) =>
    <String, dynamic>{
      'time': instance.weatherForecastTime,
      'interval': instance.intervalTime,
      'temperature_2m': instance.temperature,
      'relative_humidity_2m': instance.humidity,
      'weather_code': instance.weatherCode,
      'wind_speed_10m': instance.windSpeed,
    };
