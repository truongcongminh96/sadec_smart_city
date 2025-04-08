import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/data/models/tourism_place_detail_model.dart';

class TourismAttractionHeader extends StatelessWidget {
  const TourismAttractionHeader({super.key, required this.place});

  final TourismPlaceDetailModel place;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place.ten ?? 'Đang cập nhật',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.redAccent, size: 16),
            const SizedBox(width: 4),
            Text(
              place.diaChi ?? '',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ],
        ),
      ],
    );
  }
}
