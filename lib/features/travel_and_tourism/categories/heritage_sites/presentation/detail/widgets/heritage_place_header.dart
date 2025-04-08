import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_detail_model.dart';

class HeritagePlaceHeader extends StatelessWidget {
  const HeritagePlaceHeader({super.key, required this.place});

  final HeritagePlaceDetailModel place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place.ten ?? 'Đang cập nhật',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.redAccent, size: 16),
            const SizedBox(width: 4),
            Text(
              place.diaChi ?? '',
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}
