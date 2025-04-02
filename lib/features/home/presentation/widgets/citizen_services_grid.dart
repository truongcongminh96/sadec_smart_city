import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';

class CitizenServicesGrid extends StatelessWidget {
  final List<MenuItemModel> items;

  const CitizenServicesGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:
                      isDark
                          ? const Color(0xFF2A2A2A)
                          : const Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  item.icon,
                  width: 28,
                  height: 28,
                  errorBuilder:
                      (_, __, ___) => const Icon(Icons.image_not_supported),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.ten,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
