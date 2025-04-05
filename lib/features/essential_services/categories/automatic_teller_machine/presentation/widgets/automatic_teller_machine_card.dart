import 'package:flutter/material.dart';
import 'package:sadec_smart_city/shared/widgets/essential_place_card.dart';

class AutomaticTellerMachineCard extends StatelessWidget {
  final dynamic atm;

  const AutomaticTellerMachineCard({super.key, required this.atm});

  @override
  Widget build(BuildContext context) {
    return EssentialPlaceCard(
      title: atm.ten,
      address: atm.diaChi,
      lat: atm.gpsLat,
      lng: atm.gpsLong,
      openTime: "Mở cả ngày",
    );
  }
}
