import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/svg_path.dart';
import '../../../freelancer/presentation/widgets/screen_layout_widget.dart';
import '../widgets/screen_layout_widget-with_logo.dart';

class VendorCentersScreen extends StatelessWidget {
  const VendorCentersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 151.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'المركز',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 17.sp),
                    ),
                  ),
                  SvgPicture.asset(
                    SvgPath.notificationBill,
                    color: Colors.white,
                    height: 28.h,
                    width: 23.w,
                  ),
                ],
              ),
              SizedBox(
                height: 186.h,
              ),
              buildItem(svgImage: SvgPath.centersIcon, title: 'بيانات المركز'),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem(svgImage: SvgPath.clock, title: 'مواعيد العمل'),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem(svgImage: SvgPath.bag, title: 'خدماتي'),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
              buildItem(svgImage: SvgPath.calender2, title: 'حجوزاتي'),
              SizedBox(
                height: 10.h,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem({
    required String svgImage,
    required String title,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        svgImage,
        color: AppColorsLightTheme.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: const Color(0xff3C475C),
            fontSize: 14.sp,
            fontFamily: FontPath.almaraiRegular),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
