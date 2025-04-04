import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/models/bank_model.dart';

class BankRepository {
  final ApiService api;

  BankRepository(this.api);

  Future<List<BankModel>> fetchBanks(int menuAppId) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => BankModel.fromJson(e)).toList();
  }
}
