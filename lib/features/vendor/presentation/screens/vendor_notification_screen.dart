import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/vendor/buisness_logic/v_reservations_cubit/v_reservation_state.dart';

import '../../../../core/assets_path/font_path.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../user/data/models/notification_model.dart';
import '../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';

class VendorNotificationScreen extends StatefulWidget {
  const VendorNotificationScreen({Key? key}) : super(key: key);

  @override
  State<VendorNotificationScreen> createState() =>
      _VendorNotificationScreenState();
}

class _VendorNotificationScreenState extends State<VendorNotificationScreen> {
  @override
  void initState() {
    VReservationCubit.get(context).getAllNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VReservationCubit, VReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = VReservationCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 70.h,
            centerTitle: true,
            title: Text(
              LocaleKeys.notification.tr(),
              style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontPath.almaraiBold,
                  color: const Color(0xff1E2432)),
            ),
          ),
          body: state is! GetNotificationLoading
              ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return notificationBuilder(cubit.notificationList[index]);
                  },
                  itemCount: cubit.notificationList.length,
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }

  Widget notificationBuilder(NotificationModel notificationModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
        height: 110.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColorsLightTheme.authTextFieldFillColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3.h),
                blurRadius: 6.r,
                color: Colors.black.withOpacity(0.14)),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 77.h,
              width: 74.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Image.asset(
                ImagePath.onboarding2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${notificationModel.title}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: FontPath.almaraiBold,
                            color: const Color(0xffB83561)),
                      ),
                      Text(
                        Jiffy(notificationModel.createdOn.toString()).Hm,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontPath.almaraiRegular,
                            color: const Color(0xff1E2432)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Text(
                      '${notificationModel.body}',
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.3.h,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontFamily: FontPath.almaraiRegular,
                          color: const Color(0xff4A4A4A)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
