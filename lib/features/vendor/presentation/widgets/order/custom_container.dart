import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String bodyTitle;
  final double? width;
  final double? height;
  const CustomContainer({Key? key, required this.title, required this.bodyTitle, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 88.h,
      width: width ?? 150.w,
      decoration: BoxDecoration(
        color: AppColorsLightTheme.authTextFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColorsLightTheme.primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontFamily: FontPath.almaraiRegular,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            bodyTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontFamily: FontPath.almaraiRegular,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
