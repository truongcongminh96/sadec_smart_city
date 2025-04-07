class TouristAttractionModel {
  final String groupName;
  final int tableId;
  final int detailId;
  final String ten;
  final String? sdt;
  final String? diaChi;
  final String? gpsLong;
  final String? gpsLat;
  final int? stt;
  final int? gps;

  TouristAttractionModel({
    required this.groupName,
    required this.tableId,
    required this.detailId,
    required this.ten,
    required this.sdt,
    required this.diaChi,
    required this.gpsLong,
    required this.gpsLat,
    required this.stt,
    required this.gps,
  });

  factory TouristAttractionModel.fromJson(Map<String, dynamic> json) {
    return TouristAttractionModel(
      groupName: json['groupName'] ?? '',
      tableId: json['tableId'] ?? 0,
      detailId: json['detailId'] ?? 0,
      ten: json['ten'] ?? '',
      sdt: json['sdt'],
      diaChi: json['diaChi'],
      gpsLong: json['gpsLong'],
      gpsLat: json['gpsLat'],
      stt: json['stt'],
      gps: json['gps'],
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
