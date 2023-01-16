import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../widgets/auth_button.dart';

class ChooseTypeScreen extends StatelessWidget {
  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool type = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                height: 95.h,
                width: 95.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffF9F9F9)),
                child: SvgPicture.asset(
                  SvgPath.chooseTypeIcon,
                  width: 25.w,
                  height: 20.h,
                ),
              ),
            ),
            SizedBox(height: 25.h,),
            Text(
              'تسجيل الدخول ك',
              style: TextStyle(
                  color: const Color(0xff262626),
                  fontFamily: FontPath.almaraiBold,
                  fontSize: 18.sp),
            ),
            SizedBox(height: 12.h,),
            Text(
              'قم يتحديد اذا كنت طالب خدمة أو مقدم خدمة',
              style: TextStyle(
                  color: const Color(0xff696969),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 30.h,),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 162.w,
                      height: 44.h,
                      child: OutlinedButton(
                        onPressed: () {
                          setState((){
                            type = true;
                          });
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                                color: type?AppColorsLightTheme.primaryColor:AppColorsLightTheme.smoothPageIndicatorGreyColor,
                                width: 0.8.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            if(type)const Icon(
                              Icons.check_circle,
                              color: AppColorsLightTheme.primaryColor,
                            ),
                            Expanded(
                              child: Text(
                                'طالب خدمة',
                                textAlign:TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xff666666),
                                    fontFamily: FontPath.almaraiBold,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 162.w,
                      height: 44.h,
                      child: OutlinedButton(
                        onPressed: () {
                          setState((){
                            type = false;
                          });
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                                color: !type?AppColorsLightTheme.primaryColor:AppColorsLightTheme.smoothPageIndicatorGreyColor,
                                width: 0.8.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            if(!type)const Icon(
                              Icons.check_circle,
                              color: AppColorsLightTheme.primaryColor,
                            ),
                            Expanded(
                              child: Text(
                                'مقدمة خدمة' ,
                                textAlign:TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xff666666),
                                    fontFamily: FontPath.almaraiBold,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 30.h,),
            AuthButton(
              buttonTitle: 'استمرار',
              isTapped: () {
                if(type)Navigator.pushNamed(context, ScreenName.userRegister);
                if(!type)Navigator.pushNamed(context, ScreenName.vendorRegister);
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
