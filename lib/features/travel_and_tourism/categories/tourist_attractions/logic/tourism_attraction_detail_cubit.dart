import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_detail_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_image_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/repositories/tourism_place_detail_repository.dart';
import 'package:sadec_smart_city/shared/utils/map_detail_fields.dart';

part 'tourism_attraction_detail_state.dart';

class TourismAttractionDetailCubit extends Cubit<TourismAttractionDetailState> {
  final TourismPlaceDetailRepository repository;

  TourismAttractionDetailCubit(this.repository)
    : super(TourismAttractionDetailInitial());

  Future<void> loadDetailTourismAttraction(int tableId, int detailId) async {
    emit(TourismAttractionDetailLoading());
    try {
      final result = await repository.getDetailTourismPlace(tableId, detailId);

      final mappedData = mapDetailFields(
        template: result.template,
        realData: result.realData.toJson(),
      );

      emit(
        TourismAttractionDetailLoaded(
          data: result.realData,
          mappedFields: mappedData,
          images: result.images,
        ),
      );
    } catch (e) {
      emit(TourismAttractionDetailError(message: e.toString()));
    }
  }
}
