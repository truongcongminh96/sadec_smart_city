import 'package:flutter/material.dart';
import 'package:sadec_smart_city/shared/widgets/essential_place_card.dart';

class FuelStationCard extends StatelessWidget {
  final dynamic fuelStation;

  const FuelStationCard({super.key, required this.fuelStation});

  @override
  Widget build(BuildContext context) {
    return EssentialPlaceCard(
      title: fuelStation.ten,
      address: fuelStation.diaChi,
      lat: fuelStation.gpsLat,
      lng: fuelStation.gpsLong,
      openTime: "Mở cả ngày",
    );
  }
}
