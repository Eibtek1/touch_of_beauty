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
import '../widgets/auth_button.dart';
import '../widgets/pin_field_builder.dart';

class OtpScreen extends StatefulWidget {
  final dynamic phoneNumber;

  const OtpScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();

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
          if(state is ConfirmRegisterLoading){
            showProgressIndicator(context);
          }
          if(state is ConfirmRegisterSuccess){
            Navigator.pop(context);
            if(cubit.mainResponse.errorCode==0){
              Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
              Navigator.pushReplacementNamed(context, ScreenName.loginScreen);
            }else{
              Fluttertoast.showToast(msg: cubit.mainResponse.errorMessage);
            }
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
                    height: 70.h,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.w),
                        child: Image.asset(
                          ImagePath.phoneLogo,
                          width: 206.w,
                          height: 241.h,
                        ),
                      )),
                  SizedBox(
                    height: 55.h,
                  ),
                  Text(
                    'تأكيد رقم الهاتف',
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
                      'لقد أرسلنا كود تفعيلي من رقم 4 ارقام على الهاتف الخاص بك',
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
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinFieldBuilder(
                      controller: pinController,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AuthButton(
                      buttonTitle: 'تأكيد الرقم',
                      isTapped: () {
                        cubit.confirmRegister(phone: widget.phoneNumber.toString(), randomCode: pinController.text);
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
