import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/font_path.dart';

class TimeDropDownWidget extends StatefulWidget {

  const TimeDropDownWidget({Key? key}) : super(key: key);

  @override
  State<TimeDropDownWidget> createState() => _TimeDropDownWidgetState();
}

List<String> timeMorningList = [
  '1 صباحا',
  '2 صباحا',
  '3 صباحا',
  '4 صباحا',
  '5 صباحا',
  '6 صباحا',
  '7 صباحا',
  '8 صباحا',
  '9 صباحا',
  '10 صباحا',
  '11 صباحا',
  '12 صباحا',
  '1 مساء',
  '2 مساء',
  '3 مساء',
  '4 مساء',
  '5 مساء',
  '6 مساء',
  '7 مساء',
  '8 مساء',
  '9 مساء',
  '10 مساء',
  '11 مساء',
  '12 مساء',
];


class _TimeDropDownWidgetState extends State<TimeDropDownWidget> {
  String timeMorningValue = timeMorningList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.h,
      width: 81.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff3C475C),
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: DropdownButton(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        items: timeMorningList.map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 10.sp),
            ),
          ),).toList(),
        onChanged: (val) {
          setState(() {
            timeMorningValue = val!;
          });
        },
        value: timeMorningValue,
      ),
    );
  }
}
