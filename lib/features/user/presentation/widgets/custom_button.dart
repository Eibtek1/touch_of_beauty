import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets_path/font_path.dart';

class CustomUserButton extends StatelessWidget {
  final String buttonTitle;
  final Function isTapped;
  final double? height;
  final double width;

  const CustomUserButton(
      {Key? key,
      required this.buttonTitle,
      required this.isTapped,
      required this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 16.h),
        ),
        onPressed: () {
          isTapped();
        },

        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontPath.almaraiBold,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
