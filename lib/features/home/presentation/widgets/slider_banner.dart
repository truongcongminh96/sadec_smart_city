import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/dulichsadec.jpg',
      'assets/images/slider_1.jpg',
      'assets/images/slider_2.jpg',
      'assets/images/slider_3.jpg',
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
            items:
                images
                    .map(
                      (imgUrl) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.asset(imgUrl, fit: BoxFit.cover),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
