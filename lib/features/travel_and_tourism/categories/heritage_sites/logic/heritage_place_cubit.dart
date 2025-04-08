import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/repositories/tourism_place_repository.dart';

part 'heritage_place_state.dart';

class HeritagePlaceCubit extends Cubit<HeritagePlaceState> {
  HeritagePlaceCubit(this._repository) : super(HeritagePlaceInitial());

  final TourismPlaceRepository _repository;

  Future<void> loadHeritagePlaces(int menuAppId) async {
    emit(HeritagePlaceLoading());
    try {
      final heritagePlaces = await _repository.fetchTourismPlaces(menuAppId);
      emit(
        HeritagePlaceLoaded(
          heritagePlaces: heritagePlaces,
          allHeritagePlaces: heritagePlaces,
        ),
      );
    } catch (e) {
      emit(HeritagePlaceError(e.toString()));
    }
  }

  void searchHeritagePlaces(String query) {
    if (state is HeritagePlaceLoaded) {
      final allHeritagePlaces =
          (state as HeritagePlaceLoaded).allHeritagePlaces;
      final filteredHeritagePlaces =
          allHeritagePlaces.where((filteredHeritagePlace) {
            final lowerQuery = query.toLowerCase();
            return filteredHeritagePlace.ten.toLowerCase().contains(
                  lowerQuery,
                ) ||
                (filteredHeritagePlace.diaChi != null &&
                    filteredHeritagePlace.diaChi!.toLowerCase().contains(
                      lowerQuery,
                    )) ||
                (filteredHeritagePlace.sdt != null &&
                    filteredHeritagePlace.sdt!.contains(lowerQuery));
          }).toList();

      emit(
        HeritagePlaceLoaded(
          heritagePlaces: filteredHeritagePlaces,
          allHeritagePlaces: allHeritagePlaces,
        ),
      );
    }
  }
}
