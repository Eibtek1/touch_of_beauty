import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/cache_manager/cache_keys.dart';
import '../../../../core/cache_manager/shared_preferences.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/auth_button.dart';
import '../widgets/phone_auth_field.dart';
import '../widgets/pin_field_builder.dart';

class OtpArgs {
  final dynamic phoneNumber;
  final bool isConfirmPassword;

  OtpArgs({required this.phoneNumber, this.isConfirmPassword = false});
}

class OtpScreen extends StatefulWidget {
  final dynamic phoneNumber;
  final bool isConfirmPassword;

  const OtpScreen({Key? key, this.phoneNumber, required this.isConfirmPassword})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    phone.text =
        widget.phoneNumber != null ? widget.phoneNumber.toString() : '';
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    pinController.dispose();
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
          var cubit = AuthCubit.get(context);
          if (state is ConfirmRegisterLoading) {
            showProgressIndicator(context);
          }
          if (state is ConfirmRegisterSuccess) {
            Navigator.pop(context);
            if (cubit.mainResponse.errorCode == 0) {
              Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
              Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
            } else {
              Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
            }
          }
          if (state is ConfirmRegisterError) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
          }
          if (state is ConfirmForgetPasswordLoading) {
            showProgressIndicator(context);
          }
          if (state is ConfirmForgetPasswordSuccess) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
            CacheHelper.saveData(
                key: CacheKeys.token,
                value: state.confirmForgetPasswordModel.token)
                .whenComplete(() {
                  token = CacheHelper.getData(key: CacheKeys.token);
                  Navigator.pushReplacementNamed(context, ScreenName.changeForgetPasswordScreen, );
            });
          }
          if (state is ConfirmForgetPasswordSuccessButErrorInData) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: state.errorMessage);
          }
          if (state is ConfirmForgetPasswordError) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 25.w),
                      child: Image.asset(
                        ImagePath.phoneLogo,
                        width: 206.w,
                        height: 221.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Text(
                    LocaleKeys.valid_phone_number.tr(),
                    style: TextStyle(
                        color: const Color(0xff262626),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 14.h,
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
                    height: 30.h,
                  ),
                  PhoneAuthFormField(controller: phone,),
                  SizedBox(
                    height: 20.h,
                  ),
                  PinFieldBuilder(
                    controller: pinController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AuthButton(
                      buttonTitle: LocaleKeys.valid_phone_number.tr(),
                      isTapped: () {
                        if (!widget.isConfirmPassword) {
                          cubit.confirmRegister(
                              phone: phone.text,
                              randomCode: pinController.text);
                        } else if (widget.isConfirmPassword) {
                          cubit.confirmPassword(
                              phone: phone.text,
                              randomCode: pinController.text);
                        }
                      },
                      width: double.infinity),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
