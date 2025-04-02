import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://scontent.iocvnpt.com/resources/portal/Images/DTP/superadminportal.dtp/trangchu/portal/slider/cd12_262_cong_vien_sadec_thuy_ban_636932879.jpg',
      'https://scontent.iocvnpt.com/resources/portal/Images/DTP/dtblieu/anh_bia/thap_muoi_que_huong_513958281.jpg',
      'https://scontent.iocvnpt.com/resources/portal/Images/DTP/superadminportal.dtp/trangchu/portal/slider/cd09_112_ngay_hoi_xuan_3_532255319.jpg',
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
                          child: Image.network(imgUrl, fit: BoxFit.cover),
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
