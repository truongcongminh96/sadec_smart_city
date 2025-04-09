import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';

class CategoryServiceRepository {
  final ApiService _api;

  CategoryServiceRepository(this._api);

  Future<List<CategoryServiceModel>> fetchServices({
    required int menuAppId,
  }) async {
    final response = await _api.postData({
      "actionCode": 1,
      "menuAppId": menuAppId,
    });
    final items =
        (response['data'] as List)
            .map((e) => CategoryServiceModel.fromJson(e))
            .toList();
    items.sort((a, b) => a.stt.compareTo(b.stt));
    return items;
  }
}
