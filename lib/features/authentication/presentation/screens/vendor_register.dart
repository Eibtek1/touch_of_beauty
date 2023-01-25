import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/enums/vendor_signing_type_enum.dart';
import '../widgets/auht_text_form_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/phone_form_field.dart';
import '../widgets/show_datepicker_widget.dart';

class VendorRegisterScreen extends StatefulWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<VendorRegisterScreen> createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  TextEditingController dateController = TextEditingController();
  VendorSigningType vendorSigningType = VendorSigningType.center;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70.h,
          elevation: 0,
        ),
        body: ListView(
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
              height: 35.h,
            ),
            const AuthTextFormField(hintText: 'اسم المستخدم'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'البريد الالكتروني'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'المدينة'),
            SizedBox(
              height: 14.h,
            ),
            const PhoneFormField(),
            SizedBox(
              height: 14.h,
            ),
            ShowSatePickerWidget(
              height: 46.h,
              title: dateController,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime(2001),
                  firstDate: DateTime(1990),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData().copyWith(
                        colorScheme: const ColorScheme.light(
                            primary: AppColorsLightTheme.secondaryColor,
                            secondary: Colors.white),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                ).then((value) {
                  setState(() {
                    dateController.text = value!.toString().split(' ').first;
                  });
                });
              },
            ),
            if (vendorSigningType == VendorSigningType.center)
              SizedBox(
                height: 14.h,
              ),
            if (vendorSigningType == VendorSigningType.center)
              const AuthTextFormField(hintText: 'اسم الصالون'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'الخدمات التي تقدمها'),
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
                          fontFamily: FontPath.almaraiLight, fontSize: 12.sp),
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
              height: 15.h,
            ),
            const AuthTextFormField(hintText: 'كلمة المرور'),
            SizedBox(
              height: 14.h,
            ),
            const AuthTextFormField(hintText: 'اعد كتابة كلمة المرور'),
            AuthButton(
                buttonTitle: 'تسجيل',
                isTapped: () {
                  Navigator.pushNamed(context, ScreenName.otpScreen,arguments: vendorSigningType);
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
      ),
    );
  }


}
