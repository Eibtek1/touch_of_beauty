import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import '../../../../../core/assets_path/font_path.dart';

class NotificationItemBuilder extends StatelessWidget {
  const NotificationItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      child: Container(
        height: 88.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorsLightTheme.authTextFieldFillColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.17)
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 29.w,right: 12.w,top: 11.h,bottom: 11.h),
          child: Row(
            children: [
              Container(
                height: 63.h,
                width: 63.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child:Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColorsLightTheme.secondaryColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: SvgPicture.asset(SvgPath.notificationBill,height: 20.h,width: 25.w,),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',style:TextStyle(
                        height: 1.2.h,
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular,
                        color: const Color(0xff1E2432)),),
                    SizedBox(height: 10.h,),
                    Text('4:02',style:TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular,
                        color: const Color(0xff1E2432)),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
