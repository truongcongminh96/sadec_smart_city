import 'package:flutter/material.dart';
import 'package:sadec_smart_city/core/theme/matcha_theme.dart';

class TravelAndTourismHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const TravelAndTourismHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            child: Image.asset(
              'assets/images/dulichsadec.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Back button
          Positioned(
            top: 20,
            left: 40,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: MatchaTheme.primary, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                onPressed: () => Navigator.of(context).pop(),
                padding: EdgeInsets.zero,
                splashRadius: 24,
              ),
            ),
          ),
          // Bottom label
          Positioned(
            bottom: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MatchaTheme.primary,
              ),
              child: Text(
                'Khám phá du lịch Sa Đéc',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
