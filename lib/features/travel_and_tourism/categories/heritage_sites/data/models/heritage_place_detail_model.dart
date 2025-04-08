class HeritagePlaceDetailModel {
  final int tableId;
  final int detailId;
  final String? ten;
  final String? sdt;
  final String? tuyenDuong;
  final String? diaChi;
  final String? gioiThieu;
  final String? khungGio;
  final String? loTrinh;
  final String? gioMoCua;
  final String? gianCach;
  final String? giaVe;
  final String? giaTien;
  final String? phamVi;
  final String? web;
  final String? congTy;
  final String? veVaoCong;
  final String? quyetDinh;
  final String? namHoatDong;
  final String? namNgungHoatDong;
  final String? hinhAnh;
  final String? gpsLong;
  final String? gpsLat;
  final String? stt;

  HeritagePlaceDetailModel({
    required this.tableId,
    required this.detailId,
    this.ten,
    this.sdt,
    this.tuyenDuong,
    this.diaChi,
    this.gioiThieu,
    this.khungGio,
    this.loTrinh,
    this.gioMoCua,
    this.gianCach,
    this.giaVe,
    this.giaTien,
    this.phamVi,
    this.web,
    this.congTy,
    this.veVaoCong,
    this.quyetDinh,
    this.namHoatDong,
    this.namNgungHoatDong,
    this.hinhAnh,
    this.gpsLong,
    this.gpsLat,
    this.stt,
  });

  factory HeritagePlaceDetailModel.fromJson(Map<String, dynamic> json) {
    return HeritagePlaceDetailModel(
      tableId: json['tableId'],
      detailId: json['detailId'],
      ten: json['ten'],
      sdt: json['sdt'],
      tuyenDuong: json['tuyenDuong'],
      diaChi: json['diaChi'],
      gioiThieu: json['gioiThieu'],
      khungGio: json['khungGio'],
      loTrinh: json['loTrinh'],
      gioMoCua: json['gioMoCua'],
      gianCach: json['gianCach'],
      giaVe: json['giaVe'],
      giaTien: json['giaTien'],
      phamVi: json['phamVi'],
      web: json['web'],
      congTy: json['congTy'],
      veVaoCong: json['veVaoCong'],
      quyetDinh: json['quyetDinh'],
      namHoatDong: json['namHoatDong'],
      namNgungHoatDong: json['namNgungHoatDong'],
      hinhAnh: json['hinhAnh'],
      gpsLong: json['gpsLong'],
      gpsLat: json['gpsLat'],
      stt: json['stt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tableId': tableId,
      'detailId': detailId,
      'ten': ten,
      'sdt': sdt,
      'tuyenDuong': tuyenDuong,
      'diaChi': diaChi,
      'gioiThieu': gioiThieu,
      'khungGio': khungGio,
      'loTrinh': loTrinh,
      'gioMoCua': gioMoCua,
      'gianCach': gianCach,
      'giaVe': giaVe,
      'giaTien': giaTien,
      'phamVi': phamVi,
      'web': web,
      'congTy': congTy,
      'veVaoCong': veVaoCong,
      'quyetDinh': quyetDinh,
      'namHoatDong': namHoatDong,
      'namNgungHoatDong': namNgungHoatDong,
      'hinhAnh': hinhAnh,
      'gpsLong': gpsLong,
      'gpsLat': gpsLat,
      'stt': stt,
    };
  }
}
