import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EssentialPlaceCard extends StatelessWidget {
  final String? title;
  final String? address;
  final double? lat;
  final double? lng;
  final String? openTime;

  const EssentialPlaceCard({
    super.key,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
    this.openTime,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.white12 : Colors.grey.shade300;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white60 : Colors.black54;
    final accentColor = Colors.lightBlueAccent;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF121212) : Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 Info section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Tên địa điểm',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address ?? 'Địa chỉ đang cập nhật',
                  style: TextStyle(color: subTextColor, fontSize: 13),
                ),
                if (openTime != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    openTime!,
                    style: const TextStyle(color: Colors.green, fontSize: 13),
                  ),
                ],
              ],
            ),
          ),

          // 📍 Chỉ đường
          if (lat != null && lng != null)
            InkWell(
              onTap: () async {
                final url = Uri.parse(
                  'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Không thể mở Google Maps')),
                  );
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: accentColor),
                    ),
                    child: Icon(Icons.directions, color: accentColor, size: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Chỉ đường',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
