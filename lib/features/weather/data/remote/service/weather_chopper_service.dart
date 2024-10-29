import 'package:chopper/chopper.dart';
import 'package:open_meteo_weather_app/utils/constant/api_routes.dart';

part 'weather_chopper_service.chopper.dart';

@ChopperApi(
  baseUrl: ApiRoutes.kGeoCodingBaseUrl,
)
abstract class WeatherChopperService extends ChopperService {
  static WeatherChopperService create([ChopperClient? client]) =>
      _$WeatherChopperService(client);

  @Get(
    path: ApiRoutes.searchWeatherInfoByName,
  )
  Future<Response<Map>> fetchTimeRecordsFromServer({
    @Query('name') required String countryName,
  });
}
