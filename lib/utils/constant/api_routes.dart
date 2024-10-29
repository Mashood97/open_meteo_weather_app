
class ApiRoutes {
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory ApiRoutes() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  ApiRoutes._internal();

  static final ApiRoutes _instance = ApiRoutes._internal();

  /*BASEURL is set on the entry point from env*/
  static const String kBaseUrl = 'https://api.open-meteo.com/v1';
  static const String kGeoCodingBaseUrl = 'https://geocoding-api.open-meteo.com/v1';

  static const String searchWeatherInfoByName = '/search';
  static const String getWeatherForecastDetails = '/forecast';
}
