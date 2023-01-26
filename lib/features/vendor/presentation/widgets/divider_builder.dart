import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerBuilder extends StatelessWidget {
  const DividerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Container(
        height: 0.5.h,
        color: Colors.grey,
        width: double.infinity,
      ),
    );
  }
}
