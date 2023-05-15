import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/auth_button.dart';
import '../widgets/phone_auth_field.dart';
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
  void dispose() {
    phone.dispose();
    super.dispose();
  }
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
                  phoneNumber: phone.text,
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
                  LocaleKeys.forget_your_password.tr(),
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
                    LocaleKeys.send_otp.tr(),
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
                PhoneAuthFormField(controller: phone,),
                SizedBox(
                  height: 30.h,
                ),
                AuthButton(
                    buttonTitle: LocaleKeys.valid_phone_number.tr(),
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
