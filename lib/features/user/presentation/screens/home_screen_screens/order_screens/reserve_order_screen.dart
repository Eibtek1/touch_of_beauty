import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';

import '../../../../../../core/app_router/screens_name.dart';
import '../../../../../../core/app_theme/light_theme.dart';
import '../../../../../../core/assets_path/font_path.dart';
import '../../../../../../core/assets_path/images_path.dart';
import '../../../../../../core/assets_path/svg_path.dart';
import '../../../widgets/home_screen_widgets/complain_text_field.dart';
import '../../../widgets/home_screen_widgets/order_item_widget.dart';

class ReserveOrderScreen extends StatelessWidget {
  ReserveOrderScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.babyCare, 'title': "سارة"},
    {'image': ImagePath.beautyCenter, 'title': "فاتن"},
    {'image': ImagePath.hairCare, 'title': "هند"},
    {'image': ImagePath.makeup, 'title': "هدي"},
    {'image': ImagePath.naturalTherapy, 'title': "حنان"},
    {'image': ImagePath.photography, 'title': "هاله"},
    {'image': ImagePath.selfCare, 'title': "اميره"},
    {'image': ImagePath.skinCare, 'title': "سعاد"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'حجز الخدمة',
          style: TextStyle(
              color: const Color(0xff263238),
              fontFamily: FontPath.almaraiBold,
              fontSize: 18.sp),
        ),
        toolbarHeight: 60.h,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        children: [
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طلب خدمتك',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432)),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ScreenName.allCentersScreen);
                },
                child: Text(
                  'اضافة المزيد',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: FontPath.almaraiBold,
                      color: AppColorsLightTheme.secondaryColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 230.h,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return const OrderItemWidget();
              },
              itemCount: 2,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'عاملين المركز',
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontPath.almaraiBold,
                color: const Color(0xff1E2432)),
          ),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 71.h,
                      width: 71.w,
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.9.w),
                          shape: BoxShape.circle),
                      child: Image.asset(itemsList[index]['image']),
                    ),
                    Text(itemsList[index]['title'],
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: index != 0
                                ? const Color(0xff1E2432)
                                : const Color(0xffB83561)))
                  ],
                );
              },
            ),
          ),
          Text(
            'حجز الموعد',
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontPath.almaraiBold,
                color: const Color(0xff1E2432)),
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
          SizedBox(
            height: 95.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'الكل ( 1 خدمة )',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    Text(
                      '200  رس',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular,
                        color: const Color(0xffB83561),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ScreenName.chatScreen,
                          arguments: 'مقدم الخدمة');
                    },
                    icon: SvgPicture.asset(
                      SvgPath.chatIcon,
                      width: 60.w,
                      height: 60.h,
                    )),
                SizedBox(
                    height: 45.h,
                    child: CustomUserButton(
                      buttonTitle: 'اطلب الان',
                      isTapped: () {
                        Navigator.pushNamed(
                            context, ScreenName.chooseAddressScreen);
                      },
                      width: 124.w,
                      paddingVertical: 0,
                      paddingHorizontal: 0,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'الوقت',
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontPath.almaraiBold,
                color: const Color(0xff1E2432)),
          ),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            height: 25.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 24.h,
                    width: 81.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F3F6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        '20.00 AM',
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
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'ملاحظات',
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontPath.almaraiBold,
                color: const Color(0xff1E2432)),
          ),
          SizedBox(
            height: 14.h,
          ),
          CustomUserTextField(
            hintText: 'اكتب ملاحضاتك',
            height: 150.h,
          ),
        ],
      ),
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
