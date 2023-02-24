import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/cache_manager/cache_keys.dart';
import 'package:touch_of_beauty/core/cache_manager/shared_preferences.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import 'package:touch_of_beauty/features/authentication/presentation/widgets/auht_text_form_field.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            var cubit = AuthCubit.get(context);
            if(state is LoginLoading){
              showProgressIndicator(context);
            }
            if(state is LoginSuccess){
              Navigator.pop(context);
              Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
              if(cubit.mainResponse.errorCode ==0 && state.loginModel.userType==1){
                CacheHelper.saveData(key: CacheKeys.token, value: state.loginModel.token).whenComplete(() {
                  CacheHelper.saveData(key: CacheKeys.userType, value: state.loginModel.userType.toString()).whenComplete(() {
                    token = CacheHelper.getData(key: CacheKeys.token);
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.userMainLayout, (route) => false);
                  });
                });
              }
              else if(cubit.mainResponse.errorCode ==0 && state.loginModel.userType==2){
                CacheHelper.saveData(key: CacheKeys.token, value: state.loginModel.token).whenComplete(() {
                  CacheHelper.saveData(key: CacheKeys.userType, value: state.loginModel.userType.toString()).whenComplete(() {
                    token = CacheHelper.getData(key: CacheKeys.token);
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.vendorMainLayout, (route) => false);
                  });
                });
              }
              else if(cubit.mainResponse.errorCode ==0 && state.loginModel.userType==3){
                CacheHelper.saveData(key: CacheKeys.token, value: state.loginModel.token).whenComplete(() {
                  CacheHelper.saveData(key: CacheKeys.userType, value: state.loginModel.userType.toString()).whenComplete(() {
                    token = CacheHelper.getData(key: CacheKeys.token);
                    Navigator.pushNamedAndRemoveUntil(context, ScreenName.freelancerMainLayout, (route) => false);
                  });
                });
              }
            }
            if(state is LoginSuccessButErrorInData){
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.errorMessage);
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
                  AuthTextFormField(
                    hintText: 'رقم الهاتف',
                    maxLength: 20,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل رقم الهاتف';
                      } else if (value.length < 9) {
                        return 'لا يحب ان يقل الرقم عن 10 ارقام';
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
                    height: 10.h,
                  ),
                  AuthTextFormField(
                    hintText: 'كلمة المرور',
                    controller: password,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      } else if (value.length < 6) {
                        return 'كلمة المرور ضعيفة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ScreenName.forgetPasswordScreen);
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
                      buttonTitle: 'دخول',
                      isTapped: () {
                        if(formKey.currentState!.validate()){
                          cubit.login(phone: phone.text, password: password.text);
                        }
                      },
                      width: double.infinity),
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
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
                    onTap: () {
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
            );
          },
        ),
      ),
    );
  }
}
