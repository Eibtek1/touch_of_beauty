import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            showProgressIndicator(context);
          }
          if (state is ForgetPasswordSuccess) {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: state.mainResponse.errorMessage.toString());
            if (state.mainResponse.errorCode == 0) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                ScreenName.otpScreen,
                (route) => false,
                arguments: OtpArgs(
                  phoneNumber: null,
                  isConfirmPassword: true,
                ),
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                SizedBox(
                  height: 90.h,
                ),
                Text(
                  'هل نسيت كلمة السر؟',
                  style: TextStyle(
                      color: const Color(0xff262626),
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 120.w),
                  child: Text(
                    'لقد أرسلنا كود تفعيلي من رقم 4 ارقام على الهاتف الخاص بك',
                    style: TextStyle(
                        height: 1.8.h,
                        color: const Color(0xffABABAB),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 140.h,
                ),
                AuthTextFormField(
                  hintText: 'رقم الهاتف',
                  maxLength: 20,
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                    var regex = RegExp(r'^((?:[+?0?0?966]+)(?:\s?\d{2})(?:\s?\d{7}))$');
                    if (value!.isEmpty) {
                      return 'ادخل رقم الهاتف';
                    } else if (!regex.hasMatch(value)) {
                      return 'صيغة الهاتف غير صحيحة';
                    }
                    return null;
                  },
                  suffix: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SvgPicture.asset(
                      SvgPath.saudiPhoneFieldIcon,
                      width: 52.w,
                      height: 15.h,
                    ),
                  ),
                  controller: phone,
                ),
                SizedBox(
                  height: 30.h,
                ),
                AuthButton(
                    buttonTitle: 'تأكيد الرقم',
                    isTapped: () {
                      if (formKey.currentState!.validate()) {
                        cubit.forgetPassword(phoneNumber: phone.text);
                      }
                    },
                    width: double.infinity),
              ],
            ),
          );
        },
      ),
    );
  }
}
