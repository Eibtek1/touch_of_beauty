import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/chat/buisness_logic/chat_cubit.dart';
import 'package:touch_of_beauty/features/chat/presentation/screens/chat_screen.dart';

import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../data/models/reservation_model.dart';

class OrderedOrdersWidgetBuilder extends StatelessWidget {
  final ReservationModel reservationModel;
  const OrderedOrdersWidgetBuilder({Key? key, required this.reservationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 90.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xffE8E8E8))),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                "${EndPoints.imageBaseUrl}${reservationModel.service!.imgUrl}",
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Image.asset(
              //   ImagePath.onboarding2,
              //   fit: BoxFit.cover,
              // ),
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
                  '${reservationModel.service!.title}',
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
            const Spacer(),
            IconButton(onPressed: (){
              ChatCubit.get(context).getMessages(receiverId: reservationModel.provider!.id, senderId: userId);
              Navigator.pushNamed(context, ScreenName.chatScreen,arguments: ChatScreenArgs(title: '${reservationModel.provider!.fullName}', receiverId: '${reservationModel.provider!.id}', receiverName: reservationModel.provider!.fullName!, receiverImg: ''));
            }, icon: SvgPicture.asset(SvgPath.chatIcon,width: 50.w,height: 50.h,))
          ],
        ),
      ),
    );
  }
}
