import 'package:chopper/chopper.dart';
import 'package:open_meteo_weather_app/utils/constant/api_routes.dart';

part 'weather_detail_chopper_service.chopper.dart';

@ChopperApi(
  baseUrl: ApiRoutes.kBaseUrl,
)
abstract class WeatherDetailChopperService extends ChopperService {
  static WeatherDetailChopperService create([ChopperClient? client]) =>
      _$WeatherDetailChopperService(client);




  //latitude=51.50853&longitude=-0.12574&current=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m
  @Get(
    path: ApiRoutes.getWeatherForecastDetails,
  )
  Future<Response<Map>> fetchTimeRecordsFromServer({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('current') required String weatherQueryData,
  });
}
