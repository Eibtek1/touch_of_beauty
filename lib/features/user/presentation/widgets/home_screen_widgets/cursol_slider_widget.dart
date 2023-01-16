import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> carouselItemsList;
  const CarouselSliderWidget({Key? key, required this.carouselItemsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168.h,
      child:  CarouselSlider(
        options: CarouselOptions(
          // viewportFraction: 0.7,
          // enlargeCenterPage: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            height: 164.0.h,
            autoPlay: true,
            autoPlayAnimationDuration:
            const Duration(milliseconds: 600),
            autoPlayInterval: const Duration(seconds: 2)),
        items: carouselItemsList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 160.h,
                    width: 278.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Image.asset(i,fit: BoxFit.cover,),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
