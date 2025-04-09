import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/detail_information/data/models/detail_information_image_model.dart';
import 'package:sadec_smart_city/features/detail_information/data/models/detail_information_model.dart';

class DetailInformationRepository {
  final ApiService _api;

  DetailInformationRepository(this._api);

  Future<
    ({
      Map<String, dynamic> template,
      DetailInformationModel realData,
      List<DetailInformationImageModel> images,
    })
  >
  getDetailInformationPlace(int tableId, int detailId) async {
    final jsonData = await _api.postData({
      "actionCode": 3,
      "tableId": tableId,
      "detailId": detailId,
    });

    final data = jsonData['data'] as Map<String, dynamic>;
    final List detailList = data['detailInfo'] ?? [];
    final List imageList = data['fileHinhAnhInfo'] ?? [];

    if (detailList.length < 2) {
      throw Exception("Dữ liệu không hợp lệ: thiếu template hoặc dữ liệu thực");
    }

    final template = detailList[0] as Map<String, dynamic>;
    final realData = DetailInformationModel.fromJson(detailList[1]);
    final images =
        imageList.map((e) => DetailInformationImageModel.fromJson(e)).toList();

    return (template: template, realData: realData, images: images);
  }
}
