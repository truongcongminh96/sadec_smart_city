class TransportationServiceModel {
  final int menuAppId;
  final String ten;
  final String link;
  final int iconsPerRow;
  final String icon;
  final int hasSubmenu;
  final int stt;
  final int? tableId;
  final int? loaiDiadiemId;
  final int? phanloaiDiadiemId;
  final String? sdt;
  final int type;

  TransportationServiceModel({
    required this.menuAppId,
    required this.ten,
    required this.link,
    required this.iconsPerRow,
    required this.icon,
    required this.hasSubmenu,
    required this.stt,
    this.tableId,
    this.loaiDiadiemId,
    this.phanloaiDiadiemId,
    this.sdt,
    required this.type,
  });

  factory TransportationServiceModel.fromJson(Map<String, dynamic> json) {
    return TransportationServiceModel(
      menuAppId: json['menuAppId'],
      ten: json['ten'],
      link: json['link'],
      iconsPerRow: json['iconsPerRow'],
      icon: json['icon'],
      hasSubmenu: json['hasSubmenu'],
      stt: json['stt'],
      tableId: json['tableId'],
      loaiDiadiemId: json['loaiDiadiemId'],
      phanloaiDiadiemId: json['phanloaiDiadiemId'],
      sdt: json['sdt'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuAppId': menuAppId,
      'ten': ten,
      'link': link,
      'iconsPerRow': iconsPerRow,
      'icon': icon,
      'hasSubmenu': hasSubmenu,
      'stt': stt,
      'tableId': tableId,
      'loaiDiadiemId': loaiDiadiemId,
      'phanloaiDiadiemId': phanloaiDiadiemId,
      'sdt': sdt,
      'type': type,
    };
  }
}
