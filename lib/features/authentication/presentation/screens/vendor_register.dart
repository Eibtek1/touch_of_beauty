import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enums/vendor_signing_type_enum.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/citeis_dropdown_button.dart';

class VendorRegisterScreen extends StatefulWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<VendorRegisterScreen> createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController taxNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  VendorSigningType vendorSigningType = VendorSigningType.center;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 60.h,
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
              if (state.registerModel != null && cubit.mainResponse.errorCode == 0) {
                Fluttertoast.showToast(
                  msg: cubit.mainResponse.errorMessage,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: AppColorsLightTheme.primaryColor,
                );
                Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
                cubit.profileImage =null;
              }
              else if (state.registerModel == null &&
                  cubit.mainResponse.errorCode != 0) {
                Fluttertoast.showToast(
                  msg: cubit.mainResponse.errorMessage,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: AppColorsLightTheme.primaryColor,
                );
              }
            }
            if(state is RegisterError){
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: "${state.error.substring(0,5)}...",
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
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.getImagePick();
                        },
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                              color: AppColorsLightTheme.primaryColor,
                              shape: BoxShape.circle),
                          child: cubit.profileImage == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'صورة شخصيه',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: FontPath.almaraiRegular,
                                          fontSize: 10.sp),
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
                      vendorSigningType == VendorSigningType.freelancer
                          ? SizedBox(
                              width: 10.w,
                            )
                          : const SizedBox.shrink(),
                      vendorSigningType == VendorSigningType.freelancer
                          ? InkWell(
                              onTap: () {
                                cubit.getFreelanceImagePick();
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    color: AppColorsLightTheme.primaryColor,
                                    shape: BoxShape.circle),
                                child: cubit.freelancerImage == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'صورة العمل الحر',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    FontPath.almaraiRegular,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      )
                                    : Image.file(
                                        cubit.freelancerImage!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'اسم المستخدم',
                    controller: name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل اسم المستحدم';
                      }else if(value.length<5){
                        return 'لا يحب ان يكون الاسم اقل من خمسة احرف';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'البريد الالكتروني',
                    controller: email,

                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل البريد الالكتروني';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'صيعة البريد غير صحيحة';
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
                  AuthTextFormField(
                    hintText: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    suffix: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: SvgPicture.asset(
                        SvgPath.saudiPhoneFieldIcon,
                        width: 52.w,
                        height: 15.h,
                      ),
                    ),
                    validate: (value) {
                      var regex = RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
                      if (value!.isEmpty) {
                        return 'ادخل رقم الهاتف';
                      } else if (!regex.hasMatch(value)) {
                        return 'صيغة الهاتف غير صحيحة';
                      }
                      return null;
                    },
                    controller: phone,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'الرقم الضريبي',
                    keyboardType: TextInputType.phone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل الخدمات التي تقدمها';
                      }
                      return null;
                    },
                    controller: taxNumber,
                  ),
                  vendorSigningType == VendorSigningType.center
                      ? SizedBox(
                          height: 14.h,
                        )
                      : const SizedBox.shrink(),
                  vendorSigningType == VendorSigningType.center
                      ? const AuthTextFormField(
                          hintText: 'اسم الصالون',
                          controller: null,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'الخدمات التي تقدمها',
                    controller: description,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل الخدمات التي تقدمها';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    'ما هو نوع مقدم الخدمة؟',
                    style: TextStyle(
                        color: const Color(0xffABABAB),
                        fontFamily: FontPath.almaraiRegular,
                        fontSize: 14.sp),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 125.w,
                        child: RadioListTile<VendorSigningType>(
                          activeColor: AppColorsLightTheme.secondaryColor,
                          title: Text(
                            'مركز',
                            style: TextStyle(
                                fontFamily: FontPath.almaraiLight,
                                fontSize: 12.sp),
                          ),
                          value: VendorSigningType.center,
                          groupValue: vendorSigningType,
                          onChanged: (VendorSigningType? value) {
                            setState(() {
                              vendorSigningType = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 125.w,
                        child: RadioListTile<VendorSigningType>(
                          activeColor: AppColorsLightTheme.secondaryColor,
                          title: Text('عمل حر',
                              style: TextStyle(
                                  fontFamily: FontPath.almaraiLight,
                                  fontSize: 12.sp)),
                          value: VendorSigningType.freelancer,
                          groupValue: vendorSigningType,
                          onChanged: (VendorSigningType? value) {
                            setState(() {
                              vendorSigningType = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'كلمة المرور',
                    controller: password,
                    isPassword: true,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      } else if (value.length < 8) {
                        return 'كلمة المرور ضعيفة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthTextFormField(
                    hintText: 'اعد كتابة كلمة المرور',
                    controller: confirmPassword,
                    isPassword: true,
                    validate: (value) {
                      if (confirmPassword.text != password.text) {
                        return 'كلمة المرور غير متشابهة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  AuthButton(
                      buttonTitle: 'تسجيل',
                      isTapped: () {
                        if (cubit.profileImage == null &&
                            vendorSigningType == VendorSigningType.center) {
                          Fluttertoast.showToast(
                              msg: 'برجال اختيار صورة شخصية',
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,);
                        } else if (cubit.profileImage == null &&
                            cubit.freelancerImage == null &&
                            vendorSigningType == VendorSigningType.freelancer) {
                          Fluttertoast.showToast(
                              msg: 'برجال اختيار صورة شخصية و صورة العمل الحر',
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        } else if (formKey.currentState!.validate()) {
                          if (vendorSigningType ==
                              VendorSigningType.freelancer) {
                            cubit.freelancerRegister(
                              userName: name.text,
                              password: password.text,
                              email: email.text,
                              description: description.text,
                              phone: phone.text,
                            );
                          } else if (vendorSigningType ==
                              VendorSigningType.center) {
                            cubit.vendorRegister(
                              userName: name.text,
                              password: password.text,
                              email: email.text,
                              description: description.text,
                              phone: phone.text, taxNumber: taxNumber.text,
                            );
                          }
                        }
                      },
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
                  SizedBox(
                    height: 15.h,
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
