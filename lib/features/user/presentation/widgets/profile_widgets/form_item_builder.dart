import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';

class FormItemBuilder extends StatelessWidget {
  final String image;
  final String itemTitle;
  final String title;
  const FormItemBuilder({Key? key, required this.image, required this.itemTitle, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 46.w,
            decoration: BoxDecoration(
              color: AppColorsLightTheme.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.r)
            ),
            child: Center(
              child: SvgPicture.asset(image,height: 24.h,width: 21.w,),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(itemTitle,style: TextStyle(fontFamily: FontPath.almaraiLight,fontSize: 15.sp,color: const Color(0xffA4A4A4)),),
                Text(title,style: TextStyle(fontFamily: FontPath.almaraiRegular,fontSize: 15.sp,color: const Color(0xff3A3A3A)),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
