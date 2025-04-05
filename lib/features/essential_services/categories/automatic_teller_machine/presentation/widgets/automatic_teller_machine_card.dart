import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AutomaticTellerMachineCard extends StatelessWidget {
  final dynamic atm;

  const AutomaticTellerMachineCard({super.key, required this.atm});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final gradientColors =
        isDark
            ? [
              const Color(0xFF0F2027),
              const Color(0xFF203A43),
              const Color(0xFF2C5364),
            ]
            : [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)];

    final Color textColor = Colors.white;
    final Color subTextColor = Colors.white70;
    final Color accentColor = isDark ? Colors.amber : Colors.greenAccent;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  atm.ten ?? "Tên ATM",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.wifi, color: subTextColor, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            atm.diaChi ?? "Địa chỉ đang cập nhật",
            style: TextStyle(color: subTextColor, fontSize: 13),
          ),
          const SizedBox(height: 15),
          if (atm.gpsLat != null && atm.gpsLong != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () async {
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
                icon: Icon(Icons.location_pin, color: accentColor),
                label: Text("Bản đồ", style: TextStyle(color: accentColor)),
                style: TextButton.styleFrom(
                  side: BorderSide(color: accentColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
