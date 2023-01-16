import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/phone_form_field.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  bool chosen = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80.h,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'مستخدم جديد',
              style: TextStyle(
                  color: const Color(0xff262626),
                  fontFamily: FontPath.almaraiBold,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'قم بالتسجيل كمستخدم جديد',
              style: TextStyle(
                  color: const Color(0xffABABAB),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 35.h,
            ),
            const AuthTextFormField(hintText: 'اسم المستخدم'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'البريد الالكتروني'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'المدينة'),
            SizedBox(
              height: 14.h,
            ),
            const PhoneFormField(),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'كلمة المرور'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'اعد كتابة كلمة المرور'),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: chosen,
                    onChanged: (d) {
                      setState(() {
                        chosen = d!;
                      });
                    }),
                SizedBox(
                  width: 10.w,
                ),
                RichText(
                  text: TextSpan(
                    text: 'الموافقة علي شروط الخصوصية  ',
                    style: TextStyle(
                        color: AppColorsLightTheme.secondaryColor,
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 10.sp),
                    children: [
                      TextSpan(
                        text: 'شروط الخصوصية',
                        style: TextStyle(
                            color: AppColorsLightTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthButton(
                buttonTitle: 'تسجيل', isTapped: () {}, width: double.infinity),
            SizedBox(
              height: 25.h,
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'هل لديك حساب ؟  ',
                    style: TextStyle(
                        color: const Color(0xff262626),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 10.sp),
                  ),
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                        color: AppColorsLightTheme.secondaryColor,
                        fontFamily: FontPath.almaraiBold,
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
