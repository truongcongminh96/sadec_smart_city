import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/detail_information/data/models/detail_information_model.dart';

class DetailInformationHeader extends StatelessWidget {
  const DetailInformationHeader({super.key, required this.place});

  final DetailInformationModel place;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.redAccent, size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                place.diaChi ?? '',
                style: TextStyle(color: colorScheme.onSurface),
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
