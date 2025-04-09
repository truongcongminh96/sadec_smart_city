class DetailInformationImageModel {
  final String linkHinhAnh;
  final String tenFileHinhAnh;

  DetailInformationImageModel({
    required this.linkHinhAnh,
    required this.tenFileHinhAnh,
  });

  factory DetailInformationImageModel.fromJson(Map<String, dynamic> json) {
    return DetailInformationImageModel(
      linkHinhAnh: json['linkHinhAnh'],
      tenFileHinhAnh: json['tenFileHinhAnh'],
    );
  }
}
