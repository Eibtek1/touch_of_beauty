import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';

class AddressDetailsItemBuilder extends StatelessWidget {
  final String title;
  final String subTitle;

  const AddressDetailsItemBuilder(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: const Color(0xff3C475C),
              fontFamily: FontPath.almaraiRegular,
              fontSize: 14.sp),
        ),
        Text(
          subTitle,
          style: TextStyle(
              color: const Color(0xff3C475C),
              fontFamily: FontPath.almaraiRegular,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
