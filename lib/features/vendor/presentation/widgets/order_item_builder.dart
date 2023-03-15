import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/app_router/screens_name.dart';
import '../../../../core/app_theme/light_theme.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../data/models/reserve_model.dart';

class OrderItemBuilder extends StatelessWidget {
  final int homeZeroOrCenterOne;
  final ReserveModel reserveModel;
  const OrderItemBuilder({Key? key, required this.homeZeroOrCenterOne, required this.reserveModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 10.w),
      height: 340.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 10.r,
                color: Colors.black.withOpacity(0.14))
          ]),
      child: Column(
        children: [
          Text(
            Jiffy(reserveModel.createdOn!.toString()).yMMMd,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColorsLightTheme.secondaryColor,
                fontFamily: FontPath.almaraiRegular,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customContainer(title: 'اسم العميل', bodyTitle: '${reserveModel.user!.fullName}'),
              customContainer(title: 'رقم الطلب', bodyTitle: '${reserveModel.id}'),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customContainer(
                  title: 'اجمالي سعر الخدمة', bodyTitle: '${reserveModel.total} ريال سعودي',),
              // customContainer(title: 'عدد الخدمات', bodyTitle: '1 خدمات',),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          CustomVendorButton(
              buttonTitle: 'عرض تفاصيل الطلب',
              isTapped: () {
                print(reserveModel.orderStatus);
                VReservationCubit.get(context).getOrdersById(orderId:reserveModel.id!);
                if(homeZeroOrCenterOne == 1){
                  Navigator.pushNamed(context, ScreenName.orderInCenterDetailsScreen);
                }else{
                  Navigator.pushNamed(context, ScreenName.orderInHomeDetailsScreen);
                }
              },
              width: double.infinity,
              paddingVertical: 12.h,
              paddingHorizontal: 45.w)
        ],
      ),
    );
  }
  Widget customContainer({
    required String title,
    required String bodyTitle,
  }) {
    return Container(
      height: 88.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColorsLightTheme.authTextFieldFillColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColorsLightTheme.primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontFamily: FontPath.almaraiRegular,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            bodyTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xff3C475C),
                fontFamily: FontPath.almaraiRegular,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
