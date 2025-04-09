import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/models/list_detail_category_model.dart';

class ListDetailCategoryRepository {
  final ApiService api;

  ListDetailCategoryRepository(this.api);

  Future<List<ListDetailCategoryModel>> fetchListDetailCategory(
    int menuAppId,
  ) async {
    final jsonData = await api.postData({
      "actionCode": 10,
      "menuAppId": menuAppId,
    });

    final List list = jsonData['data'];
    return list.map((e) => ListDetailCategoryModel.fromJson(e)).toList();
  }
}
