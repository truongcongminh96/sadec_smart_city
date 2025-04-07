import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_model.dart';

class HeritagePlaceCard extends StatelessWidget {
  final HeritagePlaceModel place;

  const HeritagePlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/images/dulichsadec.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/logo_sdc.png'),
                ),
                const SizedBox(width: 8),
                Text(
                  place.groupName ?? "Heritage",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: Text(
              place.ten,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            child: Text(
              place.diaChi ?? 'Đang cập nhật',
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.favorite, color: Colors.red, size: 20),
                  Text("120k"),
                  Icon(Icons.comment, size: 20),
                  Text("530"),
                  Icon(Icons.share, size: 20),
                  Text("22"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
