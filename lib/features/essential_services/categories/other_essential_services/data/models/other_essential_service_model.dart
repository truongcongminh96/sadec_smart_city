import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';

class OtherEssentialServiceModel extends EssentialServiceModel {
  OtherEssentialServiceModel({
    required super.menuAppId,
    required super.ten,
    required super.link,
    required super.iconsPerRow,
    required super.icon,
    required super.hasSubmenu,
    required super.stt,
    super.tableId,
    super.loaiDiadiemId,
    super.phanloaiDiadiemId,
    super.sdt,
    required super.type,
  });

  factory OtherEssentialServiceModel.fromJson(Map<String, dynamic> json) {
    return OtherEssentialServiceModel(
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
}
