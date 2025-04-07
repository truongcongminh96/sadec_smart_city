import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/data/models/travel_and_tourism_model.dart';

class TravelAndTourismRepository {
  final ApiService _api;

  TravelAndTourismRepository(this._api);

  Future<List<TravelAndTourismModel>> fetchTravelAndTourism({
    required int menuAppId,
  }) async {
    final response = await _api.postData({
      "actionCode": 1,
      "menuAppId": menuAppId,
    });
    final items =
        (response['data'] as List)
            .map((e) => TravelAndTourismModel.fromJson(e))
            .toList();
    items.sort((a, b) => a.stt.compareTo(b.stt));
    return items;
  }
}
