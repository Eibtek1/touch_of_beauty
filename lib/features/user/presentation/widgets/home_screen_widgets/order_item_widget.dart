import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h,),
      child: Container(
        height: 95.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h,),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColorsLightTheme.smoothPageIndicatorGreyColor),
            ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              height: 70.h,
              width: 70.w,
              child: Image.asset(
                ImagePath.carouselImage1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  Text(
                    'خدمة تصفيف الشعر',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '200  رس',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xffB83561),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'العناية بالبشرة',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: AppColorsLightTheme.primaryColor,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
