import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';

import '../../../../core/assets_path/font_path.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final String Function(String?)? validate;
  const AuthTextFormField({Key? key, required this.hintText, this.validate,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
                color: AppColorsLightTheme.authTextFieldFillColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
                color: AppColorsLightTheme.authTextFieldFillColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
                color: AppColorsLightTheme.authTextFieldFillColor)),
        filled: true,
        fillColor: AppColorsLightTheme.authTextFieldFillColor,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontFamily: FontPath.poppinsBold),
        contentPadding: EdgeInsets.all(10.r),
      ),
    );
  }
}
