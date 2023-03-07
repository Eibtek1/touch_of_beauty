import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';

class SearchCheckButtonItem extends StatelessWidget {
  final int index;
  final int? currentIndex;
  final String title;
  final void Function()? onPressed;
  final void Function(bool?)? onChanged;

  const SearchCheckButtonItem({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.title,
    required this.onPressed,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 48.h,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              backgroundColor: AppColorsLightTheme.authTextFieldFillColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              side: BorderSide(
                width: index == currentIndex && currentIndex != null ? 1.w : 0,
                color: index == currentIndex && currentIndex != null
                    ? AppColorsLightTheme.primaryColor
                    : AppColorsLightTheme.smoothPageIndicatorGreyColor,
                style: BorderStyle.solid,
              ),),
          child: Row(
            children: [
              Checkbox(
                value: index == currentIndex && currentIndex != null
                    ? true
                    : false,
                shape: const CircleBorder(),
                onChanged: onChanged,
              ),
              SizedBox(
                width: 24.w,
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColorsLightTheme.searchScreenTextColor,
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
