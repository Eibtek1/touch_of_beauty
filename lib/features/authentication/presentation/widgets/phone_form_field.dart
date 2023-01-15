import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntlPhoneField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(
                  color: AppColorsLightTheme.authTextFieldFillColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(
                  color: AppColorsLightTheme.authTextFieldFillColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(
                  color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(
                  color: AppColorsLightTheme.authTextFieldFillColor)),
          filled: true,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
                fontFamily: FontPath.poppinsBold),
          hintText: 'رقم الهاتف',
          fillColor: AppColorsLightTheme.authTextFieldFillColor,
        counter: const SizedBox.shrink(),
          isCollapsed: true,
          contentPadding: EdgeInsets.all(10.r),
        ),
        textAlign: TextAlign.end,
        keyboardType: TextInputType.number,
        invalidNumberMessage: 'ادخل رقم صحيح',
      ),
    );
  }
}
