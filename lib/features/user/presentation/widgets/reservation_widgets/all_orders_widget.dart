import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';

import '../../../../../core/assets_path/font_path.dart';

class AllOrdersWidgetItem extends StatefulWidget {
  const AllOrdersWidgetItem({Key? key}) : super(key: key);

  @override
  State<AllOrdersWidgetItem> createState() => _AllOrdersWidgetItemState();
}

class _AllOrdersWidgetItemState extends State<AllOrdersWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: AnimatedContainer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xffE8E8E8))),
        duration: const Duration(milliseconds: 100),
        child: ExpansionTile(
            trailing: SizedBox(
              height: 70.h,
              width: 45.w,
              child: Row(
                children: [
                  Text(
                    'عرض',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontPath.almaraiBold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_downward_outlined,
                    size: 20.r,
                  )
                ],
              ),
            ),
            title: SizedBox(
              width: 75.w,
              height: 75.h,
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
                      ImagePath.onboarding1,
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
                        'خدمة تصفيف الشعر',
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
                        'حالة الطلب بانتظار الرد',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: FontPath.almaraiRegular,
                            color: const Color(0xff1E2432)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'ملاحظاتي',
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xff484848)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80.w),
                        child: Text(
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',
                          style: TextStyle(
                              height: 1.5.h,
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiRegular,
                              color: const Color(0xff1E2432)),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: const Color(0xffE8E8E8))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 100.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r), // <-- Radius
                            ),
                          ),
                          child: Row(
                            children: [Icon(Icons.delete,color: Colors.white,size: 20.r,),SizedBox(width: 5.w,), Text('الغاء الطلب',style: TextStyle(fontSize: 10.sp,fontFamily: FontPath.almaraiRegular,color: Colors.white),)],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
