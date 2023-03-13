import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';

class CustomUserTextField extends StatelessWidget {
  final String hintText;
  final double height;
  final bool isComplaints;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomUserTextField({Key? key, required this.hintText, required this.height, this.keyboardType = TextInputType.text, this.controller, this.validator, this.isComplaints = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isComplaints?Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w,),
      decoration: BoxDecoration(
          color: AppColorsLightTheme.authTextFieldFillColor,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        expands: true,
        maxLines: null,
        minLines: null,
        validator: validator,
        textAlign: TextAlign.start,
        style: TextStyle(
          height: 1.3.h,
          fontSize: 12.sp,
          fontFamily: FontPath.almaraiRegular,
          color: const Color(0xff8B8989),
        ),
        decoration: InputDecoration(
          hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: FontPath.almaraiRegular,
              color: const Color(0xff8B8989),
            ),
            border: InputBorder.none,
            suffix: SvgPicture.asset(
              SvgPath.edit,
              width: 22.w,
              height: 22.h,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            )
        ),
      ),
    ):TextFormField(
      controller: controller!,
      validator:validator,
      keyboardType: keyboardType,
      cursorColor: Colors.blue,style: TextStyle(
      fontSize: 12.sp,
      fontFamily: FontPath.almaraiRegular,
      color: const Color(0xff8B8989),
    ),
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          filled: true,
          fillColor: AppColorsLightTheme.authTextFieldFillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColorsLightTheme.authTextFieldFillColor,)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColorsLightTheme.authTextFieldFillColor,)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColorsLightTheme.authTextFieldFillColor,)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffix: SvgPicture.asset(
            SvgPath.edit,
            width: 22.w,
            height: 22.h,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          )
      ),
    );
  }
}
