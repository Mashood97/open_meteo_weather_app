import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';

part 'weather_detail_request_model.g.dart';
@JsonSerializable(checked: true)
class WeatherDetailRequestModel extends WeatherDetailRequestEntity {
  const WeatherDetailRequestModel(
      {required this.latitude,
      required this.longitude,
      required this.forecastDetailQueryData})
      : super(
          latitude: latitude,
          longitude: longitude,
          forecastDetailQueryData: forecastDetailQueryData,
        );

  factory WeatherDetailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailRequestModelToJson(this);

  @JsonKey(name: 'latitude')
  final double latitude;
  @JsonKey(name: 'longitude')
  final double longitude;
  @JsonKey(name: 'current')
  final String forecastDetailQueryData;
}
