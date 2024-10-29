import 'package:open_meteo_weather_app/utils/constant/app_icons.dart';

enum WeatherCode {
  clearSky(0, 'Clear sky', AppIcons.clearSkyIcon),
  mainlyClear(1, 'Mainly clear', AppIcons.partlyCloudIcon),
  partlyCloudy(2, 'Partly cloudy', AppIcons.partlyCloudIcon),
  overcast(3, 'Overcast', AppIcons.cloudyIcon),
  fog(45, 'Fog', AppIcons.foggyIcon),
  lightRain(51, 'Light rain', AppIcons.drizzleIcon),
  rainShowers(61, 'Rain showers', AppIcons.rainIcon),
  lightSnow(71, 'Light snow', AppIcons.lightSnowIcon),
  snowShowers(80, 'Snow showers', AppIcons.snowfallIcon),
  thunderstorms(95, 'Thunderstorms', AppIcons.thunderstormIcon);

  const WeatherCode(
    this.code,
    this.description,
    this.iconPath,
  );

  final int code;
  final String description;
  final String iconPath;

  // Static method to get description from code
  static String getDescription(int code) {
    return WeatherCode.values
        .firstWhere(
          (weatherCode) => weatherCode.code == code,
          orElse: () => WeatherCode.clearSky,
        ) // Default to Clear Sky if code not found
        .description;
  }

  static String getIconPath(int code) {
    return WeatherCode.values
        .firstWhere(
          (weatherCode) => weatherCode.code == code,
          orElse: () => WeatherCode.clearSky,
        ) // Default to Clear Sky if code not found
        .iconPath;
  }
}
