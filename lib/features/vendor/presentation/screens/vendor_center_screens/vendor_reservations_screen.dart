import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/app_router/screens_name.dart';
import '../../../../../core/app_theme/light_theme.dart';
import '../../../../../core/assets_path/font_path.dart';
import '../../../../../core/assets_path/svg_path.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_cubit.dart';
import '../../../buisness_logic/v_reservations_cubit/v_reservation_state.dart';
import '../../widgets/reservations_components/canceled_order_component.dart';
import '../../widgets/reservations_components/confirmed_order_component.dart';
import '../../widgets/reservations_components/finished_order_component.dart';
import '../../widgets/reservations_components/prepared_orders_component.dart';
import '../../widgets/reservations_components/with_driver_order_component.dart';

class VendorReservationsScreen extends StatefulWidget {
  const VendorReservationsScreen({Key? key}) : super(key: key);

  @override
  State<VendorReservationsScreen> createState() =>
      _VendorReservationsScreenState();
}

class _VendorReservationsScreenState extends State<VendorReservationsScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    VReservationCubit.get(context).getPreparedOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColorsLightTheme.primaryColor,
          foregroundColor: Colors.white,
          toolbarHeight: 60.h,
          centerTitle: true,
          title: Text(
            LocaleKeys.my_reservations.tr(),
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: FontPath.almaraiBold,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(0, 50.h),
            child: BlocConsumer<VReservationCubit, VReservationState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = VReservationCubit.get(context);
                return TabBar(
                  onTap: (index) {
                    if (index == 0 && currentIndex != 0) {
                      cubit.getPreparedOrders();
                      currentIndex = index;
                    } else if (index == 1 && currentIndex != 1) {
                      cubit.getConfirmedOrders();
                      currentIndex = index;
                    } else if (index == 2 && currentIndex != 2) {
                      cubit.getWithDriverOrders();
                      currentIndex = index;
                    } else if (index == 3 && currentIndex != 3) {
                      cubit.getFinishedOrders();
                      currentIndex = index;
                    } else if (index == 4 && currentIndex != 4) {
                      cubit.getCanceledOrders();
                      currentIndex = index;
                    }
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        LocaleKeys.not_confirmed.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontFamily: FontPath.almaraiRegular),
                      ),
                    ),
                    Tab(
                      child: Text(LocaleKeys.under_preparing.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiRegular)),
                    ),
                    Tab(
                      child: Text(LocaleKeys.in_progress.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiRegular)),
                    ),
                    Tab(
                      child: Text(LocaleKeys.finished_orders.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiRegular)),
                    ),
                    Tab(
                      child: Text(LocaleKeys.deleted_orders.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontFamily: FontPath.almaraiRegular)),
                    ),
                  ],
                );
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.vendorNotificationScreen);
              },
              icon: SvgPicture.asset(
                SvgPath.notificationBill,
                width: 23.w,
                height: 28.h,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PreparedOrdersComponent(),
            ConfirmedOrdersComponent(),
            WithDriverOrdersComponent(),
            FinishedOrdersComponent(),
            CanceledOrdersComponent(),
          ],
        ),
      ),
    );
  }
}
