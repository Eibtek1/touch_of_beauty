import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_cubit.dart';
import 'package:touch_of_beauty/features/authentication/buisness_logic/auth_state.dart';
import 'package:touch_of_beauty/features/authentication/presentation/widgets/auht_text_form_field.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/auth_button.dart';

class ChangeForgetPasswordScreen extends StatefulWidget {
  const ChangeForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangeForgetPasswordScreen> createState() => _ChangeForgetPasswordScreenState();
}

class _ChangeForgetPasswordScreenState extends State<ChangeForgetPasswordScreen> {
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    confirmPassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is ChangeConfirmForgetPasswordLoading){
              showProgressIndicator(context);
            }
            if(state is ChangeConfirmForgetPasswordSuccess){
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.confirmForgetPasswordModel.errorMessage);
              Navigator.pushNamedAndRemoveUntil(context, ScreenName.loginScreen, (route) => false);
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
                    'تغيير كلمة السر',
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
                    hintText: 'كلمة المرور',
                    controller: password,
                    isPassword: true,
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
                    height: 10.h,
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
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  SizedBox(
                    height: 8.h,
                  ),
                  AuthButton(
                      buttonTitle: 'تغيير',
                      isTapped: () {
                        if(formKey.currentState!.validate()){
                          cubit.changeConfirmPassword(password: password.text);
                        }
                      },
                      width: double.infinity),
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
