part of 'fetch_weather_details_bloc.dart';

sealed class FetchWeatherDetailsEvent extends Equatable {
  const FetchWeatherDetailsEvent();
}

final class OnFetchWeatherDetailsEvent extends FetchWeatherDetailsEvent {
  const OnFetchWeatherDetailsEvent({required this.weatherDetailRequestEntity});

  final WeatherDetailRequestEntity weatherDetailRequestEntity;

  @override
  List<Object?> get props => [weatherDetailRequestEntity];
}
