import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_cubit.dart';
import 'package:touch_of_beauty/features/user/buisness_logic/reservation_cubit/reservation_state.dart';
import '../../../../core/assets_path/font_path.dart';
import '../../../../core/assets_path/images_path.dart';
import '../widgets/reservation_widgets/all_orders_widget.dart';
import '../widgets/reservation_widgets/end_orders.dart';
import '../widgets/reservation_widgets/ordered_orders_widget.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen>
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
    tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ReservationCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('حجزاتي',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: FontPath.almaraiBold,
                    color: const Color(0xff1E2432))),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      tabs: List.generate(
                        titles.length,
                        (index) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: cubit.tabBarCIndex == index
                                ? AppColorsLightTheme.secondaryColor
                                    .withOpacity(0.2)
                                : AppColorsLightTheme.authTextFieldFillColor,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 19.w, vertical: 12.h),
                          ),
                          onPressed: () {
                            tabController!.animateTo(index);
                            cubit.changeTabBarCurrentIndex(index);
                          },
                          child: Text(
                            titles[index],
                            style: TextStyle(
                                color: cubit.tabBarCIndex == index
                                    ? Colors.pink
                                    : Colors.grey,
                                fontFamily: FontPath.almaraiBold,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const AllOrdersWidgetItem();
                          },
                        ),
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const OrderedOrdersWidgetBuilder();
                          },
                        ),
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return const EndOrdersWidgetBuilder();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
