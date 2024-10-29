import 'package:equatable/equatable.dart';

class CountryLatLngResponseEntity extends Equatable {
  const CountryLatLngResponseEntity({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.latitude,
    required this.longitude,
  });

  final int? id;
  final String? cityName;
  final String? countryName;
  final double? latitude;
  final double? longitude;

  @override
  List<Object?> get props => [
        id,
        cityName,
        countryName,
        latitude,
        longitude,
      ];
}
