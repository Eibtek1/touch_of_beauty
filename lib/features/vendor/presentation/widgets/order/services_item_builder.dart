import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';

class ServicesItemBuilder extends StatelessWidget {
  final String title;
  final String time;
  final String budget;
  const ServicesItemBuilder({Key? key, required this.title, required this.time, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: const Color(0xff3C475C),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xff3C475C).withOpacity(0.8),
                  fontFamily: FontPath.almaraiRegular,
                  fontSize: 12.sp),
            ),
          ],
        ),
        Text(
          budget,
          style: TextStyle(
              color: const Color(0xff3C475C),
              fontFamily: FontPath.almaraiRegular,
              fontSize: 10.sp),
        ),
      ],
    );
  }
}
