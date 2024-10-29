import 'package:equatable/equatable.dart';

class WeatherForecastDetailsResponseEntity extends Equatable {
  const WeatherForecastDetailsResponseEntity({
    required this.latitude,
    required this.longitude,
    required this.weatherForecastCurrentUnits,
    required this.weatherForecastCurrentDetails,
  });

  final double? latitude;
  final double? longitude;
  final WeatherForecastCurrentUnits? weatherForecastCurrentUnits;
  final WeatherForecastCurrentDetails? weatherForecastCurrentDetails;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        weatherForecastCurrentUnits,
        weatherForecastCurrentDetails,
      ];

  Map<String, dynamic> toMap() {
    return {
      'latitude': this.latitude,
      'longitude': this.longitude,
      'weatherForecastCurrentUnits': this.weatherForecastCurrentUnits,
      'weatherForecastCurrentDetails': this.weatherForecastCurrentDetails,
    };
  }

  factory WeatherForecastDetailsResponseEntity.fromMap(
      Map<String, dynamic> map) {
    return WeatherForecastDetailsResponseEntity(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      weatherForecastCurrentUnits:
          map['weatherForecastCurrentUnits'] as WeatherForecastCurrentUnits,
      weatherForecastCurrentDetails:
          map['weatherForecastCurrentDetails'] as WeatherForecastCurrentDetails,
    );
  }
}

class WeatherForecastCurrentUnits extends Equatable {
  const WeatherForecastCurrentUnits({
    required this.intervalUnit,
    required this.temperatureUnit,
    required this.humidityUnit,
    required this.windSpeedUnit,
  });

  final String intervalUnit;
  final String temperatureUnit;
  final String humidityUnit;
  final String windSpeedUnit;

  @override
  List<Object?> get props => [
        intervalUnit,
        temperatureUnit,
        humidityUnit,
        windSpeedUnit,
      ];

  Map<String, dynamic> toMap() {
    return {
      'intervalUnit': this.intervalUnit,
      'temperatureUnit': this.temperatureUnit,
      'humidityUnit': this.humidityUnit,
      'windSpeedUnit': this.windSpeedUnit,
    };
  }

  factory WeatherForecastCurrentUnits.fromMap(Map<String, dynamic> map) {
    return WeatherForecastCurrentUnits(
      intervalUnit: map['intervalUnit'] as String,
      temperatureUnit: map['temperatureUnit'] as String,
      humidityUnit: map['humidityUnit'] as String,
      windSpeedUnit: map['windSpeedUnit'] as String,
    );
  }
}

class WeatherForecastCurrentDetails extends Equatable {
  const WeatherForecastCurrentDetails({
    required this.weatherForecastTime,
    required this.intervalTime,
    required this.temperature,
    required this.humidity,
    required this.weatherCode,
    required this.windSpeed,
  });

  final String? weatherForecastTime;
  final int? intervalTime;
  final double? temperature;
  final double? humidity;
  final int? weatherCode;
  final double? windSpeed;

  @override
  List<Object?> get props => [
        weatherForecastTime,
        intervalTime,
        temperature,
        humidity,
        weatherCode,
        windSpeed,
      ];

  Map<String, dynamic> toMap() {
    return {
      'weatherForecastTime': this.weatherForecastTime,
      'intervalTime': this.intervalTime,
      'temperature': this.temperature,
      'humidity': this.humidity,
      'weatherCode': this.weatherCode,
      'windSpeed': this.windSpeed,
    };
  }

  factory WeatherForecastCurrentDetails.fromMap(Map<String, dynamic> map) {
    return WeatherForecastCurrentDetails(
      weatherForecastTime: map['weatherForecastTime'] as String,
      intervalTime: map['intervalTime'] as int,
      temperature: map['temperature'] as double,
      humidity: map['humidity'] as double,
      weatherCode: map['weatherCode'] as int,
      windSpeed: map['windSpeed'] as double,
    );
  }
}
