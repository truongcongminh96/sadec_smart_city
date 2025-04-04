class BankModel {
  final String ten;
  final String? sdt;
  final String? diaChi;
  final double? gpsLong;
  final double? gpsLat;

  BankModel({
    required this.ten,
    this.sdt,
    this.diaChi,
    this.gpsLong,
    this.gpsLat,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      ten: json['ten'],
      sdt: json['sdt'],
      diaChi: json['diaChi'],
      gpsLong: double.tryParse(json['gpsLong'] ?? ''),
      gpsLat: double.tryParse(json['gpsLat'] ?? ''),
    );
  }
}
