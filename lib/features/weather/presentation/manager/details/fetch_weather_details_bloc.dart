import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/request/weather_detail_request_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/weather_forecast_details_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/use_cases/fetch_country_weather_info_usecase.dart';

part 'fetch_weather_details_event.dart';

part 'fetch_weather_details_state.dart';

class FetchWeatherDetailsBloc
    extends Bloc<FetchWeatherDetailsEvent, FetchWeatherDetailsState> {
  FetchWeatherDetailsBloc({
    required this.fetchCountryWeatherInfoUseCase,
  }) : super(const FetchWeatherDetailsInitial()) {
    on<OnFetchWeatherDetailsEvent>(
      _fetchWeatherDetails,
    );
  }

  final FetchCountryWeatherInfoUseCase fetchCountryWeatherInfoUseCase;

  Future<void> _fetchWeatherDetails(OnFetchWeatherDetailsEvent event,
      Emitter<FetchWeatherDetailsState> emit) async {
    emit(const FetchWeatherDetailsLoading());
    final response = await fetchCountryWeatherInfoUseCase.call(
      event.weatherDetailRequestEntity,
    );

    response.fold(
      (error) => emit(
        FetchWeatherDetailsFailure(
          errorMessage: error.errorStatus,
        ),
      ),
      (success) => emit(
        FetchWeatherDetailsLoaded(
          weatherForecastDetailsResponseEntity: success,
        ),
      ),
    );
  }
}
