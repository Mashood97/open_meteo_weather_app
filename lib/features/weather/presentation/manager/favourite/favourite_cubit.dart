import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_meteo_weather_app/utils/local_storage/app_local_storage.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.appLocalStorage})
      : super(
          const FavouriteInitial(
            getFavourites: [],
          ),
        );
  final AppLocalStorage appLocalStorage;

  final List<Map<String, dynamic>> favourites = [];

  void fetchFavourites() {
    emit(const FavouriteLoading(getFavourites: []));
    final items = appLocalStorage.getFavouriteData();

    items
        .map(
          (e) => favourites.add(
            {
              'latitude': e['latitude'].toString(),
              'longitude': e['longitude'].toString(),
              'countryName': e['countryName'].toString(),
              'cityName': e['cityName'].toString(),
              'weatherId': e['weatherId'].toString(),
            },
          ),
        )
        .toList();

    emit(
      FavouriteSuccess(getFavourites: favourites, successMessage: ''),
    );
  }

  void insertAsFavouriteIntoLocalStorage({required Map<String, dynamic> item}) {
    emit(FavouriteLoading(getFavourites: state.getFavourites));
    var items = state.getFavourites.firstWhere(
      (dt) => dt['weatherId'] == item['weatherId'],
      orElse: () => {},
    );

    if (items.isEmpty) {
      favourites.add(item);
      appLocalStorage.markAsFavourite(
        item: favourites,
      );
      emit(
        FavouriteSuccess(
          getFavourites: favourites,
          successMessage: 'Added as favourite',
        ),
      );
    } else {
      emit(
        FavouriteFailure(
          getFavourites: state.getFavourites,
          errorMessage: 'Already marked as favourite',
        ),
      );
    }
  }
}
