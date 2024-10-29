// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$WeatherChopperService extends WeatherChopperService {
  _$WeatherChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = WeatherChopperService;

  @override
  Future<Response<Map<dynamic, dynamic>>> fetchTimeRecordsFromServer(
      {required String countryName}) {
    final Uri $url =
        Uri.parse('https://geocoding-api.open-meteo.com/v1/search');
    final Map<String, dynamic> $params = <String, dynamic>{'name': countryName};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }
}
