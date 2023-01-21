import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class AppDrawer extends StatelessWidget {
  final Function closeDrawer;
  const AppDrawer({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColorsLightTheme.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 47.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    closeDrawer();
                  },
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.cancel_outlined,color: const Color(0xffB83561),size: 24.r,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 43.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImagePath.hairCare,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'سارة احمد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 14.sp),
                )
              ],
            ),
            SizedBox(height: 47.h,),
            Text(
              'من نحن',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontPath.almaraiLight,
                  color: Colors.white),
            ),
            SizedBox(height: 27.h,),
            Text(
              'ما هي مهمتنا',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontPath.almaraiLight,
                  color: Colors.white),
            ),
            SizedBox(height: 27.h,),
            Text(
              'اتصل بنا',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontPath.almaraiLight,
                  color: Colors.white),
            ),
            SizedBox(height: 27.h,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ScreenName.complainsScreen);
              },
              child: Text(
                'تقديم شكوى',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontPath.almaraiLight,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 1.h,
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: 200.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.exit_to_app,size: 24.r,color: Colors.white,),
                SizedBox(width: 5.w,),
                Text(
                  'تسجيل خروج',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: FontPath.almaraiLight,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
