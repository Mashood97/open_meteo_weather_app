import 'package:json_annotation/json_annotation.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';

part 'country_lat_lng_response_model.g.dart';



@JsonSerializable(checked: true)
class CountryLatLngResponseModel extends CountryLatLngResponseEntity {
  const CountryLatLngResponseModel({
    required this.countryName,
    required this.latitude,
    required this.longitude,
    required this.cityName,
    required this.countryId,
  }) : super(
          id: countryId,
          cityName: cityName,
          countryName: countryName,
          latitude: latitude,
          longitude: longitude,
        );

  factory CountryLatLngResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountryLatLngResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryLatLngResponseModelToJson(this);

  @JsonKey(name: 'id')
  final int? countryId;
  @JsonKey(name: 'name')
  final String? cityName;
  @JsonKey(name: 'admin1')
  final String? countryName;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
}
