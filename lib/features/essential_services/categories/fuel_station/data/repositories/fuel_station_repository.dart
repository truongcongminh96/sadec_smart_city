import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/data/models/fuel_station.dart';

class FuelStationRepository {
  final ApiService api;

  FuelStationRepository(this.api);

  Future<List<FuelStationModel>> fetchFuelStations(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => FuelStationModel.fromJson(e)).toList();
  }
}
