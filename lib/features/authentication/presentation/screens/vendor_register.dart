import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enums/vendor_signing_type_enum.dart';
import '../../../../translations/locale_keys.g.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/citeis_dropdown_button.dart';
import '../widgets/password_auth_field.dart';
import '../widgets/phone_auth_field.dart';

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
  void dispose() {
    name.dispose();
    email.dispose();
    description.dispose();
    phone.dispose();
    taxNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
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
              Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
              cubit.profileImage = null;
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
          return WillPopScope(
            onWillPop: () async {
              cubit.profileImage = null;
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 60.h,
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      cubit.profileImage = null;
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              body: Form(
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
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      LocaleKeys.register_as_new_user.tr(),
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
                          borderRadius: BorderRadius.circular(50.r),
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
                                        LocaleKeys.personal_image.tr(),
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
                                borderRadius: BorderRadius.circular(50.r),
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
                                              LocaleKeys.freelancer_image.tr(),
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
                    AuthTextFormField(
                      hintText: vendorSigningType == VendorSigningType.center?LocaleKeys.tax_number.tr():LocaleKeys.freelancer_tax_umber.tr(),
                      keyboardType: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_your_services.tr();
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
                        ? AuthTextFormField(
                            hintText: LocaleKeys.center_name.tr(),
                            controller: null,
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 14.h,
                    ),
                    AuthTextFormField(
                      hintText: LocaleKeys.your_services.tr(),
                      controller: description,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.enter_your_services.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      LocaleKeys.services_type.tr(),
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
                              LocaleKeys.center.tr(),
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
                            title: Text(LocaleKeys.freelancer.tr(),
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
                    PasswordAuthField(controller: password,hintText: LocaleKeys.password.tr()),
                    SizedBox(
                      height: 14.h,
                    ),
                    PasswordAuthField(controller: confirmPassword,isConfirmPassword: true,confirmController: password, hintText: LocaleKeys.password_reenter.tr(),),
                    SizedBox(
                      height: 14.h,
                    ),
                    AuthButton(
                        buttonTitle: LocaleKeys.register.tr(),
                        isTapped: () {
                          if (cubit.profileImage == null &&
                              vendorSigningType == VendorSigningType.center) {
                            Fluttertoast.showToast(
                              msg: LocaleKeys.personal_image.tr(),
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else if (cubit.profileImage == null &&
                              cubit.freelancerImage == null &&
                              vendorSigningType ==
                                  VendorSigningType.freelancer) {
                            Fluttertoast.showToast(
                                msg:LocaleKeys.chooser_freelancer_doc.tr(),
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
                                phone: phone.text,
                                taxNumber: taxNumber.text,
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
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
