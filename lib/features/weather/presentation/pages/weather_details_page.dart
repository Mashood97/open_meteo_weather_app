import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/details/fetch_weather_details_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/favourite/favourite_cubit.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/widgets/get_weather_forecast_card_item.dart';
import 'package:open_meteo_weather_app/utils/constant/app_constant.dart';
import 'package:open_meteo_weather_app/utils/constant/app_icons.dart';
import 'package:open_meteo_weather_app/utils/constant/app_snackbar.dart';
import 'package:open_meteo_weather_app/utils/dependency_injection/di_container.dart';
import 'package:open_meteo_weather_app/utils/enum/weather_code_enum.dart';
import 'package:open_meteo_weather_app/utils/extensions/context_extensions.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/widget/error/app_error.dart';
import 'package:open_meteo_weather_app/widget/loader/app_loader.dart';

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
              listener: (ctx, state) {
                if (state is FavouriteSuccess &&
                    state.successMessage.isNotEmpty) {
                  //show success snackbar
                  AppSnackBar().showSuccessSnackBar(
                    context: ctx,
                    successMsg: state.successMessage,
                  );
                }
                if (state is FavouriteFailure) {
                  AppSnackBar().showErrorSnackBar(
                    context: ctx,
                    error: state.errorMessage,
                  );
                }
              },
              child: isFromBookMark == 'true'
                  ? const SizedBox.shrink()
                  : FloatingActionButton.small(
                      onPressed: () {
                        favouriteCubit.insertAsFavouriteIntoLocalStorage(
                          item: {
                            'latitude': latitude.toString(),
                            'longitude': longitude.toString(),
                            'countryName': countryName,
                            'cityName': cityName,
                            'weatherId': weatherId.toString(),
                          },
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
                            GetWeatherForecastCardItem(
                              icon: AppIcons.temperatureIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.temperature} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.temperatureUnit}',
                            ),
                            GetWeatherForecastCardItem(
                              icon: AppIcons.windIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.windSpeed} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.windSpeedUnit}',
                            ),
                            GetWeatherForecastCardItem(
                              icon: AppIcons.humidityIcon,
                              title:
                                  '${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentDetails?.humidity} ${state.weatherForecastDetailsResponseEntity.weatherForecastCurrentUnits?.humidityUnit}',
                            ),
                            GetWeatherForecastCardItem(
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
