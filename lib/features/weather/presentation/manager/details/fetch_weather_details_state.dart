part of 'fetch_weather_details_bloc.dart';

abstract class FetchWeatherDetailsState extends Equatable {
  const FetchWeatherDetailsState();
}

class FetchWeatherDetailsInitial extends FetchWeatherDetailsState {
  const FetchWeatherDetailsInitial();

  @override
  List<Object> get props => [];
}

class FetchWeatherDetailsLoading extends FetchWeatherDetailsState {
  const FetchWeatherDetailsLoading();

  @override
  List<Object> get props => [];
}

class FetchWeatherDetailsLoaded extends FetchWeatherDetailsState {
  const FetchWeatherDetailsLoaded({
    required this.weatherForecastDetailsResponseEntity,
  });

  final WeatherForecastDetailsResponseEntity
      weatherForecastDetailsResponseEntity;

  @override
  List<Object> get props => [
        weatherForecastDetailsResponseEntity,
      ];
}

class FetchWeatherDetailsFailure extends FetchWeatherDetailsState {
  const FetchWeatherDetailsFailure({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
        errorMessage,
      ];
}
