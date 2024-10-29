import 'package:flutter/material.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/utils/extensions/context_extensions.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/utils/navigation/app_navigations.dart';

class WeatherCountryLatLngListItem extends StatelessWidget {
  const WeatherCountryLatLngListItem({
    required this.countryLatLngResponseEntity,
    super.key,
  });

  final CountryLatLngResponseEntity countryLatLngResponseEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AppNavigations().navigateFromWeatherPageToWeatherDetailsPage(
          context: context,
          latitude: countryLatLngResponseEntity.latitude ?? 0.0,
          longitude: countryLatLngResponseEntity.longitude ?? 0.0,
          countryName: countryLatLngResponseEntity.countryName ?? '',
          cityName: countryLatLngResponseEntity.cityName ?? '',
          weatherId: countryLatLngResponseEntity.id ?? -1,
        );
      },
      title: countryLatLngResponseEntity.countryName?.isTextNullAndEmpty == true
          ? const SizedBox()
          : Text(
              countryLatLngResponseEntity.countryName ?? "N/A",
              style: context.theme.textTheme?.titleLarge
                  ?.copyWith(color: Color(0xFFF2F2F2)),
            ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      subtitle: countryLatLngResponseEntity.cityName?.isTextNullAndEmpty == true
          ? const SizedBox()
          : Text(
              countryLatLngResponseEntity.cityName ?? "N/A",
              style: context.theme.textTheme?.titleMedium
                  ?.copyWith(color: Colors.grey),
            ),
    );
  }
}
