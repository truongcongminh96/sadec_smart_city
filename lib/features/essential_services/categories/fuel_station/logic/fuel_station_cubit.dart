import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/data/models/fuel_station_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/data/repositories/fuel_station_repository.dart';

part 'fuel_station_state.dart';

class FuelStationCubit extends Cubit<FuelStationState> {
  final FuelStationRepository repository;

  FuelStationCubit(this.repository) : super(FuelStationInitial());

  Future<void> loadFuelStations(int menuAppId) async {
    emit(FuelStationLoading());
    try {
      final fuelStations = await repository.fetchFuelStations(menuAppId);
      emit(
        FuelStationLoaded(
          fuelStations: fuelStations,
          allFuelStations: fuelStations,
        ),
      );
    } catch (e) {
      emit(FuelStationError(e.toString()));
    }
  }

  void searchFuelStations(String query) {
    if (state is FuelStationLoaded) {
      final allFuelStations = (state as FuelStationLoaded).allFuelStations;
      final filteredFuelStations =
          allFuelStations.where((fuelStation) {
            final lowerQuery = query.toLowerCase();
            return fuelStation.ten.toLowerCase().contains(lowerQuery) ||
                (fuelStation.diaChi != null &&
                    fuelStation.diaChi!.toLowerCase().contains(lowerQuery));
          }).toList();

      emit(
        FuelStationLoaded(
          fuelStations: filteredFuelStations,
          allFuelStations: allFuelStations,
        ),
      );
    }
  }
}
