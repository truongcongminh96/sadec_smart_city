class TourismPlaceModel {
  final String groupName;
  final int tableId;
  final int detailId;
  final String ten;
  final String? sdt;
  final String? diaChi;
  final double? gpsLong;
  final double? gpsLat;
  final int stt;
  final int gps;

  TourismPlaceModel({
    required this.groupName,
    required this.tableId,
    required this.detailId,
    required this.ten,
    this.sdt,
    this.diaChi,
    this.gpsLong,
    this.gpsLat,
    required this.stt,
    required this.gps,
  });

  factory TourismPlaceModel.fromJson(Map<String, dynamic> json) {
    return TourismPlaceModel(
      groupName: json['groupName'] ?? '',
      tableId: json['tableId'] ?? 0,
      detailId: json['detailId'] ?? 0,
      ten: json['ten'] ?? '',
      sdt: json['sdt'],
      diaChi: json['diaChi'],
      gpsLong: double.tryParse(json['gpsLong']?.toString() ?? ''),
      gpsLat: double.tryParse(json['gpsLat']?.toString() ?? ''),
      stt: json['stt'] ?? 0,
      gps: json['gps'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'tableId': tableId,
      'detailId': detailId,
      'ten': ten,
      'sdt': sdt,
      'diaChi': diaChi,
      'gpsLong': gpsLong,
      'gpsLat': gpsLat,
      'stt': stt,
      'gps': gps,
    };
  }
}
