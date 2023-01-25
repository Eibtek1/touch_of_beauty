import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import '../../../../core/assets_path/font_path.dart';
import '../widgets/profile_widgets/form_item_builder.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230.h,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 50.h, left: 20.w, right: 20.w, bottom: 65.h),
                    width: double.infinity,
                    height: 150.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                        color: AppColorsLightTheme.primaryColor),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'الملف الشخصي',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontPath.almaraiBold,
                                fontSize: 20.sp),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              SvgPath.editIcon,
                              width: 22.w,
                              height: 22.w,
                            ))
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: CircleAvatar(
                        radius: 54.r,
                        child: Image.asset(
                          ImagePath.hairCare,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
            children: const [
              FormItemBuilder(
                  image: SvgPath.profileFilledColorIcon,
                  itemTitle: 'اسم المستخدم',
                  title: 'سارة'),
              Divider(),
              FormItemBuilder(
                  image: SvgPath.location,
                  itemTitle: 'العنوان',
                  title: 'الرياض'),
              Divider(),
              FormItemBuilder(
                  image: SvgPath.calender,
                  itemTitle: 'تاريخ الميلاد',
                  title: 'اسماء'),
              Divider(),
              FormItemBuilder(
                  image: SvgPath.gender,
                  itemTitle: 'الجنس',
                  title: 'انثي'),
              Divider(),
              FormItemBuilder(
                  image: SvgPath.email,
                  itemTitle: 'البريد الالكتروني',
                  title: 'sara@accessline.ps'),
              Divider(),
              FormItemBuilder(
                  image: SvgPath.profileFilledColorIcon,
                  itemTitle: 'رقم الهاتف',
                  title: '0591-3514-35'),
            ],
          ))
        ],
      ),
    );
  }
}
