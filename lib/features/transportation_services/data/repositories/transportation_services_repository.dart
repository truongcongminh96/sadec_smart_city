import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/transportation_services/data/models/transportation_service_model.dart';

class TransportationServicesRepository {
  final ApiService _api;

  TransportationServicesRepository(this._api);

  Future<List<TransportationServiceModel>> fetchTransportationServices({
    required int menuAppId,
  }) async {
    final response = await _api.postData({
      "actionCode": 1,
      "menuAppId": menuAppId,
    });
    final items =
        (response['data'] as List)
            .map((e) => TransportationServiceModel.fromJson(e))
            .toList();
    items.sort((a, b) => a.stt.compareTo(b.stt));
    return items;
  }
}
