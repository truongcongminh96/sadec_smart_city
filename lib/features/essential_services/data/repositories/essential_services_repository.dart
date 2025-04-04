import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';

class EssentialServiceRepository {
  final ApiService _api;

  EssentialServiceRepository(this._api);

  Future<List<EssentialServiceModel>> fetchServices({
    required int menuAppId,
  }) async {
    final response = await _api.postData({
      "actionCode": 1,
      "menuAppId": menuAppId,
    });
    final items =
        (response['data'] as List)
            .map((e) => EssentialServiceModel.fromJson(e))
            .toList();
    items.sort((a, b) => a.stt.compareTo(b.stt));
    return items;
  }
}
