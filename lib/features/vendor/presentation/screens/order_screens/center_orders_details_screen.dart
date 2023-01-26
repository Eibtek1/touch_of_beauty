import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../freelancer/presentation/widgets/screen_layout_widget.dart';
import '../../widgets/divider_builder.dart';
import '../../widgets/order/custom_container.dart';
import '../../widgets/order/services_item_builder.dart';

class CenterOrderDetailsScreen extends StatelessWidget {
  const CenterOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundScreenWidget(
          firstContainerBackgroundHeight: 251.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 24.r,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'تفاصيل الطلب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 17.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'طلب خدمة جديدة',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontPath.almaraiRegular,
                                fontSize: 14.sp),
                          ),
                          Text(
                            '1 يناير 2020  7 مساء',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontPath.almaraiRegular,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            clipBehavior: Clip.antiAlias,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              ImagePath.onboarding3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'يسرا محسن',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontPath.almaraiRegular,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'رقم الطلب  3148945268',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontPath.almaraiRegular,
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            'الخدمة في الصالون',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontPath.almaraiRegular,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 25.h),
                        height: 430.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 10.r,
                                color: Colors.black.withOpacity(0.14))
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الخدمات',
                              style: TextStyle(
                                  color: AppColorsLightTheme.secondaryColor,
                                  fontFamily: FontPath.almaraiRegular,
                                  fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                itemBuilder: (context, index) =>
                                    const ServicesItemBuilder(
                                        title: 'قفازات ترطيب اليدين',
                                        time: '10 دقائق',
                                        budget: '10 ريال'),
                                separatorBuilder: (context, index) => const DividerBuilder(),
                                itemCount: 10,
                              ),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الاجمالي',
                                  style: TextStyle(
                                      color: AppColorsLightTheme.secondaryColor,
                                      fontFamily: FontPath.almaraiRegular,
                                      fontSize: 14.sp),
                                ),
                                Text(
                                  '10 ريال',
                                  style: TextStyle(
                                      color: AppColorsLightTheme.secondaryColor,
                                      fontFamily: FontPath.almaraiRegular,
                                      fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomContainer(
                              title: 'عدد الخدمات', bodyTitle: '150 خدمات'),
                          SizedBox(width: 10.w,),
                          const CustomContainer(
                              title: 'اجمالي سعر الخدمات',
                              bodyTitle: '150 ريال سعودي'),
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      const CustomContainer(
                          title: 'حالة الخدمة',
                          bodyTitle: 'في انتظار العميل',
                          width: double.infinity),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomVendorButton(buttonTitle: 'تم تنفيذ الخدمة', isTapped: (){}, width: double.infinity, paddingVertical: 14.h, paddingHorizontal: 45.w),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
