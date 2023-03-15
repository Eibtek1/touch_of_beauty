import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../../core/assets_path/font_path.dart';
class TimeContainerWidget extends StatelessWidget {
  final String title;
  final bool isThereWorkingTime;
  final String? from;
  final String? to;
  final void Function() onPressed;
  final void Function()? onLongPress;

  const TimeContainerWidget(
      {Key? key,
      required this.title,
        required this.isThereWorkingTime ,
       this.from,
       this.to,
      required this.onPressed, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        height: 85.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: const Offset(0, 0),
                blurRadius: 10.r,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 13.w,
            ),
            Text(
              title,
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              'من',
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 7.w,
            ),
            Container(
                height: 31.h,
                width: 61.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xff3C475C),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    isThereWorkingTime?from!.substring(0,5):"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 12.sp),
                  ),
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'الي',
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiRegular),
            ),
            SizedBox(
              width: 7.w,
            ),
            Container(
                height: 31.h,
                width: 61.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xff3C475C),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    isThereWorkingTime?to!.substring(0,5):"",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                        color: const Color(0xff3C475C),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 12.sp),
                  ),
                )),
            SizedBox(
              width: 7.w,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                isThereWorkingTime ? "تعديل" : "اضافة",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: AppColorsLightTheme.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
