import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/custom_button.dart';
import 'package:touch_of_beauty/features/user/presentation/widgets/home_screen_widgets/complain_text_field.dart';
import '../../../../../../core/assets_path/font_path.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'الدفع',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              const Divider(),
              SizedBox(height: 15.h,),
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColorsLightTheme.primaryColor),
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'البطاقات الائتمانية',
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 19.w,
                    ),
                    Image.asset(
                      ImagePath.mada,
                      height: 41.h,
                      width: 41.w,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Image.asset(
                      ImagePath.visa,
                      height: 21.h,
                      width: 32.w,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Image.asset(
                      ImagePath.masterCard,
                      height: 15.h,
                      width: 26.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              CustomUserTextField(
                hintText: 'رقم البطاقة',
                height: 50.h,
              ),
              SizedBox(height: 16.h,),
              CustomUserTextField(
                hintText: 'الاسم علي البطاقة',
                height: 50.h,
              ),
              SizedBox(height: 13.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    height: 50.h,
                    width: 162.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F9F9),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تاريخ الانتهاء',
                          style: TextStyle(
                              color: const Color(0xff909090),
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiRegular),
                        ),
                        const Icon(
                          Icons.calendar_month_sharp,
                          color: Color(0xff909090),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    height: 50.h,
                    width: 162.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F9F9),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CCV',
                          style: TextStyle(
                              color: const Color(0xff909090),
                              fontSize: 14.sp,
                              fontFamily: FontPath.almaraiRegular),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17.h,),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (gg){},activeColor: Colors.black,),
                  SizedBox(width: 5.h,),
                  Text(
                    'حفظ هذه البطاقة',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 11.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                ],
              ),
              SizedBox(height: 25.h,),
              SizedBox(
                height: 45.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(SvgPath.appleIcon),
                      Text(
                        'أبل باي',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontPath.almaraiBold,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التكلفة الماليه',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                  Text(
                    '400 رس',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                ],
              ),
              SizedBox(height: 29.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'القيمة بعد الخصم',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                  Text(
                    '400 رس',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                ],
              ),
              SizedBox(height: 29.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ضريبة القيمة المضافة',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                  Text(
                    '400 رس',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 12.sp,
                        fontFamily: FontPath.almaraiRegular),
                  ),
                ],
              ),
              SizedBox(height: 29.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الاجمالي',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontPath.almaraiBold),
                  ),
                  Text(
                    '400 رس',
                    style: TextStyle(
                        color: const Color(0xff262E3E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontPath.almaraiBold),
                  ),
                ],
              ),
              SizedBox(height: 40.h,),
              CustomUserButton(buttonTitle: 'ادفع الان', isTapped: (){}, width: double.infinity, paddingVertical: 14.h, paddingHorizontal: 45.w)
            ],
          ),
        ),
      ),
    );
  }
}
