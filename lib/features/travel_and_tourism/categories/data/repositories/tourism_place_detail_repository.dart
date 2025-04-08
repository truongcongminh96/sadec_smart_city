import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_detail_model.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_image_model.dart';

class TourismPlaceDetailRepository {
  final ApiService _api;

  TourismPlaceDetailRepository(this._api);

  Future<
    ({
      Map<String, dynamic> template,
      TourismPlaceDetailModel realData,
      List<TourismPlaceImageModel> images,
    })
  >
  getDetailTourismPlace(int tableId, int detailId) async {
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
    final realData = TourismPlaceDetailModel.fromJson(detailList[1]);
    final images =
        imageList.map((e) => TourismPlaceImageModel.fromJson(e)).toList();

    return (template: template, realData: realData, images: images);
  }
}
