import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';

class CustomAppbar extends StatelessWidget {
  final Function openDrawer;
  final String titleName;

  const CustomAppbar(
      {Key? key, required this.openDrawer, required this.titleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              openDrawer();
            },
            icon: SvgPicture.asset(
              SvgPath.menu,
              width: 32.w,
              height: 32.h,
            )),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحبا , $titleName',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff1E2432)),
            ),
            Text(
              'ابحث عن الخدمات التي تريدها',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff1E2432)),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, ScreenName.userSearchScreen);
          }, icon: SvgPicture.asset(
            SvgPath.searchAppBar,
            width: 32.w,
            height: 32.h,
          ))
        ],
      ),
    );
  }
}
