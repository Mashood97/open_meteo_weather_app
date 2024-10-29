import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get_it/get_it.dart';
import 'package:open_meteo_weather_app/core/platform/network_information.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/data_sources/weather_remote_data_source_repository.dart';
import 'package:open_meteo_weather_app/features/weather/data/remote/data_sources/weather_remote_data_source_repository_impl.dart';
import 'package:open_meteo_weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:open_meteo_weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:open_meteo_weather_app/features/weather/domain/use_cases/fetch_country_lat_lng_usecase.dart';
import 'package:open_meteo_weather_app/features/weather/domain/use_cases/fetch_country_weather_info_usecase.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/details/fetch_weather_details_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/favourite/favourite_cubit.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/fetch_country_lat_lng_bloc.dart';
import 'package:open_meteo_weather_app/utils/internet_checker/network_bloc.dart';
import 'package:open_meteo_weather_app/utils/local_storage/app_local_storage.dart';
import 'package:open_meteo_weather_app/utils/theme/cubit/cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getItInstance = GetIt.instance;

Future<void> initializeDependencies() async {
  _initializeBlocsAndCubits();
  _initializeRepositories();
  _initializeUseCases();
  await _initializeExternalPackages();
}

void _initializeBlocsAndCubits() {
  getItInstance
    ..registerLazySingleton(
      NetworkBloc.new,
    )
    ..registerLazySingleton(
      ThemeCubit.new,
    )
    ..registerFactory<FetchCountryLatLngBloc>(
      () => FetchCountryLatLngBloc(
        fetchCountryLatLngUseCase: getItInstance(),
      ),
    )
    ..registerFactory<FetchWeatherDetailsBloc>(
      () => FetchWeatherDetailsBloc(
        fetchCountryWeatherInfoUseCase: getItInstance(),
      ),
    )
    ..registerFactory<FavouriteCubit>(
      () => FavouriteCubit(
        appLocalStorage: getItInstance(),
      ),
    );
}

void _initializeRepositories() {
  getItInstance
    ..registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImplementation(
        networkInfo: getItInstance(),
        weatherRemoteDataSourceRepository: getItInstance(),
      ),
    )
    ..registerLazySingleton<WeatherRemoteDataSourceRepository>(
      WeatherRemoteDataSourceRepositoryImplementation.new,
    );
}

void _initializeUseCases() {
  getItInstance
    ..registerLazySingleton<FetchCountryLatLngUseCase>(
      () => FetchCountryLatLngUseCase(
        weatherRepository: getItInstance(),
      ),
    )
    ..registerLazySingleton<FetchCountryWeatherInfoUseCase>(
      () => FetchCountryWeatherInfoUseCase(
        weatherRepository: getItInstance(),
      ),
    );
}

Future<void> _initializeExternalPackages() async {
  final prefs = await SharedPreferences.getInstance();

  getItInstance
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        networkConnectionCheck: getItInstance(),
      ),
    )
    ..registerLazySingleton(Connectivity.new)
    ..registerLazySingleton<AppLocalStorage>(
      () => AppLocalStorage(sharedPreferences: prefs),
    );
}
