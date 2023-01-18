import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_path/font_path.dart';

class GridItemBuilder extends StatelessWidget {
  final Map<String, dynamic> model;
  const GridItemBuilder({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 67.h,
          width: 67.w,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Image.asset(model['image'], fit: BoxFit.cover,),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          model['title'],
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              fontSize: 10.sp,
              fontFamily: FontPath.almaraiRegular,
              color: const Color(0xff666666)),
        ),
      ],
    );
  }
}
