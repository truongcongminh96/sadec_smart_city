import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AutomaticTellerMachineCard extends StatelessWidget {
  final dynamic atm;

  const AutomaticTellerMachineCard({super.key, required this.atm});

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
          // 🏧 Info section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  atm.ten ?? 'Tên ATM',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  atm.diaChi ?? 'Địa chỉ đang cập nhật',
                  style: TextStyle(color: subTextColor, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mở cả ngày',
                  style: TextStyle(color: Colors.green, fontSize: 13),
                ),
              ],
            ),
          ),
          if (atm.gpsLat != null && atm.gpsLong != null)
            InkWell(
              onTap: () async {
                final url = Uri.parse(
                  'https://www.google.com/maps/search/?api=1&query=${atm.gpsLat},${atm.gpsLong}',
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
