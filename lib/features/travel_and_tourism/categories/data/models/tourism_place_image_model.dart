class TourismPlaceImageModel {
  final String linkHinhAnh;
  final String tenFileHinhAnh;

  TourismPlaceImageModel({
    required this.linkHinhAnh,
    required this.tenFileHinhAnh,
  });

  factory TourismPlaceImageModel.fromJson(Map<String, dynamic> json) {
    return TourismPlaceImageModel(
      linkHinhAnh: json['linkHinhAnh'],
      tenFileHinhAnh: json['tenFileHinhAnh'],
    );
  }
}
