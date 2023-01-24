import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/complain_text_field.dart';

import '../../../../../../core/assets_path/font_path.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'الدفع',
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
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColorsLightTheme.primaryColor),
                color: Colors.white),
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                ),
                Text(
                  'البطاقات الائتمانية',
                  style: TextStyle(
                      color: const Color(0xff263238),
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 12.sp),
                ),
                SizedBox(
                  width: 19.w,
                ),
                Image.asset(
                  ImagePath.mada,
                  height: 41.h,
                  width: 41.w,
                ),
                SizedBox(
                  width: 11.w,
                ),
                Image.asset(
                  ImagePath.visa,
                  height: 21.h,
                  width: 32.w,
                ),
                SizedBox(
                  width: 11.w,
                ),
                Image.asset(
                  ImagePath.masterCard,
                  height: 15.h,
                  width: 26.w,
                ),
              ],
            ),
          ),
          CustomUserTextField(hintText: 'رقم البطاقة', height: 50.h),
          CustomUserTextField(hintText: 'الاسم علي البطاقة', height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
                height: 50.h,
                width: 162.w,
                decoration: BoxDecoration(
                    color: const Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('تاريخ الانتهاء',
                      style: TextStyle(
                          color: const Color(0xff909090),
                          fontSize: 14.sp,
                          fontFamily: FontPath.almaraiRegular),),
                    const Icon(Icons.calendar_month_sharp,color: Color(0xff909090),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 14.h),
                height: 50.h,
                width: 162.w,
                decoration: BoxDecoration(
                    color: const Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CCV',
                      style: TextStyle(
                          color: const Color(0xff909090),
                          fontSize: 14.sp,
                          fontFamily: FontPath.almaraiRegular),),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
