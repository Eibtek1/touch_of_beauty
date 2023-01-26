import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../widgets/center_details/custom_container.dart';
import '../../widgets/screen_layout_widget-with_logo.dart';

class CenterDetailsScreen extends StatelessWidget {
  const CenterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsLightTheme.primaryColor,
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'بيانات المركز',
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: FontPath.almaraiBold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                SvgPath.edit,
                width: 31.w,
                height: 31.h,
              )),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
      body: BackgroundScreenWithLogoWidget(
        firstContainerBackgroundHeight: 58.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130.h,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'صور للصالون أو الخدمات المقدمة',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: FontPath.almaraiBold,
                        color: const Color(0xff3C475C),
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Container(
                      height: 147.h,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.14),
                              blurRadius: 10.r,
                            )
                          ]),
                      child: Image.asset(
                        ImagePath.onboarding3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 55.h,
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 4.5.h),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              height: 46.h,
                              width: 46.w,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColorsLightTheme.primaryColor),
                                borderRadius: BorderRadius.circular(2.r),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 0),
                                      color: Colors.black.withOpacity(0.28),
                                      blurRadius: 8.r)
                                ],
                              ),
                              child: Image.asset(
                                ImagePath.gallery13,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomDetailsContainer(
                      height: 44.h,
                      width: double.infinity,
                      child: Text(
                        'مركز خانة الجمال',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff8B8989),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomDetailsContainer(
                      height: 190.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'وصف المركز',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff8B8989),
                            ),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Expanded(
                            child: Text(
                              'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا',
                              textAlign: TextAlign.start,
                              maxLines: 5,
                              style: TextStyle(
                                height: 1.3.h,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff8B8989),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomDetailsContainer(
                      height: 44.h,
                      width: double.infinity,
                      child: Text(
                        'رقم الهاتف',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff8B8989),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        CustomDetailsContainer(
                          height: 44.h,
                          width: 280.w,
                          child: Text(
                            'عنوان المركز',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff8B8989),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 44.h,
                          width: 45.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColorsLightTheme.authTextFieldFillColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomDetailsContainer(
                      height: 44.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'شهادة سجل المركز',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiBold,
                              color: const Color(0xff8B8989),
                            ),
                          ),
                          SvgPicture.asset(SvgPath.paperPin,height: 22.h,width: 21.w,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
