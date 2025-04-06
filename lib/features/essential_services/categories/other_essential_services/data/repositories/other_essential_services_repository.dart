import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/other_essential_services/data/models/other_essential_service_model.dart';

class OtherEssentialServicesRepository {
  final ApiService api;

  OtherEssentialServicesRepository(this.api);

  Future<List<OtherEssentialServiceModel>> fetchOtherEssentialServices(
    int menuAppId,
  ) async {
    final jsonData = await api.postData({
      "actionCode": 1,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => OtherEssentialServiceModel.fromJson(e)).toList();
  }
}
