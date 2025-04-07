import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_model.dart';

class HeritagePlaceRepository {
  final ApiService api;

  HeritagePlaceRepository(this.api);

  Future<List<HeritagePlaceModel>> fetchHeritagePlaces(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => HeritagePlaceModel.fromJson(e)).toList();
  }
}
