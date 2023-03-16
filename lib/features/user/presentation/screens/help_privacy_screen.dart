import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../widgets/about_widget.dart';

class HelpAnpPrivacyScreen extends StatelessWidget {
  const HelpAnpPrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 49.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      foregroundColor: AppColorsLightTheme.primaryColor,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColorsLightTheme.primaryColor,
                      size: 15.r,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'المساعدة والخصوصية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 34.w,
                  height: 34.h,
                )
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Image.asset(
                ImagePath.authLogo,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const AboutWidget(
                    title:
                    'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم يوضع في التصاميم  لتعرض على العميللوريم ايبسوم هو نموذج افتراضي  يوضع في التصاميم',
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
