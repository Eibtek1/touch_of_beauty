import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/features/skip_layout/scip_alert_dialog.dart';
import 'package:touch_of_beauty/features/skip_layout/skip_carousal_slider.dart';
import 'package:touch_of_beauty/features/skip_layout/skip_main_features_builder.dart';

import '../../core/app_theme/light_theme.dart';
import '../../core/assets_path/font_path.dart';
import 'featured_centers_builder.dart';

class SkipHomeScreen extends StatelessWidget {
  const SkipHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('الرئيسية',style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily: FontPath.poppinsRegular),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            SizedBox(height: 10.h,),
            const SkipCarouselSliderWidget(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'ما الذي تريد أن تفعل؟',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff1E2432)),
            ),
            SizedBox(
              height: 15.h,
            ),
            const SkipMainFeaturedComponent(),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'صالون مميز',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontPath.almaraiBold,
                      color: const Color(0xff1E2432)),
                ),
                InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return const SkipAlertDialog(title: 'يجب تسجيل الدخول لرؤية الصالونات المميزة',);
                    });
                  },
                  child: Text(
                    'شاهد كل الصالونات',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: AppColorsLightTheme.secondaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const SkipFeaturedServicesProvidersComponent(),
            SizedBox(height: 10.h,),

          ],
      ),
    );
  }
}
