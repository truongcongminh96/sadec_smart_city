import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';
import 'package:sadec_smart_city/features/essential_services/data/repositories/essential_services_repository.dart';

part 'essential_services_state.dart';

class EssentialServicesCubit extends Cubit<EssentialServicesState> {
  EssentialServicesCubit(this._repository) : super(EssentialServicesInitial());

  final EssentialServiceRepository _repository;

  List<EssentialServiceModel> _mainServices = [];
  final Map<int, List<EssentialServiceModel>> _subServicesMap = {};

  List<EssentialServiceModel> get mainServices => _mainServices;

  Map<int, List<EssentialServiceModel>> get subServicesMap => _subServicesMap;

  Future<void> fetchEssentialServices(int menuAppId) async {
    emit(EssentialServicesLoading());
    try {
      final services = await _repository.fetchServices(menuAppId: menuAppId);
      _mainServices = services;
      emit(EssentialServicesLoaded());
    } catch (e) {
      emit(EssentialServicesError(e.toString()));
    }
  }

  Future<void> fetchSubServices(int menuAppId) async {
    try {
      final subServices = await _repository.fetchServices(menuAppId: menuAppId);
      _subServicesMap[menuAppId] = subServices;
      emit(EssentialServicesLoaded());
    } catch (e) {
      emit(EssentialServicesError(e.toString()));
    }
  }
}
