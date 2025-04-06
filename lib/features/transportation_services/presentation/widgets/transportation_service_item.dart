import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/transportation_services/data/models/transportation_service_model.dart';

class TransportationServiceItem extends StatelessWidget {
  final TransportationServiceModel item;

  const TransportationServiceItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // handle tap
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.icon,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.image),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            item.ten,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
