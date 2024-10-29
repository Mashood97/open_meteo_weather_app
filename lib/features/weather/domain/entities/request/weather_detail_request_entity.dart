import 'package:equatable/equatable.dart';

class WeatherDetailRequestEntity extends Equatable {
  const WeatherDetailRequestEntity(
      {required this.latitude,
      required this.longitude,
      required this.forecastDetailQueryData});

  final double latitude;
  final double longitude;
  final String forecastDetailQueryData;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        forecastDetailQueryData,
      ];
}
