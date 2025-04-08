class HeritagePlaceImageModel {
  final String linkHinhAnh;
  final String tenFileHinhAnh;

  HeritagePlaceImageModel({
    required this.linkHinhAnh,
    required this.tenFileHinhAnh,
  });

  factory HeritagePlaceImageModel.fromJson(Map<String, dynamic> json) {
    return HeritagePlaceImageModel(
      linkHinhAnh: json['linkHinhAnh'],
      tenFileHinhAnh: json['tenFileHinhAnh'],
    );
  }
}
