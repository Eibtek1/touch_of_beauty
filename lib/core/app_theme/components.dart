import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/text.dart';

class customButton2 extends StatelessWidget {
  customButton2(
      {super.key,
        required this.text,
        required this.onTap,
        required this.color,
        required this.image});
  String text;
  String image;
  VoidCallback onTap;
  Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            TextApp.smallwidthSpace(10),
            TextApp.customText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}