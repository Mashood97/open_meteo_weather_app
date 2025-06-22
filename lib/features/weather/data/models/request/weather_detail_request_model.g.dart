// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailRequestModel _$WeatherDetailRequestModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherDetailRequestModel',
      json,
      ($checkedConvert) {
        final val = WeatherDetailRequestModel(
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
          forecastDetailQueryData:
              $checkedConvert('current', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'forecastDetailQueryData': 'current'},
    );

Map<String, dynamic> _$WeatherDetailRequestModelToJson(
        WeatherDetailRequestModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'current': instance.forecastDetailQueryData,
    };
