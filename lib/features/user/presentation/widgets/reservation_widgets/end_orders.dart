import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';

import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/network/api_end_points.dart';
import '../../../../chat/buisness_logic/chat_cubit.dart';
import '../../../../chat/presentation/screens/chat_screen.dart';
import '../../../data/models/reservation_model.dart';

class EndOrdersWidgetBuilder extends StatelessWidget {
  final ReservationModel reservationModel;
  const EndOrdersWidgetBuilder({Key? key, required this.reservationModel}) : super(key: key);

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
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black)),
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
                  '${reservationModel.addressData!.region}',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontPath.almaraiRegular,
                      color: const Color(0xff1E2432)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'حالة الطلب :- منتهي',
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
              Navigator.pushNamed(context, ScreenName.chatScreen,arguments: ChatScreenArgs(title: '${reservationModel.provider!.fullName}', receiverId: '${reservationModel.provider!.id}'));
            }, icon: SvgPicture.asset(SvgPath.chatIcon,width: 50.w,height: 50.h,))
          ],
        ),
      ),
    );
  }
}
