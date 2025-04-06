import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/transportation_services/data/models/transportation_service_model.dart';
import 'package:sadec_smart_city/features/transportation_services/data/repositories/transportation_services_repository.dart';

part 'transportation_services_state.dart';

class TransportationServicesCubit extends Cubit<TransportationServicesState> {
  TransportationServicesCubit(this._repository)
    : super(TransportationServicesInitial());

  final TransportationServicesRepository _repository;

  Future<void> fetchTransportationServices(int menuAppId) async {
    emit(TransportationServicesLoading());
    try {
      final transportationServices = await _repository
          .fetchTransportationServices(menuAppId: menuAppId);
      emit(
        TransportationServicesLoaded(
          transportationServices: transportationServices,
        ),
      );
    } catch (e) {
      emit(TransportationServicesError(e.toString()));
    }
  }
}
