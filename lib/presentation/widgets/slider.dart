import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/slider_imagesList.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
      items: sliderImageList
          .map(
            (e) => ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Stack(
                children: [
                  Image.network(
                    e,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.30,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}


