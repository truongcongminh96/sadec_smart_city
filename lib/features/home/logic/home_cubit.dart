import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiService _api = getIt<ApiService>();

  Future<void> fetchMenuItems() async {
    emit(HomeLoading());
    try {
      final response = await _api.postData({"actionCode": 1, "menuAppId": 0});

      final List<MenuItemModel> items =
          (response['data'] as List)
              .map((e) => MenuItemModel.fromJson(e))
              .toList();

      items.sort((a, b) => a.stt.compareTo(b.stt));

      emit(HomeLoaded(items));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
