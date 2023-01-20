import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import 'center_services_item.dart';

class CenterDetailsBottomSheet extends StatelessWidget {
   CenterDetailsBottomSheet({Key? key}) : super(key: key);

  final List<String> galleryList =[
    ImagePath.gallary1,
    ImagePath.gallary2,
    ImagePath.gallary3,
    ImagePath.gallary4,
    ImagePath.gallary5,
    ImagePath.gallary6,
    ImagePath.gallary7,
    ImagePath.gallary8,
    ImagePath.gallary9,
    ImagePath.gallary10,
    ImagePath.gallary11,
    ImagePath.gallary12,
    ImagePath.gallary13,
    ImagePath.gallary14,
    ImagePath.gallary15,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 230.h,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r))),
          child: Image.asset(
            ImagePath.onboarding2,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'العناية بالبشرة',
                    style: TextStyle(
                        color: const Color(0xff263238),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp),
                  ),
                  SvgPicture.asset(
                    SvgPath.chatIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              Text(
                'الطريق العام الخرج - الرياض (365)',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: FontPath.almaraiRegular,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(height: 17.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColorsLightTheme.primaryColor,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'فاتح اليوم',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '10k مشاهدة',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColorsLightTheme.secondaryColor,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '(4.5)',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              const Divider(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'وصف الخدمة',
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص',
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،لقد تم توليد هذا النص',
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 10.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اوقات العمل',
                    style: TextStyle(
                        color: const Color(0xff263238),
                        fontFamily: FontPath.almaraiBold,
                        fontSize: 18.sp),
                  ),
                  Container(
                    height: 21.h,
                    width: 52.w,
                    decoration: BoxDecoration(
                      color:
                          AppColorsLightTheme.secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Text(
                      'متاح',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular,
                        color: AppColorsLightTheme.secondaryColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              availableTimeWidget(title: 'السبت'),
              SizedBox(
                height: 10.h,
              ),
              availableTimeWidget(title: 'الاحد'),
              SizedBox(
                height: 10.h,
              ),
              availableTimeWidget(title: 'الاثنين'),
              SizedBox(
                height: 10.h,
              ),
              availableTimeWidget(title: 'الثلثاء'),
              SizedBox(
                height: 10.h,
              ),
              availableTimeWidget(title: 'الاربعاء'),
              SizedBox(
                height: 10.h,
              ),
              availableTimeWidget(title: 'الخميس'),
              SizedBox(
                height: 22.h,
              ),
              const Divider(),
              SizedBox(
                height: 22.h,
              ),
              Text(
                'خدماتنا',
                style: TextStyle(
                    color: const Color(0xff263238),
                    fontFamily: FontPath.almaraiBold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 30.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Container(
                        height: 28.h,
                        width: 87.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F3F6),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            'عناية شخصية',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: FontPath.almaraiRegular,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                height: 320.h,

                width: double.infinity,
                child: ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return const CenterServicesCategoryItem();
                  },
                  itemCount: 2,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ScreenName.ourServicesScreen);
                },
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  side: BorderSide(
                    width: 1.5.w,
                    color: AppColorsLightTheme.primaryColor
                  )
                ),
                child: Text(
                  'شاهد جميع الخدمات',
                  style: TextStyle(
                      color: AppColorsLightTheme.primaryColor,
                      fontFamily: FontPath.almaraiBold,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المعرض',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff1E2432)),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ScreenName.galleryScreen);
                    },
                    child: Text(
                      'شاهد الكل',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: AppColorsLightTheme.secondaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Container(
                        height: 76.h,
                        width: 76.w,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset(galleryList[index],fit: BoxFit.cover,),
                      ),
                    );
                  },
                  itemCount: galleryList.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget availableTimeWidget({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 16.sp),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24.h,
              width: 81.w,
              decoration: BoxDecoration(
                color: const Color(0xffF0F3F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  '20.00 - 16.00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 24.h,
              width: 81.w,
              decoration: BoxDecoration(
                color: const Color(0xffF0F3F6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  '20.00 - 16.00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontPath.almaraiRegular,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
