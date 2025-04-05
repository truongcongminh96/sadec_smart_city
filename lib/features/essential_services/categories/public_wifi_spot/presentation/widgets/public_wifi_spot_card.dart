import 'package:flutter/material.dart';
import 'package:sadec_smart_city/shared/widgets/essential_place_card.dart';

class PublicWifiSpotCard extends StatelessWidget {
  final dynamic publicWifiSpot;

  const PublicWifiSpotCard({super.key, required this.publicWifiSpot});

  @override
  Widget build(BuildContext context) {
    return EssentialPlaceCard(
      title: publicWifiSpot.ten,
      address: publicWifiSpot.diaChi,
      lat: publicWifiSpot.gpsLat,
      lng: publicWifiSpot.gpsLong,
      openTime: "Mở cả ngày",
    );
  }
}
