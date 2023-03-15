import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

import '../../../../../core/assets_path/svg_path.dart';

class CenterEmployeesWidget extends StatelessWidget {
  const CenterEmployeesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(color: Colors.transparent)
    );
    return Column(
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: AppColorsLightTheme.primaryColor)),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 65.w,
                  height: 65.h,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagePath.gallery13,
                    fit: BoxFit.cover,
                  ),
                ),
                Icon(
                  Icons.camera_alt_rounded,
                  size: 32.r,
                  color: Colors.white54,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 30.h,
          width: 80.w,
          child: TextField(

            decoration: InputDecoration(
              hintText: 'الاسم',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 8.sp,
                fontFamily: FontPath.almaraiRegular
              ),
              border: outlineBorder,
              enabledBorder: outlineBorder,
              focusedBorder: outlineBorder,
              fillColor: AppColorsLightTheme.authTextFieldFillColor,
              filled: true,
              suffix: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SvgPicture.asset(
                  SvgPath.edit,
                  width: 15.w,
                  height: 15.h,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              )
            ),
          ),
        ),
      ],
    );
  }
}
