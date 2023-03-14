import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/images_path.dart';
import 'package:touch_of_beauty/features/freelancer/presentation/widgets/custom_vendor_button.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../freelancer/presentation/widgets/screen_layout_widget.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../../widgets/divider_builder.dart';
import '../../widgets/order/addres_details_item.dart';
import '../../widgets/order/custom_container.dart';
import '../../widgets/order/services_item_builder.dart';

class HomeOrderDetailsScreen extends StatelessWidget {
  const HomeOrderDetailsScreen({
    Key? key,
  }) : super(key: key);

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
                      onTap: () {
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
                BlocConsumer<VReservationCubit, VReservationState>(
                  listener: (context, state) {
                    var cubit = VReservationCubit.get(context);
                    if(state is ChangeOrderStatusSuccess){
                      cubit.getOrdersById(orderId: cubit.reserveModel!.id!);
                    }
                  },
                  builder: (context, state) {
                    var cubit = VReservationCubit.get(context);
                    return Expanded(
                      child: state is! GetOrderByItsIdLoading && cubit.reserveModel!=null?ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'طلب خدمة',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontPath.almaraiRegular,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                Jiffy(cubit.reserveModel!.createdOn!.toString())
                                    .yMMMd,
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
                                    '${cubit.reserveModel!.user!.fullName}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontPath.almaraiRegular,
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'رقم الطلب  ${cubit.reserveModel!.id}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontPath.almaraiRegular,
                                        fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              // const Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 25.h),
                            height: 370.h,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: AppColorsLightTheme.secondaryColor,
                                    ),
                                    Text(
                                      'عنوان العميل',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: FontPath.almaraiRegular,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                const AddressDetailsItemBuilder(
                                    title: 'المدينة', subTitle: 'الرياض'),
                                const DividerBuilder(),
                                AddressDetailsItemBuilder(
                                    title: 'المنطقة',
                                    subTitle: cubit
                                        .reserveModel!.addressData!.region!),
                                const DividerBuilder(),
                                AddressDetailsItemBuilder(
                                    title: 'اسم الشارع',
                                    subTitle: cubit
                                        .reserveModel!.addressData!.street!),
                                const DividerBuilder(),
                                AddressDetailsItemBuilder(
                                    title: 'رقم المبني',
                                    subTitle: cubit.reserveModel!.addressData!
                                        .buildingNumber!),
                                const DividerBuilder(),
                                AddressDetailsItemBuilder(
                                    title: 'الطابق',
                                    subTitle: cubit
                                        .reserveModel!.addressData!.flatNumber!),
                                const DividerBuilder(),
                                AddressDetailsItemBuilder(
                                    title: 'رقم الهاتف',
                                    subTitle:
                                        cubit.reserveModel!.user!.phoneNumber!),
                                SizedBox(
                                  height: 14.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 10.h),
                            height: 130.h,
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
                                ServicesItemBuilder(
                                    title:
                                        '${cubit.reserveModel!.service!.title}',
                                    time: '10 دقائق',
                                    budget:
                                        '${cubit.reserveModel!.service!.finalPrice} ريال'),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'الاجمالي',
                                      style: TextStyle(
                                          color: AppColorsLightTheme
                                              .secondaryColor,
                                          fontFamily: FontPath.almaraiRegular,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      '${cubit.reserveModel!.total} ريال',
                                      style: TextStyle(
                                          color: AppColorsLightTheme
                                              .secondaryColor,
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
                              CustomContainer(
                                  title: 'اجمالي سعر الخدمة',
                                  bodyTitle:
                                      '${cubit.reserveModel!.service!.finalPrice} ريال سعودي'),
                            ],
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          CustomContainer(
                              title: 'حالة الخدمة',
                              bodyTitle: cubit.reserveModel!.orderStatus == 1
                                  ? 'في انتظار الموافقة'
                                  : cubit.reserveModel!.orderStatus == 2
                                      ? "في انتظار الوصول"
                                      : cubit.reserveModel!.orderStatus == 3
                                          ? "في انتظار الانهاء"
                                          : cubit.reserveModel!.orderStatus == 4
                                              ? "تم انهاء الخدمة"
                                              : "تم الغاء الخدمة",
                              width: double.infinity),
                          SizedBox(
                            height: 24.h,
                          ),
                          if (cubit.reserveModel!.orderStatus == 1 ||
                              cubit.reserveModel!.orderStatus == 2 ||
                              cubit.reserveModel!.orderStatus == 3)
                            state is! ChangeOrderStatusLoading
                                ? CustomVendorButton(
                                    buttonTitle: cubit
                                                .reserveModel!.orderStatus ==
                                            1
                                        ? 'الموافقة'
                                        : cubit.reserveModel!.orderStatus == 2
                                            ? "قيد الوصول"
                                            : cubit.reserveModel!.orderStatus ==
                                                    3
                                                ? "انهاء الخدمة"
                                                : "",
                                    isTapped: () {
                                      cubit.changeOrderStatus(
                                          orderId: cubit.reserveModel!.id!,
                                          orderStatus:
                                              (cubit.reserveModel!.orderStatus! +
                                                  1));
                                    },
                                    width: double.infinity,
                                    paddingVertical: 14.h,
                                    paddingHorizontal: 45.w)
                                : const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                          if (cubit.reserveModel!.orderStatus == 1 ||
                              cubit.reserveModel!.orderStatus == 2 ||
                              cubit.reserveModel!.orderStatus == 3)
                            SizedBox(
                              height: 25.h,
                            ),
                        ],
                      ):const Center(child: CircularProgressIndicator.adaptive(),),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// if(reservationModel.orderStatus==1)Text(
// 'حالة الطلب : بأنتظار التأكيد مع المقدم',
// style: TextStyle(
// fontSize: 10.sp,
// fontFamily: FontPath.almaraiRegular,
// color: const Color(0xff1E2432)),
// ),
// if(reservationModel.orderStatus==2)Text(
// 'حالة الطلب : تمت موافقة المقدم',
// style: TextStyle(
// fontSize: 10.sp,
// fontFamily: FontPath.almaraiRegular,
// color: const Color(0xff1E2432)),
// ),
// if(reservationModel.orderStatus==3)Text(
// 'حالة الطلب : قيد الوصول',
// style: TextStyle(
// fontSize: 10.sp,
// fontFamily: FontPath.almaraiRegular,
// color: const Color(0xff1E2432)),
// ),
// if(reservationModel.orderStatus==4)Text(
// 'حالة الطلب : انتهت الخدمة',
// style: TextStyle(
// fontSize: 10.sp,
// fontFamily: FontPath.almaraiRegular,
// color: const Color(0xff1E2432)),
// ),
// if(reservationModel.orderStatus==5)Text(
// 'حالة الطلب : تم الالغاء',
// style: TextStyle(
// fontSize: 10.sp,
// fontFamily: FontPath.almaraiRegular,
// color: const Color(0xff1E2432)),
// ),
