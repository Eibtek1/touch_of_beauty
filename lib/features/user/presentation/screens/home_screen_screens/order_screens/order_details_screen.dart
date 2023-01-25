import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../../core/assets_path/font_path.dart';
import '../../../widgets/custom_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تفاصيل الحجز',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Divider(),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 479.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 17.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColorsLightTheme.smoothPageIndicatorGreyColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ListView.builder(itemBuilder: (BuildContext context, int index) { return buildReservationDetailsItem(); },itemCount: 15,),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomUserButton(
                buttonTitle: 'اطلب الخدمة',
                isTapped: () {
                  Navigator.pushNamed(context, ScreenName.paymentScreen);
                },paddingVertical: 16.h, paddingHorizontal: 45.w,
                width: double.infinity),
          ],
        ),
      ),
    );
  }

  Widget buildReservationDetailsItem(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('خدمة تصفيف الشعر',style: TextStyle(color: const Color(0xff666666),fontSize: 14.sp,fontFamily: FontPath.almaraiBold),),
              SizedBox(height: 8.h,),
              Text('10 دقائق',style: TextStyle(color: const Color(0xff3C475C),fontSize: 14.sp,fontFamily: FontPath.almaraiRegular),),
            ],
          ),
           Text('10 ريال',style: TextStyle(color: const Color(0xffB83561),fontSize: 14.sp,fontFamily: FontPath.almaraiRegular),),
        ],
      ),
    );
  }
}
