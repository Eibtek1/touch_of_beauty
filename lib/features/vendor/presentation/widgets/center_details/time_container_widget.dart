import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';
import 'custom_switch_button.dart';
import 'morning_time_drop_down_button.dart';

class TimeContainerWidget extends StatelessWidget {
  final String title;
  const TimeContainerWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              offset: const Offset(0, 0),
              blurRadius: 10.r,
            )
          ]),
      child: Row(
        children: [
          SizedBox(width: 13.w,),
          Text(
            title,
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontSize: 10.sp,
                fontFamily: FontPath.almaraiRegular),
          ),
          SizedBox(width: 17.w,),
          Text(
            'من',
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontSize: 10.sp,
                fontFamily: FontPath.almaraiRegular),
          ),
          SizedBox(width: 7.w,),
          const TimeDropDownWidget(),
          SizedBox(width: 10.w,),
          Text(
            'الي',
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontSize: 10.sp,
                fontFamily: FontPath.almaraiRegular),
          ),
          SizedBox(width: 7.w,),
          const TimeDropDownWidget(),
          SizedBox(width: 7.w,),
          const CustomSwitchButton(),
        ],
      ),
    );
  }
}
