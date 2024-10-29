// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_lat_lng_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryLatLngResponseModel _$CountryLatLngResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CountryLatLngResponseModel',
      json,
      ($checkedConvert) {
        final val = CountryLatLngResponseModel(
          countryName: $checkedConvert('admin1', (v) => v as String?),
          latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
          longitude:
              $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
          cityName: $checkedConvert('name', (v) => v as String?),
          countryId: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'countryName': 'admin1',
        'cityName': 'name',
        'countryId': 'id'
      },
    );

Map<String, dynamic> _$CountryLatLngResponseModelToJson(
        CountryLatLngResponseModel instance) =>
    <String, dynamic>{
      'id': instance.countryId,
      'name': instance.cityName,
      'admin1': instance.countryName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
