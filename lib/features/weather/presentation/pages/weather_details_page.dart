import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/details/fetch_weather_details_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/pages/weather_page.dart';
import 'package:open_meteo_weather_app/utils/constant/app_constant.dart';
import 'package:open_meteo_weather_app/utils/constant/app_icons.dart';
import 'package:open_meteo_weather_app/utils/dependency_injection/di_container.dart';
import 'package:open_meteo_weather_app/utils/enum/weather_code_enum.dart';
import 'package:open_meteo_weather_app/utils/extensions/context_extensions.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/widget/error/app_error.dart';
import 'package:open_meteo_weather_app/widget/loader/app_loader.dart';

import '../manager/favourite/favourite_cubit.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({
    required this.queryParams,
    super.key,
  });

  final Map<String, String> queryParams;

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  late FetchWeatherDetailsBloc fetchWeatherDetailsBloc;
  late FavouriteCubit favouriteCubit;

  double latitude = 0.0;
  double longitude = 0.0;
  String countryName = '';
  String cityName = '';
  int weatherId = -1;
  String isFromBookMark = 'false';

  @override
  void initState() {
    super.initState();
    fetchWeatherDetailsBloc = getItInstance.get<FetchWeatherDetailsBloc>();
    favouriteCubit = getItInstance.get<FavouriteCubit>();
    favouriteCubit.fetchFavourites();
    latitude = double.parse(widget.queryParams['latitude'] ?? '0.0');
    longitude = double.parse(widget.queryParams['longitude'] ?? '0.0');
    countryName = widget.queryParams['countryName'] ?? '';
    cityName = widget.queryParams['cityName'] ?? '';
    weatherId = int.parse(widget.queryParams['weatherId'] ?? '-1');
    isFromBookMark = widget.queryParams['isFromBookMark'] ?? 'false';

    fetchWeatherDetailsBloc.add(
      OnFetchWeatherDetailsEvent(
        weatherDetailRequestEntity: WeatherDetailRequestEntity(
          latitude: latitude,
          longitude: longitude,
          forecastDetailQueryData:
              'temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m',
        ),
      ),
    );
  }

  @override
  void dispose() {
    fetchWeatherDetailsBloc.close();
    favouriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          countryName,
        ),
        actions: [
          BlocProvider.value(
            value: favouriteCubit,
            child: BlocListener<FavouriteCubit, FavouriteState>(
              listener: (context, state) {
                if (state is FavouriteSuccess &&
                    state.successMessage.isNotEmpty) {
                  //show success snackbar
                  print('ITEM HAS BEEN ADDED');
                }
              },
              child: isFromBookMark == 'true'
                  ? const SizedBox.shrink()
                  : FloatingActionButton.small(
                      onPressed: () {
                        favouriteCubit.insertAsFavouriteIntoLocalStorage(
                          item: widget.queryParams,
                        );
                      },
                      tooltip: 'Add to bookmark',
                      child: const Icon(
                        Icons.bookmark_add,
                      ),
                    ),
            ),
          ).animate().fade(delay: 1200.ms),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: fetchWeatherDetailsBloc,
          child:
              BlocConsumer<FetchWeatherDetailsBloc, FetchWeatherDetailsState>(
            listener: (context, state) {
              if (state is FetchWeatherDetailsFailure) {}
            },
            builder: (context, state) {
              if (state is FetchWeatherDetailsLoading) {
                return const AppLoader();
              }

              if (state is FetchWeatherDetailsFailure) {
                return AppError(
                  errorMessage: state.errorMessage,
                );
              }
              if (state is FetchWeatherDetailsLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(
                    AppConstant.kAppSidePadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityName,
                        maxLines: 2,
                        style: context.theme.textTheme.headlineMedium?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      ).animate().scale(delay: 200.ms),
                      const SizedBox(
                        height: 5,
                      ),
                      if (state
                              .weatherForecastDetailsResponseEntity
                              .weatherForecastCurrentDetails
                              ?.weatherForecastTime
                              .isTextNotNullAndNotEmpty ==
                          true)
                        Text(
                          DateFormat.yMMMEd().add_Hms().format(
                                DateTime.parse(
                                  state
                                      .weatherForecastDetailsResponseEntity
                                      .weatherForecastCurrentDetails!
                                      .weatherForecastTime!,
                                ),
                              ),
                          style: context.theme.textTheme.bodyMedium,
                        ).animate().fade(delay: 300.ms),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            GetTemperatureCardItem(
                              icon: AppIcons.temperatureIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.temperature} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.temperatureUnit}',
                            ),
                            GetTemperatureCardItem(
                              icon: AppIcons.windIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.windSpeed} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.windSpeedUnit}',
                            ),
                            GetTemperatureCardItem(
                              icon: AppIcons.humidityIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.humidity} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.humidityUnit}',
                            ),
                            GetTemperatureCardItem(
                              icon: WeatherCode.getIconPath(
                                state
                                        .weatherForecastDetailsResponseEntity
                                        .weatherForecastCurrentDetails
                                        ?.weatherCode ??
                                    0,
                              ),
                              title: WeatherCode.getDescription(
                                state
                                        .weatherForecastDetailsResponseEntity
                                        .weatherForecastCurrentDetails
                                        ?.weatherCode ??
                                    0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                );
              }

              return const AppError();
            },
          ),
        ),
      ),
    );
  }
}

class GetTemperatureCardItem extends StatelessWidget {
  const GetTemperatureCardItem({
    required this.icon,
    required this.title,
    super.key,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 50,
            width: 50,
            color: context.theme.colorScheme.primary,
          ).animate().fade(delay: 800.ms),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ).animate().fade(delay: 1000.ms),
        ],
      ),
    ).animate().fade(delay: 400.ms);
  }
}
