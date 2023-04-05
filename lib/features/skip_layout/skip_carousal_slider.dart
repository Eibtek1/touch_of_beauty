import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';


class SkipCarouselSliderWidget extends StatefulWidget {
  const SkipCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<SkipCarouselSliderWidget> createState() => _SkipCarouselSliderWidgetState();
}

class _SkipCarouselSliderWidgetState extends State<SkipCarouselSliderWidget> {
  List<String> imagesList =[
    ImagePath.onboarding1,
    ImagePath.onboarding2,
    ImagePath.onboarding3,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168.h,
      child:  CarouselSlider(
        options: CarouselOptions(
            initialPage: 0,
            enableInfiniteScroll: true,
            height: 164.0.h,
            autoPlay: true,
            autoPlayAnimationDuration:
            const Duration(milliseconds: 600),
            autoPlayInterval: const Duration(seconds: 2)),
        items: imagesList.map((i) {
          return Container(
            clipBehavior: Clip.antiAlias,
            height: 160.h,
            width: 278.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(i,fit: BoxFit.cover,),
          );
        }).toList(),
      ),
    );
  }
}
