part of 'fetch_country_lat_lng_bloc.dart';

abstract class FetchCountryLatLngState extends Equatable {
  const FetchCountryLatLngState({
    required this.items,
  });

  final List<CountryLatLngResponseEntity> items;
}

class FetchCountryLatLngInitial extends FetchCountryLatLngState {
  const FetchCountryLatLngInitial({required super.items});

  @override
  List<Object> get props => [super.items];
}

class FetchCountryLatLngLoading extends FetchCountryLatLngState {
  const FetchCountryLatLngLoading({required super.items});

  @override
  List<Object> get props => [super.items];
}

class FetchCountryLatLngLoaded extends FetchCountryLatLngState {
  const FetchCountryLatLngLoaded({required super.items});

  @override
  List<Object> get props => [super.items];
}

class FetchCountryLatLngFailure extends FetchCountryLatLngState {

  const FetchCountryLatLngFailure(
      {required super.items, required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [
        super.items,
        errorMessage,
      ];
}
