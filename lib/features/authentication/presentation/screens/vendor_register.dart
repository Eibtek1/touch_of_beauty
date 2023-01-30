import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
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
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
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
              height: 14.h,
            ),
            AuthTextFormField(
              hintText: 'اسم المستخدم',
              controller: name,
            ),
            SizedBox(
              height: 14.h,
            ),
            AuthTextFormField(
              hintText: 'البريد الالكتروني',
              controller: email,
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

            vendorSigningType == VendorSigningType.center?SizedBox(
              height: 14.h,
            ):const SizedBox.shrink(),
            vendorSigningType == VendorSigningType.center?AuthTextFormField(hintText: 'اسم الصالون', controller: null, ):const SizedBox.shrink(),
            SizedBox(
              height: 14.h,
            ),
            AuthTextFormField(hintText: 'الخدمات التي تقدمها', controller: description,),
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
                      print(vendorSigningType);
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
                      print(vendorSigningType);
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
            ),
            SizedBox(
              height: 14.h,
            ),
            AuthTextFormField(
              hintText: 'اعد كتابة كلمة المرور',
              controller: confirmPassword,
            ),
            SizedBox(
              height: 14.h,
            ),
            AuthButton(
                buttonTitle: 'تسجيل',
                isTapped: () {},
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
