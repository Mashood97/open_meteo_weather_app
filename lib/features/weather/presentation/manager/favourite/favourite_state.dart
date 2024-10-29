part of 'favourite_cubit.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState({
    required this.getFavourites,
  });

  final List<Map<String, dynamic>> getFavourites;
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial({required super.getFavourites});

  @override
  List<Object> get props => [
        super.getFavourites,
      ];
}

class FavouriteLoading extends FavouriteState {
  const FavouriteLoading({required super.getFavourites});

  @override
  List<Object> get props => [
        super.getFavourites,
      ];
}

class FavouriteSuccess extends FavouriteState {
  const FavouriteSuccess({
    required super.getFavourites,
    required this.successMessage,
  });

  final String successMessage;

  @override
  List<Object> get props => [
        super.getFavourites,
      ];
}

class FavouriteFailure extends FavouriteState {
  const FavouriteFailure({
    required super.getFavourites,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [
        super.getFavourites,
        errorMessage,
      ];
}
