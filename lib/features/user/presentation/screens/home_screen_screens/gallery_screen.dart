import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  final List<String> galleryList = [
    ImagePath.gallery1,
    ImagePath.gallery2,
    ImagePath.gallery3,
    ImagePath.gallery4,
    ImagePath.gallery5,
    ImagePath.gallery6,
    ImagePath.gallery7,
    ImagePath.gallery8,
    ImagePath.gallery9,
    ImagePath.gallery10,
    ImagePath.gallery11,
    ImagePath.gallery12,
    ImagePath.gallery13,
    ImagePath.gallery14,
    ImagePath.gallery15,
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
