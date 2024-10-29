part of 'fetch_country_lat_lng_bloc.dart';

sealed class FetchCountryLatLngEvent extends Equatable {
  const FetchCountryLatLngEvent();
}

final class OnFetchCountryLatLngEvent extends FetchCountryLatLngEvent {
  const OnFetchCountryLatLngEvent({required this.countryName});

  final String countryName;

  @override
  List<Object?> get props => [
        countryName,
      ];
}
