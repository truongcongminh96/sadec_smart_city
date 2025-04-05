import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallHelper {
  static Future<void> openPhone(BuildContext context, String? number) async {
    if (number == null || number.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Không có số điện thoại')));
      return;
    }

    final uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Không thể mở Google Maps')));
    }
  }
}
