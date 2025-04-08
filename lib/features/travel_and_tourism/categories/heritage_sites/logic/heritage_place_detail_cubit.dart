import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_detail_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_image_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/repositories/heritage_place_detail_repository.dart';
import 'package:sadec_smart_city/shared/utils/map_detail_fields.dart';

part 'heritage_place_detail_state.dart';

class HeritagePlaceDetailCubit extends Cubit<HeritagePlaceDetailState> {
  final HeritagePlaceDetailRepository repository;

  HeritagePlaceDetailCubit(this.repository)
    : super(HeritagePlaceDetailInitial());

  Future<void> loadDetailHeritagePlace(int tableId, int detailId) async {
    emit(HeritagePlaceDetailLoading());
    try {
      final result = await repository.getDetailHeritagePlace(tableId, detailId);

      final mappedData = mapDetailFields(
        template: result.template,
        realData: result.realData.toJson(),
      );

      emit(
        HeritagePlaceDetailLoaded(
          data: result.realData,
          mappedFields: mappedData,
          images: result.images,
        ),
      );
    } catch (e) {
      emit(HeritagePlaceDetailError(message: e.toString()));
    }
  }
}
