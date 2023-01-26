import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_theme/light_theme.dart';

class CustomDetailsContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const CustomDetailsContainer({Key? key, required this.height, required this.width, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColorsLightTheme.authTextFieldFillColor,
      ),
      child: child,
    );
  }
}
