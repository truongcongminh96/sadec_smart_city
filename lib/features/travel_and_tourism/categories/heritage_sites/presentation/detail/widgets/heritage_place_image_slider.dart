import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/data/models/heritage_place_image_model.dart';

class HeritagePlaceImageSlider extends StatelessWidget {
  const HeritagePlaceImageSlider({
    super.key,
    required this.images,
    required this.selectedImageIndex,
  });

  final List<HeritagePlaceImageModel> images;
  final int selectedImageIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder:
            (child, animation) => FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween(begin: 1.05, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
                child: child,
              ),
            ),
        child: Image.network(
          images[selectedImageIndex % images.length].linkHinhAnh,
          key: ValueKey(images[selectedImageIndex % images.length].linkHinhAnh),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
