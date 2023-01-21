import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';

class CustomUserTextField extends StatelessWidget {
  final String hintText;
  final double height;
  final TextInputType keyboardType;
  const CustomUserTextField({Key? key, required this.hintText, required this.height, this.keyboardType = TextInputType.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(4.r)
      ),
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        keyboardType: keyboardType,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: const Color(0xff909090),
                fontSize: 14.sp,
                fontFamily: FontPath.almaraiRegular),
            contentPadding: EdgeInsets.all(10.r),
            hintText: hintText
        ),
      ),
    );
  }
}
