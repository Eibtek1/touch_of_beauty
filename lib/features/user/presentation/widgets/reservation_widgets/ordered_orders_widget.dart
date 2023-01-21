import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';

import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/images_path.dart';

class OrderedOrdersWidgetBuilder extends StatelessWidget {
  const OrderedOrdersWidgetBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 90.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xffE8E8E8))),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black)),
              child: Image.asset(
                ImagePath.onboarding2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'خدمة العناية بالبشرة',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontPath.almaraiBold,
                      color: const Color(0xff1E2432)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'المدينة الرياض',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xff1E2432)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'حالة الطلب :- بانتظار الرد',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xff1E2432)),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, ScreenName.chatScreen,arguments: 'مقدم الخدمة');
            }, icon: SvgPicture.asset(SvgPath.chatIcon,width: 50.w,height: 50.h,))
          ],
        ),
      ),
    );
  }
}
