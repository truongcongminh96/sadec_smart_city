part of 'fuel_station_cubit.dart';

@immutable
sealed class FuelStationState {}

final class FuelStationInitial extends FuelStationState {}

class FuelStationLoading extends FuelStationState {}

class FuelStationLoaded extends FuelStationState {
  final List<FuelStationModel> fuelStations;
  final List<FuelStationModel> allFuelStations;

  FuelStationLoaded({
    required this.fuelStations,
    required this.allFuelStations,
  });
}

class FuelStationError extends FuelStationState {
  final String message;

  FuelStationError(this.message);
}
