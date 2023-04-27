import 'package:easy_localization/easy_localization.dart';
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
import '../../../../translations/locale_keys.g.dart';
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
                AuthTextFormField(
                  hintText: LocaleKeys.phone_number.tr(),
                  keyboardType: TextInputType.phone,
                  // textDirection: D,
                  validate: (value) {
                    var regex = RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
                    if (value!.isEmpty) {
                      return LocaleKeys.enter_your_phone.tr();
                    } else if (!regex.hasMatch(value)) {
                      return LocaleKeys.incorrect_phone_format.tr();
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
