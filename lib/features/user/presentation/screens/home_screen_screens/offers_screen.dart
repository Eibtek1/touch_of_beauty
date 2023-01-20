import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../widgets/home_screen_widgets/offers_item_builder.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

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
          SizedBox(height: 10.h,),
          SizedBox(
            height: 30.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                    height: 28.h,
                    width: 87.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F3F6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'عناية شخصية',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(height: 10.h,),
          Divider(
            height: 5.h,
          ),
          SizedBox(height: 10.h,),
          Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index) { return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: const OffersItemBuilder(),
          ); },itemCount: 5,))
        ],
      ),
    );
  }
}
