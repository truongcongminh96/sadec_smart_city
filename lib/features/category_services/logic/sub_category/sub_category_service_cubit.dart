import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';
import 'package:sadec_smart_city/features/category_services/data/repositories/category_service_repository.dart';

part 'sub_category_service_state.dart';

class SubCategoryServiceCubit extends Cubit<SubCategoryServiceState> {
  SubCategoryServiceCubit(this._repository)
    : super(SubCategoryServiceInitial());

  final CategoryServiceRepository _repository;

  Future<void> loadSubCategoryServices(int menuAppId) async {
    emit(SubCategoryServiceLoading());
    try {
      final otherEssentialServices = await _repository.fetchServices(
        menuAppId: menuAppId,
      );
      emit(
        SubCategoryServiceLoaded(
          allOtherEssentialServices: otherEssentialServices,
        ),
      );
    } catch (e) {
      emit(SubCategoryServiceError(e.toString()));
    }
  }
}
