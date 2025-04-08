import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_model.dart';

class TourismPlaceRepository {
  final ApiService api;

  TourismPlaceRepository(this.api);

  Future<List<TourismPlaceModel>> fetchTourismPlaces(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => TourismPlaceModel.fromJson(e)).toList();
  }
}
