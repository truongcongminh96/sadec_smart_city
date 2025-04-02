import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://cdn.dribbble.com/userupload/13740270/file/original-cf61d97d48aff752c4fb6eba190aa94e.jpg?resize=752x&vertical=center',
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8aa7e828-cef5-4a91-9367-644f1554aa22/ddp1fwo-af3c630b-b850-48ea-8ac5-50f5d708ffd0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzhhYTdlODI4LWNlZjUtNGE5MS05MzY3LTY0NGYxNTU0YWEyMlwvZGRwMWZ3by1hZjNjNjMwYi1iODUwLTQ4ZWEtOGFjNS01MGY1ZDcwOGZmZDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.R3BOs4CiXaX4K2M3oEY24WAeITA9AUsPSiVA7VC8rrQ',
      'https://i.pinimg.com/736x/4e/db/0f/4edb0f445a57f0760c25e3adba8c70df.jpg',
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
