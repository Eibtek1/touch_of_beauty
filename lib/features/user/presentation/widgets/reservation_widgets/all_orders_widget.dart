import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/features/user/data/models/reservation_model.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../../translations/locale_keys.g.dart';

class AllOrdersWidgetItem extends StatelessWidget {
  final ReservationModel reservationModel;
  final void Function()? goToPay;
  final void Function()? removeOrder;

  const AllOrdersWidgetItem(
      {Key? key,
      required this.reservationModel,
      this.goToPay,
      this.removeOrder})
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
            height: 80.h,
            width: 45.w,
            child: Row(
              children: [
                Text(
                  LocaleKeys.show.tr(),
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
            width: 80.w,
            height: 75.h,
            child: Row(
              children: [
                Container(
                  height: 70.h,
                  width: 70.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "${EndPoints.imageBaseUrl}${reservationModel.service!.imgUrl}",
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
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
                      SizedBox(
                        height: 5.h,
                      ),
                      if (reservationModel.orderStatus == 0 &&
                          reservationModel.service!.isAvailable!)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_zero.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                      if (reservationModel.orderStatus == 1)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_one.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                      if (reservationModel.orderStatus == 2)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_2.tr(),

                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                      if (reservationModel.orderStatus == 3)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_3.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                      if (reservationModel.orderStatus == 4)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_4.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                      if (reservationModel.orderStatus == 5)
                        Expanded(
                          child: Text(
                            LocaleKeys.order_status_canceled.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: FontPath.almaraiRegular,
                                color: const Color(0xff1E2432)),
                          ),
                        ),
                    ],
                  ),
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
                    // Text(
                    //   '${reservationModel.id}',
                    //   style: TextStyle(
                    //       fontSize: 20.sp,
                    //       fontFamily: FontPath.almaraiRegular,
                    //       color: const Color(0xff1E2432)),
                    // ),
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
                        if (reservationModel.orderStatus == 0)
                          SizedBox(
                            width: 110.w,
                            child: ElevatedButton(
                              onPressed: removeOrder,
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
                                    LocaleKeys.delete.tr(),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: FontPath.almaraiRegular,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (reservationModel.orderStatus == 0)
                          SizedBox(
                            width: 100.w,
                            child: ElevatedButton(
                              onPressed: goToPay,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.r), // <-- Radius
                                ),
                              ),
                              child: Text(
                                LocaleKeys.go_pay.tr(),
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
