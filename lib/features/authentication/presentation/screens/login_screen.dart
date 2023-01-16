import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/authentication/presentation/widgets/auht_text_form_field.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Image.asset(
                ImagePath.authLogo,
                width: 154.w,
                height: 154.h,
              ),
            ),
            SizedBox(
              height: 67.h,
            ),
            Text(
              'تسجيل الدخول',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xff262626),
                  fontFamily: FontPath.almaraiBold,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            const AuthTextFormField(hintText: 'اسم المستخدم'),
            SizedBox(
              height: 10.h,
            ),
            const AuthTextFormField(hintText: 'كلمة المرور'),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ScreenName.forgetPasswordScreen);
              },
              child: Text(
                'هل نسيت كلمة المرور؟',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: const Color(0xffAAADB5),
                    fontFamily: FontPath.almaraiLight,
                    fontSize: 13.sp),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            AuthButton(
                buttonTitle: 'دخول', isTapped: () {}, width: double.infinity),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(5.r),
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                        color: AppColorsLightTheme.primaryColor,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      SvgPath.bulb,
                      width: 15.w,
                      height: 15.h,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'استكشاف التطبيق',
                  style: TextStyle(
                      color: AppColorsLightTheme.secondaryColor,
                      fontFamily: FontPath.almaraiRegular,
                      fontSize: 10.sp),
                )
              ],
            ),
            SizedBox(
              height: 57.h,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ScreenName.chooseRegisterType);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب ؟  ',
                    style: TextStyle(
                        color: const Color(0xff262626),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 10.sp),
                  ),
                  Text(
                    'انشاء حساب',
                    style: TextStyle(
                        color: AppColorsLightTheme.secondaryColor,
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 14.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
