import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/data/models/automatic_teller_machine_model.dart';

class AutomaticTellerMachineRepository {
  final ApiService api;

  AutomaticTellerMachineRepository(this.api);

  Future<List<AutomaticTellerMachineModel>> fetchAtms(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => AutomaticTellerMachineModel.fromJson(e)).toList();
  }
}
