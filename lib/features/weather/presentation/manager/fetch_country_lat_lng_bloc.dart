import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/domain/use_cases/fetch_country_lat_lng_usecase.dart';

part 'fetch_country_lat_lng_event.dart';

part 'fetch_country_lat_lng_state.dart';

class FetchCountryLatLngBloc
    extends Bloc<FetchCountryLatLngEvent, FetchCountryLatLngState> {
  FetchCountryLatLngBloc({
    required this.fetchCountryLatLngUseCase,
  }) : super(
          const FetchCountryLatLngInitial(
            items: [],
          ),
        ) {
    on<OnFetchCountryLatLngEvent>(
      _fetchLatLngByCountryName,
      transformer: droppable(),
    );
  }

  final FetchCountryLatLngUseCase fetchCountryLatLngUseCase;

  Future<void> _fetchLatLngByCountryName(OnFetchCountryLatLngEvent event,
      Emitter<FetchCountryLatLngState> emitter) async {
    emitter(
      FetchCountryLatLngLoading(
        items: state.items,
      ),
    );
    final response = await fetchCountryLatLngUseCase.call(event.countryName);
    response.fold(
      (error) => emitter(
        FetchCountryLatLngFailure(
          items: state.items,
          errorMessage: error.errorStatus,
        ),
      ),
      (success) => emitter(
        FetchCountryLatLngLoaded(items: success),
      ),
    );
  }
}
