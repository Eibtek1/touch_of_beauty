import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  final List<String> galleryList = [
    ImagePath.gallary1,
    ImagePath.gallary2,
    ImagePath.gallary3,
    ImagePath.gallary4,
    ImagePath.gallary5,
    ImagePath.gallary6,
    ImagePath.gallary7,
    ImagePath.gallary8,
    ImagePath.gallary9,
    ImagePath.gallary10,
    ImagePath.gallary11,
    ImagePath.gallary12,
    ImagePath.gallary13,
    ImagePath.gallary14,
    ImagePath.gallary15,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'معرض الاعمال',
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 18.sp),
        ),
        toolbarHeight: 60.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const Divider(),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  height: 76.h,
                  width: 76.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.asset(
                    galleryList[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: galleryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
