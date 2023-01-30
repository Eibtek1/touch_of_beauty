import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 90.h,),
          Text(
            'هل نسيت كلمة السر؟',
            style: TextStyle(
                color: const Color(0xff262626),
                fontFamily: FontPath.almaraiBold,
                fontSize: 20.sp),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.only(left:120.w),
            child: Text(
              'لقد أرسلنا كود تفعيلي من رقم 4 ارقام على الهاتف الخاص بك',
              style: TextStyle(
                  height: 1.8.h,
                  color: const Color(0xffABABAB),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 140.h,),

          const AuthTextFormField(hintText: 'ادخل رقم الهاتف', controller: null,),
          SizedBox(height: 30.h,),

          AuthButton(
              buttonTitle: 'تأكيد الرقم', isTapped: () {Navigator.pushNamed(context, ScreenName.otpScreen);}, width: double.infinity),

        ],
      ),
    );
  }
}
