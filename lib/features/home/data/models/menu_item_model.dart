class MenuItemModel {
  final int menuAppId;
  final String ten;
  final String link;
  final String icon;
  final int iconsPerRow;
  final int hasSubmenu;
  final int stt;
  final int type;

  MenuItemModel({
    required this.menuAppId,
    required this.ten,
    required this.link,
    required this.icon,
    required this.iconsPerRow,
    required this.hasSubmenu,
    required this.stt,
    required this.type,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      menuAppId: json['menuAppId'] ?? 0,
      ten: json['ten'] ?? '',
      link: json['link'] ?? '',
      icon: json['icon'] ?? '',
      iconsPerRow: json['iconsPerRow'] ?? 3,
      hasSubmenu: json['hasSubmenu'] ?? 0,
      stt: json['stt'] ?? 0,
      type: json['type'] ?? 0,
    );
  }
}
