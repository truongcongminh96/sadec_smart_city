import 'package:flutter/material.dart';
import 'package:sadec_smart_city/shared/utils/call_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class BankCard extends StatelessWidget {
  final dynamic bank;

  const BankCard({super.key, required this.bank});

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
                  bank.ten ?? "Tên ngân hàng",
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
          const SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.call, color: accentColor, size: 30),
                onPressed: () => CallHelper.openPhone(context, bank.sdt),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bank.sdt ?? "Không có số",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bank.diaChi ?? "Địa chỉ đang cập nhật",
            style: TextStyle(color: subTextColor, fontSize: 13),
          ),
          const SizedBox(height: 15),
          if (bank.gpsLat != null && bank.gpsLong != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () async {
                  final url = Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=${bank.gpsLat},${bank.gpsLong}',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Không thể mở Google Maps')),
                    );
                  }
                },
                // onPressed: () {
                //   final lat = double.tryParse(bank.gpsLat?.toString() ?? '');
                //   final lng = double.tryParse(bank.gpsLong?.toString() ?? '');
                //
                //   if (lat != null && lng != null) {
                //     showModalBottomSheet(
                //       context: context,
                //       isScrollControlled: true,
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                //       ),
                //       builder: (_) => MapBottomSheet(
                //         title: bank.ten ?? 'Vị trí',
                //         lat: lat,
                //         lng: lng,
                //       ),
                //     );
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('Không tìm thấy vị trí bản đồ')),
                //     );
                //   }
                // },
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
