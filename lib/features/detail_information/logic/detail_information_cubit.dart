import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/detail_information/data/models/detail_information_image_model.dart';
import 'package:sadec_smart_city/features/detail_information/data/models/detail_information_model.dart';
import 'package:sadec_smart_city/features/detail_information/data/repositories/detail_information_repository.dart';
import 'package:sadec_smart_city/shared/utils/map_detail_fields.dart';

part 'detail_information_state.dart';

class DetailInformationCubit extends Cubit<DetailInformationState> {
  DetailInformationCubit(this._repository) : super(DetailInformationInitial());

  final DetailInformationRepository _repository;

  Future<void> loadDetailInformationPlace(int tableId, int detailId) async {
    emit(DetailInformationLoading());
    try {
      final result = await _repository.getDetailInformationPlace(
        tableId,
        detailId,
      );

      final mappedData = mapDetailFields(
        template: result.template,
        realData: result.realData.toJson(),
      );

      emit(
        DetailInformationLoaded(
          data: result.realData,
          mappedFields: mappedData,
          images: result.images,
        ),
      );
    } catch (e) {
      emit(DetailInformationError(message: e.toString()));
    }
  }
}
