import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';

class CustomButton extends StatelessWidget {
  final bool isLast;
  final Function isLastTap;
  final Function isTapped;

  const CustomButton(
      {Key? key,
      required this.isLast,
      required this.isLastTap,
      required this.isTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: !isLast ? const CircleBorder() : const StadiumBorder(),
        padding: !isLast
            ? EdgeInsets.all(16.r)
            : EdgeInsets.symmetric(horizontal: 45.w, vertical: 16.h),
      ),
      onPressed: () {
        if(!isLast) isTapped();
        if(isLast) isLastTap();
      },
      child: !isLast
          ? Center(
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 27.r,
              ),
            )
          : Text('ابدأ الأن',style: TextStyle(color: Colors.white,fontFamily: FontPath.almaraiBold,fontSize: 15.sp),),
    );
  }
}
