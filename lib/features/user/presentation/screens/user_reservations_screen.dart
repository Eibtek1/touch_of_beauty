import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/core/constants/constants.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/images_path.dart';
import '../widgets/reservation_widgets/all_orders_widget.dart';
import '../widgets/reservation_widgets/end_orders.dart';
import '../widgets/reservation_widgets/ordered_orders_widget.dart';

class UserReservationsScreen extends StatefulWidget {
  const UserReservationsScreen({Key? key}) : super(key: key);

  @override
  State<UserReservationsScreen> createState() => _UserReservationsScreenState();
}

class _UserReservationsScreenState extends State<UserReservationsScreen>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> itemsList = [
    {'image': ImagePath.babyCare, 'title': "العناية بالطفل"},
    {'image': ImagePath.beautyCenter, 'title': "فسم التجميل"},
    {'image': ImagePath.hairCare, 'title': "العناية بالشعر"},
    {'image': ImagePath.makeup, 'title': "فسم المكياج"},
    {'image': ImagePath.naturalTherapy, 'title': "العلاج الطبيعي"},
    {
      'image': ImagePath.photography,
      'title': "التصــــــــــــوير الفوتوغرافي"
    },
    {'image': ImagePath.selfCare, 'title': "العناية الشخصية"},
    {'image': ImagePath.skinCare, 'title': "العناية بالبشرة"},
  ];

  List<String> titles = [
    'كل الطلبات',
    'المطلوبة',
    'المنتهية',
  ];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    ReservationCubit.get(context).tabBarCIndex = 0;
    ReservationCubit.get(context).getOrdersForUser();
    tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ConfirmOrderSuccessState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, ScreenName.paymentWebView,
              arguments: state.mainResponse.data);
        }
        if (state is ConfirmOrderLoadingState) {
          showProgressIndicator(context);
        }
        if (state is RemoveOrderSuccessState) {
          Navigator.pop(context);
          ReservationCubit.get(context).getOrdersForUser();
        }
        if (state is RemoveOrderLoadingState) {
          showProgressIndicator(context);
        }
      },
      builder: (context, state) {
        var cubit = ReservationCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('حجوزاتي',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432))),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cubit.tabBarCIndex == 0
                              ? AppColorsLightTheme.secondaryColor
                                  .withOpacity(0.2)
                              : AppColorsLightTheme.authTextFieldFillColor,
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                        ),
                        onPressed: () {
                          cubit.changeTabBarCurrentIndex(0);
                        },
                        child: Text(
                          'كل الطلبات',
                          style: TextStyle(
                              color: cubit.tabBarCIndex == 0
                                  ? Colors.pink
                                  : Colors.grey,
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 12.sp),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cubit.tabBarCIndex == 1
                              ? AppColorsLightTheme.secondaryColor
                                  .withOpacity(0.2)
                              : AppColorsLightTheme.authTextFieldFillColor,
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                        ),
                        onPressed: () {
                          // cubit.getOrdersForUser();
                          cubit.changeTabBarCurrentIndex(1);
                        },
                        child: Text(
                          'المطلوبة',
                          style: TextStyle(
                              color: cubit.tabBarCIndex == 1
                                  ? Colors.pink
                                  : Colors.grey,
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 12.sp),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: cubit.tabBarCIndex == 2
                              ? AppColorsLightTheme.secondaryColor
                                  .withOpacity(0.2)
                              : AppColorsLightTheme.authTextFieldFillColor,
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                        ),
                        onPressed: () {
                          // cubit.getOrdersForUser();
                          cubit.changeTabBarCurrentIndex(2);
                        },
                        child: Text(
                          "المنتهية",
                          style: TextStyle(
                              color: cubit.tabBarCIndex == 2
                                  ? Colors.pink
                                  : Colors.grey,
                              fontFamily: FontPath.almaraiBold,
                              fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: state is! GetReservationsLoadingState
                      ? cubit.tabBarCIndex == 0
                          ? ListView.builder(
                              itemCount: cubit.reservationsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AllOrdersWidgetItem(
                                  reservationModel:
                                      cubit.reservationsList[index],
                                  goToPay: () {

                                    cubit.confirmOrder(
                                        id: cubit.reservationsList[index].id!);
                                  },
                                  removeOrder: () {
                                    // print(cubit.reservationsList[index].id!);
                                    // print(token);
                                    cubit.removeOrder(
                                        id: cubit.reservationsList[index].id!);
                                    cubit.reservationsList.removeAt(index);
                                  },
                                );
                              },
                            )
                          : cubit.tabBarCIndex == 1
                              ? ListView.builder(
                                  itemCount: cubit.reservationsList
                                      .where((element) =>
                                          element.orderStatus != 5 &&
                                          element.orderStatus != 4 &&
                                          element.orderStatus != 0)
                                      .toList()
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return OrderedOrdersWidgetBuilder(
                                      reservationModel: cubit.reservationsList
                                          .where((element) =>
                                              element.orderStatus != 5 &&
                                              element.orderStatus != 4 &&
                                              element.orderStatus != 0)
                                          .toList()[index],
                                    );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: cubit.reservationsList
                                      .where((element) =>
                                          element.orderStatus == 5 ||
                                          element.orderStatus == 4)
                                      .toList()
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return EndOrdersWidgetBuilder(
                                      reservationModel: cubit.reservationsList
                                          .where((element) =>
                                              element.orderStatus == 5 ||
                                              element.orderStatus == 4)
                                          .toList()[index],
                                    );
                                  },
                                )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
