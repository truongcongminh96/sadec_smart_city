import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/repositories/tourism_place_repository.dart';

part 'tourism_attraction_state.dart';

class TourismAttractionCubit extends Cubit<TourismAttractionState> {
  TourismAttractionCubit(this._repository) : super(TourismAttractionInitial());

  final TourismPlaceRepository _repository;

  Future<void> loadTourismAttractions(int menuAppId) async {
    emit(TourismAttractionLoading());
    try {
      final tourismAttractions = await _repository.fetchTourismPlaces(
        menuAppId,
      );
      emit(
        TourismAttractionLoaded(
          tourismAttractions: tourismAttractions,
          allTourismAttractions: tourismAttractions,
        ),
      );
    } catch (e) {
      emit(TourismAttractionError(e.toString()));
    }
  }

  void searchTourismAttractions(String query) {
    if (state is TourismAttractionLoaded) {
      final allTourismAttractions =
          (state as TourismAttractionLoaded).allTourismAttractions;
      final filteredTourismAttractions =
          allTourismAttractions.where((filteredTourismAttraction) {
            final lowerQuery = query.toLowerCase();
            return filteredTourismAttraction.ten.toLowerCase().contains(
                  lowerQuery,
                ) ||
                (filteredTourismAttraction.diaChi != null &&
                    filteredTourismAttraction.diaChi!.toLowerCase().contains(
                      lowerQuery,
                    )) ||
                (filteredTourismAttraction.sdt != null &&
                    filteredTourismAttraction.sdt!.contains(lowerQuery));
          }).toList();

      emit(
        TourismAttractionLoaded(
          tourismAttractions: filteredTourismAttractions,
          allTourismAttractions: allTourismAttractions,
        ),
      );
    }
  }
}
