import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/essential_services/categories/other_essential_services/presentation/other_essential_services_screen.dart';
import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';

class OtherServiceGrid extends StatelessWidget {
  final EssentialServiceModel item;

  const OtherServiceGrid({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                item.icon,
                width: 30,
                height: 30,
                errorBuilder:
                    (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              item.ten,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        OtherEssentialServicesScreen(menuAppId: item.menuAppId),
      ],
    );
  }
}
