import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';
import 'package:sadec_smart_city/features/category_services/data/repositories/category_service_repository.dart';

part 'category_service_state.dart';

class CategoryServiceCubit extends Cubit<CategoryServiceState> {
  CategoryServiceCubit(this._repository) : super(CategoryServiceInitial());

  final CategoryServiceRepository _repository;

  List<CategoryServiceModel> _mainServices = [];
  final Map<int, List<CategoryServiceModel>> _subServicesMap = {};

  List<CategoryServiceModel> get mainServices => _mainServices;

  Map<int, List<CategoryServiceModel>> get subServicesMap => _subServicesMap;

  Future<void> fetchEssentialServices(int menuAppId) async {
    emit(CategoryServiceLoading());
    try {
      final services = await _repository.fetchServices(menuAppId: menuAppId);
      _mainServices = services;
      emit(CategoryServiceLoaded());
    } catch (e) {
      emit(CategoryServiceError(e.toString()));
    }
  }

  Future<void> fetchSubServices(int menuAppId) async {
    try {
      final subServices = await _repository.fetchServices(menuAppId: menuAppId);
      _subServicesMap[menuAppId] = subServices;
      emit(CategoryServiceLoaded());
    } catch (e) {
      emit(CategoryServiceError(e.toString()));
    }
  }
}
