import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/user/data/models/reservation_model.dart';

import '../../../../../core/assets_path/font_path.dart';

class AllOrdersWidgetItem extends StatelessWidget {
  final ReservationModel reservationModel;

  const AllOrdersWidgetItem({Key? key, required this.reservationModel})
      : super(key: key);

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
          onExpansionChanged: (d){
            print(reservationModel!.orderStatus);
          },
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
                      reservationModel.service!.title!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiBold,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      reservationModel.addressData!.region!,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    if(reservationModel.orderStatus==0&&reservationModel.service!.isAvailable!)Text(
                      'حالة الطلب : بأنتظار الدفع',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),

                    if(reservationModel.orderStatus==1)Text(
                      'حالة الطلب : بأنتظار التأكيد مع المقدم',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    if(reservationModel.orderStatus==2)Text(
                      'حالة الطلب : تمت موافقة المقدم',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    if(reservationModel.orderStatus==3)Text(
                      'حالة الطلب : قيد الوصول',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    if(reservationModel.orderStatus==4)Text(
                      'حالة الطلب : انتهت الخدمة',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    if(reservationModel.orderStatus==5)Text(
                      'حالة الطلب : تم الالغاء',
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
                    // Text(
                    //   'ملاحظاتي',
                    //   style: TextStyle(
                    //       fontSize: 11.sp,
                    //       fontFamily: FontPath.almaraiBold,
                    //       color: const Color(0xff484848)),
                    // ),
                    Text(
                      '${reservationModel.id}',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff1E2432)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80.w),
                      child: Text(
                        '${reservationModel.service!.title}',
                        style: TextStyle(
                            height: 1.5.h,
                            fontSize: 10.sp,
                            fontFamily: FontPath.almaraiRegular,
                            color: const Color(0xff1E2432)),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 40.h,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4.r),
                    //       border: Border.all(color: const Color(0xffE8E8E8))),
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5.r), // <-- Radius
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'الغاء الطلب',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: FontPath.almaraiRegular,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        if(reservationModel.orderStatus==0)SizedBox(
                          width: 100.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(5.r), // <-- Radius
                              ),
                            ),
                            child: Text(
                              'أذهب للدفع',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: FontPath.almaraiRegular,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
