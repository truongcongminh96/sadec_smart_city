import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/other_essential_services/data/models/other_essential_service_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/other_essential_services/data/repositories/other_essential_services_repository.dart';

part 'other_essential_services_state.dart';

class OtherEssentialServicesCubit extends Cubit<OtherEssentialServicesState> {
  OtherEssentialServicesCubit(this._repository)
    : super(OtherEssentialServicesInitial());

  final OtherEssentialServicesRepository _repository;

  Future<void> loadOtherEssentialServices(int menuAppId) async {
    emit(OtherEssentialServicesLoading());
    try {
      final otherEssentialServices = await _repository
          .fetchOtherEssentialServices(menuAppId);
      emit(
        OtherEssentialServicesLoaded(
          allOtherEssentialServices: otherEssentialServices,
        ),
      );
    } catch (e) {
      emit(OtherEssentialServicesError(e.toString()));
    }
  }
}
