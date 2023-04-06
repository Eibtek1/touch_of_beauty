import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/assets_path/svg_path.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../widgets/order_item_builder.dart';
import '../widgets/screen_layout_widget.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

List<String> itemsList = [
  'في المركز',
  'في المنزل',
];

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  String value = itemsList.first;
  int homeZeroOrCenterOne = 0;
  @override
  void initState() {
    VReservationCubit.get(context).getTodayOrders(inHome: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreenWidget(
        firstContainerBackgroundHeight: 214.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'الرئيسية',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 17.sp),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ScreenName.vendorNotificationScreen);
                    },
                    icon: SvgPicture.asset(
                      SvgPath.notificationBill,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      height: 28.h,
                      width: 23.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      color: AppColorsLightTheme.authTextFieldFillColor,
                    ),
                    child: Center(
                      child: Text(
                        'اليوم',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: FontPath.almaraiRegular,
                            fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 160.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      color: AppColorsLightTheme.authTextFieldFillColor,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox.shrink(),
                      items: itemsList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      color: const Color(0xff666666),
                                      fontFamily: FontPath.almaraiRegular,
                                      fontSize: 14.sp),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          value = val!;
                          if (value == 'في المركز') {
                            homeZeroOrCenterOne = 0;
                            VReservationCubit.get(context)
                                .getTodayOrders(inHome: false);
                          } else {
                            VReservationCubit.get(context)
                                .getTodayOrders(inHome: true);
                            homeZeroOrCenterOne = 0;
                          }
                        });
                      },
                      value: value,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              BlocConsumer<VReservationCubit, VReservationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = VReservationCubit.get(context);
                  return Expanded(
                    child: state is GetTodayOrdersLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : cubit.getTodayOrdersList.isNotEmpty?ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: OrderItemBuilder(
                                  homeZeroOrCenterOne: homeZeroOrCenterOne,
                                  reserveModel: cubit.getTodayOrdersList[index],
                                ),
                              );
                            },
                            itemCount: cubit.getTodayOrdersList.length,
                          ):Text(
                      'لا يوجد خدمات بعد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColorsLightTheme.primaryColor,
                          fontFamily: FontPath.almaraiBold,
                          fontSize: 17.sp),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
