import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/data/models/public_wifi_spot_model.dart';

class PublicWifiSpotRepository {
  final ApiService api;

  PublicWifiSpotRepository(this.api);

  Future<List<PublicWifiSpotModel>> fetchPublicWifiSpots(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => PublicWifiSpotModel.fromJson(e)).toList();
  }
}
