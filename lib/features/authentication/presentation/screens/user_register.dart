import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import 'package:touch_of_beauty/features/authentication/presentation/screens/otp_screen.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/citeis_dropdown_button.dart';
import '../widgets/password_auth_field.dart';
import '../widgets/phone_auth_field.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {


  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool chosen = false;


  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }



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
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            var cubit = AuthCubit.get(context);
            if (state is RegisterLoading) {
              showProgressIndicator(context);
            }
            if (state is RegisterSuccess) {
              Navigator.pop(context);
              if (state.registerModel != null &&
                  cubit.mainResponse.errorCode == 0) {
                Fluttertoast.showToast(
                  msg: cubit.mainResponse.errorMessage,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: AppColorsLightTheme.primaryColor,
                );
                Navigator.pushReplacementNamed(context, ScreenName.otpScreen,
                    arguments: OtpArgs(phoneNumber: state.registerModel!.phoneNumber,isConfirmPassword: false));
                cubit.profileImage =null;
              } else if (state.registerModel == null &&
                  cubit.mainResponse.errorCode != 0) {
                Fluttertoast.showToast(
                  msg: cubit.mainResponse.errorMessage,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: AppColorsLightTheme.primaryColor,
                );
              }
            }
            if (state is RegisterError) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: "${state.error.substring(0, 5)}...",
                gravity: ToastGravity.CENTER,
                backgroundColor: AppColorsLightTheme.primaryColor,
              );
            }
            if (state is RegisterErrorInData) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: state.error,
                gravity: ToastGravity.CENTER,
                backgroundColor: AppColorsLightTheme.primaryColor,
              );
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
                    height: 10.h,
                  ),
                  Text(
                    LocaleKeys.new_user.tr(),
                    style: TextStyle(
                        color: const Color(0xff262626),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp,),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    LocaleKeys.register_as_new_user.tr(),
                    style: TextStyle(
                        color: const Color(0xffABABAB),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 16.sp,),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        cubit.getImagePick();
                      },
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                            color: AppColorsLightTheme.primaryColor,
                            shape: BoxShape.circle,),
                        child: cubit.profileImage == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.choose_image.tr(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontPath.almaraiRegular,
                                        fontSize: 10.sp,),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 15.r,
                                  ),
                                ],
                              )
                            : Image.file(
                                cubit.profileImage!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  AuthTextFormField(
                    hintText: LocaleKeys.user_name.tr(),
                    controller: name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.enter_user_name.tr();
                      } else if (value.length < 5) {
                        return LocaleKeys.short_name.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: LocaleKeys.email.tr(),
                    controller: email,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.enter_email.tr();
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return LocaleKeys.incorrect_email.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  const CityDropDownButton(),
                  SizedBox(
                    height: 14.h,
                  ),
                  PhoneAuthFormField(controller: phone,),
                  SizedBox(
                    height: 14.h,
                  ),
                  PasswordAuthField(controller: password,hintText: LocaleKeys.password.tr()),
                  SizedBox(
                    height: 14.h,
                  ),
                  PasswordAuthField(controller: confirmPassword,isConfirmPassword: true,confirmController: password, hintText: LocaleKeys.password_reenter.tr(),),
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
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ScreenName.privacyScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: '${LocaleKeys.agree_privacy_terms.tr()}  ',
                            style: TextStyle(
                                color: AppColorsLightTheme.secondaryColor,
                                fontFamily: FontPath.almaraiRegular,
                                fontSize: 10.sp),
                            children: [
                              TextSpan(
                                text: LocaleKeys.privacy_terms.tr(),
                                style: TextStyle(
                                    color: AppColorsLightTheme.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontPath.almaraiBold,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  AuthButton(
                      buttonTitle: LocaleKeys.register.tr(),
                      isTapped: chosen?() {
                        if (cubit.profileImage == null) {
                          Fluttertoast.showToast(
                              msg: LocaleKeys.please_choose_image.tr(),
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }else if(formKey.currentState!.validate()){
                          cubit.userRegister(userName: name.text, password: password.text, email: email.text, phone: phone.text);
                        }
                      }:null,
                      width: double.infinity),
                  SizedBox(
                    height: 25.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, ScreenName.loginScreen, (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${LocaleKeys.have_account.tr()}  ',
                          style: TextStyle(
                              color: const Color(0xff262626),
                              fontFamily: FontPath.almaraiRegular,
                              fontSize: 10.sp),
                        ),
                        Text(
                          LocaleKeys.login.tr(),
                          style: TextStyle(
                              color: AppColorsLightTheme.secondaryColor,
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
