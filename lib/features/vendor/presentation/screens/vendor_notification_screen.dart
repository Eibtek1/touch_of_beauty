import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

import '../../../../core/assets_path/font_path.dart';

class VendorNotificationScreen extends StatelessWidget {
  const VendorNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          'اشعارات الخدمة',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: FontPath.almaraiBold,
              color: const Color(0xff1E2432)),
        ),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) { return notificationBuilder(); },itemCount: 10,),
    );
  }

  Widget notificationBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
        height: 110.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColorsLightTheme.authTextFieldFillColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3.h),
                blurRadius: 6.r,
                color: Colors.black.withOpacity(0.14)),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 77.h,
              width: 74.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Image.asset(
                ImagePath.onboarding2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'طلب خدمة جديدة',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xffB83561)),
                      ),
                      Text(
                        '4:35',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontPath.poppinsRegular,
                            color: const Color(0xff4A4A4A)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: Text(
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص'*2,
                      maxLines: 2,
                      style: TextStyle(
                        height: 1.3.h,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff4A4A4A)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
