import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/data/models/travel_and_tourism_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/data/repositories/travel_and_tourism_repository.dart';

part 'travel_and_tourism_state.dart';

class TravelAndTourismCubit extends Cubit<TravelAndTourismState> {
  TravelAndTourismCubit(this._repository) : super(TravelAndTourismInitial());

  final TravelAndTourismRepository _repository;

  Future<void> fetchTravelAndTourism(int menuAppId) async {
    emit(TravelAndTourismLoading());
    try {
      final travelAndTourism = await _repository.fetchTravelAndTourism(
        menuAppId: menuAppId,
      );
      emit(TravelAndTourismLoaded(travelAndTourism: travelAndTourism));
    } catch (e) {
      emit(TravelAndTourismError(e.toString()));
    }
  }
}
