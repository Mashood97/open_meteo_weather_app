// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$WeatherDetailChopperService extends WeatherDetailChopperService {
  _$WeatherDetailChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = WeatherDetailChopperService;

  @override
  Future<Response<Map<dynamic, dynamic>>> fetchTimeRecordsFromServer({
    required double latitude,
    required double longitude,
    required String weatherQueryData,
  }) {
    final Uri $url = Uri.parse('https://api.open-meteo.com/v1/forecast');
    final Map<String, dynamic> $params = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'current': weatherQueryData,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }
}
